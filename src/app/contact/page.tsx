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
import { useState, useEffect } from "react";

export default function Contact() {
  const [webhookUrl, setWebhookUrl] = useState<string | null>(null);
  const [mounted, setMounted] = useState(false);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);
  
  const [form, setForm] = useState({
    name: "",
    email: "",
    message: "",
  });

  // クライアントサイドでのみ環境変数にアクセスする
  useEffect(() => {
    setMounted(true);
    const url = process.env.NEXT_PUBLIC_DISCORD_WEBHOOK_URL_CONTACT;
    if (url) {
      setWebhookUrl(url);
    }
  }, []);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async () => {
    setError(null);
    setSuccess(null);
    
    if (!webhookUrl) {
      setError("設定エラー: お問い合わせフォームが正しく設定されていません。");
      return;
    }
    
    const errors = {
      name: !form.name.trim() && "お名前を入力してください",
      email: !form.email.trim() && "メールアドレスを入力してください",
      message: !form.message.trim() && "メッセージを入力してください",
    };
    
    if (Object.values(errors).some(error => error)) {
      setError(Object.values(errors).filter(Boolean).join("\n"));
      return;
    }
    
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(form.email)) {
      setError("正しいメールアドレスの形式で入力してください");
      return;
    }
    
    setIsSubmitting(true);
    
    const corsProxyUrl = "https://corsproxy.io/?";
    const payload = {
      embeds: [{
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
      }]
    };

    try {
      const response = await fetch(corsProxyUrl + encodeURIComponent(webhookUrl), {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
      });
      
      if (response.ok) {
        setSuccess("お問い合わせが送信されました");
        setForm({ name: "", email: "", message: "" });
      } else {
        throw new Error("送信に失敗しました");
      }
    } catch (error) {
      console.error("送信エラー:", error);
      setError(error instanceof Error ? error.message : "送信に失敗しました");
    } finally {
      setIsSubmitting(false);
    }
  };

  if (!mounted) {
    return <PageLayout title="Contact"><Text>Loading...</Text></PageLayout>;
  }

  return (
    <PageLayout title="Contact">
      <Box maxW="2xl" mx="auto" py="8">
        <VStack gap="6" align="stretch">
          <Text textAlign="center" color="gray.600">
            お問い合わせはこちらのフォームからお願いします。
          </Text>
          <VStack gap="4">
            <FormControl>
              <Input
                name="name"
                placeholder="山田 太郎"
                value={form.name}
                onChange={handleChange}
              />
            </FormControl>
            <FormControl>
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
            
            {error && (
              <Box p={3} borderRadius="md" bg="red.100" color="red.800">
                {error}
              </Box>
            )}
            
            {success && (
              <Box p={3} borderRadius="md" bg="green.100" color="green.800">
                {success}
              </Box>
            )}
            
            <Button
              w="full"
              onClick={handleSubmit}
              isLoading={isSubmitting}
              bg="rgba(50, 55, 60, 0.1)"
              _hover={{ bg: "rgba(50, 55, 60, 0.2)" }}
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
