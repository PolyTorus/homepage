"use client";

import { Box, Text, Heading, Flex, Tag, VStack, HStack } from "@yamada-ui/react";
import Link from "next/link";
import { useDarkLight } from "@/libs/dark-light";

interface BlogCardProps {
  title: string;
  excerpt: string;
  date: string;
  author: string;
  slug: string;
  tags: string[];
  coverImage?: string | null;
}

export default function BlogCard({ 
  title, 
  excerpt, 
  date, 
  author, 
  slug, 
  tags,
  coverImage
}: BlogCardProps) {
  const { state } = useDarkLight();
  const isDarkMode = state.type === "dark";
  
  // 日付フォーマット
  const formattedDate = new Date(date).toLocaleDateString('ja-JP', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  });

  return (
    <Box
      as={Link}
      href={`/blog/${slug}`}
      borderWidth="1px"
      borderRadius="lg"
      p={5}
      mb={4}
      _hover={{
        transform: "translateY(-4px)",
        boxShadow: "lg",
        textDecoration: "none"
      }}
      transition="all 0.3s"
      bg={isDarkMode ? "rgba(255, 255, 255, 0.05)" : "rgba(0, 0, 0, 0.02)"}
      borderColor={isDarkMode ? "rgba(255, 255, 255, 0.1)" : "rgba(0, 0, 0, 0.1)"}
      w="full"
    >
      <VStack align="start" gap={3}>
        {coverImage && (
          <Box 
            w="full" 
            h="200px" 
            bg={`url(${coverImage}) center/cover`}
            borderRadius="md"
            mb={2}
          />
        )}
        
        <Heading as="h3" size="lg">
          {title}
        </Heading>
        
        <Flex justifyContent="space-between" alignItems="center" w="full">
          <Text fontSize="sm" color={isDarkMode ? "gray.300" : "gray.600"}>
            {formattedDate} · {author}
          </Text>
        </Flex>
        
        <Text
          sx={{
            display: "-webkit-box",
            WebkitLineClamp: 3,
            WebkitBoxOrient: "vertical",
            overflow: "hidden"
          }}
        >
          {excerpt}
        </Text>
        
        {tags.length > 0 && (
          <HStack gap={2} mt={2} flexWrap="wrap">
            {tags.map(tag => (
              <Tag 
                key={tag} 
                size="sm" 
                bg={isDarkMode ? "teal.800" : "teal.100"}
                color={isDarkMode ? "white" : "teal.800"}
              >
                {tag}
              </Tag>
            ))}
          </HStack>
        )}
      </VStack>
    </Box>
  );
}
