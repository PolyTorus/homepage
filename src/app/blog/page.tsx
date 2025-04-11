import { Box, Flex, Grid, Heading, Text } from "@yamada-ui/react";
import { PageLayout } from "@/components";
import { getAllDocumentPath } from "@/features/blog";
import Link from "next/link";

export default function Blog() {
  const blogAllInfo = getAllDocumentPath();
  return (
    <PageLayout title="Blog">
      <Box>
        <Grid
          templateColumns={{
            base: "repeat(1, 1fr)",
            md: "repeat(2, 1fr)",
            lg: "repeat(3, 1fr)"
          }}
          gap={6}
        >
          {blogAllInfo.map(({ icon, id, title, description }) => (
            <Link key={id} href={`/blog/${id}`}>
              <Box
                p={6}
                borderRadius="md"
                border="1px solid"
                borderColor="gray.200"
                _dark={{ borderColor: "gray.700" }}
                transition="all 0.3s"
                _hover={{
                  transform: "translateY(-5px)",
                  boxShadow: "lg"
                }}
              >
                <Flex direction="column" align="center">
                  <Text fontSize={50}>{icon}</Text>
                  <Heading as="h3" size="md" mb={2} textAlign="center">
                    {title}
                  </Heading>

                  <Text fontSize="sm" textAlign="center">
                    {description}
                  </Text>
                </Flex>
              </Box>
            </Link>
          ))}
        </Grid>
      </Box>
    </PageLayout>
  );
}
