import React from 'react';

import { makeStyles } from '@material-ui/core/styles';

import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import { Box } from "@material-ui/core";
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Typography from '@material-ui/core/Typography';

const useStyles = makeStyles((theme) => ({
  container: {
    background: theme.palette.background.paper,
    borderRadius: 12,
    overflow: "hidden"
  },
  imgContainer: {
    width: 150,
    height: 250,
    "& img": {
      width: "100%",
      height: "100%",
      objectFit: "cover",
    },
  },
  titleContainer: {
    padding: 12,
  },
}));

export default function HorizontalCard({ resource: { imgUrl, title }, onClick }) {
  const classes = useStyles();

  return (
    <Box className={classes.container} onClick={onClick} display="flex">
      <div className={classes.imgContainer}>
        <img src={imgUrl} alt={title} title={title} />
      </div>
      <div className={classes.titleContainer}>
        <Typography variant="body1">{title}</Typography>
      </div>
    </Box>
  );
}