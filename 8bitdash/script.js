const fs = require("fs");
const path = require("path");

const allFiles = fs
  .readdirSync(path.join(__dirname, "imagens"))
  .filter((fileName) => fileName !== "script.js")
  .map((fileName) => {
    const fileInfo = `import "../assets/${fileName}";`;
    console.log(fileInfo);

    return fileInfo;
  });

fs.writeFile(
  __dirname + "images.js",
  `export default [
      ${allFiles.join("\n")}
  ]`,
  function (err) {
    if (err) throw err;
  }
);
