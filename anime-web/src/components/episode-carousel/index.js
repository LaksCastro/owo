import React from "react";
import { useEmblaCarousel } from "embla-carousel/react";
import "./carousel.css";

export default function EpisodeCarousel() {
  const [viewportRef] = useEmblaCarousel({
    dragFree: true,
    containScroll: "trimSnaps"
  });

  return (
    <div className="embla">
      <div className="embla__viewport" ref={viewportRef}>
        <div className="embla__container">
          <div className="embla__slide" key={2}>
            <div className="embla__slide__inner">
              <img
                className="embla__slide__img"
                src="https://i.picsum.photos/id/866/536/354.jpg?hmac=tGofDTV7tl2rprappPzKFiZ9vDh5MKj39oa2D--gqhA"
                alt="A cool cat."
              />
            </div>
          </div>
          <div className="embla__slide" key={3}>
            <div className="embla__slide__inner">
              <img
                className="embla__slide__img"
                src="https://i.picsum.photos/id/866/536/354.jpg?hmac=tGofDTV7tl2rprappPzKFiZ9vDh5MKj39oa2D--gqhA"
                alt="A cool cat."
              />
            </div>
          </div>
          <div className="embla__slide" key={3}>
            <div className="embla__slide__inner">
              <img
                className="embla__slide__img"
                src="https://i.picsum.photos/id/866/536/354.jpg?hmac=tGofDTV7tl2rprappPzKFiZ9vDh5MKj39oa2D--gqhA"
                alt="A cool cat."
              />
            </div>
          </div>
          <div className="embla__slide" key={3}>
            <div className="embla__slide__inner">
              <img
                className="embla__slide__img"
                src="https://i.picsum.photos/id/866/536/354.jpg?hmac=tGofDTV7tl2rprappPzKFiZ9vDh5MKj39oa2D--gqhA"
                alt="A cool cat."
              />
            </div>
          </div>
          <div className="embla__slide" key={3}>
            <div className="embla__slide__inner">
              <img
                className="embla__slide__img"
                src="https://i.picsum.photos/id/866/536/354.jpg?hmac=tGofDTV7tl2rprappPzKFiZ9vDh5MKj39oa2D--gqhA"
                alt="A cool cat."
              />
            </div>
          </div>
          <div className="embla__slide" key={3}>
            <div className="embla__slide__inner">
              <img
                className="embla__slide__img"
                src="https://i.picsum.photos/id/866/536/354.jpg?hmac=tGofDTV7tl2rprappPzKFiZ9vDh5MKj39oa2D--gqhA"
                alt="A cool cat."
              />
            </div>
          </div>
          <div className="embla__slide" key={3}>
            <div className="embla__slide__inner">
              <img
                className="embla__slide__img"
                src="https://i.picsum.photos/id/866/536/354.jpg?hmac=tGofDTV7tl2rprappPzKFiZ9vDh5MKj39oa2D--gqhA"
                alt="A cool cat."
              />
            </div>
          </div>
          <div className="embla__slide" key={3}>
            <div className="embla__slide__inner">
              <img
                className="embla__slide__img"
                src="https://i.picsum.photos/id/866/536/354.jpg?hmac=tGofDTV7tl2rprappPzKFiZ9vDh5MKj39oa2D--gqhA"
                alt="A cool cat."
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
