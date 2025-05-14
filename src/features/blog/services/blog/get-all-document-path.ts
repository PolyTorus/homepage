import fs from "fs";
import matter from "gray-matter";
import path from "path";

import { BlogMetadata } from "./types";

export function getAllDocumentPath(): BlogMetadata[] {
  const blogContentsPath = "./src/contents";

  if (!blogContentsPath) {
    throw new Error("ブログのパスがないよぉ〜〜");
  }

  try {
    const pullFolders = fs.readdirSync(blogContentsPath);

    const blogPosts = pullFolders.map((folder) => {
      const mdxPath = path.join(
        process.cwd(),
        "src",
        "contents",
        folder,
        `${folder}.mdx`
      );

      // Read the MDX file
      const fileContents = fs.readFileSync(mdxPath, "utf8");

      // Parse frontmatter
      const { data } = matter(fileContents);

      // Create metadata object
      return {
        id: data.id || folder,
        title: data.title || "No Title",
        icon: data.icon || "📄",
        description: data.description || ""
      };
    });

    return blogPosts;
  } catch (error) {
    console.error("Error getting all document paths:", error);
    throw new Error("ブログ一覧の取得に失敗しました");
  }
}
