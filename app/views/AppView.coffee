class window.AppView extends Backbone.View

  template: _.template '
    <div class="scoreboard">
      <label class ="wins-label">Wins</label><p class="winCount"><%= wins %></p>
      <label class ="losses-label">Losses</label><p class="lossCount"><%= losses %></p>
    </div>
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()

  initialize: -> 
    @render()
    @model.on 'lose', =>
      alert "you lose #{@model.get('losses')}"
      @model.initialize()
      @render()
    @model.on 'win', =>
      alert "won #{@model.get('wins')}"
      @model.initialize()
      @render()
    @model.on 'push', =>
      alert "push"
      @model.initialize()
      @render()

  render: ->
    @$el.children().detach()
    @$el.html @template(@model.attributes)
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el