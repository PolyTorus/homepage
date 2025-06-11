import { createOption, Option } from "./option";

export function envParse(env?: string): Option<string> {
  if (!env) {
    return createOption.none();
  }

  return createOption.some(env);
}
