window.addEventListener("DOMContentLoaded", async function () {
  // ==========================================================================
  // Fetch song
  // ==========================================================================
  // const songFilename = "epitomize.mp3";

  // const request = new Request(songFilename);

  // const buffer = await (await fetch(request)).arrayBuffer();

  // ==========================================================================
  // Start context
  // ==========================================================================

  function interpolate(xInterval, yInterval) {
    const [x0, x1] = xInterval;
    const [y0, y1] = yInterval;

    return (xA) => {
      if (xA > x1) xA = x1;
      else if (xA < x0) xA = x0;

      const yA = y0 + (y1 - y0) * ((xA - x0) / (x1 - x0));

      return yA;
    };
  }

  const context = new AudioContext();

  const audioElement = document.getElementById("player");

  var analyser = context.createAnalyser();
  analyser.fftSize = 64;

  let paused = true;

  let source = null;

  let frequencyData = null;

  const toPx = interpolate([0, 255], [0, 500]);

  audioElement.addEventListener("canplay", function () {
    source = context.createMediaElementSource(audioElement);

    source.connect(analyser);

    analyser.connect(context.destination);

    frequencyData = new Uint8Array(analyser.frequencyBinCount);
    analyser.getByteFrequencyData(frequencyData);
  });

  audioElement.addEventListener("pause", function () {
    paused = true;
  });
  audioElement.addEventListener("play", function () {
    paused = false;

    function update() {
      if (paused) {
        return;
      }
      const bars = [...document.querySelectorAll("div")];

      // Get the new frequency data
      analyser.getByteFrequencyData(frequencyData);

      // Update the visualisation
      bars.forEach((bar, index) => {
        bar.style.height = toPx(frequencyData[index]) + "px";
      });

      // Schedule the next update
      requestAnimationFrame(update);
    }

    // Kick it off...
    update();
  });
});
