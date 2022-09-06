local keymap = vim.keymap

local function map(lhs, rhs, opts)
	for i,v in pairs({ "n", "v" }) do keymap.set(v, lhs, rhs, opts) end
end

local function nmap(lhs, rhs, opts)
	keymap.set("n", lhs, rhs, opts)
end

local function imap(lhs, rhs, opts)
	keymap.set("i", lhs, rhs, opts)
end

local function vmap(lhs, rhs, opts)
	keymap.set("v", lhs, rhs, opts)
end

return { map = map, nmap = nmap, imap = imap, vmap = vmap }
