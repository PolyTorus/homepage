"use client";

import { Box, For, Icon, ListItem } from "@yamada-ui/react";
import { styles } from "./style";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { useDarkLight } from "@/libs/dark-light";
import {
  FaBlog,
  FaHome,
  FaInfoCircle,
  FaUsers,
  FaEnvelope,
  FaListAlt
} from "react-icons/fa";

export const MENU_ITEMS = [
  { label: "Home", href: "/", icon: FaHome },
  { label: "About", href: "/about", icon: FaInfoCircle },
  { label: "Blog", href: "/blog", icon: FaBlog },
  { label: "Developers", href: "/developers", icon: FaUsers },
  { label: "Contact", href: "/contact", icon: FaEnvelope },
  { label: "Waitlist", href: "/waitlist", icon: FaListAlt }
] as const;

interface Props {
  onClick?: () => void;
}

export function NavLink({ onClick = () => {} }: Props) {
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
    ? {
        backgroundColor: "rgba(255, 255, 255, 0.1)",
        textDecoration: "none"
      }
    : { backgroundColor: "rgba(50, 55, 60, 0.1)", textDecoration: "none" };

  const activeStyle = isDarkMode
    ? {
        backgroundColor: "rgba(255, 255, 255, 0.15)",
        fontWeight: "bold",
        textDecoration: "none"
      }
    : {
        backgroundColor: "rgba(50, 55, 60, 0.2)",
        fontWeight: "bold",
        textDecoration: "none"
      };

  return (
    <For each={MENU_ITEMS}>
      {({ href, icon, label }) => (
        <ListItem key={href} sx={styles.listItem}>
          <Box
            as={Link}
            href={href}
            onClick={onClick}
            color={state.color}
            bg={state.bg}
            textDecoration="none"
            sx={{
              ...styles.link.base,
              ...(isActiveLink(href) ? activeStyle : {}),
              "&:hover": isActiveLink(href)
                ? { textDecoration: "none" }
                : baseHoverStyle
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
