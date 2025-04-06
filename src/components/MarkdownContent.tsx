"use client";

import { Box } from "@yamada-ui/react";
import { useDarkLight } from "@/libs/dark-light";

interface MarkdownContentProps {
  content: string;
}

export default function MarkdownContent({ content }: MarkdownContentProps) {
  const { state } = useDarkLight();
  const isDarkMode = state.type === "dark";

  return (
    <Box
      className="markdown-content"
      sx={{
        "h1, h2, h3, h4, h5, h6": {
          mt: 6,
          mb: 4,
          fontWeight: "bold",
          lineHeight: 1.2
        },
        h1: { fontSize: "2xl", mt: 8 },
        h2: { fontSize: "xl", borderBottom: "1px solid", borderColor: isDarkMode ? "gray.600" : "gray.200", pb: 2 },
        h3: { fontSize: "lg" },
        h4: { fontSize: "md" },
        p: { my: 4, lineHeight: 1.8 },
        a: {
          color: isDarkMode ? "blue.300" : "blue.600",
          textDecoration: "underline",
          _hover: { textDecoration: "none" }
        },
        ul: { ml: 8, my: 4 },
        ol: { ml: 8, my: 4 },
        li: { mb: 2 },
        blockquote: {
          borderLeft: "4px solid",
          borderColor: isDarkMode ? "gray.600" : "gray.200",
          pl: 4,
          my: 4,
          fontStyle: "italic",
          color: isDarkMode ? "gray.300" : "gray.600"
        },
        code: {
          fontFamily: "monospace",
          bg: isDarkMode ? "gray.700" : "gray.100",
          p: 1,
          borderRadius: "md",
          fontSize: "sm"
        },
        pre: {
          fontFamily: "monospace",
          bg: isDarkMode ? "gray.800" : "gray.100",
          p: 4,
          borderRadius: "md",
          overflowX: "auto",
          my: 4
        },
        "pre code": {
          bg: "transparent",
          p: 0
        },
        img: {
          maxWidth: "100%",
          height: "auto",
          borderRadius: "md",
          my: 4
        },
        table: {
          width: "100%",
          borderCollapse: "collapse",
          my: 4
        },
        "th, td": {
          border: "1px solid",
          borderColor: isDarkMode ? "gray.600" : "gray.200",
          p: 2
        },
        th: {
          bg: isDarkMode ? "gray.700" : "gray.100",
          fontWeight: "bold"
        }
      }}
      dangerouslySetInnerHTML={{ __html: content }}
    />
  );
}
