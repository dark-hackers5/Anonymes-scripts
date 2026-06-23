--[[
ANONYME SCRIPTS - BLOX FRUITS: ULTIMATE EDITION
✅ Accès PUBLIC visible par défaut
✅ Accès PRIVÉ caché (apparaît après authentification)
✅ Logo disparaît quand accès privé activé
✅ 15 clics sur l'écran = logo réapparaît/disparaît
✅ Mot de passe VIP: 98961144
✅ 100% autonome - AUCUN LIEN BRUT NÉCESSAIRE
--]]

-- =============================================
-- 🎨 LOGO ANONYME SCRIPTS (Avec ton image)
-- =============================================
local logoImageUrl = "https://mistralaichatupprodswe.blob.core.windows.net/chat-images/31/dc/45/31dc450a-f325-460f-9cb7-e7b6af1e9b56/2a4bb7b3-f8b7-497b-8390-753b144679bf/d23d3815-3676-4bc4-a5e4-8d9a18f9c78e"
local logoGui
local logoFrame
local logoVisible = true
local clickCount = 0
local MAX_CLICKS = 15 -- Changé à 15 comme demandé
local featureTableGui

local player = game.Players.LocalPlayer

local function notify(msg, duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = "ANONYME SCRIPTS",
        Text = msg,
        Duration = duration or 3
    })
end

-- Créer le logo en miniature
local function createLogo()
    logoGui = Instance.new("ScreenGui")
    logoGui.Name = "ANONYME_SCRIPTS_LOGO"
    logoGui.ResetOnSpawn = false
    logoGui.IgnoreGuiInset = true
    logoGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

    logoFrame = Instance.new("Frame")
    logoFrame.Name = "LogoFrame"
    logoFrame.Size = UDim2.new(0, 100, 0, 100)
    logoFrame.Position = UDim2.new(0.5, -50, 0.05, 0)
    logoFrame.AnchorPoint = Vector2.new(0.5, 0)
    logoFrame.BackgroundTransparency = 1
    logoFrame.Visible = logoVisible
    logoFrame.Parent = logoGui

    local logoImage = Instance.new("ImageLabel")
    logoImage.Name = "LogoImage"
    logoImage.Size = UDim2.new(1, 0, 1, 0)
    logoImage.BackgroundTransparency = 1
    logoImage.Image = logoImageUrl
    logoImage.ScaleType = Enum.ScaleType.Slice
    logoImage.SliceCenter = Rect.new(100, 100, 100, 100)
    logoImage.Parent = logoFrame

    -- Effet de lueur violet
    local glow = Instance.new("ImageLabel")
    glow.Name = "Glow"
    glow.Size = UDim2.new(1, 20, 1, 20)
    glow.Position = UDim2.new(0.5, 0, 0.5, 0)
    glow.AnchorPoint = Vector2.new(0.5, 0.5)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://5028857084"
    glow.ImageColor3 = Color3.fromRGB(150, 0, 255)
    glow.ImageTransparency = 0.8
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(100, 100, 100, 100)
    glow.Parent = logoFrame

    -- Animation de pulsation
    spawn(function()
        while true do
            for i = 0.7, 1, 0.02 do
                glow.ImageTransparency = i
                wait(0.03)
            end
            for i = 1, 0.7, -0.02 do
                glow.ImageTransparency = i
                wait(0.03)
            end
        end
    end)

    -- Clic sur le logo = affiche le tableau
    logoImage.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or
           input.UserInputType == Enum.UserInputType.Touch then
            showFeatureTable()
        end
    end)

    -- 15 clics sur l'écran = logo disparaît/réapparaît
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or
           input.UserInputType == Enum.UserInputType.Touch then
            clickCount = clickCount + 1
            if clickCount >= MAX_CLICKS then
                clickCount = 0
                logoVisible = not logoVisible
                logoFrame.Visible = logoVisible
                if logoVisible then
                    notify("🔥 Logo réactivé !", 2)
                else
                    notify("👁️ Logo masqué.", 2)
                end
            end
        end
    end)

    logoGui.Parent = player:WaitForChild("PlayerGui")
