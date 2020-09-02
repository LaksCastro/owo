const axios = require("axios");
const cheerio = require("cheerio");
const url = "https://www.assistirhentai.com/Categorias/chikan";

const jsdom = require("jsdom");
const { JSDOM } = jsdom;

async function fetchData(url) {
  console.log("Crawling data...");

  let response = await axios(url).catch((err) => {
    console.log("An error ocurred");
    console.log(err);
  });

  if (response.status !== 200) {
    console.log("An error ocurred");
    console.log("Error occurred while fetching data");
    return;
  }

  return response;
}

(async function () {
  const res = await fetchData(url);

  const html = res.data;

  const dom = cheerio.load(html);

  const images = dom(
    "body > div.meio > div > div.videos.lista-hentai > .video img"
  );

  console.log(images.html());

  images.each(function () {
    let imgUrl = dom(this).attr("src");
    console.log(imgUrl);
    // console.log(imgUrl);
  });
})();
