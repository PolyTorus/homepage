import { MDXComponents } from "mdx/types";

import A from "../components/a/a";
import H1 from "../components/h1/h1";
import H2 from "../components/h2/h2";
import H3 from "../components/h3/h3";
import Li from "../components/li/li";
import Ol from "../components/ol/ol";
import P from "../components/p/p";
import Table from "../components/table/table";
import Ul from "../components/ul/ul";

export const markdownComponent: MDXComponents = {
  a: (props) => <A {...props} />,
  h1: (props) => <H1 {...props} />,
  h2: (props) => <H2 {...props} />,
  h3: (props) => <H3 {...props} />,
  ul: (props) => <Ul {...props} />,
  p: (props) => <P {...props} />,
  li: (props) => <Li {...props} />,
  table: (props) => <Table {...props} />,
  ol: (props) => <Ol {...props} />
};
