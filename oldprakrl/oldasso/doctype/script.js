onload = function(){
	const svg = document.querySelector("svg");

	function getRndInteger(min, max) {
	  return Math.floor(Math.random() * (max - min) ) + min;
	}

	var width = window.innerWidth;
	var cont = 0;

	setInterval(() => {

		var classe = getRndInteger(1, 4);
		var y1 = getRndInteger(-300, 0);
		var y2 = y1 + 20;
		var stroke = getRndInteger(5, 7);

		svg.innerHTML = `<line class="line-t${classe}" stroke="black" x1="${width + 50}" y1="${y1}" x2="${width}" y2=${y2} stroke-width="${stroke}"  />`;

	}, 1000);
}