#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'bust', @playerLoses, @
    @get('dealerHand').on 'bust', @playerWins, @
    @get('playerHand').on 'stand', @dealerPlays, @
    @get('dealerHand').on 'stand', @whoWon, @
    if @get('wins') is undefined then @set 'wins', 0
    if @get('losses') is undefined then @set 'losses', 0

  playerWins: -> #player loses,
    @set 'wins', @get('wins')+1
    @trigger 'win'
  playerLoses: ->
    @set 'losses', @get('losses')+1
    @trigger 'lose'
  dealerPlays: -> 
    playerScore = @get('playerHand').score()
    while @get('dealerHand').score() < 17
      @get('dealerHand').hit()
    if 21 > @get('dealerHand').score() > playerScore
      @playerLoses()
    else if @get('dealerHand').score() is playerScore
      @push()
    else 
      @playerWins()
  push: ->
    @trigger 'push'