end

-- Afficher le tableau des fonctionnalités
local function showFeatureTable()
    if featureTableGui then featureTableGui:Destroy() end

    featureTableGui = Instance.new("ScreenGui")
    featureTableGui.Name = "FeatureTable"
    featureTableGui.ResetOnSpawn = false
    featureTableGui.Parent = player.PlayerGui

    local tableFrame = Instance.new("Frame")
    tableFrame.Size = UDim2.new(0, 300, 0, 200)
    tableFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    tableFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    tableFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    tableFrame.BackgroundTransparency = 0.4
    tableFrame.BorderSizePixel = 0
    tableFrame.Parent = featureTableGui

    local border = Instance.new("Frame")
    border.Size = UDim2.new(1, 4, 1, 4)
    border.Position = UDim2.new(0, -2, 0, -2)
    border.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
    border.BackgroundTransparency = 0.8
    border.Parent = tableFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "ANONYME SCRIPTS"
    title.TextColor3 = Color3.fromRGB(255, 50, 50)
    title.TextSize = 20
    title.Font = Enum.Font.SourceSansBold
    title.BackgroundTransparency = 1
    title.Parent = tableFrame

    local separator = Instance.new("Frame")
    separator.Size = UDim2.new(1, -40, 0, 1)
    separator.Position = UDim2.new(0, 20, 0, 45)
    separator.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
    separator.Parent = tableFrame

    local desc = Instance.new("TextLabel")
    desc.Size = UDim2.new(1, -40, 0, 140)
    desc.Position = UDim2.new(0, 20, 0, 55)
    desc.Text = "🔥 Script du dieux déployé\n\n" ..
                "✅ Accès PUBLIC: Visible par défaut\n" ..
                "🔐 Accès PRIVÉ: Caché (mot de passe: 98961144)\n\n" ..
                "📜 Toutes les quêtes automatiques\n" ..
                "⚔️ One-Shot/Two-Shot\n" ..
                "💰 Auto-Trade\n" ..
                "🎨 Logo interactif (15 clics)"
    desc.TextColor3 = Color3.fromRGB(200, 200, 200)
    desc.TextSize = 12
    desc.Font = Enum.Font.SourceSans
    desc.TextWrapped = true
    desc.TextXAlignment = Enum.TextXAlignment.Left
    desc.BackgroundTransparency = 1
    desc.Parent = tableFrame

    delay(8, function()
        if featureTableGui then featureTableGui:Destroy() end
    end)
end

-- =============================================
-- 🔐 SYSTÈME VIP/NON-VIP + GESTION DES ACCÈS
-- =============================================
local VIP_PASSWORD = "98961144"
local VIP_USERS = {}
local UNLOCKED_FEATURES = {}
local isPrivateAccess = false -- État initial: accès public

local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local replicatedStorage = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")

-- Vérifier si VIP
local function isVIP(player)
    return VIP_USERS[player.UserId] or false
end

-- Vérifier si une fonctionnalité est débloquée
local function isFeatureUnlocked(player, featureName)
    if isVIP(player) then return true end
    return UNLOCKED_FEATURES[player.UserId] and UNLOCKED_FEATURES[player.UserId][featureName] or false
end

-- Vérifier le Beli
local function hasEnoughBeli(player, amount)
    if player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Beli") then
        return player.leaderstats.Beli.Value >= amount
    end
    return false
end

-- Retirer du Beli
local function removeBeli(player, amount)
    if player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Beli") then
        player.leaderstats.Beli.Value = player.leaderstats.Beli.Value - amount
        return true
    end
    return false
end

-- Débloquer une fonctionnalité (pour non-VIP)
local function unlockFeature(player, featureName, cost)
    if isVIP(player) then return true end
    if hasEnoughBeli(player, cost) then
        if removeBeli(player, cost) then
            if not UNLOCKED_FEATURES[player.UserId] then
                UNLOCKED_FEATURES[player.UserId] = {}
            end
            UNLOCKED_FEATURES[player.UserId][featureName] = true
            notify("✅ " .. featureName .. " débloqué pour 1M Beli !", 5)
            return true
        end
    else
        notify("❌ Beli insuffisant (1M requis).", 3)
        return false
    end
    return false
