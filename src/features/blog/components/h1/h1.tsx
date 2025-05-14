import { Heading } from "@yamada-ui/react";
import { DetailedHTMLProps, HTMLAttributes } from "react";

function H1(
  props: DetailedHTMLProps<
    HTMLAttributes<HTMLHeadingElement>,
    HTMLHeadingElement
  >
) {
  return (
    <>
      <Heading as="h1" size="lg" {...props} />
    </>
  );
}

export default H1;
