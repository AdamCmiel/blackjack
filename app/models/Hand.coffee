class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: -> 

    @add(@deck.pop())
    if @busted() 
      @trigger 'bust'
    @last()

  score: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    scores = if hasAce then [score, score + 10] else [score]
    debugger
    if scores[1] <= 21 then scores[1] else scores[0]

  busted: ->
    @score() > 21
  stand: ->
    @trigger 'stand'
