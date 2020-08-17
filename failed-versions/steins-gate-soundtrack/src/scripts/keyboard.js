// --- Objective: centralize the keyboard actions used by the application

// This instance basically:
// 1 - Receive a array of key (code of) and callback by on(array) method 
// 2 - Still in key method, add keyup listener and if keyup code === received key, execute callback()
// 3 - And on() method return a array of instance's of function used in a document.addEventListener()
// 4 - off() method receive a array of function instances used in on() method, and remove keyup listeners
const keyboard = {
    on: (shortcuts) => {
        const funcListeners = shortcuts.map((short, i) => {
            const { key, callback, node = document } = short;

            node.addEventListener("keyup", onKeyUp);

            function onKeyUp(e) {
                if (e.keyCode === key) callback();
            }
            return onKeyUp;
        });
        return funcListeners;
    },
    off: (shortcuts) => {
        shortcuts.forEach(short => {
            const { listenerFunction, node = document } = short;
            node.removeEventListener("keyup", listenerFunction);
        });
    },

}

export default keyboard;