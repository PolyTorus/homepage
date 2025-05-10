"use client";

import { Box, Heading, HStack } from "@yamada-ui/react";
import { ModeChange } from "./mode-change";
import { useDarkLight } from "@/libs/dark-light";

export function Header() {
  const { state } = useDarkLight();
  
  return (
    <HStack
      w="100vw"
      alignItems="center"
      justifyContent="space-between"
      position="fixed"
      top={0}
      zIndex={4}
      bg={{base:'transparent',lg:state.bg+'cc'}}
    >
      <Heading
        as="h1"
        paddingLeft={7}
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
  );
}
