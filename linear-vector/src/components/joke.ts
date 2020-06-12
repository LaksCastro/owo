import State from "./state";
import { Vector2D } from "./vector";

export type JokeState = {
  initialPoint: Vector2D;
  endPoint: Vector2D;
  followingThePointer: boolean;
  drawingLine: boolean;
};

export type Joke = {
  start: () => void;
};

export default function Joke(): Joke {
  const state = State();

  const initialState: JokeState = {
    initialPoint: null,
    endPoint: null,
    followingThePointer: false,
    drawingLine: false,
  };

  function start(): void {
    state.set("joke", initialState);
  }

  const self: Joke = {
    start,
  };

  return Object.freeze(self);
}
