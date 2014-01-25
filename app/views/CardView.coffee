class window.CardView extends Backbone.View

  className: 'card'

  template: _.template '
  <div class="innerCard">
  <div class="back face">
  </div>
  <div class="front face">
      <img src="img/cards/<%= rankName %>-<%= suitName %>.png" alt="<%= rankName %>-<%= suitName %>"/>
  </div>
  </div>'


  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
