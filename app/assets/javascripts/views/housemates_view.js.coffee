root.ChoreTime.HousematesView = Backbone.View.extend

  initialize: ->
    ChoreTime.hmv = @

    @name_field = $('input.name')
    @phone_field = $('input.phone')

    housemates = @collection

    housemates.on('add', @render, @)

  events:
    'click .save': 'onSubmit'

  render: ->
    console.log "rendering..."
    list = $('ul', @el)
    list.empty()

    for model in @collection.models
      housemateView = new ChoreTime.HousemateView(model: model)
      list.append(housemateView.render().el)

    this

  onSubmit: (event) ->
    @updateMessage()

    event.preventDefault()
    housemate = new ChoreTime.Housemate
      name: @name_field.val()
      phone: @phone_field.val()

    @collection.add(housemate)

    @name_field.val('')
    @phone_field.val('')

  updateMessage: ->
    @$('#message').html("name is #{@name_field.val()}, number is #{@phone_field.val()}")

