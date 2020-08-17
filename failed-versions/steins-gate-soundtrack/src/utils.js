function randomIntFromInterval(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
}

function getSecondsTime(seconds) {
    return seconds >= 10 ? seconds.toString() : `0${seconds}`;
}
function getMinutesTime(minutes) {
    return minutes >= 10 ? minutes.toString() : `0${minutes}`
}
function getDisplayTime(seconds, minutes) {
    const display = `${getMinutesTime(minutes)}:${getSecondsTime(seconds)}`;
    return display;
}
function converterSeconds(seconds) {
    const time = {
        seconds: seconds % 60,
        minutes: Math.trunc(seconds / 60),
        hours: Math.trunc(Math.trunc(seconds / 60) / 60)
    }
    return time;
}
function firstLetterUppercase(string) {
    return string.replace(/^./, string[0].toUpperCase())
}

function moveNodeElementTo(moveEntry) {
    const { newParentId, currentParentId, nodeToMove } = moveEntry;

    const newParent = document.getElementById(newParentId);
    const oldParent = document.getElementById(currentParentId);

    oldParent.removeChild(nodeToMove);
    newParent.appendChild(nodeToMove);
}

function generateRandomColor(userConfig = {}) {
    const defaultConfig = {
        r: [0, 255],
        g: [0, 255],
        b: [0, 255],
        a: [1, 1],
    }
    const config = Object.assign({}, defaultConfig, userConfig);

    let { r, g, b, a } = config;

    let [minR, maxR] = r;
    let [minG, maxG] = g;
    let [minB, maxB] = b;
    let [minA, maxA] = a;

    maxA *= 1000;
    minA *= 1000;

    r = randomIntFromInterval(minR, maxR);
    g = randomIntFromInterval(minG, maxG);
    b = randomIntFromInterval(minB, maxB);
    a = randomIntFromInterval(minA, maxA) / 1000;

    return {
        string: `rgba(${r}, ${g}, ${b}, ${a})`,
        color: {
            r, g, b, a
        }
    };
}

function generateRandomColorPalette(userColor = {}, userVariant = {}) {
    const { color: defaultColor } = generateRandomColor();
    const defaultVariant = { vR: 15, vG: 15, vB: 15, vA: 200 };

    const color = Object.assign({}, defaultColor, userColor);
    const variant = Object.assign({}, defaultVariant, userVariant);

    const { r, g, b, a } = color;
    const { vR, vG, vB, vA } = variant;

    const palette = {
        r: getVariant({ variant: vR, num: r }),
        g: getVariant({ variant: vG, num: g }),
        b: getVariant({ variant: vB, num: b }),
        a: getVariant({ variant: vA, num: a * 1000, max: 1000, min: 0 }).map(item => item / 1000),
    }

    function getVariant(userConfig = {}) {
        const defaultConfig = {
            min: 0,
            max: 255,
            num: randomIntFromInterval(0, 255),
            variant: 15
        }
        const config = Object.assign({}, defaultConfig, userConfig);

        let { num, min, max, variant } = config;

        if (num + variant >= max) {
            num = [num - variant, max];
        } else if (num - variant < min) {
            num = [min, num + variant];
        } else {
            num = [num - variant, num + variant]
        }
        return num;
    }

    return palette;
}

export {
    randomIntFromInterval,
    getSecondsTime,
    getMinutesTime,
    getDisplayTime,
    converterSeconds,
    firstLetterUppercase,
    moveNodeElementTo,
    generateRandomColor,
    generateRandomColorPalette
}