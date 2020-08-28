import React, { useState, useEffect } from "react";

import TextField from '@material-ui/core/TextField';

import { makeStyles } from "@material-ui/core/styles";

const useStyles = makeStyles((theme) => ({
    searchForm: {
      padding: "8px",
      background: theme.palette.background.paper,
    },
  }));

export default function HomeSearch({ onChange, onDisableSearch }) {
  const [search, setSearch] = useState("");

  const classes = useStyles();

  useEffect(() => {
    if (search === "") {
      return onDisableSearch();
    }

    onChange(search);
  }, [search]);

  return (
    <form className={classes.searchForm} noValidate autoComplete="off">
      <TextField
        id="filled-basic"
        label="Search"
        variant="filled"
        fullWidth={true}
        onChange={(e) => setSearch(e.target.value)}
      />
    </form>
  );
}