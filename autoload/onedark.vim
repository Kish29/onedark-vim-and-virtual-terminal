" [onedark.vim](https://github.com/joshdick/onedark.vim/)

let s:overrides = get(g:, "onedark_color_overrides", {})

" if you use tty, you should set color of cterm(16-color supported) or color of cterm16(only 16
" \ system color suppoted)
" if you use gui or terminal simulation, set color of gui(maybe for terminal
" \ simulation)

let s:colors = {
      \ "red": get(s:overrides, "red", { "gui": "#E06C75", "cterm": "204", "cterm16": "1" }),
      \ "dark_red": get(s:overrides, "dark_red", { "gui": "#BE5046", "cterm": "196", "cterm16": "9" }),
      \ "green": get(s:overrides, "green", { "gui": "#98C379", "cterm": "114", "cterm16": "2" }),
      \ "yellow": get(s:overrides, "yellow", { "gui": "#E5C07B", "cterm": "180", "cterm16": "3" }),
      \ "dark_yellow": get(s:overrides, "dark_yellow", { "gui": "#D19A66", "cterm": "173", "cterm16": "11" }),
      \ "blue": get(s:overrides, "blue", { "gui": "#61AFEF", "cterm": "39", "cterm16": "4" }),
      \ "purple": get(s:overrides, "purple", { "gui": "#C678DD", "cterm": "170", "cterm16": "5" }),
      \ "cyan": get(s:overrides, "cyan", { "gui": "#56B6C2", "cterm": "38", "cterm16": "6" }),
      \ "white": get(s:overrides, "white", { "gui": "#ABB2BF", "cterm": "145", "cterm16": "7" }),
      \ "black": get(s:overrides, "black", { "gui": "#282C34", "cterm": "235", "cterm16": "0" }),
      \ "visual_black": get(s:overrides, "visual_black", { "gui": "#98c379", "cterm": "114", "cterm16": "2" }),   
      \ "comment_grey": get(s:overrides, "comment_grey", { "gui": "#5C6370", "cterm": "59", "cterm16": "15" }),
      \ "gutter_fg_grey": get(s:overrides, "gutter_fg_grey", { "gui": "#4b5263", "cterm": "255", "cterm16": "10" }),
      \ "cursor_grey": get(s:overrides, "cursor_grey", { "gui": "#2c323c", "cterm": "238", "cterm16": "15" }),
      \ "visual_grey": get(s:overrides, "visual_grey", { "gui": "#3e4452", "cterm": "237", "cterm16": "15" }),
      \ "menu_grey": get(s:overrides, "menu_grey", { "gui": "#3e4452", "cterm": "140", "cterm16": "8" }),
      \ "special_grey": get(s:overrides, "special_grey", { "gui": "#3b4048", "cterm": "238", "cterm16": "15" }),
      \ "vertsplit": get(s:overrides, "vertsplit", { "gui": "#181A1F", "cterm": "59", "cterm16": "15" }),
      \}
" adapted the row->visual_black, origin->gi:NONE, cterm:NONE, cterm16:0
" \if you don't change the visual_black, you will see nothing in VISUAL MODEL 

" adapted the row->menu_grey, origin->gui:3e4452, cterm:237, cterm16:8

function! onedark#GetColors()
  return s:colors
endfunction
