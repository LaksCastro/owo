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
  const context = new AudioContext();

  const audioElement = document.getElementById("player");

  var analyser = context.createAnalyser();
  analyser.fftSize = 64;

  let paused = true;

  let source = null;

  let frequencyData = null;

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
        bar.style.height = frequencyData[index] + "px";
      });

      // Schedule the next update
      requestAnimationFrame(update);
    }

    // Kick it off...
    update();
  });
});
