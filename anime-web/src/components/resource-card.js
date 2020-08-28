import React from 'react';

import { makeStyles } from '@material-ui/core/styles';

import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Typography from '@material-ui/core/Typography';

const useStyles = makeStyles({
  root: {
    width: 150,
  },
});

export default function ResourceCard({ resource: { imgUrl, title }, onClick }) {
  const classes = useStyles();

  return (
    <Card onClick={onClick} className={classes.root} title={title}>
      <CardActionArea>
        <CardMedia
          component="img"
          alt={title}
          height="200"
          image={imgUrl}
          title={title}
        />
        <CardContent>
          <Typography
            noWrap
            variant="body2"
            color="textSecondary"
            component="p"
          >
            {title}
          </Typography>
        </CardContent>
      </CardActionArea>
    </Card>
  );
}