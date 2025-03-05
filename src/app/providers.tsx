"use client";
import { UIProvider } from "@yamada-ui/react";
import { yamadaTheme } from "@/theme";

export function Providers({ children }: { children: React.ReactNode }) {
  return (
    <UIProvider theme={yamadaTheme} colorMode="dark">
      {children}
    </UIProvider>
  );
}
