import type { Metadata } from "next";
import { Sidebar, Provider, MainLayout } from "@/components";
import "@/app/globals.css";
import { ColorModeProvider } from "@/libs/dark-light";
import { Flex } from "@yamada-ui/react";

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
            <Flex>
              <Sidebar />
              <MainLayout>{children}</MainLayout>
            </Flex>
          </ColorModeProvider>
        </Provider>
      </body>
    </html>
  );
}
