import React, { useEffect, useState } from "react";
import debounce from "lodash.debounce";
import { useHistory } from "react-router-dom";

import { makeStyles } from "@material-ui/core/styles";
import Grid from '@material-ui/core/Grid';
import { Container, Box } from "@material-ui/core";

import CircularProgress from '@material-ui/core/CircularProgress';
import ResourceCard from "../components/resource-card.js";
import Typography from '@material-ui/core/Typography';

import { getImgUrl } from "../utils";

import anime from "../models/anime";
import episode from "../models/episode";
import HomeSearch from "../components/home-search.js";

const useStyles = makeStyles((theme) => ({
  container: {},
  gridContainer: {
    padding: "2rem 0",
  },
}));

export default function HomeScreen(){
  const [resources, setResources] = useState([]);
  const [searchResults, setSearchResults] = useState([]);
  const [searchMode, setSearchMode] = useState(false);
  const [noResults, setNoResults] = useState(false);
  const history = useHistory();
  
  const loading = resources.length === 0;
  const loadingSearch = searchResults.length === 0 && searchMode
  
  const classes = useStyles();
  const spacing = 1;


  useEffect(() => {
    async function fetchLatests() {
      const endpoint = "https://appanimeplus.tk/api-animesbr-10.php?latest";

      const response = await fetch(endpoint);

      const data = (await response.json()).map((item) =>
        episode({
          imgUrl: getImgUrl(item["category_image"]),
          title: item["title"],
          episodeId: item["video_id"],
          animeId: item["category_id"],
        })
      );

      setResources([...resources, ...data]);
    }

    fetchLatests();
  }, []);

  async function handleSearch(value) {
    setSearchMode(true);

    const query = value.normalize("NFD").toLowerCase().trim().replace(/ /g, "_");

    const endpoint = `https://appanimeplus.tk/api-animesbr-10.php?search=${query}`;

    try {
      const response = await fetch(endpoint);

      if (response.status !== 200) {
        throw response.status;
      }

      const data = (await response.json()).map((item) =>
        anime({
          imgUrl: getImgUrl(item["category_image"]),
          title: item["category_name"],
          animeId: item["id"],
        })
      );

      setSearchResults(data.slice(0, 300));

      setNoResults(false);
    } catch (e) {
      const exceptions = {
        404: "Not found",
      };

      console.log(e)
      console.log({ exceptions });

      setNoResults(true)
    }
  }

  return (
    <>
      {!loading && (
        <HomeSearch
          onDisableSearch={() => {
            setSearchMode(false);
            setNoResults(false)
            setNoResults(false)
            setSearchResults([]);
          }}
          onChange={debounce(handleSearch, 500)}
        />
      )}
      <Container className={classes.container}>
        {loading || loadingSearch ? (
          <div
            style={{
              height: "100vh",
              width: "100%",
              display: "flex",
              justifyContent: "center",
              alignItems: "center",
            }}
          >
            <CircularProgress />
          </div>
        ) : searchMode ? (
          noResults ? (
            <Box padding={12} justifyContent="center">
              <Typography align="center" variant="body2">
                No results found, try other keyword
              </Typography>
            </Box>
          ) : (
            <Grid
              container
              justify="center"
              spacing={spacing}
              className={classes.gridContainer}
            >
              {searchResults.map((resource) => (
                <Grid key={resource.episodeId || resource.animeId} item>
                  <ResourceCard
                    resource={resource}
                    onClick={() => {
                      // console.log(resource.title);

                      // console.log("Is anime: ");
                      // console.log(anime.isAnime(resource));

                      // console.log("Is Episode: ");
                      // console.log(episode.isEpisode(resource));
                    }}
                  />
                </Grid>
              ))}
            </Grid>
          )
        ) : (
          <Grid
            container
            justify="center"
            spacing={spacing}
            className={classes.gridContainer}
          >
            {resources.map((resource) => (
              <Grid key={resource.episodeId || resource.animeId} item>
                <ResourceCard
                  resource={resource}
                  onClick={() => {
                    // console.log(resource.title);

                    // console.log("Is anime: ");
                    // console.log(anime.isAnime(resource));

                    // console.log("Is Episode: ");
                    // console.log(episode.isEpisode(resource));

                    if(episode.isEpisode(resource)){
                      history.push("/episode/" + resource.episodeId);
                    }else{
                      //anime page...
                    }
                  }}
                />
              </Grid>
            ))}
          </Grid>
        )}
      </Container>
    </>
  );
}
