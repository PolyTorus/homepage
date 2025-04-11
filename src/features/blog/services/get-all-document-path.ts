import fs from "fs";
import { OverviewContents } from "./static";

export function getAllDocumentPath() {
  const blogContentsPath = process.env.NEXT_PUBLIC_BLOG_CONTENTS;

  if (!blogContentsPath) {
    throw new Error("ブログのパスがないよぉ〜〜");
  }

  try {
    const pullFolders = fs.readdirSync(blogContentsPath);
    const response: OverviewContents[] = pullFolders.map((item) => {
      const path = `${blogContentsPath}/${item}`;
      const overviewFile = `${item}-overview.json`;

      const overviewStr = fs.readFileSync(`${path}/${overviewFile}`).toString();
      const overviewParse = JSON.parse(overviewStr) as OverviewContents;

      return overviewParse;
    });

    return response;
  } catch {
    throw new Error("なんか失敗したよ");
  }
}
