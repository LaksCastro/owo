import Canvas from "./canvas";
import Input from "./input";
import Engine from "./engine";
import State from "./state";
import Joke from "./joke";

export type Main = {
  start: () => void;
};

export default function Main(id: string): Main {
  function start() {
    const state = State();

    const canvas = Canvas(id);
    state.set("canvas", canvas);

    const input = Input();
    state.set("input", input);

    const joke = Joke();
    joke.start();

    const engine = Engine();
    state.set("engine", engine);

    engine.start();
  }

  const self: Main = {
    start,
  };

  return Object.freeze(self);
}
