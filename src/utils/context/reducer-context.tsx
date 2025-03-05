"use client";

import { createResult, Result, RESULT_NG } from "@/utils/result";
import {
  ActionDispatch,
  createContext,
  JSX,
  ReactNode,
  useContext,
  useReducer,
} from "react";

interface ReducerContext<S, A> {
  initialState: S;
  reducer: (state: S, action: A) => S;
}

export function createReducerContext<S, A>({
  initialState,
  reducer,
}: ReducerContext<S, A>): [
  ({ children }: { children: ReactNode }) => JSX.Element,
  () => [S, ActionDispatch<[action: A]>],
] {
  const Context = createContext<
    Result<[S, ActionDispatch<[action: A]>], Error>
  >(createResult.ng(new Error("Initialize!!!!!")));

  function Provider({ children }: { children: ReactNode }): JSX.Element {
    const reducerResult = useReducer<S, [action: A]>(reducer, initialState);

    const result: Result<[S, ActionDispatch<[action: A]>], never> =
      createResult.ok<[S, ActionDispatch<[action: A]>]>(reducerResult);

    return <Context value={result}>{children}</Context>;
  }

  function useReducerContext() {
    const context = useContext(Context);

    if (context.kind === RESULT_NG) {
      throw context.value;
    }

    return context.value;
  }

  return [Provider, useReducerContext];
}
