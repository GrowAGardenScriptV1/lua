-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Create UI
local gui = Instance.new("ScreenGui")
gui.Name = "FakeFruitStealUI"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 300, 0, 250)
main.Position = UDim2.new(0.5, -150, 0.5, -125)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 0
main.Parent = gui

-- Title
local title = Instance.new("TextLabel")
title.Text = "Fruit Steal v1.0"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = main

-- Search Box (just visual)
local input = Instance.new("TextBox")
input.PlaceholderText = "s"
input.Size = UDim2.new(1, -20, 0, 30)
input.Position = UDim2.new(0, 10, 0, 40)
input.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
input.TextColor3 = Color3.new(1,1,1)
input.Font = Enum.Font.Gotham
input.TextSize = 16
input.ClearTextOnFocus = false
input.Text = ""
input.Parent = main

-- Selected Player Display Frame
local infoFrame = Instance.new("Frame")
infoFrame.Size = UDim2.new(1, -20, 0, 70)
infoFrame.Position = UDim2.new(0, 10, 0, 80)
infoFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
infoFrame.BorderSizePixel = 0
infoFrame.Parent = main

-- Avatar Image
local avatar = Instance.new("ImageLabel")
avatar.Size = UDim2.new(0, 50, 0, 50)
avatar.Position = UDim2.new(0, 10, 0.5, -25)
avatar.BackgroundTransparency = 1
avatar.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
avatar.Parent = infoFrame

-- Username Label
local nameLabel = Instance.new("TextLabel")
nameLabel.Text = "Select a player"
nameLabel.Position = UDim2.new(0, 70, 0, 5)
nameLabel.Size = UDim2.new(1, -80, 0, 25)
nameLabel.BackgroundTransparency = 1
nameLabel.TextColor3 = Color3.new(1,1,1)
nameLabel.Font = Enum.Font.GothamBold
nameLabel.TextSize = 16
nameLabel.TextXAlignment = Enum.TextXAlignment.Left
nameLabel.Parent = infoFrame

-- ID Label
local idLabel = Instance.new("TextLabel")
idLabel.Text = "ID: -----------"
idLabel.Position = UDim2.new(0, 70, 0, 35)
idLabel.Size = UDim2.new(1, -80, 0, 20)
idLabel.BackgroundTransparency = 1
idLabel.TextColor3 = Color3.new(0.8,0.8,0.8)
idLabel.Font = Enum.Font.Gotham
idLabel.TextSize = 14
idLabel.TextXAlignment = Enum.TextXAlignment.Left
idLabel.Parent = infoFrame

-- Buttons
local stealBtn = Instance.new("TextButton")
stealBtn.Text = "Select"
stealBtn.Size = UDim2.new(0.45, -5, 0, 35)
stealBtn.Position = UDim2.new(0.05, 0, 1, -45)
stealBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
stealBtn.TextColor3 = Color3.new(1, 1, 1)
stealBtn.Font = Enum.Font.Gotham
stealBtn.TextSize = 16
stealBtn.Parent = main

local bypassBtn = stealBtn:Clone()
bypassBtn.Text = "Close"
bypassBtn.Position = UDim2.new(0.5, 5, 1, -45)
bypassBtn.Parent = main

-- Made by label
local byLabel = Instance.new("TextLabel")
byLabel.Text = "Made by @Zysume Hub"
byLabel.Size = UDim2.new(1, 0, 0, 20)
byLabel.Position = UDim2.new(0, 0, 1, -20)
byLabel.BackgroundTransparency = 1
byLabel.TextColor3 = Color3.new(1,1,1)
byLabel.Font = Enum.Font.Gotham
byLabel.TextSize = 12
byLabel.TextTransparency = 0.5
byLabel.Parent = main

-- Player Select Logic
local selectedPlayer = nil

stealBtn.MouseButton1Click:Connect(function()
	if selectedPlayer then
		print("You selected:", selectedPlayer.Name)
	end
end)

bypassBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- OPTIONAL: Show first player when typing
input:GetPropertyChangedSignal("Text"):Connect(function()
	local text = input.Text:lower()
	for _, p in pairs(Players:GetPlayers()) do
		if p.Name:lower():find(text) then
			selectedPlayer = p
			nameLabel.Text = p.Name
			idLabel.Text = "ID: " .. tostring(p.UserId)
			avatar.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..p.UserId.."&width=150&height=150&format=png"
			break
		end
	end
end)
