import { DecimalList } from "@yamada-ui/react";
import { DetailedHTMLProps, OlHTMLAttributes } from "react";

function Ol(
  props: DetailedHTMLProps<OlHTMLAttributes<HTMLLIElement>, HTMLLIElement>
) {
  return <DecimalList marginBottom={5}>{props.children}</DecimalList>;
}

export default Ol;
