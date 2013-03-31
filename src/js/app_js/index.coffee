Account = require("./models/account")
AppView = require("./views/app")
{hello} = require("./lib/string")

exports.run = ->
  account = new Account
  view = new AppView(model: account, el: '#app-wrapper')
  view.render()

  console.log hello("worl!")
