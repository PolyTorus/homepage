import { Box, Flex, Heading } from "@yamada-ui/react";

interface PageLayoutProps {
  title: string;
  children: React.ReactNode;
}

export default function PageLayout({ title, children }: PageLayoutProps) {
  return (
    <Box
      p={{ base: 4, md: 8 }}
      pt={{ base: 16, md: 20 }}
      flex={1}
      overflowY="auto"
      width="100%"
    >
      <Box maxW="container.xl" mx="auto" width="100%">
        <Flex
          justifyContent="space-between"
          flexDirection={{ base: "column", md: "row" }}
        >
          <Heading
            as="h1"
            size={{ base: "xl", md: "2xl" }}
            mb={{ base: 4, md: 8 }}
            overflowWrap="break-word"
            wordBreak="break-word"
          >
            {title}
          </Heading>
        </Flex>
        <Box width="100%">{children}</Box>
      </Box>
    </Box>
  );
}
