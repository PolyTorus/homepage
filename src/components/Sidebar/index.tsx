import { Box, List } from "@yamada-ui/react";

import { Container } from "./container";
import { NavLink } from "./nav-link";
import { styles } from "./style";

export default function Sidebar() {
  return (
    <Container>
      <Box as="nav" sx={styles.nav}>
        <List sx={styles.list}>
          <NavLink />
        </List>
      </Box>
    </Container>
  );
}
