"use client";
import { useDarkLight } from "@/libs/dark-light";
import { SunIcon } from "@yamada-ui/lucide";
import { useEffect, useState } from "react";

export function ModeChange() {
  const { state, changeMode } = useDarkLight();
  const [mounted, setMounted] = useState(false);

  // Fix hydration mismatch by only applying styles after client-side hydration
  useEffect(() => {
    setMounted(true);
  }, []);

  const handleClick = () => {
    if (state.type === "dark") {
      changeMode("light");
    } else {
      changeMode("dark");
    }
  };

  // Don't render the button until after client-side hydration
  if (!mounted) {
    return null;
  }

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
