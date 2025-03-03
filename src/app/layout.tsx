import type { Metadata } from "next";
import { Inter, Noto_Sans_JP } from "next/font/google";
import "@/app/styles/globals.css";
import Sidebar from "@/app/components/Sidebar";
import { UIProvider } from '@yamada-ui/react'
import { theme } from '@/app/theme'

const inter = Inter({
  subsets: ['latin'],
  display: 'swap',
  variable: '--font-inter',
});

const notoSansJP = Noto_Sans_JP({
  subsets: ['latin'],
  weight: ['400', '500', '700'],
  display: 'swap',
  variable: '--font-noto-sans',
});

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
    <html lang="ja" className={`${inter.variable} ${notoSansJP.variable}`}>
      <body>
        <UIProvider theme={theme} colorMode="dark">
          <div style={{ paddingLeft: '200px' }}>
            <Sidebar />
            {children}
          </div>
        </UIProvider>
      </body>
    </html>
  );
}
