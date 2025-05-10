"use client";

import { useDarkLight } from "@/features/dark-light";
import { Box } from "@yamada-ui/react";
import { ReactNode } from "react";

interface Props {
  children: ReactNode;
}

export function Container({ children }: Props) {
  const { state } = useDarkLight();

  return (
    <Box
      height={120}
      marginTop={4}
      border={`1px solid ${state.color}`}
      borderRadius={8}
      overflow="hidden"
    >
      {children}
    </Box>
  );
}
