const { build } = require("esbuild");
const path = require("path");

build({
  entryPoints: ["output/Main/index.js"],
  bundle: true,
  format: "iife",
  outfile: "dist/app.js",
  globalName: "Main",
  footer: {
    js: "Main.main();"
  },
  minify: true,
  sourcemap: true
})
  .then(() => {
    console.log("✓ Bundle created successfully at dist/app.js");
  })
  .catch((error) => {
    console.error("Build failed:", error);
    process.exit(1);
  });
