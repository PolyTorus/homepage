import { Text, Box, Grid, Flex, Heading, Avatar } from "@yamada-ui/react";
import { PageLayout } from "@/components";

// 開発者データ
const developers = [
  {
    id: 1,
    name: "山田 太郎",
    role: "リードエンジニア",
    description:
      "フロントエンド開発のリーダー。ReactとTypeScriptのスペシャリスト。",
    avatar: "https://api.dicebear.com/7.x/avataaars/svg?seed=taro"
  },
  {
    id: 2,
    name: "佐藤 花子",
    role: "UIデザイナー",
    description:
      "ユーザーインターフェースとユーザーエクスペリエンスのデザインを担当。",
    avatar: "https://api.dicebear.com/7.x/avataaars/svg?seed=hanako"
  },
  {
    id: 3,
    name: "鈴木 一郎",
    role: "バックエンドエンジニア",
    description: "サーバーサイドの開発とデータベース設計を担当。",
    avatar: "https://api.dicebear.com/7.x/avataaars/svg?seed=ichiro"
  },
  {
    id: 4,
    name: "高橋 雄太",
    role: "プロジェクトマネージャー",
    description: "プロジェクト全体の進行管理と調整を担当。",
    avatar: "https://api.dicebear.com/7.x/avataaars/svg?seed=yuta"
  },
  {
    id: 5,
    name: "伊藤 美咲",
    role: "QAエンジニア",
    description: "品質保証とテスト自動化を担当。",
    avatar: "https://api.dicebear.com/7.x/avataaars/svg?seed=misaki"
  },
  {
    id: 6,
    name: "渡辺 健太",
    role: "DevOpsエンジニア",
    description: "CI/CDパイプラインとインフラストラクチャの管理を担当。",
    avatar: "https://api.dicebear.com/7.x/avataaars/svg?seed=kenta"
  }
];

interface Developer {
  id: number;
  name: string;
  role: string;
  description: string;
  avatar: string;
}

const DeveloperCard = ({ developer }: { developer: Developer }) => {
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

      <Grid
        templateColumns={{
          base: "repeat(1, 1fr)",
          md: "repeat(2, 1fr)",
          lg: "repeat(3, 1fr)"
        }}
        gap={6}
      >
        {developers.map((developer) => (
          <DeveloperCard key={developer.id} developer={developer} />
        ))}
      </Grid>
    </PageLayout>
  );
}
