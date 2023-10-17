local cmp = require("cmp")

local confirm_completion = function()
    local entry = cmp.get_selected_entry()
    if not entry then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    else
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
    end
end

local tab_mapping_default = function(fallback)
    if cmp.visible() then
        confirm_completion()
    elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
    else
        fallback()
    end
end


return {
    mapping = {
        ["<C-j>"] = cmp.mapping.select_prev_item(),
        ["<C-k>"] = cmp.mapping.select_next_item(),

        ["<Tab>"] = cmp.mapping({
            -- c = function()
            --     if cmp.visible() then
            --         confirm_completion()
            --     else
            --         cmp.complete()
            --     end
            -- end,
            i = tab_mapping_default,
            s = tab_mapping_default,
        }
        ),

        ["<CR>"] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
    },
}

