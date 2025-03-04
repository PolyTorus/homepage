'use client'
import { Text, Box } from '@yamada-ui/react'
import { PageLayout } from '@/components'

export default function Home() {
  return (
    <PageLayout title="Home">
      <Box>
        <Text fontSize="lg" lineHeight="tall">
          Welcome to Polytorus
        </Text>
      </Box>
    </PageLayout>
  )
}
