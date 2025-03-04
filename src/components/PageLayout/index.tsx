'use client'
import { Box, Heading } from '@yamada-ui/react'

interface PageLayoutProps {
  title: string
  children: React.ReactNode
}

export default function PageLayout({ title, children }: PageLayoutProps) {
  return (
    <Box p={8}>
      <Box maxW="container.xl" mx="auto">
        <Heading as="h1" size="2xl" mb={8}>
          {title}
        </Heading>
        <Box>
          {children}
        </Box>
      </Box>
    </Box>
  )
}