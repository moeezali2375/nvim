return {
    'terrortylor/nvim-comment',
    config = function()
        require('nvim_comment').setup({
            -- Disable comment on empty lines
            comment_empty = false,

            -- Hook to change comment style based on file type
            hook = function()
                local ft = vim.bo.filetype
                if ft == "cpp" or ft == "c" then
                    -- Set C++ and C comment style to // for single line comments
                    vim.bo.commentstring = "// %s"
                end
            end
        })
    end
}
