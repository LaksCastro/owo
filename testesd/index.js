const base64 = require("base-64");
const image = require("./unknown");
const fs = require("fs"),
  binary = fs.readFileSync("./unknown");
process.stdout.write(binary.slice(0, 48));
// console.log(image);
