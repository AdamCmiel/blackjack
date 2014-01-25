class window.AppView extends Backbone.View

  template: _.template '
    <div class="scoreboard">
      <label class ="wins-label">Wins</label><p class="winCount"><%= wins %></p>
      <label class ="losses-label">Losses</label><p class="lossCount"><%= losses %></p>
    </div>
    <button class="hit-button container">Hit</button> 
    <button class="stand-button container">Stand</button>
    <button class="reset-button container" style="display: none"></button>
    <div class="player-hand-container container"></div>
    <div class="dealer-hand-container container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click .reset-button": -> 
      @model.initialize()
      @render()

  initialize: -> 
    @render()
    @model.on 'lose', =>
      $('.reset-button').html('You lost.  Play Again!').fadeIn()
      $('.covered').removeClass('covered')
    @model.on 'win', =>
      $('.reset-button').html('You won!   Play Again!').fadeIn()
      $('.covered').removeClass('covered')
    @model.on 'push', =>
      $('.reset-button').html('Push.  Play Again!').fadeIn()
      $('.covered').removeClass('covered')

  render: ->
    @$el.children().detach()
    @$el.html @template(@model.attributes)
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el