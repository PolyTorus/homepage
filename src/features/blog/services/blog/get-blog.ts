// src/features/blog/services/get-blog.ts
import fs from "fs";
import path from "path";
import remarkGfm from "remark-gfm";
import rehypeHighlight from "rehype-highlight";
import math from "remark-math";
import katex from "rehype-katex";
import "highlight.js/styles/vs2015.min.css";
import "katex/dist/katex.min.css";
import matter from "gray-matter";

export function getBlog(slug: string) {
  const blogContentsPath = "./src/contents";

  if (!blogContentsPath) {
    throw new Error("ブログのパスがないよぉ〜〜");
  }

  try {
    const sourceFile = path.join(
      process.cwd(),
      "src",
      "contents",
      slug,
      `${slug}.mdx`
    );

    const source = fs.readFileSync(sourceFile, "utf8").toString();

    // Parse frontmatter from MDX file
    const { data, content } = matter(source);

    // Extract metadata from frontmatter
    const metadata = {
      id: data.id || slug,
      title: data.title || "No Title",
      icon: data.icon || "📄",
      description: data.description || ""
    };

    const option = {
      mdxOptions: {
        remarkPlugins: [remarkGfm, math],
        rehypePlugins: [rehypeHighlight, katex]
      }
    };

    return {
      source: content,
      overview: metadata,
      options: option
    };
  } catch (error) {
    console.error("Error getting blog:", error);
    throw Error("ブログの取得に失敗しました");
  }
}
