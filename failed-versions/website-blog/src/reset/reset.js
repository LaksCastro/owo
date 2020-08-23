import { createGlobalStyle } from 'styled-components'

const GlobalStyle = createGlobalStyle`
  @import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');

  /* http://meyerweb.com/eric/tools/css/reset/ 
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	font-size: 100%;
  list-style: none;
	font: inherit;
  background: transparent;
	vertical-align: baseline;
}
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1.6;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}
*{
  outline: none;
	border: none;
  box-sizing: border-box;
  text-decoration: none;
  transition: all 0.2s ease-in-out;
}
body{
  line-height: 1;
  font-size: 100%;
  font-family: 'Josefin Sans', sans-serif;
}
img{
  display: block;
  width: 100%;
  height: auto;
}
button{
  background: none;
}

  input::-webkit-outer-spin-button,
  input::-webkit-inner-spin-button {
      -webkit-appearance: none;
      margin: 0; /* <-- Apparently some margin are still there even though it's hidden */
  }

  input[type=number] {
      -moz-appearance:textfield; /* Firefox */
  }

  body.dark{
    background: rgb(20, 20, 20);
    --color-one: #000;
    --color-two: rgb(20, 20, 20);
    --color-three: rgb(40, 40, 40);
    --color-four: #333;

    --color-text-one: #444;
    --color-text-two: #666;
    --color-text-three: rgb(220, 220, 220);
    --color-text-hight: deepskyblue;
    --color-text-item-hight: white;
  }
  body.light{
    background: white;
    --color-one: rgb(245, 245, 245);
    --color-two: white;
    --color-three: rgb(225, 225, 225);
    --color-four: #999;

    --color-text-one: rgb(40, 40, 40);
    --color-text-two: rgb(60, 60, 60);
    --color-text-three: rgb(80, 80, 80);
    --color-text-hight: #d40055ff;
    --color-text-item-hight: rgb(20, 20, 20);
  }
`

export default GlobalStyle