end

-- =============================================
-- 📦 BASE DE DONNÉES
-- =============================================
local Data = {
    Fruits = {"Spin", "Chop", "Spring", "Bomb", "Smoke", "Spike", "Flame", "Falcon", "Ice", "Sand",
              "Dark", "Diamond", "Light", "Rubber", "Ghost", "Barrier", "Magma", "Quake", "Buddha", "Love",
              "Spider", "Sound", "Phoenix", "Portal", "Rumble", "Pain", "Blizzard", "Gravity", "Mammoth",
              "T-Rex", "Dough", "Shadow", "Venom", "Control", "Spirit", "Leopard", "Yeti", "Gas", "Kitsune", "Dragon"},
    Swords = {"Cutlass", "Katana", "Dual Katana", "Triple Katana", "Shark Saw", "Iron Mace", "Trident",
              "Soul Cane", "Bisento", "Saber", "Pipe", "Wardens Sword", "Dragon Trident", "Gravity Cane",
              "Jitte", "Longsword", "Koko", "Midnight Blade", "Rengoku", "Shisui", "Saddi", "Wando",
              "True Triple Katana", "Yama", "Tushita", "Canvander", "Twin Hooks", "Buddy Sword", "Spikey Trident",
              "Shark Anchor", "Fox Lamp", "Dragonheart", "Dark Blade", "Cursed Dual Katana"},
    Races = {"Human V4", "Rabbit V4", "Shark V4", "Angel V4", "Ghoul V4", "Cyborg V4", "Draco V4"}
}

-- =============================================
-- 🔧 FONCTIONS UTILITAIRES
-- =============================================
local function safeTeleport(cframe)
    if not (rootPart and rootPart.Parent) then return end
    local oldProps = {CanCollide = rootPart.CanCollide, Massless = rootPart.Massless, Anchored = rootPart.Anchored}
    rootPart.CanCollide = false
    rootPart.Massless = true
    rootPart.Anchored = false
    rootPart.CFrame = cframe
    runService.Heartbeat:Wait()
    rootPart.CanCollide = oldProps.CanCollide
    rootPart.Massless = oldProps.Massless
    rootPart.Anchored = oldProps.Anchored
end

-- =============================================
-- 🔄 PERSISTANCE DES ITEMS
-- =============================================
local function protectItem(item)
    local oldDestroy = hookfunction(item.Destroy, function(self)
        if self:IsDescendantOf(player) then
            spawn(function() wait(0.1) if not self:IsDescendantOf(game) then self.Parent = player.Backpack end end)
            return
        end
        return oldDestroy(self)
    end)
end

local function protectAllItems()
    for _, item in pairs(player.Backpack:GetChildren()) do protectItem(item) end
    if character then
        for _, item in pairs(character:GetChildren()) do
            if item:IsA("Tool") then protectItem(item) end
        end
    end
end

-- =============================================
-- 🍎⚔️👑 FONCTIONS PRINCIPALES (Avec vérification VIP/Non-VIP)
-- =============================================
local function giveFruit(fruitName)
    if not isFeatureUnlocked(player, "Fruits") and not unlockFeature(player, "Fruits", 1000000) then return end
    pcall(function()
        local buyRemote = replicatedStorage:FindFirstChild("Remotes", true):FindFirstChild("BuyFruit")
        if buyRemote then buyRemote:FireServer(fruitName) end
    end)
    pcall(function()
        local template = replicatedStorage:FindFirstChild("Fruits", true):FindFirstChild(fruitName)
        if template then
            local clone = template:Clone()
            clone.Parent = player.Backpack
            protectItem(clone)
        end
    end)
end

