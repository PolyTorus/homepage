"use client";

import { Heading, HStack } from "@yamada-ui/react";
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
    >
      <Heading
        as="h1"
        paddingLeft={7}
        fontSize="2.5rem"
        fontWeight="bold"
        color={state.color}
      >
        Polytorus
      </Heading>

      <HStack justifyContent="space-between">
        <ModeChange />
      </HStack>
    </HStack>
  );
}
