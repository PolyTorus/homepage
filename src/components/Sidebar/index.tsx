"use client";
import React, { useEffect, useState } from "react";
import { Box, List, ListItem, Heading, Icon } from "@yamada-ui/react";
import { usePathname } from "next/navigation";
import { FaHome, FaInfoCircle, FaBlog } from "react-icons/fa";
import { useDarkLight } from "@/libs/dark-light";
import Link from "next/link";

const MENU_ITEMS = [
  { label: "Home", href: "/", icon: FaHome },
  { label: "About", href: "/about", icon: FaInfoCircle },
  { label: "Blog", href: "/blog", icon: FaBlog },
] as const;

const styles = {
  sidebar: {
    position: "fixed" as const,
    top: 0,
    left: 0,
    width: "260px",
    height: "100vh",
    padding: "30px",
  },
  header: {
    marginBottom: "40px",
    fontSize: "3.5rem",
    fontWeight: "bold",
    textAlign: "center" as const,
  },
  nav: {
    width: "100%",
  },
  list: {
    width: "100%",
  },
  listItem: {
    width: "100%",
    padding: "8px",
  },
  link: {
    base: {
      width: "100%",
      padding: "16px",
      borderRadius: "md",
      display: "flex",
      alignItems: "center",
      gap: "16px",
      fontSize: "1.25rem",
      transition: "all 0.2s ease",
    },
  },
} as const;

function NavLink({
  href,
  icon,
  label,
  isActive,
  isDarkMode,
}: {
  href: string;
  icon: React.ComponentType;
  label: string;
  isActive: boolean;
  isDarkMode: boolean;
}) {
  // テーマカラーに基づいたスタイル
  const baseHoverStyle = isDarkMode
    ? { backgroundColor: "rgba(255, 255, 255, 0.1)" }
    : { backgroundColor: "rgba(50, 55, 60, 0.1)" };
    
  const activeStyle = isDarkMode
    ? { 
        backgroundColor: "rgba(255, 255, 255, 0.15)",
        fontWeight: "bold",
      }
    : { 
        backgroundColor: "rgba(50, 55, 60, 0.2)",
        fontWeight: "bold", 
      };

  return (
    <ListItem sx={styles.listItem}>
      <Box
        as={Link}
        href={href}
        sx={{
          ...styles.link.base,
          ...(isActive ? activeStyle : {}),
          "&:hover": isActive ? {} : baseHoverStyle,
        }}
      >
        <Icon as={icon} size="lg" />
        {label}
      </Box>
    </ListItem>
  );
}

export default function Sidebar() {
  const currentPath = usePathname();
  const { state } = useDarkLight();
  const [mounted, setMounted] = useState(false);

  // Fix hydration mismatch by only rendering complete UI after client-side hydration
  useEffect(() => {
    setMounted(true);
  }, []);

  const isActiveLink = (href: string) => {
    if (href === "/") {
      return currentPath === "/";
    }
    return currentPath === href || currentPath?.startsWith(href + "/");
  };

  // ダークモードかどうかを判定
  const isDarkMode = state.type === "dark";

  // Use a default style if not yet mounted to prevent hydration mismatch
  const sidebarStyle = mounted
    ? {
        ...styles.sidebar,
        backgroundColor: state.bg,
        color: state.color,
        borderRight: `1px solid ${isDarkMode ? "rgba(255, 255, 255, 0.1)" : "rgba(50, 55, 60, 0.2)"}`,
      }
    : {
        ...styles.sidebar,
        visibility: "hidden" as "hidden", // Hide until client-side hydration is complete
      };

  return (
    <Box as="aside" sx={sidebarStyle}>
      {mounted && (
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
                isDarkMode={isDarkMode}
              />
            ))}
          </List>
        </Box>
      )}
    </Box>
  );
}
