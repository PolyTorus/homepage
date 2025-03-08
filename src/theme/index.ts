import { extendTheme } from "@yamada-ui/react";

export const yamadaTheme = extendTheme({
  styles: {
    global: {
      body: {
        bg: "#1A1D1F",
        color: "white",
      },
    },
  },
  colors: {
    brand: {
      sidebar: "#32373C",
      main: "#1A1D1F",
    },
  },
  components: {
    Box: {
      baseStyle: {
        _dark: {
          bg: "#32373c",
          color: "white",
        },
        _light: {
          bg: "#cdc8c3",
          color: "#32373c",
        },
      },
    },
    Heading: {
      baseStyle: {
        _dark: {
          color: "white",
        },
      },
    },
    Text: {
      baseStyle: {
        _dark: {
          color: "white",
        },
      },
    },
    Icon: {
      sizes: {
        md: {
          boxSize: "1.5rem", // 24px
        },
        lg: {
          boxSize: "2rem", // 32px
        },
      },
      defaultProps: {
        size: "lg",
      },
    },
    Link: {
      baseStyle: {
        _hover: {
          textDecoration: "none",
        },
      },
    },
  },
});

export const DARK_BG = "#32373c" as const;
export const LIGHT_BG = "#F2F1EE" as const;
export const DARK_COLOR = "#E8E6E3" as const;
export const LIGHT_COLOR = "#32373c" as const;

export const MEDIA_QUERY = "(max-width: 765px)";
