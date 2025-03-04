"use client";

import { useDarkLight } from "@/libs/dark-light";
import { Box } from "@yamada-ui/react";
import { ReactNode } from "react";

interface Props {
  children: ReactNode;
}

export function MainLayout({ children }: Props) {
  const { state } = useDarkLight();

  return (
    <Box
      as="main"
      sx={{
        marginLeft: "260px",
        padding: "30px",
        minHeight: "100vh",
        bg: state.bg,
        color: state.color,
      }}
    >
      {children}
    </Box>
  );
}
