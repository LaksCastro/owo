import { generateRandomColorPalette, generateRandomColor, randomIntFromInterval } from "../utils"

function simpleAnimations() {

    const card = {
        allCards: [],

        animateNotSelectedCard: function (card) {

            const style = card.style;

            let animationId = null;
            let paletteId = null;
            let allowAnimate = false;

            card.onmouseenter = function () {
                allowAnimate = true;
                changePalette();
                animate();
            }
            card.onmouseleave = function () {
                allowAnimate = false;
                clearTimeout(animationId);
                clearTimeout(paletteId);
                clearAnimation();
            }

            let palette = generateRandomColorPalette();


            function changePalette() {
                if (!allowAnimate) return;

                paletteId = setTimeout(() => {
                    palette = generateRandomColorPalette();
                    changePalette();
                }, 3000);
            }

            function clearAnimation() {
                style.setProperty('--after-height', '5px');
                style.setProperty('--after-background', '#a1a1a1');

                style.setProperty('--before-height', '5px');
                style.setProperty('--before-background', '#a1a1a1');
            }
            function animate() {
                if (!allowAnimate) return;

                animationId = setTimeout(() => {
                    style.setProperty('--after-height', `${randomIntFromInterval(0, 30)}px`);
                    style.setProperty('--after-background', `${generateRandomColor(palette).string}`);

                    style.setProperty('--before-height', `${randomIntFromInterval(0, 30)}px`);
                    style.setProperty('--before-background', `${generateRandomColor(palette).string}`);

                    animate();
                }, 100);
            }
        },
        animateSelectedCard: function (card, useStatic) {
            if (useStatic) return;

            const style = card.style;

            let allowAnimate = true;

            let animationId = null;

            function clearAnimation() {
                clearTimeout(animationId);
            }
            function animate() {
                if (!allowAnimate) return;

                animationId = setTimeout(() => {
                    style.setProperty('--after-height', `${randomIntFromInterval(0, 30)}px`);

                    style.setProperty('--before-height', `${randomIntFromInterval(0, 30)}px`);

                    animate();
                }, 100);
            }
            animate();

            return clearAnimation;
        },
        createAnimation(card, isSelected, useStatic) {
            let clearAnimation = null;

            if (isSelected) {
                this.animateSelectedCard(card, useStatic)
            } else {
                clearAnimation = this.animateNotSelectedCard(card)
            }

            this.allCards.push({ card, isSelected, clearAnimation });
        },
        clearAnimations: function () {
            this.allCards.forEach(({ card }) => {
                const style = card.style;

                style.setProperty('--after-height', '5px');
                style.setProperty('--after-background', '#a1a1a1');

                style.setProperty('--before-height', '5px');
                style.setProperty('--before-background', '#a1a1a1');

                if (card.clearAnimation) card.clearAnimation();
            });
            this.allCards = [];
        }
    }

    const animations = {
        card
    }

    return animations;
}

export default simpleAnimations;