import { Text, Box, Grid, Flex, Heading, Avatar } from "@yamada-ui/react";
import { PageLayout } from "@/components";
import { collaborators, Collaborator } from "./constant/collaborator";

const DeveloperCard = ({ developer }: { developer: Collaborator }) => {
  return (
    <Box
      p={6}
      borderRadius="md"
      border="1px solid"
      borderColor="gray.200"
      _dark={{ borderColor: "gray.700" }}
      transition="all 0.3s"
      _hover={{
        transform: "translateY(-5px)",
        boxShadow: "lg"
      }}
    >
      <Flex direction="column" align="center">
        <Avatar src={developer.avatar} size="xl" mb={4} />
        <Heading as="h3" size="md" mb={2} textAlign="center">
          {developer.name}
        </Heading>
        <Text
          fontSize="sm"
          fontWeight="bold"
          color="gray.500"
          _dark={{ color: "gray.400" }}
          mb={3}
        >
          {developer.role}
        </Text>
        <Text fontSize="sm" textAlign="center">
          {developer.description}
        </Text>
      </Flex>
    </Box>
  );
};

export default function Developers() {
  return (
    <PageLayout title="開発者紹介">
      <Box mb={8}>
        <Text fontSize="lg" lineHeight="tall">
          Polytorusの素晴らしいチームメンバーをご紹介します。それぞれが専門分野を持ち、協力して最高のプロダクトを作り上げています。
        </Text>
      </Box>
      <Heading as="h2" size={{ base: "md", md: "2xs" }}>
        メイン開発者
      </Heading>
      <Grid
        templateColumns={{
          base: "repeat(1, 1fr)",
          md: "repeat(2, 1fr)",
          lg: "repeat(3, 1fr)"
        }}
        gap={6}
      >
        {collaborators.map((collaborator) => (
          <DeveloperCard key={collaborator.id} developer={collaborator} />
        ))}
      </Grid>
    </PageLayout>
  );
}
