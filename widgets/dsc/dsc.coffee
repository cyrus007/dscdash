class Dashing.Dsc extends Dashing.Widget

  ready: ->
    # This is fired when the widget is done being rendered
    @msgs = [];

  onData: (data) ->
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.
    #if data.dsc_status
    #  $(@node).find('.status').fadeOut().fadeIn()
