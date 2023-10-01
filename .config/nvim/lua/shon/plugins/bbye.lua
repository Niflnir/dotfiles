return {
	"moll/vim-bbye",
  lazy = false,
	keys = {
		-- Delete current buffer
		{
			"<leader>z",
			"<cmd>Bdelete<CR>",
			mode = "n",

			-- Options
			{
				silent = true,
			},
		},

		-- Delete all buffers
		{
			"<leader>Z",
			"<cmd>bufdo Bdelete<CR>",
			mode = "n",

			-- Options
			{
				silent = true,
			},
		},
	},
}
