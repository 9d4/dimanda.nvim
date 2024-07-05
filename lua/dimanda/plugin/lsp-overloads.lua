local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    if client.server_capabilities.signatureHelpProvider then
        vim.api.nvim_set_keymap("n", "<A-s>", ":LspOverloadsSignature<CR>",
            { noremap = true, silent = true, buffer = bufnr })
    end
    if client.server_capabilities.signatureHelpProvider then
        vim.api.nvim_set_keymap("i", "<A-s>", "<cmd>LspOverloadsSignature<CR>",
            { noremap = true, silent = true, buffer = bufnr })
    end
end)
