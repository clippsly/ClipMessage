local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local serverEvent = ReplicatedStorage:WaitForChild("ServerEvent")
local TextService = game:GetService("TextService")
local HttpService = game:GetService("HttpService")
local badWordsUrl = "https://clippsly.com/sys/bwords.json"
local badWords = {}

-- Load bad words from the URL
local function loadBadWords()
	local response = HttpService:GetAsync(badWordsUrl)
	local data = HttpService:JSONDecode(response)
	if data and data["RECORDS"] then
		for _, word in ipairs(data["RECORDS"]) do
			badWords[word] = true
		end
	end
end

-- Check if a message contains bad words
local function containsBadWords(message)
	for word in message:gmatch("%S+") do
		if badWords[word] then
			return true
		end
	end
	return false
end

-- Function to moderate a message if it contains bad words
local function moderateMessage(message)
	local moderatedMessage = message
	for word in message:gmatch("%S+") do
		if badWords[word] then
			moderatedMessage = moderatedMessage:gsub(word, "This message have been moderated because it contained inappropriate language.")
		end
	end
	return moderatedMessage
end

-- Load bad words on server start
loadBadWords()

-- Function to handle receiving messages from clients and broadcasting them to all other clients
local function onMessageReceived(sender, message)
	print("cMessage: New message: "..sender.Name, message)
	local moderatedMessage = message
	if containsBadWords(message) then
		moderatedMessage = moderateMessage(message)
	end
	for _, otherPlayer in pairs(Players:GetPlayers()) do
		if otherPlayer ~= sender then
			serverEvent:FireClient(otherPlayer, sender.Name, moderatedMessage)
		end
	end
end

-- Connect the onMessageReceived function to the server event
serverEvent.OnServerEvent:Connect(onMessageReceived)
