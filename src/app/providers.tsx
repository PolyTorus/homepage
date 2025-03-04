'use client'
import { UIProvider } from '@yamada-ui/react'
import { theme } from '@/theme'

export function Providers({ children }: { children: React.ReactNode }) {
  return (
    <UIProvider theme={theme} colorMode="dark">
      {children}
    </UIProvider>
  )
} 