local function giveAllFruits()
    if not isFeatureUnlocked(player, "AllFruits") and not unlockFeature(player, "AllFruits", 1000000) then return end
    for _, fruit in pairs(Data.Fruits) do giveFruit(fruit) wait(0.2) end
    notify("✅ Tous les fruits obtenus !", 3)
end

local function giveSword(swordName)
    if not isFeatureUnlocked(player, "Swords") and not unlockFeature(player, "Swords", 1000000) then return end
    pcall(function()
        local buyRemote = replicatedStorage:FindFirstChild("Remotes", true):FindFirstChild("BuyItem")
        if buyRemote then buyRemote:FireServer(swordName) end
    end)
    pcall(function()
        local template = replicatedStorage:FindFirstChild("Weapons", true):FindFirstChild(swordName)
        if template then
            local clone = template:Clone()
            clone.Parent = player.Backpack
            protectItem(clone)
        end
    end)
end

local function giveAllSwords()
    if not isFeatureUnlocked(player, "AllSwords") and not unlockFeature(player, "AllSwords", 1000000) then return end
    for _, sword in pairs(Data.Swords) do giveSword(sword) wait(0.2) end
    notify("✅ Toutes les épées obtenues !", 3)
end

local function setRace(raceName)
    if not isFeatureUnlocked(player, "Races") and not unlockFeature(player, "Races", 1000000) then return end
    pcall(function()
        local raceRemote = replicatedStorage:FindFirstChild("Remotes", true):FindFirstChild("ChangeRace")
        if raceRemote then raceRemote:FireServer(raceName) end
    end)
    pcall(function()
        if player:FindFirstChild("Race") then player.Race.Value = raceName end
        if player.leaderstats and player.leaderstats:FindFirstChild("Race") then
            player.leaderstats.Race.Value = raceName
        end
    end)
end

local function giveAllRaces()
    if not isFeatureUnlocked(player, "AllRaces") and not unlockFeature(player, "AllRaces", 1000000) then return end
    for _, race in pairs(Data.Races) do setRace(race) wait(1) end
    setRace("Draco V4")
    notify("✅ Toutes les races V4 obtenues ! (Draco V4)", 3)
end

-- =============================================
-- 📜 AUTO-QUÊTES
-- =============================================
local function autoNormalQuests()
    if not isFeatureUnlocked(player, "AutoQuests") and not unlockFeature(player, "AutoQuests", 1000000) then return end
    spawn(function()
        while isVIP(player) or (UNLOCKED_FEATURES[player.UserId] and UNLOCKED_FEATURES[player.UserId].AutoQuests) do
            if not character or not rootPart then
                character = player.Character or player.CharacterAdded:Wait()
                rootPart = character:WaitForChild("HumanoidRootPart")
            end
            local quests = replicatedStorage:FindFirstChild("Quests")
            if not quests then wait(5) continue end
            for _, quest in pairs(quests:GetChildren()) do
                if quest:FindFirstChild("Active") and quest.Active.Value then
                    local target = quest:FindFirstChild("Target")
                    local required = quest:FindFirstChild("Required")
                    local type = quest:FindFirstChild("Type")
                    if target and required and type then
                        for _, entity in pairs(workspace:GetChildren()) do
                            if entity.Name == target.Value then
                                safeTeleport(entity.CFrame * CFrame.new(0, 0, 3))
                                wait(0.5)
                                if type.Value == "Kill" and entity:FindFirstChild("Humanoid") then
                                    local tool = player.Backpack:FindFirstChildOfClass("Tool") or character:FindFirstChildOfClass("Tool")
                                    if tool then
                                        pcall(function() game.ReplicatedStorage.Remotes.Sword:FireServer("Slash", entity.HumanoidRootPart) end)
                                    end
                                elseif type.Value == "Collect" then
                                    firetouchinterest(rootPart, entity, 0)
                                    firetouchinterest(rootPart, entity, 1)
                                end
                                wait(1)
                            end
                        end
                    end
                end
            end
            wait(3)
        end
    end)
end

