"use client";
import { useDarkLight } from "@/libs/dark-light";
import { SunIcon } from "@yamada-ui/lucide";
import { Button } from "@yamada-ui/react";

export function ModeChange() {
  const { state, changeMode } = useDarkLight();

  const handleClick = () => {
    if (state.type === "dark") {
      changeMode("light");
    } else {
      changeMode("dark");
    }
  };

  return (
    <Button
      onClick={handleClick}
      sx={{
        color: state.color,
        backgroundColor: state.bg,
        width: 10,
        height: 10,
        borderRadius: "50%",
        marginTop: 3,
      }}
      _hover={{
        backgroundColor: state.bg,
      }}
    >
      <SunIcon sx={{ fontSize: 40 }} />
    </Button>
  );
}
