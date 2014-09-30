class Dashing.Temp extends Dashing.Widget

  #@accessor 'updatedAtMessage', ->
  Dashing.Widget.accessor 'updatedAtMessage', ->
    if updatedAt = @get('updatedAt')
      timestamp = new Date(updatedAt * 1000)
      day   = ("0" + timestamp.getDate()).slice(-2)
      month = timestamp.getMonth()+1
      month = ("0" + month).slice(-2)
      year  = timestamp.getFullYear()
      hours = timestamp.getHours()
      minutes = ("0" + timestamp.getMinutes()).slice(-2)
      "#{year}-#{month}-#{day} #{hours}:#{minutes}"

 
  ready: ->
  # This is fired when the widget is done being rendered
 
  onData: (data) ->
  # Handle incoming data
  # You can access the html node of this widget with `@node`
  # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.
