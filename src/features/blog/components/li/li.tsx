import { DetailedHTMLProps, LiHTMLAttributes } from "react";

function Li(
  props: DetailedHTMLProps<LiHTMLAttributes<HTMLLIElement>, HTMLLIElement>
) {
  return <li {...props} />;
}

export default Li;