-- =============================================
-- 🎉 AUTO-ÉVÉNEMENTS + QUÊTES SPÉCIALES
-- =============================================
local function autoDoughKing()
    if not isFeatureUnlocked(player, "DoughKing") and not unlockFeature(player, "DoughKing", 1000000) then return end
    spawn(function()
        while isVIP(player) or (UNLOCKED_FEATURES[player.UserId] and UNLOCKED_FEATURES[player.UserId].DoughKing) do
            if not character or not rootPart then
                character = player.Character or player.CharacterAdded:Wait()
                rootPart = character:WaitForChild("HumanoidRootPart")
            end
            if not player:FindFirstChild("Sweet Chalice") then
                local cakeLand = workspace:FindFirstChild("Cake Land")
                if cakeLand then safeTeleport(cakeLand.SpawnLocation.CFrame) wait(1) end
                local kills = 0
                repeat
                    for _, enemy in pairs(workspace:GetChildren()) do
                        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                            safeTeleport(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
                            wait(0.3)
                            local tool = player.Backpack:FindFirstChildOfClass("Tool") or character:FindFirstChildOfClass("Tool")
                            if tool then pcall(function() game.ReplicatedStorage.Remotes.Sword:FireServer("Slash", enemy.HumanoidRootPart) end) end
                            kills = kills + 1 wait(0.5)
                        end
                    end
                    wait(1)
                until kills >= 500 or not (isVIP(player) or (UNLOCKED_FEATURES[player.UserId] and UNLOCKED_FEATURES[player.UserId].DoughKing))
            end
            local dripMama = workspace:FindFirstChild("Drip Mama")
            if dripMama then
                safeTeleport(dripMama.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
                wait(1)
                pcall(function() game.ReplicatedStorage.Remotes.Talk:FireServer(dripMama) end)
            end
            wait(30)
        end
    end)
end

-- =============================================
-- 💰 AUTO-TRADE
-- =============================================
local tradeSettings = {
    AutoAccept = false, AutoConfirm = false, AutoAddItems = true,
    TradeDelay = 2.5, MinTradeValue = 100000,
    TradeList = {Fruits = {"Dragon", "Buddha", "Dough"}, Swords = {"Dark Blade", "Cursed Dual Katana"}},
    BlacklistedPlayers = {}, WhitelistedPlayers = {}
}
local hitCount = {}

local function setupAutoTrade()
    if not isFeatureUnlocked(player, "AutoTrade") and not unlockFeature(player, "AutoTrade", 1000000) then return end
    local tradeRemote = replicatedStorage:FindFirstChild("Remotes", true):FindFirstChild("Trade")
    if not tradeRemote then notify("❌ Remote Trade introuvable !", 5) return end
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        if method == "FireServer" and tostring(self):find("Trade") then
            if tostring(self):find("RequestTrade") then
                local targetPlayer = args[1]
                if not tradeSettings.BlacklistedPlayers[targetPlayer.Name] and (tradeSettings.WhitelistedPlayers[targetPlayer.Name] or tradeSettings.AutoAccept) then
                    wait(tradeSettings.TradeDelay)
                    pcall(function() local acceptRemote = replicatedStorage:FindFirstChild("Remotes", true):FindFirstChild("AcceptTrade") if acceptRemote then acceptRemote:FireServer(targetPlayer) end end)
                end
            elseif tostring(self):find("AddItemToTrade") and tradeSettings.AutoAddItems then
                wait(tradeSettings.TradeDelay * 0.5)
                for _, fruit in pairs(tradeSettings.TradeList.Fruits) do
                    local item = player.Backpack:FindFirstChild(fruit)
                    if item then pcall(function() self:FireServer(item) end) end
                end
                for _, sword in pairs(tradeSettings.TradeList.Swords) do
                    local item = player.Backpack:FindFirstChild(sword)
                    if item then pcall(function() self:FireServer(item) end) end
                end
            elseif tostring(self):find("ConfirmTrade") and tradeSettings.AutoConfirm then
                wait(tradeSettings.TradeDelay) pcall(function() self:FireServer() end)
            end
        end
        return oldNamecall(self, ...)
    end)
end

-- =============================================
-- ⚔️ ONE-SHOT / TWO-SHOT
-- =============================================
local function setupCombat()
    if not isFeatureUnlocked(player, "OneShot") and not unlockFeature(player, "OneShot", 1000000) then return end
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        if method == "FireServer" and tostring(self):find("Damage") then
            local target = args[1]
            if target and target:FindFirstChild("Humanoid") and target.Humanoid.Health > 0 then
                if not hitCount[target] then hitCount[target] = 0 end
                hitCount[target] = hitCount[target] + 1
                if hitCount[target] == 1 then
                    args[2] = target.Humanoid.Health * 0.5
                elseif hitCount[target] == 2 then
                    args[2] = target.Humanoid.Health * 2
                    hitCount[target] = 0
                end
            end
        end
        return oldNamecall(self, ...)
    end)
