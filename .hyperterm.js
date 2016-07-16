module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 12,

    // font family with optional fallbacks
    fontFamily: '"Droid Sans Mono", Menlo, monospace',
    //fontFamily: '"Menlo, DejaVu Sans Mono, Lucida Console, monospace"',

    // terminal cursor background color (hex)
    cursorColor: '#cccccc',
    //cursorColor: '#F81CE5',

    // color of SHELL
    foregroundColor: '#cccccc',

    // terminal background color
    backgroundColor: '#2d2d2d',
    //backgroundColor: '#000',

    // border color (window, tabs)
    //borderColor: '#515151',
    borderColor: '#2d2d2d',

    // custom css to embed in the main window
    //css: '',
    css: `
      .tab_tab.tab_active:before {
        border-color: #ccc !important;
        opacity:0.3;
      }
    `,


    // custom padding (css format, i.e.: `top right bottom left`)
    termCSS: '',

    // custom padding
    padding: '5px 14px',

    // some color overrides. see http://bit.ly/29k1iU2 for
    colors: [
      '#2d2d2d',
      '#f2777a',
      '#99cc99',
      '#ffcc66',
      '#6699cc',
      '#cc99cc',
      '#66cccc',
      '#d0d0d0',
      '#999999',
      '#f2777a',
      '#99cc99',
      '#f99157',
      '#6699cc',
      '#cc99cc',
      '#66cccc',
      '#ffffff'
    ]
    // the full list
    //defalut
    //    colors: [
    //      '#000000',
    //      '#ff0000',
    //      '#33ff00',
    //      '#ffff00',
    //      '#0066ff',
    //      '#cc00ff',
    //      '#00ffff',
    //      '#d0d0d0',
    //      '#808080',
    //      '#ff0000',
    //      '#33ff00',
    //      '#ffff00',
    //      '#0066ff',
    //      '#cc00ff',
    //      '#00ffff',
    //      '#ffffff'
    //    ]
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hypersolar`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
  ],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
