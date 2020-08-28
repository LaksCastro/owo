function anime({animeId, title, imgUrl}){
    return {
      animeId,
      title,
      imgUrl,
    };
}

anime.equals = function (anime, other) {
  return other.animeId === anime.animeId;
};

anime.isAnime = function (any) {
  return !!any.animeId && !any.episodeId;
};

export default anime;