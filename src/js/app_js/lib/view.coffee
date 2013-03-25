Funcd = require('./funcd')

class View extends Backbone.View

  renderTemplate: (path, args...) ->
    template = require(path)
    Funcd.render(template, args...)

  serialize: ->
    if @collection
      @collection.toJSON()
    else if @model
      @model.toJSON()

  render: ->
    if @template
      @$el.empty().html @renderTemplate(@template, @serialize())
    @

  renderTo: ($element) ->
    $element.empty()
    $element.append @$el
    @render()


module.exports = View

