"use client";

import {
  Text,
  Box,
  Flex,
  Heading,
  Grid,
  Card,
  CardBody,
  Button,
  Icon,
  VStack
} from "@yamada-ui/react";
import { PageLayout } from "@/components";
import { FaRocket, FaBolt, FaShieldAlt, FaUserShield } from "react-icons/fa";
import Link from "next/link";
import { useDarkLight } from "@/features/dark-light";
import { useMemo } from "react";

export default function Home() {
  const { state } = useDarkLight();
  const isDark = state.type === "dark";

  // 特徴カードのスタイル
  const cardStyle = useMemo(
    () => ({
      height: "100%",
      transition: "transform 0.3s ease, box-shadow 0.3s ease",
      border: "1px solid",
      borderColor: isDark
        ? "rgba(255, 255, 255, 0.1)"
        : "rgba(50, 55, 60, 0.1)",
      bg: isDark ? "rgba(255, 255, 255, 0.03)" : "rgba(255, 255, 255, 0.7)",
      _hover: {
        transform: "translateY(-5px)",
        boxShadow: "lg",
        borderColor: isDark
          ? "rgba(255, 255, 255, 0.2)"
          : "rgba(50, 55, 60, 0.2)"
      }
    }),
    [isDark]
  );

  // ボタンのスタイル
  const buttonStyle = {
    bg: isDark ? "rgba(255, 255, 255, 0.1)" : "rgba(50, 55, 60, 0.8)",
    color: "white",
    _hover: {
      bg: isDark ? "rgba(255, 255, 255, 0.2)" : "rgba(50, 55, 60, 0.9)"
    }
  };

  return (
    <PageLayout title="Polytorus">
      {/* ヒーローセクション */}
      <Box mb={16} textAlign="center" width="100%" px={{ base: 4, md: 0 }}>
        <Heading
          as="h2"
          size={{ base: "xl", md: "2xl" }}
          mb={4}
          bgGradient={
            isDark
              ? "linear(to-r, #a18cd1, #fbc2eb)"
              : "linear(to-r, #6a11cb, #2575fc)"
          }
          bgClip="text"
        >
          次世代のレイヤー1ブロックチェーン
        </Heading>
        <Text
          fontSize={{ base: "md", md: "xl" }}
          mb={8}
          maxW="container.md"
          mx="auto"
          lineHeight="tall"
        >
          Polytorusは、スケーラビリティ、セキュリティ、使いやすさを兼ね備えた
          次世代のブロックチェーンプラットフォームです。
        </Text>
        <Flex gap={4} justify="center" flexWrap="wrap">
          <Button
            as={Link}
            href="/about"
            size={{ base: "md", md: "lg" }}
            sx={buttonStyle}
          >
            詳細を見る
          </Button>
          <Button
            as={Link}
            href="/developers"
            size={{ base: "md", md: "lg" }}
            variant="outline"
            borderColor={
              isDark ? "rgba(255, 255, 255, 0.3)" : "rgba(50, 55, 60, 0.5)"
            }
            _hover={{
              bg: isDark
                ? "rgba(255, 255, 255, 0.05)"
                : "rgba(50, 55, 60, 0.05)"
            }}
          >
            開発者向け情報
          </Button>
        </Flex>
      </Box>

      {/* 特徴セクション */}
      <Box mb={16} width="100%" px={{ base: 4, md: 0 }}>
        <Heading
          as="h3"
          size={{ base: "md", md: "lg" }}
          mb={8}
          textAlign="center"
        >
          Polytorusの4つの原則
        </Heading>
        <Grid
          templateColumns={{
            base: "repeat(1, 1fr)",
            sm: "repeat(2, 1fr)",
            lg: "repeat(4, 1fr)"
          }}
          gap={{ base: 4, md: 6 }}
        >
          {/* 最新 */}
          <Card sx={cardStyle}>
            <CardBody>
              <VStack gap={4} align="center">
                <Icon
                  as={FaRocket}
                  boxSize={{ base: 8, md: 12 }}
                  color={isDark ? "#a18cd1" : "#6a11cb"}
                />
                <Heading as="h4" size={{ base: "sm", md: "md" }}>
                  最新
                </Heading>
                <Text textAlign="center" fontSize={{ base: "sm", md: "md" }}>
                  最先端の技術を採用し、常に革新的なソリューションを提供します。
                </Text>
              </VStack>
            </CardBody>
          </Card>

          {/* 最速 */}
          <Card sx={cardStyle}>
            <CardBody>
              <VStack gap={4} align="center">
                <Icon
                  as={FaBolt}
                  boxSize={{ base: 8, md: 12 }}
                  color={isDark ? "#fbc2eb" : "#2575fc"}
                />
                <Heading as="h4" size={{ base: "sm", md: "md" }}>
                  最速
                </Heading>
                <Text textAlign="center" fontSize={{ base: "sm", md: "md" }}>
                  高速なトランザクション処理能力により、ストレスフリーな体験を実現します。
                </Text>
              </VStack>
            </CardBody>
          </Card>

          {/* 最安全 */}
          <Card sx={cardStyle}>
            <CardBody>
              <VStack gap={4} align="center">
                <Icon
                  as={FaShieldAlt}
                  boxSize={{ base: 8, md: 12 }}
                  color={isDark ? "#a18cd1" : "#6a11cb"}
                />
                <Heading as="h4" size={{ base: "sm", md: "md" }}>
                  最安全
                </Heading>
                <Text textAlign="center" fontSize={{ base: "sm", md: "md" }}>
                  強固なセキュリティ設計により、資産と取引の安全性を確保します。
                </Text>
              </VStack>
            </CardBody>
          </Card>

          {/* 最安心 */}
          <Card sx={cardStyle}>
            <CardBody>
              <VStack gap={4} align="center">
                <Icon
                  as={FaUserShield}
                  boxSize={{ base: 8, md: 12 }}
                  color={isDark ? "#fbc2eb" : "#2575fc"}
                />
                <Heading as="h4" size={{ base: "sm", md: "md" }}>
                  最安心
                </Heading>
                <Text textAlign="center" fontSize={{ base: "sm", md: "md" }}>
                  透明性と信頼性を重視した設計で、安心してご利用いただけます。
                </Text>
              </VStack>
            </CardBody>
          </Card>
        </Grid>
      </Box>

      {/* 統計情報 */}
      <Box
        mb={16}
        p={{ base: 4, md: 8 }}
        borderRadius="lg"
        bg={isDark ? "rgba(255, 255, 255, 0.03)" : "rgba(50, 55, 60, 0.03)"}
        border="1px solid"
        borderColor={
          isDark ? "rgba(255, 255, 255, 0.1)" : "rgba(50, 55, 60, 0.1)"
        }
        width="100%"
      >
        <Heading
          as="h3"
          size={{ base: "md", md: "lg" }}
          mb={8}
          textAlign="center"
        >
          Polytorusの現在
        </Heading>
        <Grid
          templateColumns={{
            base: "repeat(2, 1fr)",
            md: "repeat(4, 1fr)"
          }}
          gap={{ base: 3, md: 6 }}
        >
          <VStack>
            <Heading
              as="h3"
              size={{ base: "xl", md: "2xl" }}
              bgGradient={
                isDark
                  ? "linear(to-r, #a18cd1, #fbc2eb)"
                  : "linear(to-r, #6a11cb, #2575fc)"
              }
              bgClip="text"
            >
              2.5秒
            </Heading>
            <Text textAlign="center" fontSize={{ base: "sm", md: "md" }}>
              ブロック生成時間
            </Text>
          </VStack>

          <VStack>
            <Heading
              as="h3"
              size={{ base: "xl", md: "2xl" }}
              bgGradient={
                isDark
                  ? "linear(to-r, #a18cd1, #fbc2eb)"
                  : "linear(to-r, #6a11cb, #2575fc)"
              }
              bgClip="text"
            >
              10,000+
            </Heading>
            <Text textAlign="center" fontSize={{ base: "sm", md: "md" }}>
              TPS処理能力
            </Text>
          </VStack>

          <VStack>
            <Heading
              as="h3"
              size={{ base: "xl", md: "2xl" }}
              bgGradient={
                isDark
                  ? "linear(to-r, #a18cd1, #fbc2eb)"
                  : "linear(to-r, #6a11cb, #2575fc)"
              }
              bgClip="text"
            >
              100+
            </Heading>
            <Text textAlign="center" fontSize={{ base: "sm", md: "md" }}>
              アクティブ開発者
            </Text>
          </VStack>

          <VStack>
            <Heading
              as="h3"
              size={{ base: "xl", md: "2xl" }}
              bgGradient={
                isDark
                  ? "linear(to-r, #a18cd1, #fbc2eb)"
                  : "linear(to-r, #6a11cb, #2575fc)"
              }
              bgClip="text"
            >
              50+
            </Heading>
            <Text textAlign="center" fontSize={{ base: "sm", md: "md" }}>
              dApps
            </Text>
          </VStack>
        </Grid>
      </Box>

      {/* CTA セクション */}
      <Box
        textAlign="center"
        p={{ base: 6, md: 10 }}
        borderRadius="lg"
        bg={isDark ? "rgba(255, 255, 255, 0.05)" : "rgba(50, 55, 60, 0.05)"}
        border="1px solid"
        borderColor={
          isDark ? "rgba(255, 255, 255, 0.1)" : "rgba(50, 55, 60, 0.1)"
        }
        width="100%"
      >
        <Heading as="h3" size={{ base: "md", md: "lg" }} mb={4}>
          Polytorusでブロックチェーンの未来を体験しよう
        </Heading>
        <Text
          fontSize={{ base: "md", md: "lg" }}
          mb={6}
          maxW="container.md"
          mx="auto"
        >
          最新・最速・最安全・最安心のブロックチェーンプラットフォームで、
          次世代のデジタルエコノミーを構築しましょう。
        </Text>
        <Button
          as={Link}
          href="/contact"
          size={{ base: "md", md: "lg" }}
          sx={buttonStyle}
        >
          お問い合わせ
        </Button>
      </Box>
    </PageLayout>
  );
}
