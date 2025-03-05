"use client";
import { UIProvider } from "@yamada-ui/react";

export default function Provider({ children }: { children: React.ReactNode }) {
  return <UIProvider>{children}</UIProvider>;
}
