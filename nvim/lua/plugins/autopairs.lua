return function()
  require('nvim-autopairs').setup {}
  local npairs = require('nvim-autopairs')
  local Rule = require('nvim-autopairs.rule')
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')

  npairs.add_rule(
    Rule('<', '>')
  )

  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )
end
