root.ChoreTime.ChoresView = Backbone.View.extend
  initialize: ->
    @collection.on('add', @render, this)

    @name_field = $('input.name')
    @description_field = $('input.description')

  events:
    'click .save': 'onSubmit'

  render: ->
    list = $('ul', @el)
    list.empty()

    for model in @collection.models
      choreView = new ChoreTime.ChoreView(model: model)
      list.append(choreView.render().el)

    this

  onSubmit: (event) ->
    event.preventDefault()

    chore = new ChoreTime.Chore({name: @name_field.val(), description: @description_field.val()})
    console.log(@name_field.val())
    @collection.add(chore)

    @clearFormFields()

  clearFormFields: ->
    @name_field.val('')
    @description_field.val('')

