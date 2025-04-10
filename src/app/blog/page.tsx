import { Text, Box, DiscList, For, ListItem, Button } from "@yamada-ui/react";
import { PageLayout } from "@/components";
import { getAllDocumentPath } from "@/features/blog";
import Link from "next/link";

export default function Blog() {
  const blogAllInfo = getAllDocumentPath();
  return (
    <PageLayout title="Blog">
      <Box>
        <DiscList>
          {blogAllInfo.map(({ id, title }) => (
            <ListItem key={id}>
              <Link href={`/blog/${id}`}>
                <Button bg="transparent">{title}</Button>
              </Link>
            </ListItem>
          ))}
        </DiscList>
      </Box>
    </PageLayout>
  );
}
