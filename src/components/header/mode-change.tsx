"use client";

import { useDarkLight } from "@/libs/dark-light";
import { SunIcon } from "@yamada-ui/lucide";
import {
  Drawer,
  DrawerBody,
  HStack,
  List,
  useDisclosure,
} from "@yamada-ui/react";
import { MenuIcon } from "@yamada-ui/lucide";
import { NavLink } from "../Sidebar/nav-link";

export function ModeChange() {
  const { state, changeMode } = useDarkLight();
  const { open, onOpen, onClose } = useDisclosure();

  const handleClick = () => {
    if (state.type === "dark") {
      changeMode("light");
    } else {
      changeMode("dark");
    }
  };

  return (
    <HStack w={20} marginRight={5} justifyContent="space-between">
      <SunIcon
        color={state.color}
        fontSize={24}
        onClick={handleClick}
        cursor="pointer"
        bg="transparent"
      />

      <MenuIcon
        fontSize={24}
        display={{ base: "none", lg: "inline-flex" }}
        color={state.color}
        onClick={onOpen}
      />

      <Drawer
        open={open}
        w={260}
        onClose={onClose}
        bg={state.bg}
        color={state.color}
      >
        <DrawerBody>
          <List marginLeft={5} marginTop={20}>
            <NavLink />
          </List>
        </DrawerBody>
      </Drawer>
    </HStack>
  );
}
