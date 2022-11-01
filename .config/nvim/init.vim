augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end

lua require("plugins")
lua require("config")

lua require("config/vimoptions")
lua require("config/keymaps")
lua require("config/colors")
lua require("autocomplete/snippets")
