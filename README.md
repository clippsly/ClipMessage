# Clippsly cMessage
Clippsly cMessage is a messaging system designed for use in Roblox games. It allows players to send and receive messages to/from other players within the game environment. The system comes with a user-friendly interface that integrates seamlessly with any Roblox game.

## Features
- Customizable chat log
- Message moderation
- Notification sounds and visual notifications
- Bad word filter
- How It Works

Clippsly cMessage consists of two scripts: a client-side script and a server-side script. The client-side script handles the user interface and sends messages to the server. The server-side script receives messages from clients, moderates them if necessary, and broadcasts them to all other clients.

## Client-Side Script
The client-side script defines the GUI elements, such as the chat log and message box, and connects them to the server event. It also contains functions for adding messages to the chat log and handling message sending. Additionally, the script plays notification sounds and displays visual notifications when new messages arrive.

## Server-Side Script
The server-side script loads a list of bad words from a URL, checks messages for bad words, and moderates messages if necessary. It also handles receiving messages from clients and broadcasting them to all other clients.

## Installation
To use Clippsly cMessage in your Roblox game, simply copy the client-side and server-side scripts into your game's workspace and ReplicatedStorage folders, respectively.

## Usage
Clippsly cMessage is easy to use. Simply open the messaging window, type your message, and press enter. Your message will be sent to all other players in the game. The chat log displays all messages that have been sent and received.

## Customization
Clippsly cMessage is highly customizable. You can change the appearance of the chat log, modify the bad words list, and adjust notification sounds and visual notifications to your liking.

## License
Clippsly cMessage is released under the MIT License. See the LICENSE file for more information.
