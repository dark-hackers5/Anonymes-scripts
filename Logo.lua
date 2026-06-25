local gui = Instance.new("ScreenGui")
gui.Name = "LogoGui"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 50, 0, 50)
frame.Position = UDim2.new(0.9, 0, 0.1, 0)
frame.BackgroundTransparency = 0.5
frame.BackgroundColor3 = Color3.new(1, 0, 0)
frame.Parent = gui

local image = Instance.new("ImageLabel")
image.Size = UDim2.new(1, 0, 1, 0)
image.BackgroundTransparency = 1
image.Image = "rbxassetid://88742532715379"
image.Parent = frame
