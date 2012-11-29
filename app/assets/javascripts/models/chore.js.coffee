root.ChoreTime.Chore = Backbone.Model.extend
  url: ->
    return "chores/#{@attributes.id}" if @attributes.id
    "chores"

