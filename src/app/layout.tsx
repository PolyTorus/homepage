import type { Metadata } from "next";
import { Sidebar, Provider, MainLayout } from "@/components";
import "@/app/globals.css";
import { ColorModeProvider } from "@/libs/dark-light";
import { Box, Flex } from "@yamada-ui/react";

export const metadata: Metadata = {
  title: "Polytorus Homepage",
  description: "Polytorus Homepage",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
        <Provider>
          <ColorModeProvider>
            <MainLayout>
              <Flex>
                <Sidebar />
                <Box>{children}</Box>
              </Flex>
            </MainLayout>
          </ColorModeProvider>
        </Provider>
      </body>
    </html>
  );
}
