type VectorPosition = {
  x: number;
  y: number;
};

export type Vector2D = {
  get: () => VectorPosition;
};

export default function Vector2D(x: number, y: number): Vector2D {
  let position = {
    x,
    y,
  };

  function get(): VectorPosition {
    return position;
  }

  const self: Vector2D = {
    get,
  };

  return Object.freeze(self);
}
