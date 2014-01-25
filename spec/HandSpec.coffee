describe 'hand', ->
  
  king = null
  queen = null
  ace = null
  two = null
  hand = null

  beforeEach ->

    king =  
      rank: 0
      suit: 0
    queen =  
      rank: 12
      suit: 0
    ace = 
      rank: 1
      suit: 0
    two = 
      rank: 2
      suit: 0

    hand = new Hand []

  describe 'bust', ->
    it "should bust when score is over 21", ->
      hand.add(king)
      expect(hand.busted()).toEqual(false)
      hand.add(queen)
      hand.add(ace)
      expect(hand.busted()).toEqual(false)
      hand.add(two)
      expect(hand.busted()).toEqual(true)
    it "should call busted when hit", ->
      deck = new Deck()
      bustedSpyOn = spyOn(Hand.prototype, "busted").andCallThrough()
      hand2 = new Hand([king, queen, ace], deck)
      hand2.hit()
      expect(bustedSpyOn).toHaveBeenCalled()  
    it "should bust with no aces", ->
      hand.add(king)
      hand.add(king)
      expect(hand.busted()).toEqual(false)
      hand.add(king)
      expect(hand.busted()).toEqual(true)
    it "should have a stand method", ->
      expect(typeof Hand.prototype.stand).toBe('function')


