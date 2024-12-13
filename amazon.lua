local screengui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))

local frame = Instance.new("Frame", screengui)
frame.Size = UDim2.new(0, 220, 0, 200)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0

local frameCorner = Instance.new("UICorner", frame)
frameCorner.CornerRadius = UDim.new(0, 10)

local background = Instance.new("Frame", frame)
background.Size = UDim2.new(1, 0, 1, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
background.BorderSizePixel = 0

local backgroundCorner = Instance.new("UICorner", background)
backgroundCorner.CornerRadius = UDim.new(0, 10)

local items = {
	{text = "UGC 1", id = 76836880710588},
	{text = "UGC 2", id = 140391580405218},
	{text = "UGC 3", id = 106856017481999}
}

local function createButton(text, itemId, yOffset)
	local button = Instance.new("TextButton", background)
	button.Size = UDim2.new(1, -10, 0, 40)
	button.Position = UDim2.new(0, 5, 0, yOffset)
	button.Text = text
	button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font["LuckiestGuy"]
	button.TextSize = 24

	local buttonCorner = Instance.new("UICorner", button)
	buttonCorner.CornerRadius = UDim.new(0, 10)

	button.MouseButton1Click:Connect(function()
		local player = game.Players.LocalPlayer
		local success, err = pcall(function()
			player:RequestPurchase(itemId)
		end)

		if not success then
			print("Ошибка при покупке: " .. err)
			game.StarterGui:SetCore("SendNotification", {
				Title = "Ошибка",
				Text = "Ошибка при покупке: " .. err,
				Duration = 5
			})
		else
			print("Куплена вещь с ID: " .. itemId)
			game.StarterGui:SetCore("SendNotification", {
				Title = "Успех",
				Text = "Куплена вещь с ID: " .. itemId,
				Duration = 5
			})
		end
	end)
end

for i, item in ipairs(items) do
	createButton(item.text, item.id, (i - 1) * 45 + 10)
end

local footerText = Instance.new("TextLabel", background)
footerText.Size = UDim2.new(1, 0, 0, 30)
footerText.Position = UDim2.new(0, 0, 1, -30)
footerText.Text = "Amazon's Joyful Horizons"
footerText.BackgroundTransparency = 1
footerText.TextColor3 = Color3.fromRGB(255, 255, 255)
footerText.TextSize = 16
footerText.Font = Enum.Font["LuckiestGuy"]
footerText.TextScaled = true