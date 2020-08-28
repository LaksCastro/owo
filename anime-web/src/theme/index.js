import { red } from '@material-ui/core/colors';
import { createMuiTheme, responsiveFontSizes } from '@material-ui/core/styles';

const theme = responsiveFontSizes(
  createMuiTheme({
    typography: {
      fontFamily: ["Raleway"],
    },
    palette: {
      primary: {
        main: "#556cd6",
      },
      secondary: {
        main: "#19857b",
      },
      error: {
        main: red.A400,
      },
      background: {
        default: "#111111",
        paper: "#222",
      },
      text: {
        primary: "rgba(255, 255, 255, 0.8)",
        disabled: "rgba(255, 255, 255, 0.25)",
        secondary: "rgba(255, 255, 255, 0.5)",
        hint: "#f00",
      },
    },
    overrides: {
      MuiCssBaseline: {
        "@global": {
          "::-webkit-scrollbar": {
            width: "12px",
            backgroundColor: "transparent",
          },

          "::-webkit-scrollbar-button": {
            display: "none",
            width: 0,
            height: 0,
          },

          "::-webkit-scrollbar-corner": {
            backgroundColor: "transparent",
          },

          "::-webkit-scrollbar-thumb": {
            backgroundColor: "#222",
            border: "2px solid #252525",
            borderRadius: "10px",
          },
        },
      },
    },
  })
);

export default theme;