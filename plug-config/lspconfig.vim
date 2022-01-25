lua << EOF
local nvim_lsp = require'lspconfig'
local cmp = require'cmp'

local lsp = vim.lsp
local handlers = lsp.handlers

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<C-j>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<C-k>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),

  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
nvim_lsp.pyright.setup{ capabilities = capabilites }

nvim_lsp.hls.setup{ capabilities = capabilites }
nvim_lsp.rust_analyzer.setup{ capabilities = capabilites }

-- Hover doc popup
local pop_opts = { border = "rounded", max_width = 80 }
handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)
handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics,
      {
          virtual_text = false
      }
)
handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
handlers['textDocument/references'] = require'lsputil.locations'.references_handler
handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
EOF

autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
