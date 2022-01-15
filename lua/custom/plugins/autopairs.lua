local npairs = require("nvim-autopairs")
local ncmp = require("nvim-autopairs.completion.cmp")
local Rule   = require("nvim-autopairs.rule")
local cmp = require("cmp")

npairs.setup()

npairs.add_rules {
  Rule(" ", " ")
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ "()", "[]", "{}" }, pair)
    end),
  Rule("( ", " )")
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match(".%)") ~= nil
      end)
      :use_key(")"),
  Rule("{ ", " }")
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match(".%}") ~= nil
      end)
      :use_key("}"),
  Rule("[ ", " ]")
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match(".%]") ~= nil
      end)
      :use_key("]")
}

cmp.event:on("confirm_done", ncmp.on_confirm_done())

print("hi")