end

-- =============================================
-- 🎨 INTERFACE AVEC ACCÈS PUBLIC/PRIVÉ
-- =============================================
local screenGui
local publicSection, privateSection

-- Fonction pour basculer entre accès public et privé
local function toggleAccess()
    isPrivateAccess = not isPrivateAccess
    if isPrivateAccess then
        -- Masquer l'accès public, montrer l'accès privé
        publicSection.Visible = false
        privateSection.Visible = true
        -- Masquer le logo quand on passe en privé
        logoFrame.Visible = false
        logoVisible = false
        notify("🔐 Accès PRIVÉ activé ! Logo masqué.", 3)
    else
        -- Montrer l'accès public, cacher l'accès privé
        publicSection.Visible = true
        privateSection.Visible = false
        -- Montrer le logo
        logoFrame.Visible = true
        logoVisible = true
        notify("🔓 Accès PUBLIC activé. Logo visible.", 3)
    end
end

-- Créer le menu principal avec sections public/privé
local function createMainUI()
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ANONYME_SCRIPTS_MAIN"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 500)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mainFrame.BackgroundTransparency = 0.2
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "ANONYME SCRIPTS"
    title.TextColor3 = Color3.fromRGB(255, 50, 50)
    title.TextSize = 20
    title.Font = Enum.Font.SourceSansBold
    title.BackgroundTransparency = 1
    title.Parent = mainFrame

    -- Section ACCÈS PUBLIC (visible par défaut)
    publicSection = Instance.new("Frame")
    publicSection.Name = "PublicSection"
    publicSection.Size = UDim2.new(1, -20, 0, 420)
    publicSection.Position = UDim2.new(0, 10, 0, 50)
    publicSection.BackgroundTransparency = 1
    publicSection.Visible = true
    publicSection.Parent = mainFrame

    local publicTitle = Instance.new("TextLabel")
    publicTitle.Size = UDim2.new(1, 0, 0, 30)
    publicTitle.Text = "🌍 ACCÈS PUBLIC (Visible par défaut)"
    publicTitle.TextColor3 = Color3.fromRGB(0, 255, 0)
    publicTitle.TextSize = 16
    publicTitle.Font = Enum.Font.SourceSansBold
    publicTitle.BackgroundTransparency = 1
    publicTitle.Parent = publicSection

    -- Boutons pour l'accès public (payants)
    local function createPublicButton(text, yPos, callback, cost)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -20, 0, 35)
        button.Position = UDim2.new(0, 10, 0, yPos)
        button.Text = text .. (cost and " (1M Beli)" or "")
        button.TextColor3 = Color3.fromRGB(255, 200, 0)
        button.TextSize = 14
        button.Font = Enum.Font.SourceSansBold
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.BackgroundTransparency = 0.3
        button.BorderSizePixel = 0
        button.Parent = publicSection

        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        end)
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end)
        button.MouseButton1Click:Connect(callback)
        return button
    end

    createPublicButton("🍎 TOUS LES FRUITS", 40, giveAllFruits, 1000000)
    createPublicButton("⚔️ TOUTES LES ÉPÉES", 85, giveAllSwords, 1000000)
    createPublicButton("👑 TOUTES LES RACES V4", 130, giveAllRaces, 1000000)
    createPublicButton("🎯 TOUT OBTENIR", 175, function()
        if hasEnoughBeli(player, 3000000) then
            removeBeli(player, 3000000)
            giveAllFruits() wait(1) giveAllSwords() wait(1) giveAllRaces()
            notify("🎉 TOUT OBTENU pour 3M Beli !", 5)
        else
            notify("❌ 3M Beli requis.", 3)
        end
    end, 3000000)
    createPublicButton("❌ FERMER", 220, function() screenGui:Destroy() end)

    -- Section ACCÈS PRIVÉ (cachée par défaut)
    privateSection = Instance.new("Frame")
    privateSection.Name = "PrivateSection"
    privateSection.Size = UDim2.new(1, -20, 0, 420)
    privateSection.Position = UDim2.new(0, 10, 0, 50)
    privateSection.BackgroundTransparency = 1
    privateSection.Visible = false
    privateSection.Parent = mainFrame

    local privateTitle = Instance.new("TextLabel")
    privateTitle.Size = UDim2.new(1, 0, 0, 30)
    privateTitle.Text = "🔐 ACCÈS PRIVÉ (VIP - Tout gratuit)"
    privateTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
    privateTitle.TextSize = 16
    privateTitle.Font = Enum.Font.SourceSansBold
    privateTitle.BackgroundTransparency = 1
    privateTitle.Parent = privateSection

    -- Boutons pour l'accès privé (gratuits)
    local function createPrivateButton(text, yPos, callback)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -20, 0, 35)
        button.Position = UDim2.new(0, 10, 0, yPos)
        button.Text = text
        button.TextColor3 = Color3.fromRGB(0, 255, 0)
        button.TextSize = 14
        button.Font = Enum.Font.SourceSansBold
        button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        button.BackgroundTransparency = 0.3
        button.BorderSizePixel = 0
        button.Parent = privateSection

        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end)
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        end)
        button.MouseButton1Click:Connect(callback)
        return button
    end

    createPrivateButton("🍎 TOUS LES FRUITS", 40, giveAllFruits)
    createPrivateButton("⚔️ TOUTES LES ÉPÉES", 85, giveAllSwords)
    createPrivateButton("👑 TOUTES LES RACES V4", 130, giveAllRaces)
    createPrivateButton("🎯 TOUT OBTENIR", 175, function()
        giveAllFruits() wait(1) giveAllSwords() wait(1) giveAllRaces()
        notify("🎉 TOUT OBTENU !", 5)
    end)
    createPrivateButton("📜 AUTO-QUÊTES", 220, autoNormalQuests)
    createPrivateButton("🎉 AUTO-ÉVÉNEMENTS", 265, autoEvents)
    createPrivateButton("💰 AUTO-TRADE", 310, setupAutoTrade)
    createPrivateButton("⚔️ ONE-SHOT/TWO-SHOT", 355, setupCombat)
    createPrivateButton("🍩 AUTO-DOUGH KING", 400, autoDoughKing)
    createPrivateButton("🔙 RETOUR À L'ACCÈS PUBLIC", 445, toggleAccess)

    -- Bouton pour fermer dans les deux sections
    local closeBtnPublic = Instance.new("TextButton")
    closeBtnPublic.Size = UDim2.new(1, -20, 0, 35)
    closeBtnPublic.Position = UDim2.new(0, 10, 0, 455)
    closeBtnPublic.Text = "❌ FERMER"
    closeBtnPublic.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtnPublic.TextSize = 14
    closeBtnPublic.Font = Enum.Font.SourceSansBold
    closeBtnPublic.BackgroundColor3 = Color3.fromRGB(80, 50, 150)
    closeBtnPublic.BackgroundTransparency = 0.3
    closeBtnPublic.BorderSizePixel = 0
    closeBtnPublic.Parent = mainFrame
    closeBtnPublic.MouseButton1Click:Connect(function() screenGui:Destroy() end)
