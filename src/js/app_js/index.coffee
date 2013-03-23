Account = require("./models/account")
AppView = require("./views/app")

exports.run = ->
  account = new Account
  view = new AppView(model: account)
  view.renderTo $("#app-wrapper")
