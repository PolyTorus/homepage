import { DetailedHTMLProps, HTMLAttributes } from "react";
import { Heading } from "@yamada-ui/react";

function H2(
  props: DetailedHTMLProps<
    HTMLAttributes<HTMLHeadingElement>,
    HTMLHeadingElement
  >
) {
  return (
    <>
      <Heading as="h2" size="md" {...props} />
    </>
  );
}

export default H2;
