<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chatbot</title>
    <script>
    function sendMessage() {
        var message = document.getElementById('message').value;
        fetch('/chatbot/message', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(message)
        })
        .then(response => response.text())
        .then(data => document.getElementById('response').innerText = data)
        .catch(error => console.error('Error:', error));
    }
    </script>
</head>
<body>
    <h1>Chat with the Bot</h1>
    <input type="text" id="message" placeholder="Type your message here"/>
    <button onclick="sendMessage()">Send</button>
    <div id="response"></div>
</body>
</html>