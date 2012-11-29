root.ChoreTime.Housemate = Backbone.Model.extend
  name: ->
    "#{@attributes.name}"
  url: ->
    return "housemates/#{@attributes.id}" if @attributes.id
    "housemates"
