import { Box, List, Heading } from "@yamada-ui/react";
import { styles } from "./style";
import { NavLink } from "./nav-link";
import { Container } from "./container";

export default function Sidebar() {
  return (
    <Container>
      <Box as="nav" sx={styles.nav}>
        <Box sx={styles.header}>
          <Heading as="h1">Polytorus</Heading>
        </Box>
        <List sx={styles.list}>
          <NavLink />
        </List>
      </Box>
    </Container>
  );
}
