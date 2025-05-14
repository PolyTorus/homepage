"use client";

import { ReactNode } from "react";

import { LIGHT_BG, LIGHT_COLOR } from "@/theme";
import { createReducerContext } from "@/utils/context";

import { darkLightReducer } from "./dark-light.reducer";
import { ModeAction, ModeState } from "./dark-light.type";

export const darkLightContext = createReducerContext<ModeState, ModeAction>({
  reducer: darkLightReducer,
  initialState: {
    type: "light",
    bg: LIGHT_BG,
    color: LIGHT_COLOR
  }
});

interface Props {
  children: ReactNode;
}

export function ColorModeProvider({ children }: Props) {
  const [Provider] = darkLightContext;

  return <Provider>{children}</Provider>;
}
