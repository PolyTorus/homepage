import { Link } from "@yamada-ui/react";
import React, { DetailedHTMLProps } from "react";

import { Container } from "./container";
import LinkCustom from "./link-custom";

const A = ({
  href,
  children
}: DetailedHTMLProps<
  React.AnchorHTMLAttributes<HTMLAnchorElement>,
  HTMLAnchorElement
>) => {
  if (!href) return null;

  if (href === children)
    return (
      <Container>
        <LinkCustom url={href} />
      </Container>
    );

  return (
    <Link href={href} target="_blank">
      {children}
    </Link>
  );
};

export default A;
