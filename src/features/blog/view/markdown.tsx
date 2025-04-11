import { MDXComponents } from "mdx/types";
import Ul from "../components/ul/ul";
import H1 from "../components/h1/h1";
import P from "../components/p/p";
import Table from "../components/table/table";
import H2 from "../components/h2/h2";
import Li from "../components/li/li";
import Ol from "../components/ol/ol";

export const markdownComponent: MDXComponents = {
  h1: (props) => <H1 {...props} />,
  h2: (props) => <H2 {...props} />,
  ul: (props) => <Ul {...props} />,
  p: (props) => <P {...props} />,
  li: (props) => <Li {...props} />,
  table: (props) => <Table {...props} />,
  ol: (props) => <Ol {...props} />
};
