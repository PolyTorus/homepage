import { DiscList } from "@yamada-ui/react";
import { DetailedHTMLProps, HTMLAttributes } from "react";

function Ul(
  props: DetailedHTMLProps<HTMLAttributes<HTMLUListElement>, HTMLUListElement>
) {
  return <DiscList marginBottom={5}>{props.children}</DiscList>;
}

export default Ul;
