import {
    getSecondsTime,
    getMinutesTime,
    getDisplayTime,
    converterSeconds
} from "../utils"

const timer = {
    id: null,
    // Current Time, in Seconds, Minutes, and Both
    minutes: 0,
    seconds: 0,
    onTimeChange: null,
    currentTime: 0,

    // hours: 0,
    startCount: function () {
        const everySecondRunThis = () => {
            this.id = setTimeout(() => {
                this.currentTime = this.audio.currentTime.toFixed(0);

                const { seconds, minutes } = converterSeconds(this.currentTime);

                this.seconds = seconds;
                this.minutes = minutes;

                if (this.onTimeChange) this.onTimeChange(this);

                everySecondRunThis();
            }, 1000)
        }
        everySecondRunThis();
    },
    pauseCount: function () {
        clearTimeout(this.id)
    },
    getDisplayTime: function () {
        return getDisplayTime(this.seconds, this.minutes);
    },
    getDisplaySeconds: function () {
        return getSecondsTime(this.seconds);
    },
    getDisplayMinutes: function () {
        return getMinutesTime(this.minutes);
    },

}

export default timer;