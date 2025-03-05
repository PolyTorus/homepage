export const styles = {
  sidebar: {
    position: "fixed" as const,
    top: 0,
    left: 0,
    width: "260px",
    height: "100vh",
    padding: "30px",
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
