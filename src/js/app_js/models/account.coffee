Model = require("../lib/model")

class Account extends Model
  defaults:
    balance: 0

  constructor: ->
    super

  withdraw: (amount) ->
    balance = parseFloat(@get('balance'))
    @set balance: balance - parseFloat(amount)

  deposit: (amount) ->
    balance = parseFloat(@get('balance'))
    @set balance: balance + parseFloat(amount)

module.exports = Account

