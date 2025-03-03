import React from 'react';
import { Box, List, ListItem, Link, Heading } from '@yamada-ui/react';

export default function Sidebar() {
  const sidebarStyles = {
    position: 'fixed' as const,
    top: 0,
    left: 0,
    width: '200px',
    height: '100vh',
    backgroundColor: '#32373C',
    borderRight: '1px solid',
    borderColor: 'whiteAlpha.200',
    boxShadow: 'md',
  };

  const navStyles = {
    padding: 20,
  };

  const headingStyles = {
    marginBottom: 10,
    fontSize: '2xl',
    fontWeight: 'bold',
    color: 'white',
  };

  const listItemStyles = {
    padding: 4,
    borderRadius: 'md',
    transition: 'colors',
    _hover: { backgroundColor: 'primaryAlpha.200' },
  };

  const linkStyles = {
    fontSize: 'lg',
    color: 'white',
    _hover: { color: 'white' },
  };

  // 配列の順序を変更
  const menuItems = ['Home', 'About', 'Blog'];

  return (
    <Box as="aside" sx={sidebarStyles}>
      <Box as="nav" sx={navStyles}>
        <Box sx={headingStyles}>
          <Heading as="h1">Polytorus</Heading>
        </Box>
        <List gap={4}>
          {menuItems.map((text, index) => (
            <ListItem key={index} sx={listItemStyles}>
              <Link href={text === 'Home' ? '/' : `/${text.toLowerCase()}`} sx={linkStyles}>
                {text}
              </Link>
            </ListItem>
          ))}
        </List>
      </Box>
    </Box>
  );
}
