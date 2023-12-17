if vim.fn.executable "autocomp" == 1 then
  vim.api.nvim_create_autocmd("VimLeave", {
    desc = "Stop running auto compiler on leave",
    group = vim.api.nvim_create_augroup("quit_autocomp", { clear = true }),
    pattern = "*",
    callback = function() vim.fn.jobstart { "autocomp", vim.fn.expand "%:p", "stop" } end,
  })
end

if vim.env.KITTY_LISTEN_ON then
  local cmd = require("astronvim.utils").cmd

  for _, color in ipairs(vim.fn.split(cmd { "kitty", "@", "get-colors" } or "", "\n")) do
    local orig_bg = color:match "^background%s+(#[0-9a-fA-F]+)$"
    if orig_bg then
      local function set_bg(new_color) cmd { "kitty", "@", "set-colors", ("background=%s"):format(new_color) } end

      local augroup = vim.api.nvim_create_augroup("kitty_background", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        desc = "set kitty background to colorscheme's background",
        pattern = "AstroColorScheme",
        group = augroup,
        callback = function()
          local bg_color = require("astronvim.utils").get_hlgroup("Normal").bg
          if not bg_color or bg_color == "NONE" then
            bg_color = orig_bg
          elseif type(bg_color) == "number" then
            bg_color = string.format("#%06x", bg_color)
          end

          set_bg(bg_color)
        end,
      })

      vim.api.nvim_create_autocmd("VimLeave", {
        desc = "set kitty background back to original background",
        group = augroup, -- add autocmd to augroup
        callback = function() set_bg(orig_bg) end,
      })
      break
    end
  end
end
