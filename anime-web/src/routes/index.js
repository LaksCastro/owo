import React from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom"

import HomeScreen from "../pages/home";
import EpisodeScreen from "../pages/episode";

export default function Routes(){
  return (
    <BrowserRouter>
      <Switch>
        <Route exact component={HomeScreen} path="/" />
        <Route exact component={EpisodeScreen} path="/episode/:id/:animeId" />
        <Route exact component={EpisodeScreen} path="/episode/:id" />
      </Switch>
    </BrowserRouter>
  );
}