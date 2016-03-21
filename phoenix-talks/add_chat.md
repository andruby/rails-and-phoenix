## Let's add chat

* [ ] mix phoenix.gen.channel Room rooms
* [ ] remove authentication
* [ ] uncomment channel in `web/channels/user_socket.ex`
* [ ] uncomment import socket in `web/static/js/app.js`
* [ ] rename channel name to `rooms:lobby` in `web/static/js/socket.js`
* [ ] add jquery to `web/templates/layout/app.html.eex`

```html
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
```

* [ ] add messages div and input `web/templates/talk/index.html.eex`

```html
<h2>Discuss</h2>

 <div id="messages" class="well"></div>
 <input id="chat-input" type="text" class="form-control" placeholder="your message"></input>
```

* [ ] add js to send and receive messages to `web/static/js/socket.js`

```javascript
let channel           = socket.channel("rooms:lobby", {})
let chatInput         = $("#chat-input")
let messagesContainer = $("#messages")

chatInput.on("keypress", event => {
  if(event.keyCode === 13){
    channel.push("new_msg", {body: chatInput.val()})
    chatInput.val("")
  }
})

channel.on("new_msg", payload => {
  let new_span = $('<span></span>')
  new_span.text(`[${Date()}] ${payload.body}`)
  messagesContainer.append('<br/>')
  messagesContainer.append(new_span)
})
```

* [ ] add message handling backend to `web/channels/room_channel.ex`

```elixir
def handle_in("new_msg", %{"body" => body}, socket) do
  broadcast! socket, "new_msg", %{body: body}
  {:noreply, socket}
end

def handle_out("new_msg", payload, socket) do
  push socket, "new_msg", payload
  {:noreply, socket}
end
```

* [ ] add support for IE9 by uncommenting transport longpoll in `web/channels/user_socket.ex`
