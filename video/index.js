const express = require("express");

const fs = require("fs");

const app = express();

app.get("/", function (req, res) {
  const path = "./video.webm";
  const stat = fs.statSync(path);
  const fileSize = stat.size;
  const head = {
    "Content-Length": fileSize,
    "Content-Type": "video/mp4",
  };
  res.writeHead(200, head);
  fs.createReadStream(path).pipe(res);
});

app.listen(3000, () => console.log("Listening on PORT"));

const ngrok = require("ngrok");
(async function () {
  try {
    const url = await ngrok.connect({
      proto: "http",
      addr: 3000,
    });
    console.log("Tunnel Created -> ");
    console.log(url);
    console.log("Tunnel Inspector ->  http://127.0.0.1:4040");
  } catch (error) {
    console.log(error);
  }
})();
