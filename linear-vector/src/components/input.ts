import Vector2D, { Vector2D as Vector2DPosition } from "./vector";

type InputState = {
  clicking: boolean;
  vector2D: Vector2DPosition | null;
};

export type Input = {
  listen: () => void;
  get: () => InputState;
  stop: () => void;
};

export default function Input(): Input {
  let state: InputState = {
    clicking: false,
    vector2D: null,
  };

  function onPointerDown(e: PointerEvent): void {
    state = {
      ...state,
      clicking: true,
      vector2D: Vector2D(e.pageX, e.pageY),
    };
  }

  function onPointerUp(): void {
    state = {
      ...state,
      clicking: false,
      vector2D: null,
    };
  }

  function listen(): void {
    window.addEventListener("pointerdown", onPointerDown);
    window.addEventListener("pointerup", onPointerUp);
  }

  function get(): InputState {
    return state;
  }

  function stop(): void {
    window.removeEventListener("pointerdown", onPointerDown);
    window.removeEventListener("pointerup", onPointerUp);
  }

  const self: Input = {
    listen,
    get,
    stop,
  };

  return Object.freeze(self);
}
