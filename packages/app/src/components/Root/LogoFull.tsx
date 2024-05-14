import React from 'react';
import DevopsDaysFullLogo from './logo-devops-days-backstage-full.png';
import { makeStyles } from '@material-ui/core';

const useStyles = makeStyles({
  img: {
    width: '170px',
  },
});

const LogoFull = () => {
  const classes = useStyles();

  // eslint-disable-next-line jsx-a11y/alt-text
  return <img className={classes.img} src={DevopsDaysFullLogo} />;
};

export default LogoFull;
