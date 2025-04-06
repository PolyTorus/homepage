"use client";

import { Text, Box, Grid, Heading, Center } from "@yamada-ui/react";
import { PageLayout } from "@/components";
import BlogCard from "@/components/BlogCard";
import { useEffect, useState } from "react";

interface BlogPost {
  slug: string;
  title: string;
  date: string;
  excerpt: string;
  author: string;
  tags: string[];
  coverImage?: string | null;
}

export default function Blog() {
  const [blogPosts, setBlogPosts] = useState<BlogPost[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    async function fetchPosts() {
      try {
        const response = await fetch('/api/blog');
        
        if (!response.ok) {
          throw new Error('Failed to fetch blog posts');
        }
        
        const data = await response.json() as BlogPost[];
        setBlogPosts(data);
      } catch (err) {
        console.error('Error fetching blog posts:', err);
        setError('ブログ記事の読み込み中にエラーが発生しました。');
      } finally {
        setLoading(false);
      }
    }

    fetchPosts();
  }, []);

  if (loading) {
    return (
      <PageLayout title="Blog">
        <Box mb={8}>
          <Text fontSize="lg" lineHeight="tall">
            技術的な洞察、チュートリアル、プロジェクトの最新情報をお届けします。
          </Text>
        </Box>
        <Center py={10}>
          <Text fontSize="lg" lineHeight="tall" color="gray.500">
            読み込み中...
          </Text>
        </Center>
      </PageLayout>
    );
  }

  if (error) {
    return (
      <PageLayout title="Blog">
        <Box mb={8}>
          <Text fontSize="lg" lineHeight="tall">
            技術的な洞察、チュートリアル、プロジェクトの最新情報をお届けします。
          </Text>
        </Box>
        <Box textAlign="center" py={10} color="red.500">
          <Heading as="h2" size="lg" mb={4}>
            エラーが発生しました
          </Heading>
          <Text>{error}</Text>
        </Box>
      </PageLayout>
    );
  }
  
  return (
    <PageLayout title="Blog">
      <Box mb={8}>
        <Text fontSize="lg" lineHeight="tall">
          技術的な洞察、チュートリアル、プロジェクトの最新情報をお届けします。
        </Text>
      </Box>

      {blogPosts.length === 0 ? (
        <Box textAlign="center" py={10}>
          <Heading as="h2" size="lg" mb={4}>
            記事がまだありません
          </Heading>
          <Text>
            ブログ記事は近日公開予定です。しばらくお待ちください。
          </Text>
        </Box>
      ) : (
        <Grid
          templateColumns={{
            base: "repeat(1, 1fr)",
            md: "repeat(2, 1fr)",
            lg: "repeat(3, 1fr)"
          }}
          gap={6}
        >
          {blogPosts.map((post) => (
            <BlogCard
              key={post.slug}
              title={post.title}
              excerpt={post.excerpt}
              date={post.date}
              author={post.author}
              slug={post.slug}
              tags={post.tags}
              coverImage={post.coverImage || undefined}
            />
          ))}
        </Grid>
      )}
    </PageLayout>
  );
}
