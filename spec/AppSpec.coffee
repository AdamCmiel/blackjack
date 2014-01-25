describe 'App', ->
  
  app = null
  king = null
  playerWinSpy = null
  playerLosesSpy = null
  dealer = null
  player = null

  beforeEach ->
    app = new App()
    king =  
      rank: 0
      suit: 0
  
  describe 'player', ->
    it "should have method bust and stand", ->
      expect(typeof App.prototype.playerWins).toBe('function')
      expect(typeof App.prototype.playerLoses).toBe('function')
  describe 'game', ->
    it "should win if dealer busts", ->
      playerWinsSpy = spyOn(App.prototype, 'playerWins').andCallThrough()
      app = new App()
      app.get('dealerHand').hit() for num in [1..100]
      expect(playerWinsSpy).toHaveBeenCalled()
    it "should lose if player busts", ->
      playerLosesSpy = spyOn(App.prototype, 'playerLoses').andCallThrough()
      app = new App()
      app.get('playerHand').hit() for num in [1..100]
      expect(playerLosesSpy).toHaveBeenCalled()
    it "should persist the wins and losses when the app in reinitialized", ->
      expect(app.get('wins')).toEqual(0)
      app.set 'wins', 16
      expect(app.get('wins')).toEqual(16)
      app.initialize()
      expect(app.get('wins')).toEqual(16)
