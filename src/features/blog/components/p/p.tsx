import { DetailedHTMLProps, HTMLAttributes } from "react";
import { Text } from "@yamada-ui/react";

function P(
  props: DetailedHTMLProps<
    HTMLAttributes<HTMLParagraphElement>,
    HTMLParagraphElement
  >
) {
  if (!props.children) return;

  return (
    <Text display="flex" alignItems="center" marginTop={10} marginBottom={10}>
      {props.children}
    </Text>
  );
}

export default P;
