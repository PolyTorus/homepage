'use client';

import {
  Text,
  Box,
  VStack,
  Input,
  Textarea,
  Button,
  FormControl,
} from "@yamada-ui/react";
import { PageLayout } from "@/components";
import { useState } from "react";

export default function Contact() {
  const webhookUrl = process.env.NEXT_PUBLIC_DISCORD_WEBHOOK_URL_CONTACT;
  if (!webhookUrl) {
    throw new Error("DISCORD_WEBHOOK_URL_CONTACT is not defined");
  }

  const [form, setForm] = useState({
    name: "",
    email: "",
    message: "",
  });

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async () => {
    // 入力検証
    const errors = {
      name: !form.name.trim() && "お名前を入力してください",
      email: !form.email.trim() && "メールアドレスを入力してください",
      message: !form.message.trim() && "メッセージを入力してください",
    };

    if (Object.values(errors).some(error => error)) {
      alert(Object.values(errors).filter(Boolean).join("\n"));
      return;
    }

    // メールアドレスの形式チェック
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(form.email)) {
      alert("正しいメールアドレスの形式で入力してください");
      return;
    }

    const payload = {
        embeds: [
          {
            title: "新しいお問い合わせが届きました",
            color: 3447003, // 青色
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
      await fetch(webhookUrl, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
      });
      alert("お問い合わせが送信されました");
      setForm({ name: "", email: "", message: "" });
    } catch (error) {
      console.error("送信エラー:", error);
      alert("送信に失敗しました");
    }
  };

  return (
    <PageLayout title="Contact">
      <Box maxW="2xl" mx="auto" py="8">
        <VStack gap="6" align="stretch">
          <Text textAlign="center" color="gray.600">
            お問い合わせはこちらのフォームからお願いします。
            <Text as="span" color="red.500">*</Text>は必須項目です。
          </Text>

          <VStack gap="4">
            <FormControl isRequired>
              <Input
                name="name"
                placeholder="山田 太郎"
                value={form.name}
                onChange={handleChange}
              />
            </FormControl>

            <FormControl isRequired>
              <Input
                name="email"
                type="email"
                placeholder="your-email@example.com"
                value={form.email}
                onChange={handleChange}
              />
            </FormControl>

            <FormControl>
              <Textarea
                name="message"
                rows={5}
                placeholder="お問い合わせ内容をご記入ください"
                value={form.message}
                onChange={handleChange}
              />
            </FormControl>

            <Button
              w="full"
              onClick={handleSubmit}
              bg="rgba(50, 55, 60, 0.1)"
              _hover={{ bg: "rgba(50, 55, 60, 0.2)" }}
            >
              送信する
            </Button>
          </VStack>
        </VStack>
      </Box>
    </PageLayout>
  );
}
