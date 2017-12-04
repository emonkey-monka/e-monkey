App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    element	=	document.createElement('div')	
    element.className	=	'message'	
    element.innerHTML	=	"<p>#{data.message}</p>"
    document.getElementById('messages').appendChild(element)	#
    # Called when there's incoming data on the websocket for this channel

  post_message: (message)->
    @perform	'post_message',	message:	message	#修
