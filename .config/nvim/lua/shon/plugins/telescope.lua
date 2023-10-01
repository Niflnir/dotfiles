return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "gbrlsnchs/telescope-lsp-handlers.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  keys = {
    {
      "<leader>f",
      "<cmd>Telescope find_files previewer=false<CR>",
      mode = "n",

      -- Options
      {
        noremap = true,
        silent = true,
      },
    },
    {
      "<leader>t",
      "<cmd>Telescope live_grep<CR>",
      mode = "n",

      -- Options
      {
        noremap = true,
        silent = true,
      },
    },
    {
      "<leader>d",
      "<cmd>Telescope diagnostics bufnr=0<CR>",
      mode = "n",

      -- Options
      {
        noremap = true,
        silent = true,
      },
    },
    {
      "<leader>D",
      "<cmd>Telescope diagnostics<CR>",
      mode = "n",

      -- Options
      {
        noremap = true,
        silent = true,
      },
    },
  },
  config = function()
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
      return
    end

    telescope.load_extension("fzf")
    telescope.load_extension("lsp_handlers")

    local actions = require("telescope.actions")
    local layout_actions = require("telescope.actions.layout")

    telescope.setup({
      defaults = {

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "top",
          mirror = true,
        },
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-p>"] = layout_actions.toggle_preview,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-c>"] = actions.close,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["<CR>"] = function()
              vim.cmd([[:stopinsert]])
              vim.cmd([[call feedkeys("\<CR>")]])
            end,
            -- ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist,    -- + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist, -- + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-_>"] = actions.which_key,         -- keys from pressing <C-/>
          },

          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<C-p>"] = layout_actions.toggle_preview,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["?"] = actions.which_key,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
        },
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
    })
  end,
}
