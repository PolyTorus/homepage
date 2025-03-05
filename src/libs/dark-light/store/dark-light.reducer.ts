import { ModeAction, ModeState } from "./dark-light.type";

export function darkLightReducer(
  state: ModeState,
  action: ModeAction,
): ModeState {
  switch (action) {
    case "dark":
      return {
        type: "dark",
        bg: "#32373c", 
        color: "#E8E6E3",
      };
    case "light":
      return {
        type: "light",
        bg: "#F2F1EE", 
        color: "#32373c", 
      };
    default:
      return {
        type: "dark",
        bg: "#32373c",
        color: "#E8E6E3",
      };
  }
}
