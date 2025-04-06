import fs from 'fs';
import path from 'path';
import matter from 'gray-matter';
import { remark } from 'remark';
import html from 'remark-html';

const postsDirectory = path.join(process.cwd(), 'blog-contents');

export interface BlogPost {
    slug: string;
    title: string;
    date: string;
    excerpt: string;
    author: string;
    tags: string[];
    content: string;
    coverImage: string;
}

export function getSortedBlogPosts(): BlogPost[] {
    if (!fs.existsSync(postsDirectory)) {
        fs.mkdirSync(postsDirectory, { recursive: true });
        return [];
    }
    
    const fileNames = fs.readdirSync(postsDirectory);
    const allPostsData = fileNames
        .filter(fileName => fileName.endsWith('.md'))
        .map(fileName => {
            const slug = fileName.replace(/\.md$/, '');

            const fullPath = path.join(postsDirectory, fileName);
            const fileContents = fs.readFileSync(fullPath, 'utf8');

            const matterResult = matter(fileContents);

            return {
            slug,
            title: matterResult.data.title || 'Untitled',
            date: matterResult.data.date || new Date().toISOString(),
            excerpt: matterResult.data.excerpt || '',
            author: matterResult.data.author || 'Anonymous',
            tags: matterResult.data.tags || [],
            content: matterResult.content,
            coverImage: matterResult.data.coverImage
            };
        });

    return allPostsData.sort((a, b) => {
        if (a.date < b.date) {
            return 1;
        } else {
            return -1;
        }
    });
}