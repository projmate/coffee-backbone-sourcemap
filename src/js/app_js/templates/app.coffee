module.exports = (t, data) ->
  t.div ->
    t.p ->
      t.input id:"input-deposit"
      t.button id:"action-deposit", "deposit"
    t.p ->
      t.input id:"input-withdraw"
      t.button id:"action-withdraw", "withdraw"
    t.p ->
      t.span "Balance: "
      t.span id:"label-balance", data.balance
