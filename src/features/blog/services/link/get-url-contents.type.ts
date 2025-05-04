import { createOption, Option } from "@/utils/option";

export type LinkDict = Record<string, unknown>;

export function judgeStringType(text: unknown): Option<string> {
  if (typeof text === "undefined") {
    return createOption.none();
  }

  if (typeof text === "string") {
    return createOption.some(text);
  }

  throw new Error("text is not string type");
}
