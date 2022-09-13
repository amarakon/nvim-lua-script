-- Base key map functions
function keymap(mode, lhs, rhs, opts)
	local options = {}
	if opts then local options = vim.tbl_extend("force", options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
keynoremap = vim.keymap.set

-- Modal mappings
for _, i in pairs { "n", "i", "v", "c", "o" } do
	for _, j in pairs({ "", "nore" }) do
		_G[i .. j .. "map"] = function (...) _G["key" .. j .. "map"](i, ...) end
	end
end

-- Regular map functions
for _, i in pairs { "", "nore" } do
	_G[i .. "map"] = function (...)
		for _, j in pairs({ "n", "v" }) do _G["key" .. i .. "map"](j, ...) end
	end
end

-- Auto-commands
function autocmd(type, match, opts)
	vim.api.nvim_create_autocmd({ type }, { pattern = match, callback = opts })
end

-- Options
g = vim.g
o = vim.o
opt = vim.opt
