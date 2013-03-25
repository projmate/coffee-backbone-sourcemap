Account = require("./models/account")
AppView = require("./views/app")
{hello} = require("./lib/string")

exports.run = ->
  account = new Account
  view = new AppView(model: account)
  view.renderTo $("#app-wrapper")

  console.log hello("world!")
