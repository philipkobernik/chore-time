root.ChoreTime.HousemateView = Backbone.View.extend

  tagName: 'li'

  render: ->
    $(@el).html(JST['housemate'](housemate: @model))
    @

