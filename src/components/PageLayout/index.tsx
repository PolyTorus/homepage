import { Box, Flex, Heading } from "@yamada-ui/react";

import { ModeChange } from "../mode-change";
interface PageLayoutProps {
  title: string;
  children: React.ReactNode;
}

export default function PageLayout({ title, children }: PageLayoutProps) {
  return (
    <Box p={8}>
      <Box maxW="container.xl" mx="auto">
        <Flex justifyContent="space-between">
          <Heading as="h1" size="2xl" mb={8}>
            {title}
          </Heading>
          <ModeChange />
        </Flex>
        <Box>{children}</Box>
      </Box>
    </Box>
  );
}
