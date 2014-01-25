describe 'AppView', ->
  
  app = null
  appView = null
  initSpyOn = null
  renderSpy = null

  # beforeEach ->
  #   initSpyOn = spyOn(App.prototype, 'initialize').andCallThrough()
  #   renderSpy = spyOn(AppView.prototype, 'render').andCallThrough()
  #   app = new App()
  #   appView = new AppView
  #     model: app
  
  describe 're-render', ->

    beforeEach ->
      initSpyOn = spyOn(App.prototype, 'initialize').andCallThrough()
      renderSpy = spyOn(AppView.prototype, 'render').andCallThrough()
      app = new App()
      appView = new AppView
        model: app

    it "should re-render when player busts", ->
      app.get('playerHand').trigger 'bust'
      expect(initSpyOn).toHaveBeenCalled()
      expect(renderSpy).toHaveBeenCalled()
    it "should re-render on a push event", ->
      app.trigger('push')
      expect(initSpyOn).toHaveBeenCalled()
      expect(renderSpy).toHaveBeenCalled()
    it "should re-render when a player wins", ->
      app.trigger('win')
      expect(initSpyOn).toHaveBeenCalled()
      expect(renderSpy).toHaveBeenCalled()
  describe 'keep score', ->
    it 'should update the score with a win', ->
      app.playerWins()
      expect(appView.$el.find('.winCount').text()).toEqual('1')
    it 'should update the score with a loss', ->
      app.playerLoses()
      expect(appView.$el.find('.lossCount').text()).toEqual('1')