View = require("../lib/view")

class AppView extends View
  id: "app"
  template: "app"

  constructor: ->
    super
    @model.on 'change:balance', (model, balance) ->
      $("#label-balance").text balance

  events:
    "click #action-withdraw": "onWithdraw"
    "click #action-deposit": "onDeposit"

  onDeposit: ->
    amount = $("#input-deposit").val()
    unless isNaN(amount)
      @model.deposit amount
      $("#input-deposit").val("")

  onWithdraw: ->
    amount = $("#input-withdraw").val()
    unless isNaN(amount)
      @model.withdraw amount
      amount = $("#input-withdraw").val("")


module.exports = AppView


