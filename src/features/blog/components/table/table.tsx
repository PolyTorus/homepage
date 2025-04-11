import { DetailedHTMLProps, TableHTMLAttributes } from "react";
import React from "react";

function Table(
  props: DetailedHTMLProps<
    TableHTMLAttributes<HTMLTableElement>,
    HTMLTableElement
  >
) {
  return <table border={1} style={{ borderCollapse: "collapse" }} {...props} />;
}

export default Table;
