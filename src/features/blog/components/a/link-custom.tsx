import React from "react";
import { getUrlContents } from "../../services/link/get-url-contents";
import { Box, HStack, Image, Link } from "@yamada-ui/react";
import { LinkText } from "./link-text";
import { Option, OPTION_SOME } from "@/utils/option";
import { judgeStringType } from "../../services/link/get-url-contents.type";

interface Props {
  url: string;
}

const LinkCustom = async (props: Props) => {
  try {
    const ogp = await getUrlContents(props.url);

    const title: Option<string> = judgeStringType(ogp["og:title"]);
    const description: Option<string> = judgeStringType(ogp["og:description"]);
    const imageUrl: Option<string> = judgeStringType(ogp["og:image"]);

    return (
      <Link href={props.url} target="_blank" textDecoration="none">
        <HStack justifyContent="space-between">
          <Box height={120} minW={150}>
            <LinkText
              title={title.kind === OPTION_SOME ? title.value : props.url}
              description={
                description.kind === OPTION_SOME ? description.value : ""
              }
            />
          </Box>

          {imageUrl.kind === OPTION_SOME && (
            <Box h={120} minW={220} display="flex" overflow="hidden">
              <Image
                src={imageUrl.value}
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
