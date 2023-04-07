-- Define the GUI elements
local window = script.Parent.Parent.WindowManager.MessageWindow
local chatLog = window.ChatLog
local messageBox = window.MesgBar
local msgFrame = game.ReplicatedStorage.MsgFrame
local notif = script.Parent.Parent.DockShelf.Dock.BMessages.Notif
local notifSound = script.Parent.Parent.Background.Notif

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Define the server event
local serverEvent = game.ReplicatedStorage:WaitForChild("ServerEvent")

-- Function to add a message to the chat log
local function addMessageToChatLog(senderName, message)
	-- Copy the message frame and set its parent to the chat log
	local newMsgFrame = msgFrame:Clone()
	newMsgFrame.Parent = chatLog

	-- Set the message text and sender username
	local sndr = newMsgFrame.Sndr
	sndr.Value = senderName
	local msgText = newMsgFrame.MsgText
	msgText.Text = message
	local userName = newMsgFrame.UsrName
	userName.Text = senderName
	local role = newMsgFrame.Role
	local roleclr = newMsgFrame.RoleColor
	if senderName == "SzywkoGames" then
		role.Visible = true
		roleclr.Enabled = true
	end

	print("cMessage: Message successfully sent.")

	-- Notify the player of the new message
	if LocalPlayer.Name ~= senderName then
		notif.Visible = true
		notifSound:Play()
	end
end

-- Function to handle sending messages
local function sendMessage()
	local message = messageBox.Text
	if message ~= "" then
		chatLog.CanvasPosition = Vector2.new(0,9999)
		serverEvent:FireServer(message, LocalPlayer.Name)
		messageBox.Text = ""
		addMessageToChatLog(LocalPlayer.Name, message)
	end
end

-- Connect the message box to the sendMessage function
messageBox.FocusLost:Connect(sendMessage)

-- Connect the server event to adding messages to the chat log
serverEvent.OnClientEvent:Connect(function(senderName, message)
	addMessageToChatLog(senderName, message)
end)
