import fs from "fs";
import path from "path";
import remarkGfm from "remark-gfm";
import "highlight.js/styles/vs2015.min.css";
import { Contents, OverviewContents } from "./static";
import rehypeHighlight from "rehype-highlight";

export function getBlog(slug: string) {
  const blogContentsPath = process.env.NEXT_PUBLIC_BLOG_CONTENTS;

  if (!blogContentsPath) {
    throw new Error("ブログのパスがないよぉ〜〜");
  }

  const pullFolders = fs.readdirSync(blogContentsPath);

  const subResponse: Contents[] = pullFolders.map((item) => {
    const sourceFile = path.join(
      process.cwd(),
      "src",
      "contents",
      item,
      `${item}.mdx`
    );
    const overviewFile = path.join(
      process.cwd(),
      "src",
      "contents",
      item,
      `${item}-overview.json`
    );

    const source = fs.readFileSync(sourceFile, "utf8").toString();
    const overviewStr = fs.readFileSync(overviewFile, "utf8").toString();
    const overviewParse = JSON.parse(overviewStr) as OverviewContents;

    return {
      source: source,
      overview: overviewParse
    };
  });

  const filterResponse: Contents | undefined = subResponse.find(
    (item) => item.overview.id === slug
  );

  if (!filterResponse) {
    throw Error("何も引っ掛からなかったよ");
  }

  const option = {
    mdxOptions: {
      remarkPlugins: [remarkGfm],
      rehypePlugins: [rehypeHighlight]
    }
  };

  const response = {
    source: filterResponse.source,
    overview: filterResponse.overview,
    options: option
  };

  return response;
}
