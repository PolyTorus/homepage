export const styles = {
  sidebar: {
    position: "sticky" as const,
    width: "260px",
    height: "100vh",
    padding: "30px",
  },
  menu: {
    position: "absolute" as const,
    top: 25,
    left: 5,
    zIndex: 2,
    fontSize: 40,
  },
  header: {
    marginBottom: "40px",
    fontSize: "3.5rem",
    fontWeight: "bold",
    textAlign: "center" as const,
  },
  nav: {
    width: "100%",
  },
  list: {
    width: "100%",
  },
  listItem: {
    width: "100%",
    padding: "8px",
  },
  link: {
    base: {
      width: "100%",
      padding: "16px",
      borderRadius: "md",
      display: "flex",
      alignItems: "center",
      gap: "16px",
      fontSize: "1.25rem",
      transition: "all 0.2s ease",
    },
  },
} as const;
