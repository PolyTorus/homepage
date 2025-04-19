export interface BlogMetadata {
    id: string;
    title: string;
    icon: string;
    description: string;
}

export interface BlogContent {
    source: string;
    overview: BlogMetadata;
}
