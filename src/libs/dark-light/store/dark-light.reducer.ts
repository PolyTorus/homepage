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
        color: "#DAD7D3",
      };
    case "light":
      return {
        type: "light",
        bg: "#DAD7D3",
        color: "#32373c",
      };
    default:
      return {
        type: "dark",
        bg: "#32373c",
        color: "#DAD7D3",
      };
  }
}
