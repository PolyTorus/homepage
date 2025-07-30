const esbuild = require("esbuild");
const fs = require("fs");

esbuild
  .build({
    entryPoints: ["output/Main/index.js"],
    bundle: true,
    outfile: "dist/app.js",
    format: "iife",
    globalName: "PureScriptApp"
  })
  .then(() => {
    let content = fs.readFileSync("dist/app.js", "utf8");

    // Find the main function and expose it
    const mainMatch = content.match(
      /var (main\d*) = [^;]*runHalogenAff[^}]*}\)\);/
    );
    if (mainMatch) {
      const mainFunctionName = mainMatch[1];

      // Add main function to window and execute it
      content = content.replace(
        `var ${mainFunctionName} = `,
        `var ${mainFunctionName} = window.${mainFunctionName} = `
      );
      content += `\nsetTimeout(function() { window.${mainFunctionName}(); }, 0);`;

      fs.writeFileSync("dist/app.js", content);
      console.log(`Exposed and executed ${mainFunctionName}()`);
    } else {
      console.error("Could not find main function");
    }
  })
  .catch(() => process.exit(1));
