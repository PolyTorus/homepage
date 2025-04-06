import { NextRequest, NextResponse } from 'next/server';
import fs from 'fs';
import path from 'path';
import matter from 'gray-matter';
import { remark } from 'remark';
import html from 'remark-html';

const postsDirectory = path.join(process.cwd(), 'blog-contents');

export async function GET(
  request: NextRequest,
  { params }: { params: { slug: string } }
) {
  try {
    // paramsをawaitして安全に使用
    const { slug } = await params;
    const fullPath = path.join(postsDirectory, `${slug}.md`);
    
    if (!fs.existsSync(fullPath)) {
      return NextResponse.json(
        { error: 'Post not found' },
        { status: 404 }
      );
    }

    const fileContents = fs.readFileSync(fullPath, 'utf8');
    const matterResult = matter(fileContents);

    // マークダウンをHTMLに変換
    const processedContent = await remark()
      .use(html)
      .process(matterResult.content);
    const contentHtml = processedContent.toString();

    const postData = {
      slug,
      title: matterResult.data.title || 'Untitled',
      date: matterResult.data.date || new Date().toISOString(),
      excerpt: matterResult.data.excerpt || '',
      author: matterResult.data.author || 'Anonymous',
      tags: matterResult.data.tags || [],
      content: contentHtml,
      coverImage: matterResult.data.coverImage || null
    };

    return NextResponse.json(postData);
  } catch (error) {
    console.error(`Error reading blog post:`, error);
    return NextResponse.json(
      { error: 'Failed to fetch blog post' },
      { status: 500 }
    );
  }
}
