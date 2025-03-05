"use client";

import { Box } from "@yamada-ui/react";
import { ReactNode } from "react";
import { styles } from "./style";
import { useDarkLight } from "@/libs/dark-light";

interface Props {
  children: ReactNode;
}

export function Container({ children }: Props) {
  const { state } = useDarkLight();
  // ダークモードかどうかを判定
  const isDarkMode = state.type === "dark";
  // Fix hydration mismatch by only rendering complete UI after client-side hydration

  // Use a default style if not yet mounted to prevent hydration mismatch
  const sidebarStyle = {
    ...styles.sidebar,
    backgroundColor: state.bg,
    color: state.color,
    borderRight: `1px solid ${isDarkMode ? "rgba(255, 255, 255, 0.1)" : "rgba(50, 55, 60, 0.2)"}`,
  };
  return (
    <Box as="aside" sx={sidebarStyle}>
      {children}
    </Box>
  );
}
