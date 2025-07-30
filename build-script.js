const esbuild = require("esbuild");
const fs = require("fs");

esbuild
  .build({
    entryPoints: ["output/Main/index.js"],
    bundle: true,
    outfile: "dist/app.js",
    format: "iife"
  })
  .then(() => {
    // Add main() execution at the end and rename main2 to main
    let content = fs.readFileSync("dist/app.js", "utf8");

    // Rename main2 to main
    content = content.replace(/var main2 = /g, "var main = ");

    // Find the main function and add execution
    const mainMatch = content.match(/var (main) = .*runHalogenAff/);
    if (mainMatch) {
      const mainFunctionName = mainMatch[1];
      content += `\n${mainFunctionName}();`;
      fs.writeFileSync("dist/app.js", content);
      console.log(
        `Renamed main2 to main and added ${mainFunctionName}() execution`
      );
    } else {
      console.error("Could not find main function");
    }
  })
  .catch(() => process.exit(1));
