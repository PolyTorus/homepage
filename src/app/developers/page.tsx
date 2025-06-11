import {
  Text,
  Box,
  Grid,
  Flex,
  Heading,
  Avatar,
  HStack,
  Link
} from "@yamada-ui/react";
import { PageLayout } from "@/components";
import { collaborators, Collaborator } from "./constant/collaborator";
import { getContributor } from "./services/get-contributor";
import { RESULT_NG } from "@/utils/result";
import { Contributor } from "./services/api-contributor.type";
import { DeveloperContainer } from "./components/developer-container";

const DeveloperCard = ({ developer }: { developer: Collaborator }) => {
  return (
    <Link href={developer.htmlUrl} target="_blank">
      <DeveloperContainer>
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
      </DeveloperContainer>
    </Link>
  );
};

function Contributors({ avatarUrl, htmlUrl }: Contributor) {
  return (
    <Link href={htmlUrl} target="_blank">
      <Avatar src={avatarUrl} size="lg" mb={4} />
    </Link>
  );
}

export default async function Developers() {
  const contributors = await getContributor();

  if (contributors.kind === RESULT_NG) {
    throw contributors.value;
  }

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

      <Heading as="h2" marginTop={15} size={{ base: "md", md: "2xs" }}>
        貢献者
      </Heading>

      <HStack marginTop={10}>
        {contributors.value.map((item, index) => (
          <Contributors key={index} {...item} />
        ))}
      </HStack>
    </PageLayout>
  );
}
