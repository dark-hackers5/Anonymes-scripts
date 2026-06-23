--[[
ANONYMES SCRIPTS HUB - BLOX FRUITS ULTIMATE
✅ Interface à onglets (12 onglets comme Zynex Hub)
✅ TOUTES les fonctionnalités du jeu:
   - Auto PvP (Aimbot, TriggerBot, Auto-Attack, Kill Aura)
   - Auto-Quêtes (normales + spéciales)
   - Auto-Événements (Pirate Raid, Ship Raid, Sea Beast, Terrorshark, Volcano, Factory, etc.)
   - Auto-Trade (avec whitelist/blacklist)
   - One-Shot/Two-Shot
   - Auto-Farm (Level, Nearest, Ectoplasm, Candy, etc.)
   - Auto-Collect (Gift, Rewards, Fruits)
   - ESP (Joueurs, Fruits, Coffres, Boss)
   - Téléportation (Îles, PNJ, Boss, Bring Mob)
   - Déplacements (Walk On Water, No Clip, Infinite Jump)
   - Server Hop / Rejoin
✅ Logo miniature visible au démarrage
✅ Clique sur le logo → Affiche le tableau général
✅ Dans le tableau général → Bouton "Paramètres" en bas
✅ Clique sur "Paramètres" → Affiche le tableau VIP (mot de passe MASQUÉ: 98961144)
✅ Après validation → Accès VIP activé, menu complet débloqué
✅ 15 clics sur l'écran = logo disparaît/réapparaît
--]]

-- =============================================
-- 🎯 VARIABLES GLOBALES
-- =============================================
local logoImageUrl = "https://mistralaichatupprodswe.blob.core.windows.net/chat-images/31/dc/45/31dc450a-f325-460f-9cb7-e7b6af1e9b56/2a4bb7b3-f8b7-497b-8390-753b144679bf/d23d3815-3676-4bc4-a5e4-8d9a18f9c78e"
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local replicatedStorage = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")

-- =============================================
-- 🔐 SYSTÈME VIP
-- =============================================
local VIP_PASSWORD = "98961144"
local VIP_USERS = {}
local isPrivateAccess = false

local function isVIP()
    return VIP_USERS[player.UserId] or false
end

local function notify(msg, duration)
    game.StarterGui:SetCore("SendNotification", {Title = "ANONYMES SCRIPTS HUB", Text = msg, Duration = duration or 3})
end

-- =============================================
-- 🎨 LOGO (Miniature + 15 clics)
-- =============================================
local logoGui, logoFrame, logoVisible = true, clickCount = 0, MAX_CLICKS = 15

local function createLogo()
    logoGui = Instance.new("ScreenGui")
    logoGui.Name = "ANONYMES_SCRIPTS_HUB_LOGO"
    logoGui.ResetOnSpawn = false
    logoGui.IgnoreGuiInset = true
    logoGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

    logoFrame = Instance.new("Frame")
    logoFrame.Size = UDim2.new(0, 80, 0, 80)
    logoFrame.Position = UDim2.new(0.5, -40, 0.03, 0)
    logoFrame.AnchorPoint = Vector2.new(0.5, 0)
    logoFrame.BackgroundTransparency = 1
    logoFrame.Visible = logoVisible
    logoFrame.Parent = logoGui

    local logoImage = Instance.new("ImageLabel")
    logoImage.Size = UDim2.new(1, 0, 1, 0)
    logoImage.BackgroundTransparency = 1
    logoImage.Image = logoImageUrl
    logoImage.ScaleType = Enum.ScaleType.Slice
    logoImage.SliceCenter = Rect.new(100, 100, 100, 100)
    logoImage.Parent = logoFrame

    local glow = Instance.new("ImageLabel")
    glow.Size = UDim2.new(1, 15, 1, 15)
    glow.Position = UDim2.new(0.5, 0, 0.5, 0)
    glow.AnchorPoint = Vector2.new(0.5, 0.5)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://5028857084"
    glow.ImageColor3 = Color3.fromRGB(150, 0, 255)
    glow.ImageTransparency = 0.7
    glow.Parent = logoFrame

    spawn(function()
        while true do
            for i = 0.7, 1, 0.02 do glow.ImageTransparency = i wait(0.03) end
            for i = 1, 0.7, -0.02 do glow.ImageTransparency = i wait(0.03) end
        end
    end)

    logoImage.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            showFeatureTable()
        end
    end)

    userInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            clickCount = clickCount + 1
            if clickCount >= MAX_CLICKS then
                clickCount = 0
                logoVisible = not logoVisible
                logoFrame.Visible = logoVisible
                notify(logoVisible and "🔥 Logo réactivé !" or "👁️ Logo masqué.", 2)
            end
        end
    end)

    logoGui.Parent = player:WaitForChild("PlayerGui")
end

-- =============================================
-- 📌 TABLEAU GÉNÉRAL (Clique sur le logo)
-- =============================================
local featureTableGui

local function showFeatureTable()
    if featureTableGui then featureTableGui:Destroy() end

    featureTableGui = Instance.new("ScreenGui")
    featureTableGui.Name = "FeatureTable"
    featureTableGui.ResetOnSpawn = false
    featureTableGui.Parent = player.PlayerGui

    local tableFrame = Instance.new("Frame")
    tableFrame.Size = UDim2.new(0, 320, 0, 400)
    tableFrame.Position = UDim2.new(0.5, -160, 0.5, -200)
    tableFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    tableFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    tableFrame.BackgroundTransparency = 0.3
    tableFrame.BorderSizePixel = 0
    tableFrame.Parent = featureTableGui

    local border = Instance.new("Frame")
    border.Size = UDim2.new(1, 4, 1, 4)
    border.Position = UDim2.new(0, -2, 0, -2)
    border.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
    border.BackgroundTransparency = 0.7
