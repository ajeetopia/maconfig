return {
    -- Set color scheme
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            styles = {
                italic = false
            }
        }
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "rose-pine"
        }
    },

    -- Disable annoying automatic pairing
    {
        "nvim-mini/mini.pairs",
        enabled = false
    },

    -- override nvim-cmp and add cmp-emoji
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji" },
        ---@param opts cmp.ConfigSchema
            opts = function(_, opts)
            table.insert(opts.sources, { name = "emoji" })
            end,
    },

    -- change some telescope options and a keymap to browse plugin files
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            -- add a keymap to browse plugin files
                -- stylua: ignore
                {
                    "<leader>fp",
                    function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
                    desc = "Find Plugin File",
                },
        },
        -- change some options
            opts = {
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = { prompt_position = "top" },
                    sorting_strategy = "ascending",
                    winblend = 0,
                },
            },
    },

    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "awk",
                "bash",
                "c",
                "cpp",
                "css",
                "csv",
                "cuda",
                "devicetree",
                "diff",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "glsl",
                "html",
                "http",
                "javascript",
                "json",
                "kconfig",
                "linkerscript",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "objc",
                "objdump",
                "passwd",
                "pem",
                "printf",
                "proto",
                "python",
                "query",
                "regex",
                "rst",
                "ssh_config",
                "strace",
                "todotxt",
                "udev",
                "vim",
                "xml",
                "yaml",
            },
        },
    },

    -- claude code
    {
        "coder/claudecode.nvim",
        dependencies = { "folke/snacks.nvim" },
        config = true,
        keys = {
          { "<leader>a", nil, desc = "AI/Claude Code" },
          { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
          { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
          { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
          { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
          { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
          { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
          { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
          {
            "<leader>as",
            "<cmd>ClaudeCodeTreeAdd<cr>",
            desc = "Add file",
            ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
          },
          -- Diff management
          { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
          { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
        },
    },

    -- tmux integration
    {
        "alexghergh/nvim-tmux-navigation",
        config = function()
            require("nvim-tmux-navigation").setup({ disable_when_zoomed = true })
            end
    },
}
