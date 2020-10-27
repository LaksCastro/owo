// const Crawler = require("crawler");
// const googleIt = require("google-it");
// const colors = require("colors");

// const c = new Crawler({
//   maxConnections: 10,
//   // This will be called for each crawled page
//   callback: function (error, res, done) {
//     if (error) {
//       console.log(error);
//     } else {
//       var $ = res.$;

//       console.log("====================================================".cyan);
//       console.log(res.request.uri.href.blue);
//       console.log($("title").text());
//       console.log(
//         $(
//           ".sg-text.sg-text--break-words.brn-rich-content.js-answer-content"
//         ).text()
//       );

//       $(".sg-text.sg-text--break-words.brn-rich-content.js-answer-content")
//         .children()
//         .each(function (i, elem) {
//           console.log($(this).text().green);
//         });

//       console.log("\n\n\n\n\n");
//     }
//   },
// });

// googleIt({
//   query: "site:brainly.com.br " + process.argv.slice(2)[0],
// })
//   .then((results) => {
//     results = results.slice(0, 4);

//     results.forEach((result, i) => {
//       c.queue(result.link);
//     });
//   })
//   .catch((e) => {
//     throw e;
//   });

with ({
  a: {
    kaka: "asodfsam",
  },
}) {
  console.log(this);
}
