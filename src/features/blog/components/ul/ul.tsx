import { DetailedHTMLProps, HTMLAttributes } from "react";
import { DiscList } from "@yamada-ui/react";

function Ul(
  props: DetailedHTMLProps<HTMLAttributes<HTMLUListElement>, HTMLUListElement>
) {
  <ul></ul>;
  return <DiscList marginBottom={5}>{props.children}</DiscList>;
}

export default Ul;
