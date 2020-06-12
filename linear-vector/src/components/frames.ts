export type Frames = {
  start: () => void;
  stop: () => void;
};

export default function Frames(update: () => void): Frames {
  let isToAnimate = false;

  function start(): void {
    isToAnimate = true;
    animate();
  }

  function animate(): void {
    if (!isToAnimate) return;

    function animationFrame(): void {
      update();
      animate();
    }

    window.requestAnimationFrame(animationFrame);
  }

  function stop(): void {
    isToAnimate = false;
    animate();
  }

  const self: Frames = {
    start,
    stop,
  };

  return Object.freeze(self);
}
