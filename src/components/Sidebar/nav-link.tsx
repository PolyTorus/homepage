"use client";

import { Box, For, Icon, ListItem } from "@yamada-ui/react";
import { styles } from "./style";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { useDarkLight } from "@/libs/dark-light";
import { FaBlog, FaHome, FaInfoCircle, FaUsers } from "react-icons/fa";

export const MENU_ITEMS = [
  { label: "Home", href: "/", icon: FaHome },
  { label: "About", href: "/about", icon: FaInfoCircle },
  { label: "Blog", href: "/blog", icon: FaBlog },
  { label: "Developers", href: "/developers", icon: FaUsers },
] as const;

export function NavLink() {
  const currentPath = usePathname();
  const { state } = useDarkLight();
  // ダークモードかどうかを判定
  const isDarkMode = state.type === "dark";

  const isActiveLink = (href: string) => {
    if (href === "/") {
      return currentPath === "/";
    }
    return currentPath === href || currentPath?.startsWith(href + "/");
  };

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
    <For each={MENU_ITEMS}>
      {({ href, icon, label }) => (
        <ListItem key={href} sx={styles.listItem}>
          <Box
            as={Link}
            href={href}
            sx={{
              ...styles.link.base,
              ...(isActiveLink(href) ? activeStyle : {}),
              "&:hover": isActiveLink(href) ? {} : baseHoverStyle,
            }}
          >
            <Icon as={icon} size="lg" />
            {label}
          </Box>
        </ListItem>
      )}
    </For>
  );
}
