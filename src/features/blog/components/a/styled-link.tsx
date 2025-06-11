"use client";

import { Link } from "@yamada-ui/react";
import { ReactNode } from "react";

import { useDarkLight } from "@/features/dark-light";

interface Props {
  url: string;
  children: ReactNode;
}

export function StyledLink({ url, children }: Props) {
  const { state } = useDarkLight();

  return (
    <Link
      href={url}
      textDecoration="none"
      w="100%"
      h="100%"
      display="flex"
      alignItems="center"
      paddingLeft={5}
      color={state.color}
    >
      {children}
    </Link>
  );
}
