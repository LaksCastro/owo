import 'boxicons'

import React, { useEffect, useState } from "react";
import { useParams, useHistory } from "react-router-dom"

import Grid from '@material-ui/core/Grid';

import video from "../models/video"
import episodeModel from "../models/episode";

import HorizontalCard from "../components/horizontal-card.js";

import { makeStyles, Container } from "@material-ui/core";

import { getImgUrl } from "../utils";

import { Box, Typography } from "@material-ui/core";

const useStyles = makeStyles((theme) => ({
  topBar: {
    background: theme.palette.background.paper,
    cursor: "pointer",
  },
  episodeSkeleton: {
    height: 585,
    background: "",
    borderRadius: 12,
    background: theme.palette.background.paper,
  },
  video: {
    width: "100%",
    borderRadius: 12,
  },
  cardContainer: {
    margin: "0 0 0 20px",
    background: "red",
    padding: 12
  },
}));

export default function HomeScreen(){
  const [episode, setEpisode] = useState([]);
  const [related, setRelated] = useState([]);

  const [loading, setLoading] = useState(true);
  const [loadingRelated, setLoadingRelated] = useState(true);

  const history = useHistory();

  const params = useParams();
  
  const classes = useStyles();

  useEffect(() => {
    async function fetchEpisode() {
      const { id } = params;

      const endpoint = `https://appanimeplus.tk/api-animesbr-10.php?episodios=${id}`;

      const response = await fetch(endpoint);

      const data = (await response.json())[0];

      const info = video({
        episodeId: data["video_id"],
        animeId: data["category_id"],
        title: data["title"],
        url: data["location"],
        urlHd: data["locationsd"] || data["locationhd"]
      });

      setEpisode(info);
      setLoading(false);

      fetchRelated(info.animeId);
    }

    async function fetchRelated(animeId) {
      const relatedEndpoint = `https://appanimeplus.tk/api-animesbr-10.php?cat_id=${animeId}`;
      const animeEndpoint = `https://appanimeplus.tk/api-animesbr-10.php?info=${animeId}`;

      const relatedResponse = await fetch(relatedEndpoint);
      const animeResponse = await fetch(animeEndpoint);

      const relatedData = (await relatedResponse.json());
      const animeData = (await animeResponse.json())[0];

      const relatedEpisodes = relatedData.map((item) =>
        episodeModel({
          animeId,
          imgUrl: getImgUrl(animeData["category_image"]),
          episodeId: item["video_id"],
          title: item["title"],
        })
      );

      setRelated(relatedEpisodes);
      setLoadingRelated(false)
    }

    fetchEpisode();
  }, [params]);

  function handleBack() {
    history.replace(params.animeId ? "/anime/" + params.animeId : "/");
  }
  
  return (
    <>
      <Box
        display="flex"
        alignItems="center"
        onClick={handleBack}
        padding={2}
        className={classes.topBar}
      >
        <box-icon name="left-arrow-alt" color="#fff"></box-icon>
        <Box padding="0 0 0 12px">
          <Typography variant="subtitle1" noWrap>
            {loading ? "Loading" : episode.title}
          </Typography>
        </Box>
      </Box>
      <Container>
        <Box padding="1rem 0">
          <Box flex={1}>
            {loading ? (
              <div className={classes.episodeSkeleton}></div>
            ) : (
              <video
                className={classes.video}
                autoPlay
                controls
                src={!!episode.urlHd ? episode.urlHd : episode.url}
              ></video>
            )}
          </Box>
        </Box>

        {loadingRelated ? (
          <div>Um momento amigo</div>
        ) : (
          <Box display="flex" flexDirection="column" alignItems="center">
            {related.map((resource) => (
              <Box maxWidth={650} margin="0 0 12px 0">
                <HorizontalCard
                  resource={
                    resource.episodeId === episode.episodeId
                      ? {
                          ...resource,
                          title: resource.title + " CURRENT PLAYING",
                        }
                      : resource
                  }
                  onClick={() => {
                    if (episodeModel.isEpisode(resource)) {
                      history.push("/episode/" + resource.episodeId);
                    } else {
                      //anime page...
                    }
                  }}
                />
              </Box>
            ))}
          </Box>
        )}
      </Container>
    </>
  );
}
