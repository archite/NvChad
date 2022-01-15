local M = {}

M.setup_lsp = function(attach, capabilities)
  local lsp_installer = require("nvim-lsp-installer")

  local servers = {
    "bashls",
    "cmake",
    "dockerls",
    "groovyls",
    "jsonls",
    "pyright",
    "sumneko_lua",
    "vimls",
    "yamlls"
  }

  local sysname = vim.loop.os_uname().sysname
  if sysname == 'Darwin' then
    local clangd_folder = vim.fn.stdpath("data") .. "/lsp_servers/clangd"
    if vim.fn.isdirectory(clangd_folder) == 0 then
      vim.fn.mkdir(clangd_folder, 'p')
    end
  else
    table.insert(servers, "clangd")
  end

  for _, name in pairs(servers) do
    local ok, server = lsp_installer.get_server(name)
    -- Check that the server is supported in nvim-lsp-installer
    if ok then
      if not server:is_installed() then
        -- server:install()
        -- print("Language server " .. name .. " installed.")
        lsp_installer.install(name)
      end
    end
  end

  lsp_installer.on_server_ready(function(server)
    local default_opts = {
      on_attach = attach,
      capabilities = capabilities,
    }

    local server_opts = {
      ["bashls"] = function()
        default_opts.filetypes = {
          "sh",
          "zsh"
        }

        return default_opts
      end,

      ["clangd"] = function()
        default_opts.cmd = {
          "clangd",
          "--background-index",
          "--query-driver=arm-none-eabi*,avr*"
        }

        default_opts.on_attach = function(client, bufnr)
          local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
          end

          attach(client, bufnr)

          local opts = { noremap=true, silent=true }

          buf_set_keymap('n', 'gc', '<cmd>ClangdSwitchSourceHeader<CR>', opts)
        end

        return default_opts
      end,

      ["sumneko_lua"] = function ()
        default_opts.settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {
                'vim'
              },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
              }
            }
          }
        }

        -- default_opts.on_attach = on_attach
        -- default_opts.capabilities = capabilities

        return default_opts
      end
    }

    server:setup(server_opts[server.name] and server_opts[server.name]() or default_opts)
    vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

return M
