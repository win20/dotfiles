return function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")

    mason.setup()

    lspconfig.lua_ls.setup {
	settings = {
	    Lua = {
		diagnostics = {
		    globals = {"vim"},
		}
	    }
	}
    }
end

