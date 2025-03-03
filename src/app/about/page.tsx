'use client'
import { Box, Heading, Text, VStack, Link, HStack, Icon } from '@yamada-ui/react';
import { FaGithub, FaEnvelope } from 'react-icons/fa';
import styles from '@/app/styles/page.module.css';

export default function AboutPage() {
  return (
    <Box ml="200px">
      <div className={styles.page}>
        <Box as="main" className={styles.main} p={8} borderRadius="lg" boxShadow="md" maxW="800px" mx="auto">
          <VStack gap={10} alignItems="flex-start">
            <Heading as="h1" size="xl" position="relative" _after={{
              content: '""',
              position: "absolute",
              bottom: "-8px",
              left: 0,
              width: "40px",
              height: "4px",
              borderRadius: "full"
            }}>
              開発者紹介
            </Heading>
            <Text fontSize="xl" fontWeight="medium">
              ソフトウェアエンジニア
            </Text>
            <Box w="full">
              <Heading as="h2" size="lg" mb={6}>スキル</Heading>
              <Text fontSize="lg" p={4} borderRadius="md" borderLeft="4px solid">
                TypeScript, React, Node.js
              </Text>
            </Box>
            <Box w="full">
              <Heading as="h2" size="lg" mb={6}>連絡先</Heading>
              <HStack gap={6}>
                <Link href="https://github.com/your-actual-username" transition="all 0.2s">
                  <HStack gap={3}>
                    <Icon as={FaGithub} boxSize={15} />
                    <Text fontSize="lg">GitHub</Text>
                  </HStack>
                </Link>
                <Link href="mailto:your-email@example.com" transition="all 0.2s">
                  <HStack gap={3}>
                    <Icon as={FaEnvelope} boxSize={15} />
                    <Text fontSize="lg">Email</Text>
                  </HStack>
                </Link>
              </HStack>
            </Box>
          </VStack>
        </Box>
      </div>
    </Box>
  );
}
