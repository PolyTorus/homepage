import { DARK_BG, DARK_COLOR, LIGHT_BG, LIGHT_COLOR } from "@/theme";
import { ModeAction, ModeState } from "./dark-light.type";

export function darkLightReducer(
  state: ModeState,
  action: ModeAction
): ModeState {
  switch (action) {
    case "dark":
      return {
        type: "dark",
        bg: DARK_BG,
        color: DARK_COLOR
      };
    case "light":
      return {
        type: "light",
        bg: LIGHT_BG,
        color: LIGHT_COLOR
      };
    default:
      return {
        type: "dark",
        bg: DARK_BG,
        color: DARK_COLOR
      };
  }
}
