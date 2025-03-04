interface Dark {
  type: "dark";
  bg: "#32373c";
  color: "#DAD7D3";
}

interface Light {
  type: "light";
  bg: "#DAD7D3";
  color: "#32373c";
}

export type ModeState = Dark | Light;

export type ModeAction = "dark" | "light";
