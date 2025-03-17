"use client";
import { extendTheme } from "@yamada-ui/react";

export const theme = extendTheme({
  styles: {
    global: {
      body: {
        bg: "var(--background)",
        color: "var(--foreground)",
        fontFamily: "var(--font-noto-sans), sans-serif"
      }
    }
  },
  fonts: {
    heading: "var(--font-inter), sans-serif",
    body: "var(--font-noto-sans), sans-serif"
  },
  components: {
    Heading: {
      baseStyle: {
        fontFamily: "var(--font-inter), sans-serif"
      }
    },
    Text: {
      baseStyle: {
        fontFamily: "var(--font-noto-sans), sans-serif"
      }
    },
    Sidebar: {
      baseStyle: {
        bg: "white",
        borderRight: "1px solid",
        borderColor: "gray.200",
        shadow: "sm"
      }
    }
  }
});
