-- =============================================
-- TEST - Logo uniquement
-- =============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TestLogo"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local Logo = Instance.new("ImageButton")
Logo.Parent = ScreenGui
Logo.Size = UDim2.new(0,70,0,70)
Logo.Position = UDim2.new(0.05,0,0.45,0)
Logo.BackgroundColor3 = Color3.fromRGB(20,20,30)
Logo.Image = "rbxassetid://73393542095412"

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(1,0)
Corner.Parent = Logo

local Stroke = Instance.new("UIStroke")
Stroke.Parent = Logo
Stroke.Color = Color3.fromRGB(170,0,255)
Stroke.Thickness = 3

-- Texte de secours si l'image charge pas
local Fallback = Instance.new("TextLabel")
Fallback.Parent = Logo
Fallback.Size = UDim2.new(1,0,1,0)
Fallback.BackgroundTransparency = 1
Fallback.Text = "AS"
Fallback.TextColor3 = Color3.fromRGB(255,255,255)
Fallback.TextSize = 24
Fallback.Font = Enum.Font.GothamBold
Fallback.Visible = false

-- Vérification après 2 secondes
task.wait(2)
if Logo.ImageContentId == "" or Logo.ImageContentId == "rbxassetid://0" then
    Fallback.Visible = true
    Logo.Image = ""
end

print("Test logo terminé - regarde en haut à gauche de l'écran")
