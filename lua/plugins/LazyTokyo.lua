return {
  -- theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
      -- colorscheme = "citylights",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      light_style = "day",
      transparent = true,
      -- terminal_colors = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
      },
      -- day_brightness = 0.3,
      -- lualine_bold = false,
      on_color = function(colors) end,
      on_highlights = function(hl, c)
        hl.comment = { fg = "#41505e" }
      end,
    },
    sidebars = { "qf", "help" },
  },

  -- statusbar
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- 右下角是 lualine 的 section z，默认是时间
      opts.sections.lualine_z = {}
    end,
  },

  -- format
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        javascript = { "prettier" },
        markdown = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        json5 = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        mdx = { "prettier" },
        css = { "prettier" },
        less = { "prettier" },
        scss = { "prettier" },
        vue = { "prettier" },
      },
    },
  },

  -- trouble
  {
    "folke/trouble.nvim",
    enbled = true,
    opts = { use_diagnostic_signs = true },
  },

  -- flash
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- telescope find
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", "browse_components", ".git" },
      },
      picker = {
        find_files = {
          hidden = true,
          no_ignore = true,
          file_ignore_patterns = {
            "**/node_modules/*",
            ".ruff_cache",
            ".git/",
            ".mypy_cache",
          },
        },
      },
    },
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        stylua = false,
        pyright = {},
        cssls = {
          settings = {
            css = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
            scss = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
            less = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
            tailwindcss = {
              classFunctions = { "cva", "cx" },
            },
          },
        },
      },
    },
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = {
        enable = true,
      },
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx", -- React/TSX
        "vue", -- Vue
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "python",
        "prisma",
        "svelte",
        "graphql",
        "dockerfile",
        "gitignore",
        "query",
      },
    },
  },

  {
    "Exafunction/windsurf.vim",
    -- event = "BufEnter",
  },

  -- bufferline tabbar
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    opts = {
      options = {
        groups = {
          items = {},
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_buffer_icons = false,
        always_show_bufferline = false,
      },
    },
    keys = function()
      return {
        { "<leader>bp", false },
        { "<leader>bP", false },
      }
    end,
  },

  -- snacks explorer
  {
    "snacks.nvim",
    ---@class snacks.explorer.Config
    opts = {
      dashboard = {
        preset = {
          -- https://github.com/nvimdev/dashboard-nvim/wiki/Ascii-Header-Text
          header = [[ 
 ooooo                                                              
`888'                                                              
 888          .oooo.     oooooooo oooo    ooo                      
 888         `P  )88b   d'""7d8P   `88.  .8'                       
 888          .oP"888     .d8P'     `88..8'                        
 888       o d8(  888   .d8P'  .P    `888'                         
o888ooooood8 `Y888""8o d8888888P      .8'                          
                                  .o..P'                           
                                  `Y8P'                            
                                                                   
ooooooooooooo   .oooooo.   oooo    oooo oooooo   oooo   .oooooo.   
8'   888   `8  d8P'  `Y8b  `888   .8P'   `888.   .8'   d8P'  `Y8b  
     888      888      888  888  d8'      `888. .8'   888      888 
     888      888      888  88888[         `888.8'    888      888 
     888      888      888  888`88b.        `888'     888      888 
     888      `88b    d88'  888  `88b.       888      `88b    d88' 
    o888o      `Y8bood8P'  o888o  o888o     o888o      `Y8bood8P'  
    ]],
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 0.2, padding = 0 },
          { icon = " ", title = "Projects", section = "projects", indent = 1, padding = 1 },
          { section = "startup" },
        },
      },
      picker = {
        sources = {
          -- 这里是 find files
          smart = {
            exclude = { "node_modules", ".git", ".DS_Store" },
            hidden = false, -- 是否显示隐藏文件（按需）
            ignored = true, -- 是否忽略 .gitignore（按需）
          },
          files = {
            exclude = { "node_modules", ".git", ".DS_Store" },
          },
          explorer = {
            hidden = false,
            ignored = true,
            exclude = { "node_modules", ".git", ".DS_Store" },
            layout = {
              auto_hide = {
                --     "input",
              },
            },
          },
        },
      },
    },
  },

  -- mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        -- JS/TS
        "typescript-language-server",
        "eslint-lsp",
        "prettier", -- 格式化
        "css-lsp",
        "html-lsp",
        "vue-language-server", -- Volar
        "tailwindcss-language-server",

        -- 其他常用
        "json-lsp",
        "yaml-language-server",
      },
    },
  },

  -- 使用tab进行补全
  -- 首先 禁用LuaSnip中默认的tab快捷键
  -- {
  --   "L3MON4D3/LuaSnip",
  --   keys = function()
  --     return {}
  --   end,
  -- },

  -- yanky
  {
    "gbprod/yanky.nvim",
    opts = {
      highlight = { timer = 150 },
      ring = {
        history_length = 100,
      },
    },
  },
}
