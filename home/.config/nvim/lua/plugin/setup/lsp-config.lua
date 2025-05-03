return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", opts = {} },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- Useful status updates for LSP.
    { "j-hui/fidget.nvim", opts = {} },

    -- Allows extra capabilities provided by nvim-cmp
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", require("telescope.builtin").lsp_definitions, "lsp: goto definition")
        map("gr", require("telescope.builtin").lsp_references, "lsp: goto references")
        map("gI", require("telescope.builtin").lsp_implementations, "lsp: goto implementation")
        map("<leader>D", require("telescope.builtin").lsp_type_definitions, "lsp: type definition")
        map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "lsp: document symbols")
        map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "lsp: workspace symbols")
        map("<leader>rn", vim.lsp.buf.rename, "lsp: rename")
        map("<leader>ca", vim.lsp.buf.code_action, "lsp: code action", { "n", "x" })
        map("gD", vim.lsp.buf.declaration, "lsp: goto declaration")
        map("<leader>dt", ToggleDiagnosticsVirtualText, "lsp: toggle diagnostics virtual linen")

        -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
        ---@param client any
        ---@param method string
        ---@param bufnr? integer some lsp support methods only in specific files
        ---@return boolean
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has "nvim-0.11" == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = "kickstart-lsp-highlight", buffer = event2.buf }
            end,
          })
        end
      end,
    })

    -- Diagnostic Config
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = "rounded", source = "if_many" },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
      } or {},
      virtual_text = {
        source = "if_many",
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local servers = {

      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = { disable = { "missing-fields" }, globals = { "vim", "require" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
              checkThirdParty = false, -- Optional: Disable third-party library checks
            },
            telemetry = {
              enable = false, -- Disable telemetry
            },
          },
        },
      },

      ts_ls = {},

      pyright = {},

      astro = {},

      gopls = {},

      phpactor = {
        cmd = { "phpactor", "language-server" },
        filetypes = { "php" },

        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("composer.json", ".git")(fname) or vim.fn.getcwd()
        end,

        init_options = {
          ["language_server_phpstan.enabled"] = false,
          ["language_server_psalm.enabled"] = false,
          ["completion.enabled"] = true,
        },
      },

      html = {
        filetypes = { "html", "twig", "hbs", "blade" },
        init_options = {
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = {
            css = true,
            javascript = true,
          },
          provideFormatter = true,
        },
      },

      cssls = {
        settings = {
          css = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          scss = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          less = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
      },

      emmet_language_server = {},
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua",
      "prettier",
      "phpstan",
      "psalm",
      "ts_ls",
    })
    require("mason-tool-installer").setup { ensure_installed = ensure_installed }

    require("mason-lspconfig").setup {
      ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for ts_ls)
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    }
  end,
}
