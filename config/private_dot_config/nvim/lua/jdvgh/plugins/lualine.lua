return {
        {
                'nvim-lualine/lualine.nvim',
                requires = { 'nvim-tree/nvim-web-devicons', opt = true },
                opts = {
                        sections = {
                                lualine_c = {
                                        "filename",
                                        path = 3,
                                }
                        }
                }
        }
}
