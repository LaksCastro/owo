export type Canvas = {
  getContext: () => CanvasRenderingContext2D;
};

export default function Canvas(id: string): Canvas {
  const canvas = getNode();

  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;

  function getNode(): HTMLCanvasElement {
    return document.getElementById(id) as HTMLCanvasElement;
  }

  function getContext(): CanvasRenderingContext2D {
    const node = getNode();

    return node.getContext("2d");
  }

  const self: Canvas = {
    getContext,
  };

  return Object.freeze(self);
}
