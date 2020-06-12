import State from "./state";
import { Vector2D } from "./vector";
import { Canvas } from "./canvas";

export type Draw = {
  line: (from: Vector2D, to: Vector2D) => void;
  rect: (where: Vector2D, size: number) => void;
  clear: () => void;
};

export default function Draw(): Draw {
  const state = State();

  const ctx = (state.get() as { canvas: Canvas }).canvas.getContext();

  function rect(where: Vector2D, size: number) {
    const { x, y } = where.get();

    ctx.beginPath();

    ctx.fillStyle = "#fff";

    ctx.rect(x, y, size, size);

    ctx.fill();
  }

  function line(from: Vector2D, to: Vector2D): void {
    const { x: x1, y: y1 } = from.get();
    const { x: x2, y: y2 } = to.get();

    ctx.beginPath();
    console.log("teste");
    ctx.strokeStyle = "#fff";

    ctx.moveTo(x1, y1);
    ctx.lineTo(x2, y2);

    ctx.stroke();
  }

  function clear() {
    ctx.clearRect(0, 0, window.innerWidth, window.innerHeight);
  }

  const self: Draw = {
    rect,
    line,
    clear,
  };

  return Object.freeze(self);
}
