export interface OverviewContents {
  id: string;
  title: string;
  icon: string;
  description: string;
}

export interface Contents {
  source: string;
  overview: OverviewContents;
}
