import { Heading } from "@yamada-ui/react";
import { DetailedHTMLProps, HTMLAttributes } from "react";

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
