module.exports = (data) ->
  @div ->
    @p ->
      @input id:"input-deposit"
      @button "data-gf-click":"onClickDeposit", "deposit"
    @p ->
      @input id:"input-withdraw"
      @button "data-gf-click":"onClickWithdraw", "withdraw"
    @p ->
      @span "Balance: "
      @span id:"label-balance", data.balance
