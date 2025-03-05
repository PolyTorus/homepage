"use client";

import { useDarkLight } from "@/libs/dark-light";
import { LIGHT_BG } from "@/theme";
import { Box } from "@yamada-ui/react";
import { ReactNode, useEffect, useState } from "react";

interface Props {
  children: ReactNode;
}

export function MainLayout({ children }: Props) {
  const { state } = useDarkLight();
  const [mounted, setMounted] = useState(false);

  // Fix hydration mismatch by only applying styles after client-side hydration
  useEffect(() => {
    setMounted(true);
  }, []);

  // Use a default style if not yet mounted to prevent hydration mismatch
  const mainStyle = mounted
    ? {
        marginLeft: "260px",
        padding: "30px",
        minHeight: "100vh",
        bg: state.bg,
        color: state.color,
      }
    : {
        marginLeft: "260px",
        padding: "30px",
        minHeight: "100vh",
        bg: LIGHT_BG,
        // No dynamic styles before hydration
      };

  return (
    <Box as="main" sx={mainStyle}>
      {children}
    </Box>
  );
}
