import { Heading, HStack } from "@yamada-ui/react";
import { ModeChange } from "./mode-change";

export function Header() {
  return (
    <HStack w="full" alignItems="center" justifyContent="space-between">
      <Heading as="h1" paddingLeft={7} fontSize="2.5rem" fontWeight="bold">
        Polytorus
      </Heading>

      <HStack justifyContent="space-between">
        <ModeChange />
      </HStack>
    </HStack>
  );
}
