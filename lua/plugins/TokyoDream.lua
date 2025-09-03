return {

  -- theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        comments = {
          italic = true,
        },
        -- keywords = { bold = true },
        -- functions = { bold = true },
        -- variables = { bold = true },
        -- numbers = { bold = true },
        -- booleans = { bold = true },
        -- strings = { bold = true },
        -- types = { bold = true },
      },
      sidebars = { "qf", "help" },
    },
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

  -- mason
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
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

  -- nvim-cmp cmp-emojo  autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- telescope find
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", "browse_components", ".git" },
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
        pyright = {},
      },
    },
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
      },
    },
  },

  -- 🔮 自动补全源（加上 Tailwind / Emoji 之类）
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- bufferline tabbar
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        show_buffer_icons = false, -- 不显示文件类型图标
        show_buffer_close_icons = false, -- 不显示 buffer 的关闭按钮
        show_close_icon = false, -- 不显示整个 tabline 的关闭按钮
      })
      return opts
    end,
  },

  -- snacks explorer
  {
    "folke/snacks.nvim",
    ---@class snacks.explorer.Config
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = false,
            exclude = { "node_modules", ".DS_Store" },
            layout = {
              auto_hide = {
                "input",
              },
            },
          },
        },
      },
    },
  },
}
