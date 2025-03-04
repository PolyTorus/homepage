'use client'
import React from 'react'
import { Box, List, ListItem, Link, Heading, Icon } from '@yamada-ui/react'
import { usePathname } from 'next/navigation'
import { FaHome, FaInfoCircle, FaBlog } from 'react-icons/fa'

const MENU_ITEMS = [
  { label: 'Home', href: '/', icon: FaHome },
  { label: 'About', href: '/about', icon: FaInfoCircle },
  { label: 'Blog', href: '/blog', icon: FaBlog },
] as const

const styles = {
  sidebar: {
    position: 'fixed' as const,
    top: 0,
    left: 0,
    width: '260px',
    height: '100vh',
    backgroundColor: '#32373C',
    padding: '30px',
  },
  header: {
    marginBottom: '40px',
    fontSize: '3.5rem',
    fontWeight: 'bold',
    textAlign: 'center' as const,
  },
  nav: {
    width: '100%',
  },
  list: {
    width: '100%',
  },
  listItem: {
    width: '100%',
    padding: '8px',
  },
  link: {
    base: {
      width: '100%',
      padding: '16px',
      borderRadius: 'md',
      display: 'flex',
      alignItems: 'center',
      gap: '16px',
      fontSize: '1.25rem',
      transition: 'all 0.2s ease',
      _hover: { 
        backgroundColor: 'rgba(255, 255, 255, 0.1)',
      },
    },
    active: {
      backgroundColor: 'rgba(255, 255, 255, 0.15)',
    },
  },
} as const

function NavLink({ href, icon, label, isActive }: {
  href: string
  icon: React.ComponentType
  label: string
  isActive: boolean
}) {
  return (
    <ListItem sx={styles.listItem}>
      <Link
        href={href}
        sx={isActive ? { ...styles.link.base, ...styles.link.active } : styles.link.base}
      >
        <Icon as={icon} size="lg" />
        {label}
      </Link>
    </ListItem>
  )
}

export default function Sidebar() {
  const currentPath = usePathname()

  const isActiveLink = (href: string) => {
    if (href === '/') {
      return currentPath === '/'
    }
    return currentPath === href || currentPath?.startsWith(href + '/')
  }

  return (
    <Box as="aside" sx={styles.sidebar}>
      <Box as="nav" sx={styles.nav}>
        <Box sx={styles.header}>
          <Heading as="h1">Polytorus</Heading>
        </Box>
        <List sx={styles.list}>
          {MENU_ITEMS.map((item) => (
            <NavLink
              key={item.href}
              {...item}
              isActive={isActiveLink(item.href)}
            />
          ))}
        </List>
      </Box>
    </Box>
  )
} 