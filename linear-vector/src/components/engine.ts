import Frames from "./frames";
import State from "./state";
import Draw from "./draw";
import Vector2D from "./vector";
import Linear from "./linear";
import { Input } from "./input";
import { JokeState } from "./joke";

export type Engine = {
  start: () => void;
};

export default function Engine(): Engine {
  const frames = Frames(update);

  const draw = Draw();

  const state = State();

  const { input } = state.get() as { input: Input };

  function update(): void {
    const inputState = input.get();
    const { joke: jokeState } = state.get() as { joke: JokeState };

    draw.clear();

    const size = 20;

    if (jokeState.drawingLine) {
      // Faça a lógica do desenho aqui
      const linear = Linear(jokeState.initialPoint, jokeState.endPoint);

      const { x: x1, y: y1 } = jokeState.initialPoint.get();
      const { x: x2, y: y2 } = jokeState.endPoint.get();

      draw.rect(Vector2D(x1 - size / 2, y1 - size / 2), size);

      draw.rect(Vector2D(x2 - size / 2, y2 - size / 2), size);

      const points = linear.get();

      console.log(points);
      for (const point of points) {
        draw.line(jokeState.initialPoint, point);
      }

      resetJokeState();
    } else if (inputState.clicking) {
      console.log("a");
      if (jokeState.followingThePointer) {
        const { x: x1, y: y1 } = jokeState.initialPoint.get();
        draw.rect(Vector2D(x1 - size / 2, y1 - size / 2), size);

        state.set("joke", {
          ...jokeState,
          endPoint: inputState.vector2D,
          drawingLine: true,
          followingThePointer: false,
        });
      } else {
        state.set("joke", {
          ...jokeState,
          initialPoint: inputState.vector2D,
          endPoint: null,
          drawingLine: false,
          followingThePointer: true,
        });
      }
    }

    function resetJokeState() {
      state.set("joke", {
        initialPoint: null,
        endPoint: null,
        followingThePointer: false,
        drawingLine: false,
      });
    }
  }

  function start(): void {
    input.listen();
    frames.start();
  }

  const self: Engine = {
    start,
  };

  return Object.freeze(self);
}
