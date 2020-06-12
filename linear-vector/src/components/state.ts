let state: object = {};

export type State = {
  get: () => object;
  set: (key: string, value: any) => void;
};

export default function State(): State {
  function get(): object {
    return state;
  }

  function set(key: string, value: any): void {
    state[key] = value;
  }

  const self: State = {
    get,
    set,
  };

  return Object.freeze(self);
}
