"use client";

import { Box, Text, Heading, Flex, Tag, HStack, VStack, Center } from "@yamada-ui/react";
import { PageLayout } from "@/components";
import MarkdownContent from "@/components/MarkdownContent";
import { useEffect, useState } from "react";
import Link from "next/link";
import { useParams } from "next/navigation";

interface BlogPost {
  slug: string;
  title: string;
  date: string;
  excerpt: string;
  author: string;
  tags: string[];
  content: string;
  coverImage?: string;
}

export default function BlogPost() {
  // useParamsを使ってスラッグを取得
  const params = useParams();
  const slug = params?.slug as string;
  
  const [postData, setPostData] = useState<BlogPost | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [formattedDate, setFormattedDate] = useState("");

  useEffect(() => {
    if (!slug) return;
    
    async function fetchPost() {
      try {
        const response = await fetch(`/api/blog/${slug}`);
        
        if (response.status === 404) {
          setError('記事が見つかりませんでした');
          setLoading(false);
          return;
        }
        
        if (!response.ok) {
          throw new Error('記事の取得に失敗しました');
        }
        
        const data = await response.json();
        setPostData(data);
        
        // 日付フォーマット
        const formatted = new Date(data.date).toLocaleDateString('ja-JP', {
          year: 'numeric',
          month: 'long',
          day: 'numeric'
        });
        setFormattedDate(formatted);
      } catch (err) {
        console.error('Error fetching blog post:', err);
        setError('記事の読み込み中にエラーが発生しました');
      } finally {
        setLoading(false);
      }
    }

    fetchPost();
  }, [slug]);

  if (loading) {
    return (
      <PageLayout title="読み込み中...">
        <Center py={10}>
          <Text fontSize="lg" lineHeight="tall" color="gray.500">
            読み込み中...
          </Text>
        </Center>
      </PageLayout>
    );
  }

  if (error || !postData) {
    return (
      <PageLayout title="記事が見つかりません">
        <Box textAlign="center" py={10}>
          <Heading as="h2" size="lg" mb={4}>
            {error || '記事が見つかりませんでした'}
          </Heading>
          <Text mb={6}>
            お探しの記事は存在しないか、削除された可能性があります。
          </Text>
          <Box as={Link} href="/blog" px={4} py={2} bg="blue.500" color="white" borderRadius="md">
            ブログ一覧に戻る
          </Box>
        </Box>
      </PageLayout>
    );
  }

  return (
    <PageLayout title={postData.title}>
      <VStack gap={6} align="start">
        <Flex
          direction={{ base: "column", md: "row" }}
          justifyContent="space-between"
          alignItems={{ base: "start", md: "center" }}
          w="full"
          mb={2}
        >
          <Text fontSize="md" fontStyle="italic">
            {formattedDate} · {postData.author}
          </Text>
          
          {postData.tags && postData.tags.length > 0 && (
            <HStack gap={2} mt={{ base: 2, md: 0 }} flexWrap="wrap">
              {postData.tags.map((tag: string) => (
                <Tag key={tag} size="sm">
                  {tag}
                </Tag>
              ))}
            </HStack>
          )}
        </Flex>

        {postData.coverImage && (
          <Box 
            w="full" 
            h={{ base: "200px", md: "300px" }} 
            bg={`url(${postData.coverImage}) center/cover`}
            borderRadius="md"
            mb={4}
          />
        )}

        <Box w="full">
          <MarkdownContent content={postData.content} />
        </Box>
      </VStack>
    </PageLayout>
  );
}
