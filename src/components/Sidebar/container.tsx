"use client";

import { VStack } from "@yamada-ui/react";
import { ReactNode } from "react";

import { useDarkLight } from "@/features/dark-light";

import { styles } from "./style";

interface Props {
  children: ReactNode;
}

export function Container({ children }: Props) {
  const { state } = useDarkLight();
  const isDarkMode = state.type === "dark";

  //style
  const sidebarStyle = {
    ...styles.sidebar,
    backgroundColor: state.bg,
    color: state.color,
    borderRight: `1px solid ${isDarkMode ? "rgba(255, 255, 255, 0.1)" : "rgba(50, 55, 60, 0.2)"}`
  };

  return (
    <VStack as="aside" display={{ base: "flex", lg: "none" }} sx={sidebarStyle}>
      {children}
    </VStack>
  );
}
