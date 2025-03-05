import { DARK_BG, DARK_COLOR, LIGHT_BG, LIGHT_COLOR } from "@/theme";

interface Dark {
  type: "dark";
  bg: typeof DARK_BG;
  color: typeof DARK_COLOR;
}

interface Light {
  type: "light";
  bg: typeof LIGHT_BG;
  color: typeof LIGHT_COLOR;
}

export type ModeState = Dark | Light;

export type ModeAction = "dark" | "light";
