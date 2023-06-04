require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")

dap.adapters.codelldb = {

	host = "${port}",
	port = 13000,
	executable = {
		command = "/home/winb/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
		args = { "--port", "${port}" },
	},
}

dap.configurations.rust = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		showDisassembly = "never",
	},
}

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