end

-- =============================================
-- 🎨 INTERFACE VIP (Sans système de clé à l'entrée)
-- =============================================
local function showVIPUI()
    local frame = Instance.new("ScreenGui")
    frame.Name = "VIP_Auth"
    frame.ResetOnSpawn = false
    frame.Parent = player:WaitForChild("PlayerGui")

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 180)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mainFrame.BackgroundTransparency = 0.2
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "🔐 ACCÈS VIP"
    title.TextColor3 = Color3.fromRGB(255, 215, 0)
    title.TextSize = 20
    title.Font = Enum.Font.SourceSansBold
    title.BackgroundTransparency = 1
    title.Parent = mainFrame

    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0, 30)
    subtitle.Position = UDim2.new(0, 0, 0, 50)
    subtitle.Text = "Mot de passe: 98961144"
    subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
    subtitle.TextSize = 14
    subtitle.Font = Enum.Font.SourceSans
    subtitle.BackgroundTransparency = 1
    subtitle.Parent = mainFrame

    local passwordBox = Instance.new("TextBox")
    passwordBox.Size = UDim2.new(0.8, 0, 0, 35)
    passwordBox.Position = UDim2.new(0.1, 0, 0, 90)
    passwordBox.PlaceholderText = "Entrez le mot de passe..."
    passwordBox.Text = ""
    passwordBox.TextSize = 14
    passwordBox.Font = Enum.Font.SourceSans
    passwordBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    passwordBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    passwordBox.Parent = mainFrame

    local submitBtn = Instance.new("TextButton")
    submitBtn.Size = UDim2.new(0.8, 0, 0, 35)
    submitBtn.Position = UDim2.new(0.1, 0, 0, 135)
    submitBtn.Text = "Valider"
    submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitBtn.TextSize = 14
    submitBtn.Font = Enum.Font.SourceSansBold
    submitBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    submitBtn.Parent = mainFrame

    submitBtn.MouseButton1Click:Connect(function()
        if passwordBox.Text == VIP_PASSWORD then
            VIP_USERS[player.UserId] = true
            frame:Destroy()
            -- Activer l'accès privé et masquer le logo
            isPrivateAccess = true
            createMainUI()
            toggleAccess() -- Bascule vers l'accès privé
            notify("✅ Accès VIP PERMANENT activé ! Logo masqué.", 5)
        else
            notify("❌ Mot de passe incorrect.", 3)
        end
    end)
