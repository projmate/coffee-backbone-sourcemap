View = require("../lib/view")

class AppView extends View
  id: "app"
  template: "app"

  constructor: ->
    super
    @model.on 'change:balance', (model, balance) ->
      $("#label-balance").text balance

  onClickDeposit: ->
    amount = $("#input-deposit").val()
    unless isNaN(amount)
      @model.deposit amount
      $("#input-deposit").val("")

  onClickWithdraw: ->
    amount = $("#input-withdraw").val()
    unless isNaN(amount)
      @model.withdraw amount
      amount = $("#input-withdraw").val("")


module.exports = AppView


