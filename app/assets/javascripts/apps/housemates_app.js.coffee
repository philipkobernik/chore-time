root.ChoreTime.InitialSetupApp =

  init: (options) ->
    @housemates = new ChoreTime.Housemates()
    @housemates.reset(options['housemates'])

    @chores = new ChoreTime.Chores()
    @chores.reset(options['chores'])

    housematesView = new ChoreTime.HousematesView collection: @housemates
    housematesView.setElement $('#housemates')
    housematesView.render()

    console.log ChoreTime

    choresView = new ChoreTime.ChoresView collection: @chores
    choresView.setElement $('#chores')
    choresView.render()
