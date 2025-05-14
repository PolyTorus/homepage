import { Heading } from "@yamada-ui/react";
import { DetailedHTMLProps, HTMLAttributes } from "react";

function H3(
  props: DetailedHTMLProps<
    HTMLAttributes<HTMLHeadingElement>,
    HTMLHeadingElement
  >
) {
  return (
    <>
      <Heading as="h3" size="sm" {...props} marginTop={5} marginBottom={5} />
    </>
  );
}

export default H3;
