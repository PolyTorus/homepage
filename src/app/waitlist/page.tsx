'use client';

import {
  Text,
  Box,
  VStack,
  Input,
  Textarea,
  Button,
  FormControl,
  Heading,
  Checkbox,
} from "@yamada-ui/react";
import { PageLayout } from "@/components";
import { useState } from "react";

export default function Waitlist() {
  const webhookUrl = process.env.NEXT_PUBLIC_DISCORD_WEBHOOK_URL_WAITLIST;

  const [form, setForm] = useState({
    name: "",
    email: "",
    organization: "",
    interests: {
      developer: false,
      investor: false,
      user: false,
      other: false
    },
    message: ""
  });

  const [isSubmitting, setIsSubmitting] = useState(false);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleCheckboxChange = (interest: keyof typeof form.interests) => {
    setForm({
      ...form,
      interests: {
        ...form.interests,
        [interest]: !form.interests[interest]
      }
    });
  };

  const handleSubmit = async () => {
    // webhookUrlが設定されているか確認
    if (!webhookUrl) {
        console.error("DISCORD_WEBHOOK_URL_WAITLIST is not defined");
        return;
    }
    
    // 入力検証
    const errors = {
      name: !form.name.trim() && "お名前を入力してください",
      email: !form.email.trim() && "メールアドレスを入力してください"
    };

    if (Object.values(errors).some(error => error)) {
        console.error(Object.values(errors).filter(Boolean).join("\n"));
    }

    // メールアドレスの形式チェック
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(form.email)) {
        console.error("正しいメールアドレスの形式で入力してください");
        return;
    }

    // 少なくとも1つの興味を選択していることを確認
    const hasInterest = Object.values(form.interests).some(val => val);
    if (!hasInterest) {
        console.error("少なくとも1つの興味を選択してください");
        return;
    }
    setIsSubmitting(true);

    // 選択された興味のリストを作成
    const selectedInterests = Object.entries(form.interests)
      .filter(([, isSelected]) => isSelected)
      .map(([interest]) => interest)
      .join(", ");

    const payload = {
      embeds: [
        {
          title: "新しいウェイトリスト登録がありました",
          color: 7506394, // 緑色
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
              name: "🏢 組織/企業",
              value: form.organization.trim() || "未入力",
              inline: true
            },
            {
              name: "👀 興味のある分野",
              value: selectedInterests
            },
            {
              name: "📝 メッセージ",
              value: form.message.trim() || "未入力"
            }
          ],
          timestamp: new Date().toISOString()
        }
      ]
    };

    try {
      const response = await fetch(webhookUrl, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

    // 送信成功時の処理
    console.log("ウェイトリスト登録が送信されました");
      
      // フォームをリセット
      setForm({
        name: "",
        email: "",
        organization: "",
        interests: {
          developer: false,
          investor: false,
          user: false,
          other: false
        },
        message: ""
      });
    } catch (error) {
      console.error("送信エラー:", error);
        // 送信失敗時の処理
        console.error("送信に失敗しました");
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <PageLayout title="ウェイトリスト登録">
      <Box maxW="2xl" mx="auto" py="8">
        <VStack gap="8" align="stretch">
          <Text fontSize="lg" lineHeight="tall" textAlign="center">
            Polytorusの早期アクセスにご興味をお持ちいただきありがとうございます。
            以下のフォームにご記入いただくと、リリース時にいち早くご案内いたします。
          </Text>

          <VStack gap="5" align="stretch">
            <FormControl isRequired>
              <Text mb="2">お名前</Text>
              <Input
                name="name"
                placeholder="山田 太郎"
                value={form.name}
                onChange={handleChange}
              />
            </FormControl>

            <FormControl isRequired>
              <Text mb="2">メールアドレス</Text>
              <Input
                name="email"
                type="email"
                placeholder="your-email@example.com"
                value={form.email}
                onChange={handleChange}
              />
            </FormControl>

            <FormControl>
              <Text mb="2">組織/企業名（任意）</Text>
              <Input
                name="organization"
                placeholder="株式会社サンプル"
                value={form.organization}
                onChange={handleChange}
              />
            </FormControl>

            <FormControl isRequired>
              <Text mb="3">興味のある分野（1つ以上選択）</Text>
              <VStack align="flex-start" gap="2">
                <Checkbox 
                  isChecked={form.interests.developer}
                  onChange={() => handleCheckboxChange("developer")}
                >
                  開発者として参加したい
                </Checkbox>
                <Checkbox 
                  isChecked={form.interests.investor}
                  onChange={() => handleCheckboxChange("investor")}
                >
                  投資家として参加したい
                </Checkbox>
                <Checkbox 
                  isChecked={form.interests.user}
                  onChange={() => handleCheckboxChange("user")}
                >
                  ユーザーとして利用したい
                </Checkbox>
                <Checkbox 
                  isChecked={form.interests.other}
                  onChange={() => handleCheckboxChange("other")}
                >
                  その他
                </Checkbox>
              </VStack>
            </FormControl>

            <FormControl>
              <Text mb="2">メッセージ（任意）</Text>
              <Textarea
                name="message"
                rows={4}
                placeholder="Polytorusに期待することや、ご質問などあればご記入ください"
                value={form.message}
                onChange={handleChange}
              />
            </FormControl>

            <Button
              w="full"
              onClick={handleSubmit}
              isLoading={isSubmitting}
              loadingText="送信中..."
              bg="rgba(50, 55, 60, 0.8)"
              color="white"
              _hover={{ bg: "rgba(50, 55, 60, 0.9)" }}
              _dark={{
                bg: "rgba(255, 255, 255, 0.1)",
                _hover: { bg: "rgba(255, 255, 255, 0.2)" }
              }}
              size="lg"
              mt="4"
            >
              ウェイトリストに登録する
            </Button>
          </VStack>

          <Box 
            p="6" 
            borderRadius="md" 
            bg="rgba(50, 55, 60, 0.05)" 
            border="1px solid"
            borderColor="rgba(50, 55, 60, 0.1)"
            _dark={{ 
              bg: "rgba(255, 255, 255, 0.05)",
              borderColor: "rgba(255, 255, 255, 0.1)"
            }}
          >
            <Heading as="h4" size="sm" mb="3">プライバシーポリシー</Heading>
            <Text fontSize="sm">
              ご提供いただいた情報は、Polytorusのサービス提供およびリリース情報のご案内のみに使用し、
              第三者に提供することはありません。お客様の個人情報は適切に管理し、保護いたします。
            </Text>
          </Box>
        </VStack>
      </Box>
    </PageLayout>
  );
}


