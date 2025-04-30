"use client";

import { useDarkLight } from "@/libs/dark-light";
import { Heading, Text } from "@yamada-ui/react";

interface Props {
  title: string;
  description?: string;
}

export function LinkText({ title, description = "" }: Props) {
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
        p={1}
      >
        {title}
      </Heading>

      <Text p={1} color={state.color} mt={5} fontSize={12}>
        {description}
      </Text>
    </>
  );
}
