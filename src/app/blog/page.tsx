import { Text, Box, Grid, Heading } from "@yamada-ui/react";
import { PageLayout } from "@/components";
import BlogCard from "@/components/BlogCard";
import { getSortedBlogPosts } from "@/utils/blog-helpers";

export const dynamic = "force-dynamic";

export default function Blog() {
  const blogPosts = getSortedBlogPosts();


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
              coverImage={post.coverImage}
            />
          ))}
        </Grid>
      )}
    </PageLayout>
  );
}
