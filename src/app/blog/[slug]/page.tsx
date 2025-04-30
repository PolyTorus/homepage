import { PageLayout } from "@/components";
import {
  getAllDocumentPath,
  getBlog,
  markdownComponent
} from "@/features/blog";
import { Box } from "@yamada-ui/react";
import { MDXRemote } from "next-mdx-remote/rsc";

export const generateStaticParams = (): { slug: string }[] => {
  const overviews = getAllDocumentPath();

  const titles = overviews.map((j) => {
    return { slug: j.id };
  });

  return titles;
};

type Props = Promise<{
  slug: string;
}>;

async function BlogContents({ params }: { params: Props }) {
  const { slug } = await params;
  const { source, options, overview } = getBlog(slug);

  return (
    <PageLayout title={overview.title}>
      <Box>
        <MDXRemote
          source={source}
          options={options}
          components={markdownComponent}
        />
      </Box>
    </PageLayout>
  );
}

export default BlogContents;
