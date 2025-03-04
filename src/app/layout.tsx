import type { Metadata } from "next";
import { Box } from '@yamada-ui/react'
import { Sidebar, Provider } from '@/components'
import "@/app/globals.css";

export const metadata: Metadata = {
  title: "Polytorus Homepage",
  description: "Polytorus Homepage",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>
        <Provider>
          <Sidebar />
          <Box
            as="main"
            sx={{
              marginLeft: '260px',
              padding: '30px',
              minHeight: '100vh',
              backgroundColor: '#1A1D1F',
            }}
          >
            {children}
          </Box>
        </Provider>
      </body>
    </html>
  )
}
