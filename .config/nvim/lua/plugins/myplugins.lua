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
        "echasnovski/mini.pairs",
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

    {
        "olimorris/codecompanion.nvim",
        opts = {
            adapters = {
                openai = function()
                    return require("codecompanion.adapters").extend("openai", {
                        url = "https://integrate.api.nvidia.com/v1/chat/completions",
                        env = {
                            api_key = os.getenv("OPENAI_API_KEY"),
                            -- Use this if you gpg encrypt your api key (recommended approach)
                            -- api_key = "cmd:gpg --quiet --decrypt ~/.openai_api_key.asc",
                        },
                        schema = {
                            model = {
                                default = "nvdev/nvidia/llama-3.1-nemotron-70b-instruct",
                                -- default = "nvdev/deepseek-ai/deepseek-r1",
                            },
                        },
                    })
                end,
            },
            strategies = {
                -- Change the default chat adapter
                chat = {
                    adapter = "openai",
                    slash_commands = {
                        ["buffer"] = { opts = { provider = "snacks", }, },
                        ["file"] = { opts = { provider = "snacks", }, },
                        ["symbol"] = { opts = { provider = "snacks", }, },
                        ["help"] = { opts = { provider = "snacks", }, },
                    },
                },
                inline = { adapter = "openai" },
                agent = { adapter = "openai" },
            },
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
