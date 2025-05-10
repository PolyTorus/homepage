import { darkLightContext } from "../store/dark-light.context";

export function useDarkLight() {
  const [, useDarkLightContext] = darkLightContext;
  const [state, dispatch] = useDarkLightContext();

  const changeMode = (type: "dark" | "light") => {
    dispatch(type);
  };

  return { state, changeMode };
}
