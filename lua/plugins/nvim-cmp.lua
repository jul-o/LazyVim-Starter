return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
  },
  opts = function(_, opts)
    local types = require("cmp.types")

    -- Function to sort LSP snippets, so that they appear at the end of LSP suggestions
    local function deprioritize_snippet(entry1, entry2)
      if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
        return false
      end
      if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
        return true
      end
    end

    table.insert(opts.sorting.comparators, 1, deprioritize_snippet)
  end,
}

-- return {
--   "hrsh7th/nvim-cmp",
--   dependencies = {
--     { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
--   },
--   opts = function(_, opts)
--     -- original LazyVim kind icon formatter
--     local format_kinds = opts.formatting.format
--     opts.formatting.format = function(entry, item)
--       format_kinds(entry, item) -- add icons
--       return require("tailwindcss-colorizer-cmp").formatter(entry, item)
--     end
--   end,
-- }
