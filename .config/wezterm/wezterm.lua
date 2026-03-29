local wezterm = require 'wezterm'
local config = {}

config.colors = {
    foreground = '#24292f',
    background = '#fafafa',

    cursor_fg = '#fafafa',
    cursor_bg = '#24292f',

    selection_fg = '#24292f',
    selection_bg = '#e1e5ea',

    scrollbar_thumb = '#808080',
    -- split =

    ansi = {
        '#24292f',
        '#b3202c',
        '#4a915b',
        '#b39020',
        '#174d8f',
        '#744d99',
        '#157685',
        '#d1d5da'
    },
    brights = {
        '#4f5966',
        '#cb2431',
        '#519e63',
        '#cca525',
        '#1b5cab',
        '#8759b3',
        '#188899',
        '#e1e5ea'
    },

    tab_bar = {
        active_tab = {
            fg_color = '#4f5966',
            bg_color = '#fafafa'
        },
        inactive_tab = {
            fg_color = '#4f5966',
            bg_color = '#d1d5da'
        },
        new_tab = {
            fg_color = '#4f5966',
            bg_color = '#d1d5da'
        }
    }
}

config.window_padding = {
    top = 6,
    right = 6,
    left = 6,
    bottom = 6
}

config.use_fancy_tab_bar = true
config.enable_tab_bar = true
config.enable_scroll_bar = true
config.enable_wayland = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = 'NeverPrompt'

config.window_frame = {
    font = wezterm.font { family = 'IBMPlexSansJP', weight = 'Bold' },
    font_size = 10,

    active_titlebar_bg = '#e1e5ea',
    inactive_titlebar_bg = '#e1e5ea'
}

config.window_background_opacity = 1.0

config.font = wezterm.font('monospace', { weight = 'Regular', italic = false })
config.font_size = 10

return config

