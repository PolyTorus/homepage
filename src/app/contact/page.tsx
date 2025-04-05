"use client";
import {
  Text,
  Box,
  VStack,
  Input,
  Textarea,
  Button,
  FormControl
} from "@yamada-ui/react";
import { PageLayout } from "@/components";
import { useState, useEffect } from "react";
import { useDarkLight } from "@/libs/dark-light";
import { createOption, Option, OPTION_SOME } from "@/utils/option";
import { createResult, Result, RESULT_NG } from "@/utils/result";

export default function Contact() {
  const [webhookUrl, setWebhookUrl] = useState<Result<string, Error>>(
    createResult.ng(new Error("urlがありません。"))
  );
  const [mounted, setMounted] = useState(false);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState<Option<string>>(createOption.none());
  const [success, setSuccess] = useState<Option<string>>(createOption.none());
  const { state } = useDarkLight();

  const [form, setForm] = useState({
    name: "",
    email: "",
    message: ""
  });

  // クライアントサイドでのみ環境変数にアクセスする
  useEffect(() => {
    setMounted(true);
    const url = process.env.NEXT_PUBLIC_DISCORD_WEBHOOK_URL_CONTACT;
    if (url) {
      setWebhookUrl(createResult.ok(url));
    }
  }, []);

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>
  ) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async () => {
    setError(createOption.none());
    setSuccess(createOption.none());

    if (!webhookUrl) {
      setError(
        createOption.some(
          "設定エラー: お問い合わせフォームが正しく設定されていません。"
        )
      );
      return;
    }

    const errors = {
      name: !form.name.trim() && "お名前を入力してください",
      email: !form.email.trim() && "メールアドレスを入力してください",
      message: !form.message.trim() && "メッセージを入力してください"
    };

    if (Object.values(errors).some((error) => error)) {
      setError(
        createOption.some(Object.values(errors).filter(Boolean).join("\n"))
      );
      return;
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(form.email)) {
      setError(
        createOption.some("正しいメールアドレスの形式で入力してください")
      );
      return;
    }

    setIsSubmitting(true);

    const corsProxyUrl = "https://corsproxy.io/?";
    const payload = {
      embeds: [
        {
          title: "新しいお問い合わせが届きました",
          color: 3447003,
          fields: [
            {
              name: "👤 名前",
              value: form.name.trim(),
              inline: true
            },
            {
              name: "📧 メール",
              value: form.email.trim(),
              inline: true
            },
            {
              name: "📝 メッセージ",
              value: form.message.trim()
            }
          ],
          timestamp: new Date().toISOString()
        }
      ]
    };

    try {
      if (webhookUrl.kind === RESULT_NG) {
        throw webhookUrl.value;
      }

      const response = await fetch(
        corsProxyUrl + encodeURIComponent(webhookUrl.value),
        {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(payload)
        }
      );

      if (response.ok) {
        setSuccess(createOption.some("お問い合わせが送信されました"));
        setForm({ name: "", email: "", message: "" });
      } else {
        throw new Error("送信に失敗しました");
      }
    } catch (error) {
      console.error("送信エラー:", error);
      setError(
        createOption.some(
          error instanceof Error ? error.message : "送信に失敗しました"
        )
      );
    } finally {
      setIsSubmitting(false);
    }
  };

  if (!mounted) {
    return (
      <PageLayout title="Contact">
        <Text>Loading...</Text>
      </PageLayout>
    );
  }

  return (
    <PageLayout title="Contact">
      <Box maxW="2xl" mx="auto" py="8">
        <VStack gap="6" align="stretch">
          <Text textAlign="center" color={state.color}>
            お問い合わせはこちらのフォームからお願いします。
          </Text>
          <VStack gap="4">
            <FormControl>
              <Input
                name="name"
                placeholder="山田 太郎"
                value={form.name}
                onChange={handleChange}
                _placeholder={{
                  color: state.color
                }}
              />
            </FormControl>
            <FormControl>
              <Input
                name="email"
                type="email"
                placeholder="your-email@example.com"
                value={form.email}
                onChange={handleChange}
                _placeholder={{
                  color: state.color
                }}
              />
            </FormControl>
            <FormControl>
              <Textarea
                name="message"
                rows={5}
                placeholder="お問い合わせ内容をご記入ください"
                value={form.message}
                onChange={handleChange}
                _placeholder={{
                  color: state.color
                }}
              />
            </FormControl>

            {error.kind === OPTION_SOME && (
              <Box p={3} borderRadius="md" bg="red.100" color="red.800">
                {error.value}
              </Box>
            )}

            {success.kind === OPTION_SOME && (
              <Box p={3} borderRadius="md" bg="green.100" color="green.800">
                {success.value}
              </Box>
            )}

            <Button
              w="full"
              onClick={handleSubmit}
              isLoading={isSubmitting}
              color={state.color}
              bg={
                state.type === "light"
                  ? "rgba(50, 55, 60, 0.1)"
                  : "rgba(255, 255, 255, 0.05)"
              }
              _hover={{
                bg:
                  state.type === "light"
                    ? "rgba(50, 55, 60, 0.2)"
                    : "rgba(255, 255, 255, 0.08)"
              }}
              disabled={isSubmitting}
            >
              送信する
            </Button>
          </VStack>
        </VStack>
      </Box>
    </PageLayout>
  );
}
