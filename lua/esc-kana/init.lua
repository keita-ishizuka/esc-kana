local M = {}

local current_im_method = "com.apple.keylayout.ABC"

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function()
    os.execute("im-select " .. current_im_method)
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    local handle = io.popen("im-select")
    if handle ~= nil then
      local result = handle:read("*a")
      current_im_method = result
      handle:close()
      os.execute("im-select com.apple.keylayout.ABC")
    end
  end,
})

return M
