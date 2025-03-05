"use client";

import { createReducerContext } from "@/utils/context";
import { ModeAction, ModeState } from "./dark-light.type";
import { darkLightReducer } from "./dark-light.reducer";
import { ReactNode } from "react";

export const darkLightContext = createReducerContext<ModeState, ModeAction>({
  reducer: darkLightReducer,
  initialState: {
    type: "light",
    bg: "#F2F1EE",
    color: "#32373c",
  },
});

interface Props {
  children: ReactNode;
}

export function ColorModeProvider({ children }: Props) {
  const [Provider] = darkLightContext;

  return <Provider>{children}</Provider>;
}
