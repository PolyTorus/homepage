interface Dark {
  type: "dark";
  bg: "#32373c"; 
  color: "#E8E6E3"; 
}

interface Light {
  type: "light";
  bg: "#F2F1EE"; 
  color: "#32373c"; 
}

export type ModeState = Dark | Light;

export type ModeAction = "dark" | "light";
