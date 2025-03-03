import { Box, Heading, Text, VStack } from '@yamada-ui/react';
import styles from '@/app/styles/page.module.css';

export default function BlogPage() {
  return (
    <Box ml="200px">
      <div className={styles.page}>
        <Box as="main" className={styles.main}>
          <VStack gap={6} alignItems="flex-start">
            <Heading as="h1">ブログ</Heading>
            <Text>
              Coming soon...
            </Text>
          </VStack>
        </Box>
      </div>
    </Box>
  );
} 