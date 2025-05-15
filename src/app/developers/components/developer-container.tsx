"use client";

import { useDarkLight } from "@/features/dark-light";
import { Box } from "@yamada-ui/react";
import { ReactNode } from "react";

export function DeveloperContainer({ children }: { children: ReactNode }) {
  const { state } = useDarkLight();

  return (
    <Box
      p={6}
      borderRadius="md"
      border="1px solid"
      borderColor="gray.200"
      _dark={{ borderColor: "gray.700" }}
      transition="all 0.3s"
      _hover={{
        transform: "translateY(-5px)",
        boxShadow: "lg"
      }}
      color={state.color}
      cursor="pointer"
    >
      {children}
    </Box>
  );
}
