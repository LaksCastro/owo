import Hammer from "hammerjs";

import keyboard from "./keyboard"
import { moveNodeElementTo } from "../utils"

function watch() {

    const pExpandedTopBarVolButton = document.getElementById("p-expanded-vol");
    const pExpandedVolButtonsWrapper = document.getElementById("p-expanded-vol-icons-wrapper");
    const pExpandedVolMaxButton = document.getElementById("p-expanded-vol-max");
    const pExpandedVolMinButton = document.getElementById("p-expanded-vol-min");
    const pExpandedVolSliderWrapper = document.getElementById("p-expanded-vol-slider-wrapper");

    let volState = "hidden";

    // --INIT-- AUTO CLOSE VOL FEATURE =====================

    let autoHiddenId = null;
    let allowAutoClose = true;

    pExpandedTopBarVolButton.onclick = () => {
        toggleVolState();
        if (volState === "visible") {
            enableAutoClose();
        } else {
            disableAutoClose();
        }
    }
    function enableAutoClose() {
        allowAutoClose = true;
        autoHiddenId = setTimeout(() => {
            if (allowAutoClose)
                hideVol();

        }, 3000);
    }
    function disableAutoClose() {
        allowAutoClose = false;
        if (autoHiddenId !== null) {
            clearTimeout(autoHiddenId);
            autoHiddenId = null;
        }
    }
    function nodeToPreventAutoClose(node) {
        node.onpointerdown = () => {
            disableAutoClose();
        }
        node.onpointerup = () => {
            enableAutoClose();
        }
    }
    nodeToPreventAutoClose(pExpandedVolSliderWrapper);
    nodeToPreventAutoClose(pExpandedVolButtonsWrapper);

    // --END-- AUTO CLOSE VOL FEATURE =====================

    // --INIT-- FEATURE TO SET VOL BY BUTTONS, NOT SLIDER =============

    pExpandedVolMaxButton.onclick = () => this.player.changeVol.apply(this.player, [100]);
    pExpandedVolMinButton.onclick = () => this.player.changeVol.apply(this.player, [0]);

    // --END-- TO SET VOL BY BUTTONS, NOT SLIDER =============

    // --INIT-- WRAPPERS FOR TOGGLE STATE FUNCITION =============

    function showVol() {
        if (volState === "visible") return;
        toggleVolState();
    }
    function hideVol() {
        if (volState === "hidden") return;
        toggleVolState();
    }

    // --END-- WRAPPERS FOR TOGGLE STATE FUNCITION =============

    // --INIT-- FUNCTION TO TOGGLE VOLUME SLIDER STATE, ADD OR REMOVE CLASS ON NECESSARY NODES

    function toggleVolState() {
        const isHidden = volState === "hidden";
        const newState = isHidden ? "visible" : "hidden";

        volState = newState;

        const newStateIsHidden = newState === "hidden";


        pExpandedVolButtonsWrapper.classList.add(newStateIsHidden ? "hide" : "show");
        pExpandedVolButtonsWrapper.classList.remove(newStateIsHidden ? "show" : "hide");

        pExpandedVolSliderWrapper.classList.add(newStateIsHidden ? "hide" : "show");
        pExpandedVolSliderWrapper.classList.remove(newStateIsHidden ? "show" : "hide");
    }

    // --END-- FUNCTION TO TOGGLE VOLUME SLIDER STATE, SET CLASS ON NECESSARY NODES



    const stateSpan = document.querySelector(".state-span");
    const stateExpandedWrapper = document.querySelector(".state-expanded");
    const stateCollapsedWrapper = document.querySelector(".state-collapsed");

    const pExpandedBody = document.querySelector(".p-expanded-data");

    const playerExpandedBackButton = document.getElementById("p-expanded-back-button");
    const playerExpandedToHomeButton = document.getElementById("p-expanded-to-home");
    const playerExpandedFavoriteButton = document.getElementById("p-expanded-favorite");
    const playerExpandedMuteButton = document.getElementById("p-expanded-mute");
    const pData = document.getElementById("p-data");

    pData.onclick = expandPlayer.bind(this);

    playerExpandedToHomeButton.onclick = collapsePlayer.bind(this);
    playerExpandedBackButton.onclick = collapsePlayer.bind(this);

    let state = "collapsed";

    const expandedBodyHammer = new Hammer(pExpandedBody);
    expandedBodyHammer.get('swipe').set({ direction: Hammer.DIRECTION_ALL });

    expandedBodyHammer.on('swipeleft', this.player.next.bind(this.player));
    expandedBodyHammer.on('swiperight', this.player.prev.bind(this.player));
    expandedBodyHammer.on('swipedown', collapsePlayer.bind(this));
    expandedBodyHammer.on('swipeup', collapsePlayer.bind(this));

    keyboard.on([{
        key: 38,
        callback: expandPlayer.bind(this)
    }, {
        key: 40,
        callback: collapsePlayer.bind(this)
    }]);

    function expandPlayer() {
        if (state === "expanded") return

        changeState.apply(this, [{
            playButton: "#p-expanded-play",
            nextButton: "#p-expanded-next",
            prevButton: "#p-expanded-prev",
            loopButton: "#p-expanded-loop",
            randomButton: "#p-expanded-random",
            // volRange: volSlider,
            durationRange: "#p-expanded-duration",
        }]);

        moveNodeElementTo({
            newParentId: "p-expanded-wave-wrapper",
            currentParentId: "p-wave-wrapper",
            nodeToMove: this.wave.container
        });

        this.wave.reInit();
    }
    function collapsePlayer() {

        if (state === "collapsed") return

        changeState.apply(this, [{
            playButton: "#p-play",
            nextButton: "#p-next",
            prevButton: "#p-prev",
            muteButton: "#p-toggle-mute",
            loopButton: "#p-loop",
            randomButton: "#p-random",
            // volRange: volSlider,
            durationRange: "#duration",
        }]);

        moveNodeElementTo({
            newParentId: "p-wave-wrapper",
            currentParentId: "p-expanded-wave-wrapper",
            nodeToMove: this.wave.container
        });
        this.wave.reInit();
    }

    function changeState(config) {
        const isCollapsed = state === "collapsed";
        const newState = isCollapsed ? "expanded" : "collapsed";

        const newStateIsCollapsed = newState === "collapsed";

        state = newState;

        stateSpan.classList.add(newStateIsCollapsed ? "collapsed" : "expanded");
        stateSpan.classList.remove(newStateIsCollapsed ? "expanded" : "collapsed");

        stateCollapsedWrapper.classList.add(newStateIsCollapsed ? "show" : "hide");
        stateCollapsedWrapper.classList.remove(newStateIsCollapsed ? "hide" : "show");

        stateExpandedWrapper.classList.add(newStateIsCollapsed ? "hide" : "show");
        stateExpandedWrapper.classList.remove(newStateIsCollapsed ? "show" : "hide");

        this.player.changeButtonControls(config);
    }


    playerExpandedMuteButton.onclick = () => {
        const nowIsMuted = this.player.toggleMute();

        playerExpandedMuteButton.textContent = nowIsMuted ? "volume_off" : "volume_up";
    }
    // FAVORITE FEATURE

    playerExpandedFavoriteButton.onclick = toggleFavorite.bind(this);

    this.player.on(this.player.events.FAVORITE_CHANGE, ({ songs }) => {
        const favoriteSongs = songs.filter(song => song.favorite);
        this.storage.setFavorites(favoriteSongs);
    });

    function toggleFavorite() {
        const nowIsFavorite = this.player.toggleFavorite();
        playerExpandedFavoriteButton.textContent = nowIsFavorite ? "favorite" : "favorite_border";
    }
}

export default { watch };