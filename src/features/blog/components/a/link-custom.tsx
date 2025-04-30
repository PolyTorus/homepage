import React from "react";
import { getUrlContents } from "./get-url-contents";
import { Box, HStack, Image, Link } from "@yamada-ui/react";
import { LinkText } from "./link-text";

interface Props {
  url: string;
}

const LinkCustom = async (props: Props) => {
  try {
    const ogp = await getUrlContents(props.url);

    return (
      <Link href={props.url} target="_blank" textDecoration="none">
        <HStack justifyContent="space-between">
          <Box height={120} minW={150}>
            <LinkText
              title={ogp["og:title"] ? ogp["og:title"] : props.url}
              description={ogp["og:description"]}
            />
          </Box>

          {ogp["og:image"] && (
            <Box h={120} minW={220} display="flex" overflow="hidden" bg="red">
              <Image
                src={ogp["og:image"]}
                alt=""
                pointerEvents="none"
                userSelect="none"
                objectFit="contain"
                objectPosition="right"
              />
            </Box>
          )}
        </HStack>
      </Link>
    );
  } catch (e) {
    console.log(e);
  }
};

export default LinkCustom;
