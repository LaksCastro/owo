function video({ episodeId, animeId, title, url, urlHd }) {
  return {
    episodeId,
    animeId,
    title,
    url,
    urlHd,
  };
}

video.equals = function (video, other) {
  return (
    other.animeId === video.animeId &&
    other.episodeId === video.episodeId &&
    !!other.url
  );
};

video.isVideo = function (any) {
  return !!any.url;
};

export default video;