import Vector2D, { Vector2D as Vector2DPosition } from "./vector";

type Range = [number, number];

export type Linear = {
  get: () => Vector2DPosition[];
};

export default function Linear(
  startPoint: Vector2DPosition,
  endPoint: Vector2DPosition
): Linear {
  let points: Vector2DPosition[] = [];

  function interpolate(
    xInterval: Range,
    yInterval: Range
  ): (xA: number) => number {
    const [x0, x1] = xInterval;
    const [y0, y1] = yInterval;

    return (xA: number): number => {
      if (xA > x1) xA = x1;
      else if (xA < x0) xA = x0;

      const yA = y0 + (y1 - y0) * ((xA - x0) / (x1 - x0));

      return yA;
    };
  }

  function calc(): void {
    let { x: x1, y: y1 } = startPoint.get();
    let { x: x2, y: y2 } = endPoint.get();

    console.log(startPoint.get());
    console.log(endPoint.get());
    const coordConverter = interpolate([x1, x2], [y1, y2]);

    while (x2 > x1) {
      points.push(Vector2D(x1, y1));

      x1++;
      y1 = coordConverter(x1);
    }
    console.log(points);
    console.log("aqio");
    // while (x2 < x1) {
    //   points.push(Vector2D(x1, y1));

    //   x1--;
    //   y1 = coordConverter(x1);
    // }
  }

  function get(): Vector2DPosition[] {
    calc();
    return points;
  }

  const self: Linear = {
    get,
  };

  return Object.freeze(self);
}
