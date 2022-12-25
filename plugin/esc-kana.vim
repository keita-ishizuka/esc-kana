if exists("g:loaded_esc_kana")
    finish
endif

lua require("esc-kana")

let g:loaded_esc_kana = 1
