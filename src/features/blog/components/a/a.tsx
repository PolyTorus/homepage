import React, { DetailedHTMLProps } from "react";
import LinkCustom from "./link-custom";
import { Link } from "@yamada-ui/react";
import { Container } from "./container";

const A = (
  props: DetailedHTMLProps<
    React.AnchorHTMLAttributes<HTMLAnchorElement>,
    HTMLAnchorElement
  >
) => {
  if (!props.href) return null;

  if (props.href === props.children)
    return (
      <Container>
        <LinkCustom url={props.href} />
      </Container>
    );

  return (
    <Link href={props.href} target="_blank">
      {props.children}
    </Link>
  );
};

export default A;