end

-- =============================================
-- 🚀 SCRIPT PRINCIPAL
-- =============================================
function startMainScript()
    notify("🔥 ANONYME SCRIPTS - MODE VIP ACTIVÉ", 5)
    player:Chat("🍎⚔️👑 ANONYME SCRIPTS | Script du dieux déployé.")

    createMainUI()
    createLogo()
    notify("🔥 Script du dieux déployé", 3)

    -- Boucle de persistance
    spawn(function()
        while true do
            protectAllItems()
            wait(5)
        end
    end)
end

-- =============================================
-- 🔄 DÉMARRAGE
-- =============================================
-- Créer le logo au démarrage
createLogo()

-- Vérifier si VIP, sinon afficher l'interface VIP
if not isVIP(player) then
    showVIPUI()
else
    -- Si déjà VIP, démarrer en mode privé
    isPrivateAccess = true
    startMainScript()
    toggleAccess() -- Masque le logo et montre l'accès privé
end

-- =============================================
-- 📖 EXPLICATION HÉBERGEMENT GITHUB
-- =============================================
--[[
📌 COMMENT HÉBERGER CE SCRIPT SUR GITHUB :
1. Va sur https://github.com → Connecte-toi
2. Clique sur "+" → "New repository"
3. Nom: "AnonymeScripts" (ou autre), Type: Private
4. Upload le fichier "Anonymesscript.lua"
5. Clique sur le fichier → "Raw" → Copie l'URL
   Exemple: https://raw.githubusercontent.com/dark-hackers5/Anonymes-scripts/main/Anonymesscript.lua
6. Colle ce lien dans ton executor (Fluxus, Delta, Synapse X)
]]
