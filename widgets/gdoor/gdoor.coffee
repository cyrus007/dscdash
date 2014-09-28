class Dashing.Gdoor extends Dashing.Widget

  ready: ->
    # This is fired when the widget is done being rendered

  onData: (data) ->
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.
    if (typeof data.logmsg == 'undefined')
      @logView().hide()
    else
      @logView().show()
      @logView().val(new Date().toLocaleTimeString("en-US", {hour12: false}) + '- ' + data.logmsg + '\n' + @logView().val());

  logView: ->
    $(@node).find("#log")
