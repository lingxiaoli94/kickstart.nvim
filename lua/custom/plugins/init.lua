-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
    end,
    init = function()
      vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
  },
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'skim'
      vim.g.vimtex_quickfix_open_on_warning = false
    end,
  },
  -- install without yarn or npm
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    init = function()
      vim.g.mkdp_preview_options = {
        disable_sync_scroll = true,
      }
      vim.keymap.set('n', '<leader>lv', '<Plug>MarkdownPreview', { noremap = true, silent = true })
    end,
  },
  { 'github/copilot.vim' },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      -- on_attach = function(client)
      --   client.server_capabilities.documentFormattingProvider = false
      --   client.server_capabilities.documentRangeFormattingProvider = false
      -- end,
      settings = {
        tsserver_file_preferences = {
          quotePreference = 'auto',
        },
        tsserver_format_options = {
          indentSize = 2,
        },
      },
    },
  },
}
