// name: Rosé Pine
// author: thuanowa
// license: unlicense
// upstream: https://github.com/rose-pine/surfingkeys/blob/main/dist/rose-pine.conf
// blurb: All natural pine, faux fur and a bit of soho vibes for the classy minimalist

const hintsCss =
  "font-size: 13pt; font-family: 'JetBrainsMono Nerd Font'; border: 0px; color: #e0def4 !important; background: #191724; background-color: #191724";

api.Hints.style(hintsCss);
api.Hints.style(hintsCss, "text");

settings.theme = `
  .sk_theme {
    background: #191724;
    color: #e0def4;
  }
  .sk_theme input {
    color: #e0def4;
  }
  .sk_theme .url {
    color: #c4a7e7;
  }
  .sk_theme .annotation {
    color: #ebbcba;
  }
  .sk_theme kbd {
    background: #26233a;
    color: #e0def4;
  }
  .sk_theme .frame {
    background: #1f1d2e;
  }
  .sk_theme .omnibar_highlight {
    color: #403d52;
  }
  .sk_theme .omnibar_folder {
    color: #e0def4;
  }
  .sk_theme .omnibar_timestamp {
    color: #9ccfd8;
  }
  .sk_theme .omnibar_visitcount {
    color: #9ccfd8;
  }
  .sk_theme .prompt, .sk_theme .resultPage {
    color: #e0def4;
  }
  .sk_theme .feature_name {
    color: #e0def4;
  }
  .sk_theme .separator {
    color: #524f67;
  }
  body {
    margin: 0;

    font-family: "JetBrainsMono Nerd Font";
    font-size: 14px;
  }
  #sk_omnibar {
    overflow: hidden;
    position: fixed;
    width: 80%;
    max-height: 80%;
    left: 10%;
    text-align: left;
    box-shadow: 0px 2px 10px #21202e;
    z-index: 2147483000;
    font-family: "JetBrainsMono Nerd Font";
  }
  .sk_omnibar_middle {
    top: 10%;
    border-radius: 4px;
  }
  .sk_omnibar_bottom {
    bottom: 0;
    border-radius: 4px 4px 0px 0px;
  }
  #sk_omnibar span.omnibar_highlight {
    text-shadow: 0 0 0.01em;
  }
  #sk_omnibarSearchArea .prompt, #sk_omnibarSearchArea .resultPage {
    display: inline-block;
    font-size: 20px;
    width: auto;
  }
  #sk_omnibarSearchArea>input {
    display: inline-block;
    width: 100%;
    flex: 1;
    font-size: 20px;
    margin-bottom: 0;
    padding: 0px 0px 0px 0.5rem;
    background: transparent;
    border-style: none;
    outline: none;

    /* need to override input style here */
    font-family: "JetBrainsMono Nerd Font";
  }
  #sk_omnibarSearchArea {
    display: flex;
    align-items: center;
    border-bottom: 1px solid #524f67;
  }
  .sk_omnibar_middle #sk_omnibarSearchArea {
    margin: 0.5rem 1rem;
  }
  .sk_omnibar_bottom #sk_omnibarSearchArea {
    margin: 0.2rem 1rem;
  }
  .sk_omnibar_middle #sk_omnibarSearchResult>ul {
    margin-top: 0;
  }
  .sk_omnibar_bottom #sk_omnibarSearchResult>ul {
    margin-bottom: 0;
  }
  #sk_omnibarSearchResult {
    max-height: 60vh;
    overflow: hidden;
    margin: 0rem 0.6rem;
  }
  #sk_omnibarSearchResult:empty {
    display: none;
  }
  #sk_omnibarSearchResult>ul {
    padding: 0;
  }
  #sk_omnibarSearchResult>ul>li {
    padding: 0.2rem 0rem;
    display: block;
    max-height: 600px;
    overflow-x: hidden;
    overflow-y: auto;
  }
  .sk_theme #sk_omnibarSearchResult>ul>li:nth-child(odd) {
    background: #1f1d2e;
  }
  .sk_theme #sk_omnibarSearchResult>ul>li.focused {
    background: #26233a;
  }
  .sk_theme #sk_omnibarSearchResult>ul>li.window {
    border: 2px solid #524f67;
    border-radius: 8px;
    margin: 4px 0px;
  }
  .sk_theme #sk_omnibarSearchResult>ul>li.window.focused {
    border: 2px solid #c4a7e7;
  }
  .sk_theme div.table {
    display: table;
  }
  .sk_theme div.table>* {
    vertical-align: middle;
    display: table-cell;
  }
  #sk_omnibarSearchResult li div.title {
    text-align: left;
  }
  #sk_omnibarSearchResult li div.url {
    font-weight: bold;
    white-space: nowrap;
  }
  #sk_omnibarSearchResult li.focused div.url {
    white-space: normal;
  }
  #sk_omnibarSearchResult li span.annotation {
    float: right;
  }
  #sk_omnibarSearchResult .tab_in_window {
    display: inline-block;
    padding: 5px;
    margin: 5px;
    box-shadow: 0px 2px 10px #21202e;
  }
  #sk_status {
    position: fixed;
    bottom: 0;
    right: 20%;
    z-index: 2147483000;
    padding: 4px 8px 0 8px;
    border-radius: 4px 4px 0px 0px;
    border: 1px solid #524f67;
    font-size: 12px;
  }
  #sk_status>span {
    line-height: 16px;
  }
  .expandRichHints span.annotation {
    padding-left: 4px;
    color: #ebbcba;
  }
  .expandRichHints .kbd-span {
    min-width: 30px;
    text-align: right;
    display: inline-block;
  }
  .expandRichHints kbd>.candidates {
    color: #e0def4;
    font-weight: bold;
  }
  .expandRichHints kbd {
    padding: 1px 2px;
  }
  #sk_find {
    border-style: none;
    outline: none;
  }
  #sk_keystroke {
    padding: 6px;
    position: fixed;
    float: right;
    bottom: 0px;
    z-index: 2147483000;
    right: 0px;
    background: #191724;
    color: #e0def4;
  }
  #sk_usage, #sk_popup, #sk_editor {
    overflow: auto;
    position: fixed;
    width: 80%;
    max-height: 80%;
    top: 10%;
    left: 10%;
    text-align: left;
    box-shadow: #21202e;
    z-index: 2147483298;
    padding: 1rem;
  }
  #sk_nvim {
    position: fixed;
    top: 10%;
    left: 10%;
    width: 80%;
    height: 30%;
  }
  #sk_popup img {
    width: 100%;
  }
  #sk_usage>div {
    display: inline-block;
    vertical-align: top;
  }
  #sk_usage .kbd-span {
    width: 80px;
    text-align: right;
    display: inline-block;
  }
  #sk_usage .feature_name {
    text-align: center;
    padding-bottom: 4px;
  }
  #sk_usage .feature_name>span {
    border-bottom: 2px solid #524f67;
  }
  #sk_usage span.annotation {
    padding-left: 32px;
    line-height: 22px;
  }
  #sk_usage * {
    font-size: 10pt;
  }
  kbd {
    white-space: nowrap;
    display: inline-block;
    padding: 3px 5px;
    font: 11px "JetBrainsMono Nerd Font";
    line-height: 10px;
    vertical-align: middle;
    border: solid 1px #524f67;
    border-bottom-lolor: #524f67;
    border-radius: 3px;
    box-shadow: inset 0 -1px 0 #21202e;
  }
  #sk_banner {
    padding: 0.5rem;
    position: fixed;
    left: 10%;
    top: -3rem;
    z-index: 2147483000;
    width: 80%;
    border-radius: 0px 0px 4px 4px;
    border: 1px solid #524f67;
    border-top-style: none;
    text-align: center;
    background: #191724;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
  }
  #sk_tabs {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: transparent;
    overflow: auto;
    z-index: 2147483000;
  }
  div.sk_tab {
    display: inline-block;
    border-radius: 3px;
    padding: 10px 20px;
    margin: 5px;
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#191724), color-stop(100%,#191724));
    box-shadow: 0px 3px 7px 0px #21202e;
  }
  div.sk_tab_wrap {
    display: inline-block;
  }
  div.sk_tab_icon {
    display: inline-block;
    vertical-align: middle;
  }
  div.sk_tab_icon>img {
    width: 18px;
  }
  div.sk_tab_title {
    width: 150px;
    display: inline-block;
    vertical-align: middle;
    font-size: 10pt;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    padding-left: 5px;
    color: #e0def4;
  }
  div.sk_tab_url {
    font-size: 10pt;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    color: #c4a7e7;
  }
  div.sk_tab_hint {
    display: inline-block;
    float:right;
    font-size: 10pt;
    font-weight: bold;
    padding: 0px 2px 0px 2px;
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#191724), color-stop(100%,#191724));
    color: #e0def4;
    border: solid 1px #524f67;
    border-radius: 3px;
    box-shadow: #21202e;
  }
  #sk_bubble {
    position: absolute;
    padding: 9px;
    border: 1px solid #524f67;
    border-radius: 4px;
    box-shadow: 0 0 20px #21202e;
    color: #e0def4;
    background-color: #191724;
    z-index: 2147483000;
    font-size: 14px;
  }
  #sk_bubble .sk_bubble_content {
    overflow-y: scroll;
    background-size: 3px 100%;
    background-position: 100%;
    background-repeat: no-repeat;
  }
  .sk_scroller_indicator_top {
    background-image: linear-gradient(#191724, transparent);
  }
  .sk_scroller_indicator_middle {
    background-image: linear-gradient(transparent, #191724, transparent);
  }
  .sk_scroller_indicator_bottom {
    background-image: linear-gradient(transparent, #191724);
  }
  #sk_bubble * {
    color: #e0def4 !important;
  }
  div.sk_arrow>div:nth-of-type(1) {
    left: 0;
    position: absolute;
    width: 0;
    border-left: 12px solid transparent;
    border-right: 12px solid transparent;
    background: transparent;
  }
  div.sk_arrow[dir=down]>div:nth-of-type(1) {
    border-top: 12px solid #524f67;
  }
  div.sk_arrow[dir=up]>div:nth-of-type(1) {
    border-bottom: 12px solid #524f67;
  }
  div.sk_arrow>div:nth-of-type(2) {
    left: 2px;
    position: absolute;
    width: 0;
    border-left: 10px solid transparent;
    border-right: 10px solid transparent;
    background: transparent;
  }
  div.sk_arrow[dir=down]>div:nth-of-type(2) {
    border-top: 10px solid #e0def4;
  }
  div.sk_arrow[dir=up]>div:nth-of-type(2) {
    top: 2px;
    border-bottom: 10px solid #e0def4;
  }
  .ace_editor.ace_autocomplete {
    z-index: 2147483300 !important;
    width: 80% !important;
  }
  @media only screen and (max-width: 767px) {
    #sk_omnibar {
      width: 100%;
      left: 0;
    }
    #sk_omnibarSearchResult {
      max-height: 50vh;
      overflow: scroll;
    }
    .sk_omnibar_bottom #sk_omnibarSearchArea {
      margin: 0;
      padding: 0.2rem;
    }
  }
`;

