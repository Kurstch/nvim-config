local dashboard = require('dashboard')

local ascii = {
    [1] = {
        path = '~/.config/nvim/ascii/chika_fujiwara.txt',
        height = 15,
        width = 33,
    },
    [2] = {
        path = '~/.config/nvim/ascii/anime_girl1.txt',
        height = 20,
        width = 30,
    },
    [3] = {
        path = '~/.config/nvim/ascii/hydra.txt',
        height = 11,
        width = 32,
    },
    [4] = {
        path = '~/.config/nvim/ascii/anime_girl2.txt',
        height = 13,
        width = 28,
    },
    [5] = {
        path = '~/.config/nvim/ascii/anime_girl3.txt',
        height = 14,
        width = 30,
    }
}

math.randomseed(os.time())
local ascii_index = math.random(5)

dashboard.preview_command = 'cat | lolcat -p 2'
dashboard.preview_file_path = ascii[ascii_index].path
dashboard.preview_file_height = ascii[ascii_index].height
dashboard.preview_file_width = ascii[ascii_index].width

dashboard.custom_center = {
    {
        icon = " ",
        desc = "Find File               ",
        shortcut = "Space f s",
        action = "Telescope find_files hidden=true"
    },
    {
        icon = " ",
        desc = "File Browser            ",
        shortcut = "Space f r",
        action = "Telescope file_browser hidden=true"
    },
    {
        icon = " ",
        desc = "Go To Mark              ",
        shortcut = "Space f m",
        action = "Telescope harpoon marks"
    }
}

dashboard.custom_footer = {}
