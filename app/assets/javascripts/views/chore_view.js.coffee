root.ChoreTime.ChoreView = Backbone.View.extend
  tagName: 'li'

  render: ->
    @$el.html(JST['chore'](chore: @model))
    @

