import { notFound } from "next/navigation";
import { Box, Text, Heading, Flex, Tag, HStack, VStack } from "@yamada-ui/react";
import { PageLayout } from "@/components";
import MarkdownContent from "@/components/MarkdownContent";
import { getBlogPostData, getSortedBlogPosts } from "@/utils/blog-helpers";

export const dynamic = 'force-dynamic'; // 最新の記事データを取得

// 静的なパラメータを生成
export async function generateStaticParams() {
  const posts = getSortedBlogPosts();
  return posts.map((post) => ({
    slug: post.slug,
  }));
}

export default async function BlogPost({ params }: { params: { slug: string } }) {
  const postData = await getBlogPostData(params.slug);
  
  if (!postData) {
    return notFound();
  }

  // 日付フォーマット
  const formattedDate = new Date(postData.date).toLocaleDateString('ja-JP', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  });

  return (
    <PageLayout title={postData.title}>
      <VStack gap={6} alignItems="flex-start">
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
              {postData.tags.map(tag => (
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
