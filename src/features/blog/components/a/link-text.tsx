"use client";

import { Heading, Text } from "@yamada-ui/react";

import { useDarkLight } from "@/features/dark-light";

interface Props {
  title: string;
  description: string;
}

export function LinkText({ title, description }: Props) {
  const { state } = useDarkLight();

  return (
    <>
      <Heading
        as="h2"
        fontSize={14}
        color={state.color}
        overflow="hidden"
        whiteSpace="nowrap"
        textOverflow="ellipsis"
        paddingTop={20}
        p={1}
      >
        {title}
      </Heading>

      <Text p={1} color={state.color} fontSize={12}>
        {description}
      </Text>
    </>
  );
}
