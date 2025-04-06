"use client";

import { Box, Heading, HStack, useColorMode } from "@yamada-ui/react";
import { ModeChange } from "./mode-change";
import { useDarkLight } from "@/libs/dark-light";
import { useEffect, useState } from "react";

export function Header() {
  const { state } = useDarkLight();
  const [isMounted, setIsMounted] = useState(false);
  
  // クライアントサイドでのみレンダリング
  useEffect(() => {
    setIsMounted(true);
  }, []);

  // サーバーサイドレンダリング時は基本的なコンテンツのみ表示
  if (!isMounted) {
    return (
      <Box
        as="header"
        w="100%"
        position="fixed"
        top={0}
        zIndex={4}
        bg={state.type === "dark" ? "rgba(50, 55, 60, 0.9)" : "rgba(242, 241, 238, 0.9)"}
        backdropFilter="blur(5px)"
        py={2}
      >
        <Box maxW="container.xl" mx="auto" px={4}>
          <Heading
            as="h1"
            fontSize={30}
            fontWeight="bold"
            color={state.color}
          >
            Polytorus
          </Heading>
        </Box>
      </Box>
    );
  }

  // クライアントサイドでの完全なレンダリング
  return (
    <Box
      as="header"
      w="100%"
      position="fixed"
      top={0}
      zIndex={4}
      bg={state.type === "dark" ? "rgba(50, 55, 60, 0.9)" : "rgba(242, 241, 238, 0.9)"}
      backdropFilter="blur(5px)"
      py={2}
    >
      <HStack
        maxW="container.xl"
        mx="auto"
        px={4}
        alignItems="center"
        justifyContent="space-between"
      >
        <Heading
          as="h1"
          fontSize={30}
          fontWeight="bold"
          color={state.color}
        >
          Polytorus
        </Heading>

        <Box
          display={{ base: "flex", lg: "block" }}
          justifyContent="space-between"
        >
          <ModeChange />
        </Box>
      </HStack>
    </Box>
  );
}
