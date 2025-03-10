"use client";

import { useDarkLight } from "@/libs/dark-light";
import { Box } from "@yamada-ui/react";
import { ReactNode } from "react";
import { Header } from "../header";

interface Props {
  children: ReactNode;
}

export function MainLayout({ children }: Props) {
  const { state } = useDarkLight();

  return (
    <Box
      as="main"
      w="full"
      h="full"
      minHeight="100vh"
      bg={state.bg}
      color={state.color}
    >
      <Header />
      {children}
    </Box>
  );
}
