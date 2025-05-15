import { collaborators } from "../constant/collaborator";

export interface APIContributor {
  login: string;
  id: number;
  node_id: string;
  avatar_url: string;
  gravatar_id: string;
  url: string;
  html_url: string;
  followers_url: string;
  following_url: string;
  gists_url: string;
  starred_url: string;
  subscriptions_url: string;
  organizations_url: string;
  repos_url: string;
  events_url: string;
  received_events_url: string;
  type: string;
  user_view_type: string;
  site_admin: boolean;
  contributions: number;
}

export function isApiContributor(
  value: unknown
): value is Array<APIContributor> {
  if (!Array.isArray(value)) {
    return false;
  }

  const isRightList: Array<boolean> = value.map((item) => {
    return (
      typeof item.login === "string" &&
      typeof item.id === "number" &&
      typeof item.node_id === "string" &&
      typeof item.avatar_url === "string" &&
      typeof item.gravatar_id === "string" &&
      typeof item.url === "string" &&
      typeof item.html_url === "string" &&
      typeof item.followers_url === "string" &&
      typeof item.following_url === "string" &&
      typeof item.gists_url === "string" &&
      typeof item.starred_url === "string" &&
      typeof item.subscriptions_url === "string" &&
      typeof item.organizations_url === "string" &&
      typeof item.repos_url === "string" &&
      typeof item.events_url === "string" &&
      typeof item.received_events_url === "string" &&
      typeof item.type === "string" &&
      typeof item.user_view_type === "string" &&
      typeof item.site_admin === "boolean" &&
      typeof item.contributions === "number"
    );
  });

  return !isRightList.includes(false);
}

export interface Contributor {
  id: number;
  login: string;
  avatarUrl: string;
  htmlUrl: string;
}

const bots = [49699333];

export type Contributors = Array<Contributor>;

export function parseContributors(value: Array<APIContributor>): Contributors {
  const collaboratorIds = collaborators.map((collaborator) => collaborator.id);

  collaboratorIds.push(...bots);

  return value
    .filter(({ id }) => !collaboratorIds.includes(id))
    .map(({ id, login, avatar_url, html_url }) => {
      return {
        id,
        login,
        avatarUrl: avatar_url,
        htmlUrl: html_url
      };
    });
}
