import { Text } from "@yamada-ui/react";
import { DetailedHTMLProps, HTMLAttributes } from "react";

function P(
  props: DetailedHTMLProps<
    HTMLAttributes<HTMLParagraphElement>,
    HTMLParagraphElement
  >
) {
  if (!props.children) return;

  if (typeof props.children === "object") {
    return <>{props.children}</>;
  }

  return (
    <Text display="flex" alignItems="center" marginTop={10} marginBottom={10}>
      {props.children}
    </Text>
  );
}

export default P;
