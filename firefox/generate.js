import JsonUrl from "json-url";

const jsonCodec = JsonUrl("lzma");

// Ember palette (RGB values)
const palette = {
  bg: { r: 13, g: 13, b: 13 },       // #0d0d0d
  bg1: { r: 20, g: 20, b: 20 },      // #141414
  bg2: { r: 26, g: 26, b: 26 },      // #1a1a1a
  bg3: { r: 42, g: 42, b: 42 },      // #2a2a2a
  fg: { r: 232, g: 228, b: 224 },    // #e8e4e0
  fg_dim: { r: 144, g: 140, b: 136 }, // #908c88
  comment: { r: 85, g: 85, b: 85 },  // #555555
  yellow: { r: 240, g: 192, b: 0 },  // #f0c000
  orange: { r: 232, g: 138, b: 42 }, // #e88a2a
  red: { r: 212, g: 74, b: 58 },     // #d44a3a
  green: { r: 169, g: 182, b: 101 }, // #a9b665
  blue: { r: 122, g: 162, b: 199 },  // #7aa2c7
  tan: { r: 196, g: 168, b: 122 },   // #c4a87a
};

const theme = {
  colors: {
    toolbar: palette.bg1,
    toolbar_text: palette.fg,
    frame: palette.bg,
    tab_background_text: palette.fg,
    toolbar_field: palette.bg2,
    toolbar_field_text: palette.fg,
    tab_line: palette.yellow,
    popup: palette.bg1,
    popup_text: palette.fg,
    button_background_active: palette.bg3,
    frame_inactive: palette.bg,
    icons_attention: palette.yellow,
    icons: palette.yellow,
    ntp_background: palette.bg,
    ntp_text: palette.fg,
    popup_border: palette.tan,
    popup_highlight_text: palette.fg,
    popup_highlight: palette.bg3,
    sidebar_border: palette.tan,
    sidebar_highlight_text: palette.bg,
    sidebar_highlight: palette.yellow,
    sidebar_text: palette.fg,
    sidebar: palette.bg1,
    tab_background_separator: palette.bg3,
    tab_loading: palette.yellow,
    tab_selected: palette.bg1,
    tab_text: palette.fg,
    toolbar_bottom_separator: palette.bg1,
    toolbar_field_border_focus: palette.yellow,
    toolbar_field_border: palette.bg1,
    toolbar_field_focus: palette.bg1,
    toolbar_field_highlight_text: palette.bg,
    toolbar_field_highlight: palette.yellow,
    toolbar_field_separator: palette.tan,
    toolbar_vertical_separator: palette.tan,
  },
  images: {
    additional_backgrounds: [],
    custom_backgrounds: [],
  },
  title: "Ember",
};

(async () => {
  const url = await jsonCodec.compress(theme);
  console.log(`Firefox Color URL:\n`);
  console.log(`https://color.firefox.com/?theme=${url}`);
})();
