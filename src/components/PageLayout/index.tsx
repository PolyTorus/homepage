import { Box, Flex, Heading } from "@yamada-ui/react";

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
        </Flex>
        <Box>{children}</Box>
      </Box>
    </Box>
  );
}
