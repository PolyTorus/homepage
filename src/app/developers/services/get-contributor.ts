import { envParse } from "@/utils/env-parse";
import {
  Contributors,
  isApiContributor,
  parseContributors
} from "./api-contributor.type";
import { OPTION_NONE } from "@/utils/option";
import { createResult, Result } from "@/utils/result";
import { APIError } from "@/utils/api-error";

export async function getContributor(): Promise<
  Result<Contributors, APIError>
> {
  const url = process.env.CONTRIBUTOR_URL;

  const parseUrl = envParse(url);

  if (parseUrl.kind === OPTION_NONE) {
    throw new Error("URLが設定されていません。");
  }

  const res = await fetch(parseUrl.value);

  if (!res.ok) {
    if (res.status >= 400 && res.status < 500) {
      return createResult.ng<APIError>(
        new APIError({
          type: "yourError",
          message: "URL等の設定を確認してください。"
        })
      );
    }

    return createResult.ng<APIError>(
      new APIError({
        type: "ServerError",
        message: "サーバー側で問題が起こっています。"
      })
    );
  }

  const value = await res.json();

  if (!isApiContributor(value)) {
    return createResult.ng(
      new APIError({
        type: "typeError",
        message: "型が違います"
      })
    );
  }

  const parseValue = parseContributors(value);

  return createResult.ok(parseValue);
}
