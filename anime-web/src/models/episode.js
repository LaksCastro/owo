function episode({ episodeId, animeId, title, imgUrl }) {
  return {
    episodeId,
    animeId,
    title,
    imgUrl,
  };
}

episode.equals = function(episode, other){
    return other.episodeId === episode.episodeId && other.animeId === episode.animeId;
}

episode.isEpisode = function(any){
  return !!any.animeId && !!any.episodeId;
}

export default episode;