// currently not working
settings.tabsMRUOrder = true;

settings.scrollStepSize = 150;

// settings.lurkingPattern = /youtube.com/;

api.Hints.setCharacters("arstgoienmqwfpbyuljzxcdvhk");

api.mapkey("<Space>", "Choose a tab with omnibar", function () {
  api.Front.openOmnibar({ type: "Tabs" });
});

api.map("<ArrowDown>", "j");
api.map("<ArrowLeft>", "h");
api.map("<ArrowRight>", "l");
api.map("<ArrowUp>", "k");
api.map("<Backspace>", "S");
api.map("<Delete>", "D");
api.map("F", "af");
api.map("gm", "<Alt-m>");
api.map("gp", "<Alt-i>");
api.map("o", "go");
api.map("sw", "se");
api.map("zf", "cf");
api.map("zm", "om");
api.map("U", "E");
api.map("Y", "R");

api.unmapAllExcept([
  '$',
  '.',
  '/',
  '0',
  '<<',
  '<ArrowDown>',
  '<ArrowLeft>',
  '<ArrowRight>',
  '<ArrowUp>',
  '<Backspace>',
  '<Delete>',
  '<Esc>',
  '<Space>',
  '>>',
  '?',
  'F',
  'G',
  'N',
  'T',
  'U',
  'W',
  'X',
  'Y',
  '[[',
  ']]',
  'd',
  'f',
  'g$',
  'g0',
  'gU',
  'gf',
  'gg',
  'gi',
  'gm',
  'gp',
  'gu',
  'gx$',
  'gx0',
  'gxT',
  'gxt',
  'gxx',
  'i',
  'n',
  'o',
  'p',
  'r',
  'sg',
  'sh',
  'sw',
  'sy',
  't',
  'u',
  'v',
  'x',
  'yT',
  'yt',
  'yy',
  'zf',
  'zi',
  'zm',
  'zo',
  'zr',
  // '<Ctrl-Alt-i>', open in neovim, not working
]);

api.vmap("<ArrowLeft>", "h");
api.vmap("<ArrowDown>", "j");
api.vmap("<ArrowUp>", "k");
api.vmap("<ArrowRight>", "l");
