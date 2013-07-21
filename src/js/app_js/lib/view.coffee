class View extends Giraffe.View

  # Use funcd precompiled Coffee templates.
  templateStrategy: ->
    # View#template is name of template relative to templates/
    result = Funcd.render require("app/templates/#{@template}"), @serialize()
    console.log "RESULT"
    result

  serialize: ->
    if @collection
      @collection.toJSON()
    else if @model
      @model.toJSON()
    else
      @

module.exports = View

