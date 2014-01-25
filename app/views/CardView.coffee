class window.CardView extends Backbone.View

  className: 'card'

  template: _.template '
  <div class="innerCard">
  <div class="front face">
  <img src="img/cards/<%= rankName %>-<%= suitName %>.png" alt="<%= rankName %>-<%= suitName %>"/>
  </div>
  <div class="back face">
  </div>
  </div>'


  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.addClass 'revealed' if @model.get 'revealed'
