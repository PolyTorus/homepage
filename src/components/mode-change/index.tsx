"use client";

import { useDarkLight } from "@/libs/dark-light";
import { SunIcon } from "@yamada-ui/lucide";

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
    <SunIcon
      onClick={handleClick}
      sx={{
        color: state.color,
        fontSize: 24,
        marginTop: 3,
        cursor: "pointer",
      }}
    />
  );
}
