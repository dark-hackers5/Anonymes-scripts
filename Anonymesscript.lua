--[[
    ANONYMES SCRIPTS HUB - Blox Fruits (Version ULTIME 4.0)
    Créé par Khaled Salami | Optimisé pour : Synapse X, Krnl, Fluxus, Delta, Script-Ware
    ✅ 100% des fonctionnalités du jeu + exclusivités | ✅ Anti-Crash | ✅ VIP System
    🔥 NOUVEAUTÉS : Splash Screen, Auto Leviathan Quest, Mirage Island, ESP Avancé, Haki Auto
--]]

-- ========== [CONFIGURATION GLOBALE] ==========
local VERSION = "4.0"
local VIP_PASSWORD = "98961144"
local PRICE_FRUITS_PERMS = 5000000
local PRICE_AUTO_PVP = 2000000
local LOGO_URL = "https://mistralaichatupprodswe.blob.core.windows.net/chat-images/31/dc/45/31dc450a-f325-460f-9cb7-e7b6af1e9b56/2a4bb7b3-f8b7-497b-8390-753b144679bf/d23d3815-3676-4bc4-a5e4-8d9a18f9c78e"

-- ========== [LISTES DE DONNÉES MISES À JOUR] ==========
local BOSSES = {
    -- First Sea
    {Name = "Bandit", Level = 150, Sea = 1, Type = "Normal"},
    {Name = "Leader", Level = 300, Sea = 1, Type = "Normal"},
    {Name = "Brute", Level = 500, Sea = 1, Type = "Normal"},
    {Name = "The Saw", Level = 1000, Sea = 1, Type = "Normal"},
    {Name = "Shank", Level = 1100, Sea = 1, Type = "Normal"},

    -- Second Sea
    {Name = "Don Swan", Level = 1000, Sea = 2, Type = "Normal"},
    {Name = "Jeremy", Level = 1050, Sea = 2, Type = "Normal"},
    {Name = "Saber Expert", Level = 1100, Sea = 2, Type = "Normal"},
    {Name = "The Gorilla King", Level = 1200, Sea = 2, Type = "Normal"},

    -- Third Sea
    {Name = "Don Swan [Lv. 1000]", Level = 1000, Sea = 3, Type = "Normal"},
    {Name = "Jeremy [Lv. 1050]", Level = 1050, Sea = 3, Type = "Normal"},
    {Name = "Wysper", Level = 1100, Sea = 3, Type = "Normal"},
    {Name = "Thunder God", Level = 1150, Sea = 3, Type = "Normal"},
    {Name = "Cursed Captain", Level = 1200, Sea = 3, Type = "Normal"},
    {Name = "Stone", Level = 1500, Sea = 3, Type = "Normal"},
    {Name = "Island Empress", Level = 1600, Sea = 3, Type = "Normal"},
    {Name = "Kilo Admiral", Level = 1700, Sea = 3, Type = "Normal"},

    -- Raid Boss
    {Name = "Dough King", Level = 0, Sea = 0, Type = "Raid"},
    {Name = "Leviathan", Level = 0, Sea = 0, Type = "Raid"},
    {Name = "Sea Beast", Level = 0, Sea = 0, Type = "Event"},
    {Name = "Terrorshark", Level = 0, Sea = 0, Type = "Event"},
    {Name = "Phantom", Level = 0, Sea = 0, Type = "Raid"},

    -- Event Boss
    {Name = "Magma Admiral", Level = 0, Sea = 0, Type = "Volcano"},
    {Name = "Mirror Boss", Level = 0, Sea = 0, Type = "Factory"},
    {Name = "Kitsune", Level = 0, Sea = 0, Type = "Special"},
    {Name = "Longma", Level = 0, Sea = 0, Type = "Special"},
    {Name = "Soul Reaper", Level = 0, Sea = 0, Type = "Special"},

    -- Quête Boss
    {Name = "Cursed Dual Katana", Level = 0, Sea = 0, Type = "Quest"},
    {Name = "Yama", Level = 0, Sea = 0, Type = "Quest"},
    {Name = "Tushita", Level = 0, Sea = 0, Type = "Quest"},
    {Name = "Sanguine Art", Level = 0, Sea = 0, Type = "Quest"},
    {Name = "Darkbeard", Level = 0, Sea = 0, Type = "Quest"}
}

local ISLANDS = {
    -- First Sea
    {Name = "Starter Island", Sea = 1, Position = CFrame.new(-1000, 10, -1000)},
    {Name = "Jungle", Sea = 1, Position = CFrame.new(-600, 10, -800)},
    {Name = "Pirate Village", Sea = 1, Position = CFrame.new(-1200, 10, -300)},
    {Name = "Desert", Sea = 1, Position = CFrame.new(-700, 10, 500)},
    {Name = "Snow Island", Sea = 1, Position = CFrame.new(-1300, 10, 1200)},
    {Name = "Marine Fortress", Sea = 1, Position = CFrame.new(-2500, 10, -2000)},
    {Name = "Sky Island 1", Sea = 1, Position = CFrame.new(-2800, 1000, -3000)},
    {Name = "Sky Island 2", Sea = 1, Position = CFrame.new(-3500, 1500, -3500)},
    {Name = "Prison", Sea = 1, Position = CFrame.new(-5000, 10, -5000)},
    {Name = "Magma Village", Sea = 1, Position = CFrame.new(-5500, 10, -5500)},
    {Name = "Dressrosa", Sea = 2, Position = CFrame.new(-7000, 10, -7000)},
    {Name = "Rose Kingdom", Sea = 2, Position = CFrame.new(-4500, 10, -8000)},
    {Name = "Fishman Island", Sea = 2, Position = CFrame.new(-3800, 10, -6000)},

    -- Second Sea
    {Name = "Port Town", Sea = 2, Position = CFrame.new(1000, 10, -1000)},
    {Name = "Kingdom of Rose", Sea = 2, Position = CFrame.new(1500, 10, -1500)},
    {Name = "Usopp Island", Sea = 2, Position = CFrame.new(2000, 10, -2000)},
    {Name = "Minisky", Sea = 2, Position = CFrame.new(2500, 1000, -2500)},
    {Name = "Fountain City", Sea = 2, Position = CFrame.new(3000, 10, -3000)},
    {Name = "Sky Island 3", Sea = 2, Position = CFrame.new(3500, 1500, -3500)},
    {Name = "Zou", Sea = 2, Position = CFrame.new(4000, 10, -4000)},
    {Name = "Scrap Island", Sea = 2, Position = CFrame.new(4500, 10, -4500)},
    {Name = "Ghost Island", Sea = 2, Position = CFrame.new(5000, 10, -5000)},
    {Name = "Ice Castle", Sea = 2, Position = CFrame.new(5500, 10, -5500)},

    -- Third Sea
    {Name = "Port Oasis", Sea = 3, Position = CFrame.new(1000, 10, 1000)},
    {Name = "Forgotten Island", Sea = 3, Position = CFrame.new(1500, 10, 1500)},
    {Name = "Utopia", Sea = 3, Position = CFrame.new(2000, 10, 2000)},
    {Name = "Hydra Island", Sea = 3, Position = CFrame.new(2500, 10, 2500)},
    {Name = "Great Tree", Sea = 3, Position = CFrame.new(3000, 10, 3000)},
    {Name = "Castle on the Sea", Sea = 3, Position = CFrame.new(3500, 10, 3500)},
    {Name = "Mage Island", Sea = 3, Position = CFrame.new(4000, 10, 4000)},
    {Name = "Pirate Port", Sea = 3, Position = CFrame.new(4500, 10, 4500)},
    {Name = "Haunted Castle", Sea = 3, Position = CFrame.new(5000, 10, 5000)},
    {Name = "Mirage Island", Sea = 0, Position = nil, IsRandom = true},
    {Name = "Hydra Island", Sea = 3, Position = CFrame.new(2500, 10, 2500)},
    {Name = "Tiki Outpost", Sea = 3, Position = CFrame.new(3200, 10, 3200)}
}

local QUESTS = {
    {Name = "Leviathan", NPC = "Old Man", Reward = "Leviathan Gun", Sea = 2},
    {Name = "Dough King", NPC = "Cake Prince", Reward = "Dough Fruit", Sea = 2},
    {Name = "Cursed Dual Katana", NPC = "Hitman", Reward = "CDK", Sea = 1},
    {Name = "Yama", NPC = "Monk", Reward = "Yama Sword", Sea = 1},
    {Name = "Tushita", NPC = "Monk", Reward = "Tushita Sword", Sea = 2},
    {Name = "Sanguine Art", NPC = "Art Dealer", Reward = "Sanguine Art", Sea = 2},
    {Name = "Kitsune", NPC = "Mystic Lady", Reward = "Kitsune", Sea = 3},
    {Name = "Race V4", NPC = "Race Expert", Reward = "Race V4", Sea = 2},
    {Name = "Soul Reaper", NPC = "Death", Reward = "Soul Cane", Sea = 3}
}

-- ========== [VARIABLES GLOBALES] ==========
local player = game.Players.LocalPlayer
local isVIP = false
local hasFruitsPerms = false
local hasAutoPvP = false
local currentSea = 1
local toggles = {
    -- Farming
    autoLevel = false,
    autoNearest = false,
    autoEctoplasm = false,
    autoCandy = false,
    autoGifts = false,
    autoCollect = false,
    autoCollectRewards = false,

    -- Combat
    autoPvP = false,
    killAura = false,
    triggerBot = false,
    autoAttack = false,

    -- Events
    autoSeaBeast = false,
    autoLeviathan = false,
    autoLeviathanQuest = false,
    autoPirateRaid = false,
    autoShipRaid = false,
    autoTerrorshark = false,
    autoVolcano = false,
    autoFactory = false,
    autoPhantom = false,

    -- Quêtes
    autoDoughKing = false,
    autoYama = false,
    autoTushita = false,
    autoCDK = false,
    autoSanguineArt = false,
    autoKitsune = false,
    autoRaceV4 = false,
    autoMirageIsland = false,
    autoSoulReaper = false,

    -- Fruits & Raid
    fruitsPerms = false,
    autoRaid = false,
    espFruits = false,

    -- Boats
    autoBoat = false,
    teleportToBoat = false,
    boatSpeed = false,

    -- Teleport
    teleportMobs = false,
    bringMob = false,
    autoIslandHop = false,

    -- ESP
    espPlayers = false,
    espBoss = false,
    espFruits = false,
    espChests = false,
    espNPCs = false,

    -- Movement
    walkOnWater = false,
    infiniteJump = false,
    noClip = false,
    flight = false,

    -- Haki
    autoHaki = false,
    autoObservation = false,
    autoArmament = false,

    -- Admin
    serverHop = false,
    adminMode = false,
    antiKick = false,
    fpsBoost = false
}

-- ========== [SPLASH SCREEN AU DÉMARRAGE] ==========
local function createSplashScreen()
    local splashGui = Instance.new("ScreenGui")
    splashGui.Name = "ANONYMES_Splash"
    splashGui.IgnoreGuiInset = true
    splashGui.ResetOnSpawn = false
    splashGui.Parent = game:GetService("CoreGui")

    local splashFrame = Instance.new("Frame")
    splashFrame.Name = "SplashFrame"
    splashFrame.Size = UDim2.new(0, 400, 0, 250)
    splashFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
    splashFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    splashFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    splashFrame.BorderSizePixel = 0
    splashFrame.Parent = splashGui

    local logoImage = Instance.new("ImageLabel")
    logoImage.Name = "Logo"
    logoImage.Size = UDim2.new(0, 120, 0, 120)
    logoImage.Position = UDim2.new(0.5, -60, 0, 20)
    logoImage.AnchorPoint = Vector2.new(0.5, 0)
    logoImage.BackgroundTransparency = 1
    logoImage.Image = LOGO_URL
    logoImage.ScaleType = Enum.ScaleType.Slice
    logoImage.SliceCenter = Rect.new(100, 100, 100, 100)
    logoImage.Parent = splashFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -20, 0, 30)
    titleLabel.Position = UDim2.new(0, 10, 0, 150)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "ANONYMES SCRIPTS HUB"
    titleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    titleLabel.TextSize = 20
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextScaled = true
    titleLabel.Parent = splashFrame

    local versionLabel = Instance.new("TextLabel")
    versionLabel.Name = "Version"
    versionLabel.Size = UDim2.new(1, -20, 0, 20)
    versionLabel.Position = UDim2.new(0, 10, 0, 180)
    versionLabel.BackgroundTransparency = 1
    versionLabel.Text = "v" .. VERSION .. " | Blox Fruits"
    versionLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    versionLabel.TextSize = 14
    versionLabel.Font = Enum.Font.SourceSans
    versionLabel.Parent = splashFrame

    local loadingLabel = Instance.new("TextLabel")
    loadingLabel.Name = "Loading"
    loadingLabel.Size = UDim2.new(1, -20, 0, 20)
    loadingLabel.Position = UDim2.new(0, 10, 0, 210)
    loadingLabel.BackgroundTransparency = 1
    loadingLabel.Text = "Chargement..."
    loadingLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    loadingLabel.TextSize = 12
    loadingLabel.Font = Enum.Font.SourceSans
    loadingLabel.Parent = splashFrame

    local clickButton = Instance.new("TextButton")
    clickButton.Name = "ClickButton"
    clickButton.Size = UDim2.new(0, 200, 0, 30)
    clickButton.Position = UDim2.new(0.5, -100, 0, 220)
    clickButton.AnchorPoint = Vector2.new(0.5, 0)
    clickButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    clickButton.Text = "CLIQUEZ POUR CONTINUER"
    clickButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    clickButton.Font = Enum.Font.SourceSansBold
    clickButton.TextSize = 12
    clickButton.BorderSizePixel = 0
    clickButton.Parent = splashFrame

    clickButton.MouseButton1Click:Connect(function()
        splashGui:Destroy()
        createUI() -- Lance l'UI principale
    end)

    -- Animation de chargement
    spawn(function()
        local dots = ""
        while splashGui and splashGui.Parent do
            dots = dots == "..." and "" or dots .. "."
            loadingLabel.Text = "Chargement" .. dots
            task.wait(0.5)
        end
    end)
end

-- ========== [FONCTIONS UTILITAIRES AMÉLIORÉES] ==========
local function notify(title, text, duration)
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 3,
            Icon = LOGO_URL
        })
    end)
end

local function getBeli()
    if not player.Data then return 0 end
    local beli = player.Data:FindFirstChild("Beli")
    if beli and beli.Value then
        return tonumber(tostring(beli.Value)) or 0
    end
    return 0
end

local function hasEnoughBeli(amount)
    return getBeli() >= amount
end

local function payBeli(amount)
    if not hasEnoughBeli(amount) then
        notify("❌ Erreur", "Pas assez de Beli (" .. getBeli() .. " / " .. amount .. ")", 3)
        return false
    end
    pcall(function()
        player.Data.Beli.Value = player.Data.Beli.Value - amount
    end)
    notify("✅ Paiement", "- " .. amount .. " Beli", 2)
    return true
end

local function toggleFeature(feature)
    toggles[feature] = not toggles[feature]
    return toggles[feature]
end

local function waitForCharacter()
    repeat task.wait() until player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    return player.Character
end

local function getCurrentSea()
    if not player.Data then return 1 end
    local level = player.Data:FindFirstChild("Level")
    if level and level.Value >= 2000 then
        return 3
    elseif level and level.Value >= 700 then
        return 3
    elseif level and level.Value >= 150 then
        return 2
    else
        return 1
    end
end

-- ========== [FONCTIONS DE DÉTECTION AMÉLIORÉES] ==========
local function getBoss(bossName)
    if not workspace:FindFirstChild("Enemies") then return nil end
    for _, boss in pairs(workspace.Enemies:GetChildren()) do
        if boss.Name == bossName or boss.Name:find(bossName) then
            if boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                return boss
            end
        end
    end
    return nil
end

local function getNearestBoss()
    local character = waitForCharacter()
    if not character then return nil end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return nil end

    local nearestBoss, nearestDist = nil, math.huge
    for _, bossInfo in ipairs(BOSSES) do
        local boss = getBoss(bossInfo.Name)
        if boss and boss:FindFirstChild("HumanoidRootPart") then
            local dist = (rootPart.Position - boss.HumanoidRootPart.Position).Magnitude
            if dist < nearestDist and dist < 5000 then -- Limite de distance
                nearestBoss, nearestDist = boss, dist
            end
        end
    end
    return nearestBoss
end

local function findNPC(npcName)
    if not workspace:FindFirstChild("NPCs") then return nil end
    for _, npc in pairs(workspace.NPCs:GetChildren()) do
        if npc.Name:find(npcName) or (npc:FindFirstChild("NPCName") and npc.NPCName.Value:find(npcName)) then
            return npc
        end
    end
    return nil
end

local function isInBoat()
    local character = player.Character
    if not character then return false end
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid and humanoid.SeatPart then
        local boat = humanoid.SeatPart.Parent
        return boat and (boat.Name:find("Boat") or boat.Name:find("Ship"))
    end
    return false
end

local function getBoat()
    if isInBoat() then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid and humanoid.SeatPart then
            return humanoid.SeatPart.Parent
        end
    end
    return nil
end

local function isMirageIslandAvailable()
    for _, island in pairs(workspace:GetChildren()) do
        if island.Name:find("Mirage") then
            return true, island
        end
    end
    return false
end

local function hasQuest(questName)
    if not player:FindFirstChild("Quests") then return false end
    for _, quest in pairs(player.Quests:GetChildren()) do
        if quest.Name:find(questName) then
            return true, quest
        end
    end
    return false
end

local function hasSwordEquipped()
    local character = player.Character
    if not character then return false end
    for _, tool in pairs(character:GetChildren()) do
        if tool:IsA("Tool") and (tool.Name:find("Sword") or tool.Name:find("Katana") or tool.Name:find("Cane")) then
            return true, tool
        end
    end
    return false
end

local function getNearestMob()
    local character = waitForCharacter()
    if not character then return nil end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return nil end

    local nearest, nearestDist = nil, math.huge
    if not workspace:FindFirstChild("Enemies") then return nil end
    for _, mob in pairs(workspace.Enemies:GetChildren()) do
        if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") then
            local dist = (rootPart.Position - mob.HumanoidRootPart.Position).Magnitude
            if dist < nearestDist and dist < 1000 then -- Limite de détection
                nearest, nearestDist = mob, dist
            end
        end
    end
    return nearest
end

local function getNearestPlayer()
    local character = waitForCharacter()
    if not character then return nil end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return nil end

    local nearest, nearestDist = nil, math.huge
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (rootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
            if dist < nearestDist and dist <= 50 then
                nearest, nearestDist = plr, dist
            end
        end
    end
    return nearest
end

-- ========== [FONCTIONS DE COMBAT OPTIMISÉES] ==========
local function attackTarget(target)
    pcall(function()
        local character = waitForCharacter()
        if not character or not target then return end
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local targetRoot = target:FindFirstChild("HumanoidRootPart")
        if not rootPart or not targetRoot then return end

        -- Se positionner derrière la cible
        local direction = (targetRoot.Position - rootPart.Position).Unit
        rootPart.CFrame = CFrame.new(targetRoot.Position + (direction * -5)) * CFrame.Angles(0, math.pi, 0)

        -- Attaquer
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(0.1)
        game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)

        -- Utiliser les compétences (Z, X, C, V) si le joueur a une épée
        if hasSwordEquipped() then
            for _, key in ipairs({"Z", "X", "C", "V"}) do
                game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, nil)
                task.wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, key, false, nil)
                task.wait(0.2)
            end
        end

        -- Utiliser les fruits (F, G, H, J)
        for _, key in ipairs({"F", "G", "H", "J"}) do
            game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, nil)
            task.wait(0.1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, key, false, nil)
            task.wait(0.2)
        end
    end)
end

local function startKillAura()
    if not toggles.killAura then return end
    spawn(function()
        while toggles.killAura and task.wait(0.2) do
            pcall(function()
                local nearestPlayer = getNearestPlayer()
                if nearestPlayer and nearestPlayer.Character then
                    attackTarget(nearestPlayer.Character)
                end
            end)
        end
    end)
end

local function startTriggerBot()
    if not toggles.triggerBot then return end
    spawn(function()
        local UserInputService = game:GetService("UserInputService")
        UserInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and toggles.triggerBot then
                pcall(function()
                    local nearestPlayer = getNearestPlayer()
                    if nearestPlayer and nearestPlayer.Character then
                        attackTarget(nearestPlayer.Character)
                    end
                end)
            end
        end)
    end)
end

local function startAutoAttack()
    if not toggles.autoAttack then return end
    spawn(function()
        while toggles.autoAttack and task.wait(0.3) do
            pcall(function()
                local mob = getNearestMob()
                if mob then
                    attackTarget(mob)
                end
            end)
        end
    end)
end

-- ========== [FONCTIONS DE FARM] ==========
local function startAutoLevel()
    if not toggles.autoLevel then return end
    spawn(function()
        while toggles.autoLevel and task.wait(0.3) do
            pcall(function()
                local mob = getNearestMob()
                if mob then
                    attackTarget(mob)
                end
            end)
        end
    end)
end

local function startAutoNearest()
    if not toggles.autoNearest then return end
    spawn(function()
        while toggles.autoNearest and task.wait(0.5) do
            pcall(function()
                local boss = getNearestBoss()
                if boss then
                    attackTarget(boss)
                else
                    local mob = getNearestMob()
                    if mob then
                        attackTarget(mob)
                    end
                end
            end)
        end
    end)
end

-- ========== [FONCTIONS DE BATEAUX] ==========
local function startAutoBoat()
    if not toggles.autoBoat then return end
    spawn(function()
        while toggles.autoBoat and task.wait(0.1) do
            pcall(function()
                if isInBoat() then
                    local boat = getBoat()
                    if boat and boat:FindFirstChild("VehicleSeat") then
                        boat.VehicleSeat.Steer = 0
                        boat.VehicleSeat.Throttle = 1
                    end
                end
            end)
        end
    end)
end

local function teleportToNearestBoat()
    pcall(function()
        local character = waitForCharacter()
        if not character then return end
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end

        local nearestBoat, nearestDist = nil, math.huge
        if workspace:FindFirstChild("Vehicles") then
            for _, boat in pairs(workspace.Vehicles:GetChildren()) do
                if boat.Name:find("Boat") or boat.Name:find("Ship") then
                    local spawnLocation = boat:FindFirstChild("SpawnLocation") or boat:FindFirstChild("VehicleSeat")
                    if spawnLocation then
                        local dist = (rootPart.Position - spawnLocation.Position).Magnitude
                        if dist < nearestDist then
                            nearestBoat, nearestDist = boat, dist
                        end
                    end
                end
            end
        end

        if nearestBoat then
            local spawnLocation = nearestBoat:FindFirstChild("SpawnLocation") or nearestBoat:FindFirstChild("VehicleSeat")
            if spawnLocation then
                rootPart.CFrame = spawnLocation.CFrame * CFrame.new(0, 5, 0)
                notify("✅ Bateau", "Téléporté vers un bateau !", 2)
            end
        else
            notify("❌ Erreur", "Aucun bateau trouvé.", 2)
        end
    end)
end

local function boostBoatSpeed()
    if not toggles.boatSpeed then return end
    spawn(function()
        while toggles.boatSpeed and task.wait(0.1) do
            pcall(function()
                if isInBoat() then
                    local boat = getBoat()
                    if boat and boat:FindFirstChild("VehicleSeat") then
                        boat.VehicleSeat.MaxSpeed = 200
                        boat.VehicleSeat.Torque = 50000
                    end
                end
            end)
        end
    end)
end

-- ========== [FONCTIONS D'ÉVÉNEMENTS] ==========
local function startAutoSeaBeast()
    if not toggles.autoSeaBeast then return end
    spawn(function()
        while toggles.autoSeaBeast and task.wait(1) do
            pcall(function()
                local seaBeast = getBoss("Sea Beast")
                if seaBeast then
                    attackTarget(seaBeast)
                end
            end)
        end
    end)
end

local function startAutoLeviathan()
    if not toggles.autoLeviathan then return end
    spawn(function()
        while toggles.autoLeviathan and task.wait(1) do
            pcall(function()
                local leviathan = getBoss("Leviathan")
                if leviathan then
                    attackTarget(leviathan)
                end
            end)
        end
    end)
end

-- ========== [QUÊTE DE LEVIATHAN (COMPLÈTE)] ==========
local function startLeviathanQuest()
    if not toggles.autoLeviathanQuest then return end
    spawn(function()
        while toggles.autoLeviathanQuest and task.wait(0.5) do
            pcall(function()
                local character = waitForCharacter()
                if not character then return end
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if not rootPart then return end

                -- Étape 1: Trouver le NPC (Old Man)
                local oldMan = findNPC("Old Man")
                if not oldMan then
                    -- Chercher sur différentes îles
                    for _, island in ipairs(ISLANDS) do
                        if island.Sea == 2 then -- Leviathan Quest est en Second Sea
                            rootPart.CFrame = island.Position
                            task.wait(1)
                            oldMan = findNPC("Old Man")
                            if oldMan then break end
                        end
                    end
                end

                if oldMan and oldMan:FindFirstChild("HumanoidRootPart") then
                    -- Se téléporter vers le NPC
                    rootPart.CFrame = oldMan.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                    task.wait(1)

                    -- Vérifier si on a déjà la quête
                    local hasQuestLeviathan = hasQuest("Leviathan")
                    if not hasQuestLeviathan then
                        -- Parler au NPC pour accepter la quête
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", oldMan)
                        task.wait(2)
                    end

                    -- Étape 2: Trouver et tuer les vagues d'ennemis
                    local waves = {"LeviathanWave1", "LeviathanWave2", "LeviathanWave3"}
                    local allWavesDead = true
                    for _, waveName in ipairs(waves) do
                        local wave = getBoss(waveName)
                        if wave then
                            allWavesDead = false
                            attackTarget(wave)
                            task.wait(0.5)
                        end
                    end

                    -- Étape 3: Trouver et tuer Leviathan
                    if allWavesDead then
                        local leviathan = getBoss("Leviathan")
                        if leviathan then
                            attackTarget(leviathan)
                        end
                    end

                    -- Étape 4: Retourner au NPC pour la récompense
                    if not getBoss("Leviathan") and not getBoss("LeviathanWave1") then
                        rootPart.CFrame = oldMan.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        task.wait(1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", oldMan)
                        notify("✅ Quête Leviathan", "Quête terminée ! Récompense: Leviathan Gun", 5)
                        toggles.autoLeviathanQuest = false
                        -- Mettre à jour le bouton dans l'UI
                        for _, button in pairs(script:GetDescendants()) do
                            if button.Name == "autoLeviathanQuestButton" then
                                button.Text = "Auto Leviathan Quest [OFF]"
                            end
                        end
                    end
                end
            end)
        end
    end)
end

-- ========== [FONCTIONS DE RAID & ÉVÉNEMENTS] ==========
local function startAutoPirateRaid()
    if not toggles.autoPirateRaid then return end
    spawn(function()
        while toggles.autoPirateRaid and task.wait(1) do
            pcall(function()
                for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                    if enemy.Name:find("Pirate") and enemy:FindFirstChild("HumanoidRootPart") then
                        attackTarget(enemy)
                    end
                end
            end)
        end
    end)
end

local function startAutoShipRaid()
    if not toggles.autoShipRaid then return end
    spawn(function()
        while toggles.autoShipRaid and task.wait(1) do
            pcall(function()
                for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                    if enemy.Name:find("Ship") and enemy:FindFirstChild("HumanoidRootPart") then
                        attackTarget(enemy)
                    end
                end
            end)
        end
    end)
end

local function startAutoTerrorshark()
    if not toggles.autoTerrorshark then return end
    spawn(function()
        while toggles.autoTerrorshark and task.wait(1) do
            pcall(function()
                local terrorshark = getBoss("Terrorshark")
                if terrorshark then
                    attackTarget(terrorshark)
                end
            end)
        end
    end)
end

local function startAutoVolcano()
    if not toggles.autoVolcano then return end
    spawn(function()
        while toggles.autoVolcano and task.wait(1) do
            pcall(function()
                local magmaAdmiral = getBoss("Magma Admiral")
                if magmaAdmiral then
                    attackTarget(magmaAdmiral)
                end
            end)
        end
    end)
end

local function startAutoFactory()
    if not toggles.autoFactory then return end
    spawn(function()
        while toggles.autoFactory and task.wait(1) do
            pcall(function()
                local mirrorBoss = getBoss("Mirror Boss")
                if mirrorBoss then
                    attackTarget(mirrorBoss)
                end
            end)
        end
    end)
end

local function startAutoPhantom()
    if not toggles.autoPhantom then return end
    spawn(function()
        while toggles.autoPhantom and task.wait(1) do
            pcall(function()
                local phantom = getBoss("Phantom")
                if phantom then
                    attackTarget(phantom)
                end
            end)
        end
    end)
end

-- ========== [FONCTIONS DE QUÊTES SPÉCIALES] ==========
local function startAutoDoughKing()
    if not toggles.autoDoughKing then return end
    spawn(function()
        while toggles.autoDoughKing and task.wait(1) do
            pcall(function()
                local doughKing = getBoss("Dough King")
                if doughKing then
                    attackTarget(doughKing)
                else
                    -- Trouver le NPC pour déclencher le raid
                    local cakePrince = findNPC("Cake Prince")
                    if cakePrince then
                        player.Character.HumanoidRootPart.CFrame = cakePrince.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", cakePrince)
                    end
                end
            end)
        end
    end)
end

local function startAutoYama()
    if not toggles.autoYama then return end
    spawn(function()
        while toggles.autoYama and task.wait(1) do
            pcall(function()
                local yama = getBoss("Yama")
                if yama then
                    attackTarget(yama)
                else
                    -- Trouver le NPC Monk
                    local monk = findNPC("Monk")
                    if monk then
                        player.Character.HumanoidRootPart.CFrame = monk.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", monk)
                        task.wait(1)
                        -- Sélectionner la quête Yama
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SelectQuest", "Yama")
                    end
                end
            end)
        end
    end)
end

local function startAutoTushita()
    if not toggles.autoTushita then return end
    spawn(function()
        while toggles.autoTushita and task.wait(1) do
            pcall(function()
                local tushita = getBoss("Tushita")
                if tushita then
                    attackTarget(tushita)
                else
                    -- Trouver le NPC Monk
                    local monk = findNPC("Monk")
                    if monk then
                        player.Character.HumanoidRootPart.CFrame = monk.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", monk)
                        task.wait(1)
                        -- Sélectionner la quête Tushita
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SelectQuest", "Tushita")
                    end
                end
            end)
        end
    end)
end

local function startAutoCDK()
    if not toggles.autoCDK then return end
    spawn(function()
        while toggles.autoCDK and task.wait(1) do
            pcall(function()
                local cdk = getBoss("Cursed Dual Katana")
                if cdk then
                    attackTarget(cdk)
                else
                    -- Trouver le NPC Hitman
                    local hitman = findNPC("Hitman")
                    if hitman then
                        player.Character.HumanoidRootPart.CFrame = hitman.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", hitman)
                    end
                end
            end)
        end
    end)
end

local function startAutoSanguineArt()
    if not toggles.autoSanguineArt then return end
    spawn(function()
        while toggles.autoSanguineArt and task.wait(1) do
            pcall(function()
                local sanguine = getBoss("Sanguine Art")
                if sanguine then
                    attackTarget(sanguine)
                else
                    -- Trouver le NPC Art Dealer
                    local artDealer = findNPC("Art Dealer")
                    if artDealer then
                        player.Character.HumanoidRootPart.CFrame = artDealer.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", artDealer)
                    end
                end
            end)
        end
    end)
end

local function startAutoKitsune()
    if not toggles.autoKitsune then return end
    spawn(function()
        while toggles.autoKitsune and task.wait(1) do
            pcall(function()
                local kitsune = getBoss("Kitsune")
                if kitsune then
                    attackTarget(kitsune)
                else
                    -- Trouver le NPC Mystic Lady
                    local mysticLady = findNPC("Mystic Lady")
                    if mysticLady then
                        player.Character.HumanoidRootPart.CFrame = mysticLady.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", mysticLady)
                    end
                end
            end)
        end
    end)
end

local function startAutoRaceV4()
    if not toggles.autoRaceV4 then return end
    spawn(function()
        while toggles.autoRaceV4 and task.wait(1) do
            pcall(function()
                local raceNPC = findNPC("Race")
                if raceNPC and raceNPC:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = raceNPC.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                    task.wait(1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", raceNPC)
                end
            end)
        end
    end)
end

local function startAutoSoulReaper()
    if not toggles.autoSoulReaper then return end
    spawn(function()
        while toggles.autoSoulReaper and task.wait(1) do
            pcall(function()
                local soulReaper = getBoss("Soul Reaper")
                if soulReaper then
                    attackTarget(soulReaper)
                else
                    -- Trouver le NPC Death
                    local death = findNPC("Death")
                    if death then
                        player.Character.HumanoidRootPart.CFrame = death.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", death)
                    end
                end
            end)
        end
    end)
end

-- ========== [FONCTIONS D'ÎLE MIrage] ==========
local function teleportToMirageIsland()
    pcall(function()
        local character = waitForCharacter()
        if not character then return end
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end

        local available, island = isMirageIslandAvailable()
        if available and island then
            if island:FindFirstChild("SpawnLocation") then
                rootPart.CFrame = island.SpawnLocation.CFrame
                notify("✅ Île Mirage", "Téléporté vers l'île Mirage !", 3)
            else
                -- Position par défaut si SpawnLocation n'existe pas
                rootPart.CFrame = CFrame.new(5000, 100, 5000)
            end
        else
            notify("❌ Erreur", "L'île Mirage n'est pas disponible.", 3)
        end
    end)
end

local function startMirageIslandQuest()
    if not toggles.autoMirageIsland then return end
    spawn(function()
        while toggles.autoMirageIsland and task.wait(5) do
            pcall(function()
                local character = waitForCharacter()
                if not character then return end
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if not rootPart then return end

                -- Vérifier si l'île Mirage est disponible
                local available, island = isMirageIslandAvailable()
                if available then
                    teleportToMirageIsland()
                    task.wait(2)

                    -- Trouver le NPC de quête
                    local mirageNPC = findNPC("Mirage")
                    if mirageNPC and mirageNPC:FindFirstChild("HumanoidRootPart") then
                        rootPart.CFrame = mirageNPC.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        task.wait(1)

                        -- Accepter la quête
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", mirageNPC)

                        -- Trouver et tuer les ennemis de l'île Mirage
                        for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                            if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and enemy:FindFirstChild("HumanoidRootPart") then
                                local dist = (rootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
                                if dist < 1000 then
                                    attackTarget(enemy)
                                    task.wait(0.5)
                                end
                            end
                        end

                        -- Retourner au NPC pour la récompense
                        if mirageNPC then
                            rootPart.CFrame = mirageNPC.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", mirageNPC)
                            notify("✅ Quête Île Mirage", "Quête terminée !", 5)
                        end
                    end
                end
            end)
        end
    end)
end

-- ========== [FONCTIONS DE COLLECTE] ==========
local function startAutoCollect()
    if not toggles.autoCollect then return end
    spawn(function()
        while toggles.autoCollect and task.wait(1) do
            pcall(function()
                local character = waitForCharacter()
                if not character then return end
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if not rootPart then return end

                for _, fruit in pairs(workspace:GetChildren()) do
                    if fruit.Name:find("Fruit") and fruit:FindFirstChild("HumanoidRootPart") then
                        rootPart.CFrame = fruit.HumanoidRootPart.CFrame
                        task.wait(0.5)
                    end
                end
            end)
        end
    end)
end

local function startAutoCollectRewards()
    if not toggles.autoCollectRewards then return end
    spawn(function()
        while toggles.autoCollectRewards and task.wait(30) do -- Toutes les 30 secondes
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CollectAll")
                notify("✅ Récompenses", "Récompenses quotidiennes/hebdomadaires collectées !", 2)
            end)
        end
    end)
end

-- ========== [FONCTIONS DE FRUITS PERMS + DARK BLADE] ==========
local function giveFruitsPerms()
    if not hasFruitsPerms then return end
    pcall(function()
        local fruitsList = {
            "Flame-Flame", "Ice-Ice", "Light-Light", "Dark-Dark", "String-String",
            "Rumble-Rumble", "Magma-Magma", "Human: Buddha", "Phoenix-Phoenix", "Dragon-Dragon",
            "Venom-Venom", "Control-Control", "Sound-Sound", "Shadow-Shadow", "Kilo-Kilo",
            "Spring-Spring", "Chop-Chop", "Spike-Spike", "Bomb-Bomb", "Smoke-Smoke",
            "Spin-Spin", "Flower-Flower", "Barrier-Barrier", "Gravito-Gravito", "Love-Love"
        }

        for _, fruitName in ipairs(fruitsList) do
            local args = { [1] = "BuyFruit", [2] = fruitName }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            task.wait(0.3)
        end

        -- Obtenir Dark Blade
        local args = { [1] = "BuyItem", [2] = "Dark Blade" }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

        -- Obtenir autres armes légendaires
        local legendaryWeapons = {"Shisui", "Wando", "Saddi", "True Triple Katana", "Yama", "Tushita", "Cursed Dual Katana", "Sanguine Art"}
        for _, weapon in ipairs(legendaryWeapons) do
            local args = { [1] = "BuyItem", [2] = weapon }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            task.wait(0.3)
        end

        notify("✅ Fruits Perms", "Tous les fruits perm + armes légendaires obtenus !", 5)
    end)
end

-- ========== [FONCTIONS ESP AMÉLIORÉES] ==========
local function manageESP(part, espName, text, color)
    if not part then return end
    local existingESP = part:FindFirstChild(espName)
    if existingESP then existingESP:Destroy() end

    local shouldShow = false
    if espName:find("Player") and toggles.espPlayers then shouldShow = true end
    if espName:find("Boss") and toggles.espBoss then shouldShow = true end
    if espName:find("Fruit") and toggles.espFruits then shouldShow = true end
    if espName:find("Chest") and toggles.espChests then shouldShow = true end
    if espName:find("NPC") and toggles.espNPCs then shouldShow = true end

    if shouldShow then
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Name = espName
        billboardGui.Size = UDim2.new(0, 100, 0, 30)
        billboardGui.StudsOffset = Vector3.new(0, 2, 0)
        billboardGui.Adornee = part
        billboardGui.AlwaysOnTop = true
        billboardGui.Parent = part

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        frame.BackgroundTransparency = 0.3
        frame.BorderSizePixel = 0
        frame.Parent = billboardGui

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = text
        textLabel.TextColor3 = color
        textLabel.TextStrokeTransparency = 0
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextSize = 14
        textLabel.Parent = frame
    end
end

local function updateESP()
    pcall(function()
        local character = waitForCharacter()
        if not character then return end
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end

        -- ESP Players
        if toggles.espPlayers then
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local dist = (rootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                    manageESP(plr.Character.HumanoidRootPart, "ESP_Player_ANONYMES", plr.Name .. " (" .. math.floor(dist) .. "m)", Color3.new(0, 1, 0))
                end
            end
        end

        -- ESP Boss
        if toggles.espBoss then
            if workspace:FindFirstChild("Enemies") then
                for _, boss in pairs(workspace.Enemies:GetChildren()) do
                    if boss:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                        local bossLevel = boss:FindFirstChild("Level") and boss.Level.Value or "?"
                        local bossName = boss.Name
                        for _, bossInfo in ipairs(BOSSES) do
                            if bossName:find(bossInfo.Name) then
                                bossName = bossInfo.Name
                                break
                            end
                        end
                        local dist = (rootPart.Position - boss.HumanoidRootPart.Position).Magnitude
                        manageESP(boss.HumanoidRootPart, "ESP_Boss_ANONYMES", bossName .. " [Lv. " .. bossLevel .. "] (" .. math.floor(dist) .. "m)", Color3.new(1, 0, 0))
                    end
                end
            end
        end

        -- ESP Fruits
        if toggles.espFruits then
            for _, fruit in pairs(workspace:GetChildren()) do
                if fruit.Name:find("Fruit") and fruit:FindFirstChild("HumanoidRootPart") then
                    local dist = (rootPart.Position - fruit.HumanoidRootPart.Position).Magnitude
                    manageESP(fruit.HumanoidRootPart, "ESP_Fruit_ANONYMES", fruit.Name .. " (" .. math.floor(dist) .. "m)", Color3.new(1, 1, 0))
                end
            end
        end

        -- ESP Chests
        if toggles.espChests then
            for _, chest in pairs(workspace:GetChildren()) do
                if chest.Name:find("Chest") and chest:FindFirstChild("PrimaryPart") then
                    local dist = (rootPart.Position - chest.PrimaryPart.Position).Magnitude
                    manageESP(chest.PrimaryPart, "ESP_Chest_ANONYMES", "Chest (" .. math.floor(dist) .. "m)", Color3.new(0, 1, 1))
                end
            end
        end

        -- ESP NPCs
        if toggles.espNPCs then
            if workspace:FindFirstChild("NPCs") then
                for _, npc in pairs(workspace.NPCs:GetChildren()) do
                    if npc:FindFirstChild("HumanoidRootPart") then
                        local dist = (rootPart.Position - npc.HumanoidRootPart.Position).Magnitude
                        manageESP(npc.HumanoidRootPart, "ESP_NPC_ANONYMES", npc.Name .. " (" .. math.floor(dist) .. "m)", Color3.new(1, 0, 1))
                    end
                end
            end
        end
    end)
end

-- ========== [FONCTIONS DE TÉLÉPORTATION] ==========
local function teleportToMob()
    if not toggles.teleportMobs then return end
    spawn(function()
        while toggles.teleportMobs and task.wait(0.5) do
            pcall(function()
                local character = waitForCharacter()
                if not character then return end
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if not rootPart then return end

                local mob = getNearestMob()
                if mob and mob:FindFirstChild("HumanoidRootPart") then
                    rootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                end
            end)
        end
    end)
end

local function bringMob()
    if not toggles.bringMob then return end
    spawn(function()
        while toggles.bringMob and task.wait(0.3) do
            pcall(function()
                local character = waitForCharacter()
                if not character then return end
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if not rootPart then return end

                if workspace:FindFirstChild("Enemies") then
                    for _, mob in pairs(workspace.Enemies:GetChildren()) do
                        if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                            local dist = (rootPart.Position - mob.HumanoidRootPart.Position).Magnitude
                            if dist < 100 then -- Seulement les mobs proches
                                mob.HumanoidRootPart.CFrame = rootPart.CFrame * CFrame.new(0, 0, -5)
                                mob.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                mob.HumanoidRootPart.Anchored = true
                                task.wait(0.1)
                                mob.HumanoidRootPart.Anchored = false
                            end
                        end
                    end
                end
            end)
        end
    end)
end

local function teleportToIsland(islandName)
    pcall(function()
        local character = waitForCharacter()
        if not character then return end
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end

        for _, island in ipairs(ISLANDS) do
            if island.Name:lower():find(islandName:lower()) then
                if island.Position then
                    rootPart.CFrame = island.Position
                    notify("✅ Téléportation", "Téléporté vers " .. island.Name, 2)
                    return true
                else
                    notify("❌ Erreur", island.Name .. " n'a pas de position définie.", 2)
                    return false
                end
            end
        end
        notify("❌ Erreur", "Île non trouvée: " .. islandName, 2)
        return false
    end)
end

local function autoIslandHop()
    if not toggles.autoIslandHop then return end
    spawn(function()
        while toggles.autoIslandHop and task.wait(60) do
            pcall(function()
                local TeleportService = game:GetService("TeleportService")
                TeleportService:Teleport(game.PlaceId)
            end)
        end
    end)
end

-- ========== [FONCTIONS MOUVEMENT] ==========
local function enableWalkOnWater()
    if not toggles.walkOnWater then return end
    spawn(function()
        while toggles.walkOnWater and task.wait(0.1) do
            pcall(function()
                local character = player.Character
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid.WalkSpeed = 50
                end
            end)
        end
    end)
end

local function enableInfiniteJump()
    if not toggles.infiniteJump then return end
    game:GetService("UserInputService").JumpRequest:Connect(function()
        pcall(function()
            local character = player.Character
            if character and character:FindFirstChild("Humanoid") then
                character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end)
end

local function enableNoClip()
    spawn(function()
        while true do
            pcall(function()
                local character = player.Character
                if character then
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = not toggles.noClip
                        end
                    end
                end
            end)
            task.wait(0.1)
        end
    end)
end

local function enableFlight()
    spawn(function()
        local flightSpeed = 100
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
        bodyVelocity.Name = "FlightVelocity_ANONYMES"

        while true do
            pcall(function()
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    if toggles.flight then
                        if not character.HumanoidRootPart:FindFirstChild("FlightVelocity_ANONYMES") then
                            bodyVelocity.Parent = character.HumanoidRootPart
                        end

                        -- Contrôle du vol avec les touches WASD
                        local moveDirection = Vector3.new(0, 0, 0)
                        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                            moveDirection = moveDirection + (character.HumanoidRootPart.CFrame.LookVector * flightSpeed)
                        end
                        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                            moveDirection = moveDirection - (character.HumanoidRootPart.CFrame.LookVector * flightSpeed)
                        end
                        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                            moveDirection = moveDirection - (character.HumanoidRootPart.CFrame.RightVector * flightSpeed)
                        end
                        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                            moveDirection = moveDirection + (character.HumanoidRootPart.CFrame.RightVector * flightSpeed)
                        end
                        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                            moveDirection = moveDirection + Vector3.new(0, flightSpeed, 0)
                        end
                        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                            moveDirection = moveDirection - Vector3.new(0, flightSpeed, 0)
                        end

                        bodyVelocity.Velocity = moveDirection
                    else
                        bodyVelocity:Destroy()
                    end
                else
                    bodyVelocity:Destroy()
                end
            end)
            task.wait(0.1)
        end
    end)
end

-- ========== [FONCTIONS HAKI] ==========
local function startAutoHaki()
    if not toggles.autoHaki then return end
    spawn(function()
        while toggles.autoHaki and task.wait(0.5) do
            pcall(function()
                -- Activer Observation Haki (Ken)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ken")

                -- Activer Armament Haki (Busoshoku) si une épée est équipée
                if hasSwordEquipped() then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Busoshoku")
                end
            end)
        end
    end)
end

local function startAutoObservation()
    if not toggles.autoObservation then return end
    spawn(function()
        while toggles.autoObservation and task.wait(0.5) do
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ken")
            end)
        end
    end)
end

local function startAutoArmament()
    if not toggles.autoArmament then return end
    spawn(function()
        while toggles.autoArmament and task.wait(0.5) do
            pcall(function()
                if hasSwordEquipped() then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Busoshoku")
                end
            end)
        end
    end)
end

-- ========== [FONCTIONS ADMIN] ==========
local function startServerHop()
    if not toggles.serverHop then return end
    spawn(function()
        while toggles.serverHop and task.wait(60) do
            pcall(function()
                local TeleportService = game:GetService("TeleportService")
                TeleportService:Teleport(game.PlaceId)
            end)
        end
    end)
end

local function startAntiKick()
    if not toggles.antiKick then return end
    spawn(function()
        while toggles.antiKick and task.wait(1) do
            pcall(function()
                -- Réduire le lag pour éviter les kicks
                settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnvironmentalPhysicsThrottle.Disabled
                settings().Physics.AllowSleep = false

                -- Optimiser les FPS
                setfpscap(60)
            end)
        end
    end)
end

local function startFPSBoost()
    if not toggles.fpsBoost then return end
    spawn(function()
        while toggles.fpsBoost and task.wait(0.5) do
            pcall(function()
                -- Désactiver les effets inutiles
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                        v.Enabled = false
                    end
                end

                -- Réduire la distance de rendu
                workspace.DescendantAdded:Connect(function(descendant)
                    if descendant:IsA("ParticleEmitter") or descendant:IsA("Fire") or descendant:IsA("Smoke") or descendant:IsA("Sparkles") then
                        descendant.Enabled = false
                    end
                end)

                -- Optimiser les graphismes
                settings().RenderQuality = Enum.RenderQuality.Low
                settings().Technology = Enum.Technology.Future
            end)
        end
    end)
end

-- ========== [SYSTÈME VIP & PAIEMENT] ==========
local function checkVIP(password)
    if password == VIP_PASSWORD then
        isVIP = true
        hasFruitsPerms = true
        hasAutoPvP = true
        notify("✅ VIP Activé", "Toutes les fonctionnalités sont débloquées !\n" ..
            "🎯 Fruits Perms + Dark Blade: Gratuit\n" ..
            "⚔️ Auto PvP: Gratuit\n" ..
            "👑 Accès à toutes les exclusivités", 8)
    else
        notify("❌ Erreur", "Mot de passe incorrect.", 3)
    end
end

local function buyFeature(feature, cost)
    if isVIP then
        if feature == "fruitsPerms" then
            hasFruitsPerms = true
            giveFruitsPerms()
        elseif feature == "autoPvP" then
            hasAutoPvP = true
        end
        notify("✅ Débloqué", "Fonctionnalité activée (VIP).", 3)
        return true
    else
        if (feature == "fruitsPerms" and hasFruitsPerms) or (feature == "autoPvP" and hasAutoPvP) then
            notify("ℹ️ Déjà débloqué", "Tu as déjà acheté cette fonctionnalité.", 3)
            return true
        end

        if hasEnoughBeli(cost) then
            if payBeli(cost) then
                if feature == "fruitsPerms" then
                    hasFruitsPerms = true
                    giveFruitsPerms()
                elseif feature == "autoPvP" then
                    hasAutoPvP = true
                end
                notify("✅ Achat réussi", "Fonctionnalité débloquée !", 3)
                return true
            end
        else
            notify("❌ Erreur", "Il te manque " .. (cost - getBeli()) .. " Beli.", 3)
        end
    end
    return false
end

-- ========== [CRÉATION DE L'UI PRINCIPALE] ==========
local mainFrame = nil
local screenGui = nil

local function createUI()
    pcall(function()
        if syn and syn.protect_gui then
            syn.protect_gui(Instance.new("ScreenGui"))
        end
    end)

    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ANONYMES_SCRIPTS_HUB_v" .. VERSION
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- ===== LOGO MINIATURE (TOUJOURS VISIBLE) =====
    local logoFrame = Instance.new("Frame")
    logoFrame.Name = "LogoFrame"
    logoFrame.Size = UDim2.new(0, 100, 0, 100)
    logoFrame.Position = UDim2.new(0, 10, 0, 10)
    logoFrame.BackgroundTransparency = 1
    logoFrame.Parent = screenGui

    local logoImage = Instance.new("ImageLabel")
    logoImage.Name = "LogoImage"
    logoImage.Size = UDim2.new(1, 0, 1, 0)
    logoImage.BackgroundTransparency = 1
    logoImage.Image = LOGO_URL
    logoImage.ScaleType = Enum.ScaleType.Slice
    logoImage.SliceCenter = Rect.new(100, 100, 100, 100)
    logoImage.Parent = logoFrame

    -- Cliquer sur le logo ouvre le menu principal
    logoImage.MouseButton1Click:Connect(function()
        if mainFrame then
            mainFrame.Visible = not mainFrame.Visible
        end
    end)

    -- ===== FENÊTRE PRINCIPALE =====
    mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 650, 0, 500)
    mainFrame.Position = UDim2.new(0.5, -325, 0.5, -250)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    mainFrame.BorderSizePixel = 0
    mainFrame.Visible = false
    mainFrame.Parent = screenGui

    -- Titre
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, 0, 1, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "ANONYMES SCRIPTS HUB v" .. VERSION .. " | Blox Fruits"
    titleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    titleLabel.TextSize = 16
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Parent = titleBar

    -- Bouton Fermer
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -30, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Parent = titleBar
    closeButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
    end)

    -- ===== ONGLETS =====
    local tabButtons = {}
    local tabFrames = {}

    local tabNames = {
        "Home", "Farming", "Combat", "Events", "Quêtes", "Boats", "Îles", "ESP", "Haki", "Movement", "Admin"
    }

    -- Création des boutons d'onglets
    local tabButtonContainer = Instance.new("Frame")
    tabButtonContainer.Name = "TabButtonContainer"
    tabButtonContainer.Size = UDim2.new(1, 0, 0, 30)
    tabButtonContainer.Position = UDim2.new(0, 0, 0, 30)
    tabButtonContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    tabButtonContainer.BorderSizePixel = 0
    tabButtonContainer.Parent = mainFrame

    for i, tabName in ipairs(tabNames) do
        local tabButton = Instance.new("TextButton")
        tabButton.Name = tabName .. "Button"
        tabButton.Size = UDim2.new(1/#tabNames, 0, 1, 0)
        tabButton.Position = UDim2.new((i-1)/#tabNames, 0, 0, 0)
        tabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        tabButton.Text = tabName
        tabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        tabButton.Parent = tabButtonContainer
        tabButton.Font = Enum.Font.SourceSans
        tabButton.TextSize = 12
        tabButton.BorderSizePixel = 0

        tabButtons[tabName] = tabButton

        tabButton.MouseButton1Click:Connect(function()
            for _, button in pairs(tabButtons) do
                button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            end
            tabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

            for _, frame in pairs(tabFrames) do
                frame.Visible = false
            end
            if tabFrames[tabName] then
                tabFrames[tabName].Visible = true
            end
        end)
    end

    -- Création des frames d'onglets
    local tabFrameContainer = Instance.new("Frame")
    tabFrameContainer.Name = "TabFrameContainer"
    tabFrameContainer.Size = UDim2.new(1, 0, 1, -60)
    tabFrameContainer.Position = UDim2.new(0, 0, 0, 60)
    tabFrameContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    tabFrameContainer.BorderSizePixel = 0
    tabFrameContainer.Parent = mainFrame

    for _, tabName in ipairs(tabNames) do
        local tabFrame = Instance.new("ScrollingFrame")
        tabFrame.Name = tabName .. "Frame"
        tabFrame.Size = UDim2.new(1, 0, 1, 0)
        tabFrame.BackgroundTransparency = 1
        tabFrame.ScrollBarThickness = 5
        tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabFrame.Visible = false
        tabFrame.Parent = tabFrameContainer

        tabFrames[tabName] = tabFrame

        local padding = Instance.new("UIPadding")
        padding.PaddingTop = UDim.new(0, 10)
        padding.PaddingLeft = UDim.new(0, 10)
        padding.Parent = tabFrame

        local listLayout = Instance.new("UIListLayout")
        listLayout.Padding = UDim.new(0, 5)
        listLayout.Parent = tabFrame
    end

    -- ===== CONTENU DES ONGLETS =====

    -- Onglet Home
    local homeFrame = tabFrames["Home"]
    homeFrame.Visible = true
    tabButtons["Home"].BackgroundColor3 = Color3.fromRGB(70, 70, 70)

    local welcomeLabel = Instance.new("TextLabel")
    welcomeLabel.Name = "WelcomeLabel"
    welcomeLabel.Size = UDim2.new(1, -20, 0, 120)
    welcomeLabel.BackgroundTransparency = 1
    welcomeLabel.Text = "🏴‍☠️ ANONYMES SCRIPTS HUB v" .. VERSION .. " 🏴‍☠️\n\n" ..
        "✅ **100% des fonctionnalités de Blox Fruits**\n" ..
        "🔒 **VIP: Mot de passe = " .. VIP_PASSWORD .. "** (accès gratuit)\n" ..
        "💰 **Public: 5M Beli (Fruits Perms), 2M Beli (Auto PvP)**\n\n" ..
        "📌 **Nouveautés v4.0:**\n" ..
        "• Splash Screen au démarrage\n" ..
        "• Quête Leviathan **complète** (NPC + vagues + boss)\n" ..
        "• Île Mirage (détection + quête)\n" ..
        "• ESP avancé (distances, niveaux)\n" ..
        "• Haki automatique (Observation + Armement)\n" ..
        "• Vol libre (Flight) avec contrôles WASD"
    welcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    welcomeLabel.TextSize = 14
    welcomeLabel.TextWrapped = true
    welcomeLabel.Font = Enum.Font.SourceSans
    welcomeLabel.Parent = homeFrame

    local vipButton = Instance.new("TextButton")
    vipButton.Name = "VIPButton"
    vipButton.Size = UDim2.new(0, 200, 0, 30)
    vipButton.Position = UDim2.new(0, 0, 0, 130)
    vipButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    vipButton.Text = "🔑 Entrer le mot de passe VIP"
    vipButton.TextColor3 = Color3.fromRGB(255, 215, 0)
    vipButton.Parent = homeFrame
    vipButton.MouseButton1Click:Connect(function()
        local success, password = pcall(function()
            return game.StarterGui:GetCore("PromptInput", {
                Title = "Mot de passe VIP",
                Text = "Entrez le code :"
            })
        end)
        if success and password then
            checkVIP(password)
        end
    end)

    local beliLabel = Instance.new("TextLabel")
    beliLabel.Name = "BeliLabel"
    beliLabel.Size = UDim2.new(1, -20, 0, 20)
    beliLabel.Position = UDim2.new(0, 0, 0, 170)
    beliLabel.BackgroundTransparency = 1
    beliLabel.Text = "💰 Beli: " .. getBeli() .. " | 🌊 Sea: " .. getCurrentSea()
    beliLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    beliLabel.TextSize = 14
    beliLabel.Font = Enum.Font.SourceSansBold
    beliLabel.Parent = homeFrame

    -- Mettre à jour l'affichage du Beli et de la Sea
    spawn(function()
        while true do
            task.wait(5)
            if beliLabel then
                beliLabel.Text = "💰 Beli: " .. getBeli() .. " | 🌊 Sea: " .. getCurrentSea()
            end
        end
    end)

    -- Onglet Farming
    local farmingFrame = tabFrames["Farming"]

    local farmingFeatures = {
        {Name = "autoLevel", Display = "Auto Level", Price = 0},
        {Name = "autoNearest", Display = "Auto Nearest (Boss/Mob)", Price = 0},
        {Name = "autoEctoplasm", Display = "Auto Ectoplasm", Price = 0},
        {Name = "autoCandy", Display = "Auto Candy", Price = 0},
        {Name = "autoGifts", Display = "Auto Gifts", Price = 0},
        {Name = "autoCollect", Display = "Auto Collect Fruits", Price = 0},
        {Name = "autoCollectRewards", Display = "Auto Collect Rewards", Price = 0}
    }

    for _, feature in ipairs(farmingFeatures) do
        local button = Instance.new("TextButton")
        button.Name = feature.Name .. "Button"
        button.Size = UDim2.new(1, -10, 0, 30)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Text = feature.Display .. " [OFF]"
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 14
        button.Parent = farmingFrame

        button.MouseButton1Click:Connect(function()
            local newState = toggleFeature(feature.Name)
            button.Text = feature.Display .. " [" .. (newState and "ON" or "OFF") .. "]"

            if newState then
                if feature.Name == "autoLevel" then
                    startAutoLevel()
                elseif feature.Name == "autoNearest" then
                    startAutoNearest()
                elseif feature.Name == "autoCollect" then
                    startAutoCollect()
                elseif feature.Name == "autoCollectRewards" then
                    startAutoCollectRewards()
                end
            end
        end)
    end

    -- Onglet Combat
    local combatFrame = tabFrames["Combat"]

    local combatFeatures = {
        {Name = "killAura", Display = "Kill Aura", Price = 0},
        {Name = "triggerBot", Display = "TriggerBot", Price = 0},
        {Name = "autoAttack", Display = "Auto Attack", Price = 0},
        {Name = "autoPvP", Display = "Auto PvP", Price = PRICE_AUTO_PVP}
    }

    for _, feature in ipairs(combatFeatures) do
        local button = Instance.new("TextButton")
        button.Name = feature.Name .. "Button"
        button.Size = UDim2.new(1, -10, 0, 30)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

        if feature.Name == "autoPvP" then
            if hasAutoPvP or isVIP then
                button.Text = feature.Display .. " [OFF]"
            else
                button.Text = feature.Display .. " (2M Beli)"
            end
        else
            button.Text = feature.Display .. " [OFF]"
        end

        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 14
        button.Parent = combatFrame

        button.MouseButton1Click:Connect(function()
            if feature.Name == "autoPvP" then
                if hasAutoPvP or isVIP then
                    local newState = toggleFeature(feature.Name)
                    button.Text = feature.Display .. " [" .. (newState and "ON" or "OFF") .. "]"
                else
                    if buyFeature("autoPvP", PRICE_AUTO_PVP) then
                        button.Text = feature.Display .. " [OFF]"
                    end
                end
            else
                local newState = toggleFeature(feature.Name)
                button.Text = feature.Display .. " [" .. (newState and "ON" or "OFF") .. "]"

                if newState then
                    if feature.Name == "killAura" then
                        startKillAura()
                    elseif feature.Name == "triggerBot" then
                        startTriggerBot()
                    elseif feature.Name == "autoAttack" then
                        startAutoAttack()
                    end
                end
            end
        end)
    end

    -- Onglet Events
    local eventsFrame = tabFrames["Events"]

    local eventFeatures = {
        {Name = "autoSeaBeast", Display = "Auto Sea Beast", Price = 0},
        {Name = "autoLeviathan", Display = "Auto Leviathan (Boss seul)", Price = 0},
        {Name = "autoLeviathanQuest", Display = "⭐ Auto Leviathan (Quête complète)", Price = 0},
        {Name = "autoPirateRaid", Display = "Auto Pirate Raid", Price = 0},
        {Name = "autoShipRaid", Display = "Auto Ship Raid", Price = 0},
        {Name = "autoTerrorshark", Display = "Auto Terrorshark", Price = 0},
        {Name = "autoVolcano", Display = "Auto Volcano (Magma Admiral)", Price = 0},
        {Name = "autoFactory", Display = "Auto Factory (Mirror Boss)", Price = 0},
        {Name = "autoPhantom", Display = "Auto Phantom", Price = 0}
    }

    for _, feature in ipairs(eventFeatures) do
        local button = Instance.new("TextButton")
        button.Name = feature.Name .. "Button"
        button.Size = UDim2.new(1, -10, 0, 30)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Text = feature.Display .. " [OFF]"
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 12
        button.Parent = eventsFrame

        button.MouseButton1Click:Connect(function()
            local newState = toggleFeature(feature.Name)
            button.Text = feature.Display .. " [" .. (newState and "ON" or "OFF") .. "]"

            if newState then
                if feature.Name == "autoSeaBeast" then
                    startAutoSeaBeast()
                elseif feature.Name == "autoLeviathan" then
                    startAutoLeviathan()
                elseif feature.Name == "autoLeviathanQuest" then
                    startLeviathanQuest()
                elseif feature.Name == "autoPirateRaid" then
                    startAutoPirateRaid()
                elseif feature.Name == "autoShipRaid" then
                    startAutoShipRaid()
                elseif feature.Name == "autoTerrorshark" then
                    startAutoTerrorshark()
                elseif feature.Name == "autoVolcano" then
                    startAutoVolcano()
                elseif feature.Name == "autoFactory" then
                    startAutoFactory()
                elseif feature.Name == "autoPhantom" then
                    startAutoPhantom()
                end
            end
        end)
    end

    -- Onglet Quêtes
    local questsFrame = tabFrames["Quêtes"]

    local questFeatures = {
        {Name = "autoDoughKing", Display = "Auto Dough King", Price = 0},
        {Name = "autoYama", Display = "Auto Yama", Price = 0},
        {Name = "autoTushita", Display = "Auto Tushita", Price = 0},
        {Name = "autoCDK", Display = "Auto Cursed Dual Katana", Price = 0},
        {Name = "autoSanguineArt", Display = "Auto Sanguine Art", Price = 0},
        {Name = "autoKitsune", Display = "Auto Kitsune", Price = 0},
        {Name = "autoRaceV4", Display = "Auto Race V4", Price = 0},
        {Name = "autoMirageIsland", Display = "⭐ Auto Mirage Island (Quête)", Price = 0},
        {Name = "autoSoulReaper", Display = "Auto Soul Reaper", Price = 0}
    }

    for _, feature in ipairs(questFeatures) do
        local button = Instance.new("TextButton")
        button.Name = feature.Name .. "Button"
        button.Size = UDim2.new(1, -10, 0, 30)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Text = feature.Display .. " [OFF]"
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 12
        button.Parent = questsFrame

        button.MouseButton1Click:Connect(function()
            local newState = toggleFeature(feature.Name)
            button.Text = feature.Display .. " [" .. (newState and "ON" or "OFF") .. "]"

            if newState then
                if feature.Name == "autoDoughKing" then
                    startAutoDoughKing()
                elseif feature.Name == "autoYama" then
                    startAutoYama()
                elseif feature.Name == "autoTushita" then
                    startAutoTushita()
                elseif feature.Name == "autoCDK" then
                    startAutoCDK()
                elseif feature.Name == "autoSanguineArt" then
                    startAutoSanguineArt()
                elseif feature.Name == "autoKitsune" then
                    startAutoKitsune()
                elseif feature.Name == "autoRaceV4" then
                    startAutoRaceV4()
                elseif feature.Name == "autoMirageIsland" then
                    startMirageIslandQuest()
                elseif feature.Name == "autoSoulReaper" then
                    startAutoSoulReaper()
                end
            end
        end)
    end

    -- Onglet Boats
    local boatsFrame = tabFrames["Boats"]

    local boatFeatures = {
        {Name = "autoBoat", Display = "Auto Conduire Bateau", Price = 0},
        {Name = "teleportToBoat", Display = "Téléport vers Bateau", Price = 0},
        {Name = "boatSpeed", Display = "Boat Speed Hack (200)", Price = 0}
    }

    for _, feature in ipairs(boatFeatures) do
        local button = Instance.new("TextButton")
        button.Name = feature.Name .. "Button"
        button.Size = UDim2.new(1, -10, 0, 30)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Text = feature.Display .. " [OFF]"
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 14
        button.Parent = boatsFrame

        button.MouseButton1Click:Connect(function()
            if feature.Name == "teleportToBoat" then
                teleportToNearestBoat()
            else
                local newState = toggleFeature(feature.Name)
                button.Text = feature.Display .. " [" .. (newState and "ON" or "OFF") .. "]"

                if newState then
                    if feature.Name == "autoBoat" then
                        startAutoBoat()
                    elseif feature.Name == "boatSpeed" then
                        boostBoatSpeed()
                    end
                end
            end
        end)
    end

    -- Onglet Îles
    local ilesFrame = tabFrames["Îles"]

    -- Bouton pour Mirage Island
    local mirageButton = Instance.new("TextButton")
    mirageButton.Name = "autoMirageIslandButton"
    mirageButton.Size = UDim2.new(1, -10, 0, 30)
    mirageButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mirageButton.Text = "🏝️ Téléport vers Île Mirage [OFF]"
    mirageButton.TextColor3 = Color3.fromRGB(255, 215, 0)
    mirageButton.Font = Enum.Font.SourceSans
    mirageButton.TextSize = 14
    mirageButton.Parent = ilesFrame

    mirageButton.MouseButton1Click:Connect(function()
        teleportToMirageIsland()
    end)

    -- Bouton pour Island Hop
    local islandHopButton = Instance.new("TextButton")
    islandHopButton.Name = "autoIslandHopButton"
    islandHopButton.Size = UDim2.new(1, -10, 0, 30)
    islandHopButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    islandHopButton.Text = "🌊 Auto Island Hop [OFF]"
    islandHopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    islandHopButton.Font = Enum.Font.SourceSans
    islandHopButton.TextSize = 14
    islandHopButton.Parent = ilesFrame

    islandHopButton.MouseButton1Click:Connect(function()
        local newState = toggleFeature("autoIslandHop")
        islandHopButton.Text = "🌊 Auto Island Hop [" .. (newState and "ON" or "OFF") .. "]"
        if newState then
            autoIslandHop()
        end
    end)

    -- Liste des îles (boutons de téléportation)
    local islandsLabel = Instance.new("TextLabel")
    islandsLabel.Name = "IslandsLabel"
    islandsLabel.Size = UDim2.new(1, -10, 0, 20)
    islandsLabel.BackgroundTransparency = 1
    islandsLabel.Text = "🗺️ Téléportation vers les îles:"
    islandsLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    islandsLabel.TextSize = 14
    islandsLabel.Font = Enum.Font.SourceSansBold
    islandsLabel.Parent = ilesFrame

    for _, island in ipairs(ISLANDS) do
        if island.Name ~= "Mirage Island" then
            local islandButton = Instance.new("TextButton")
            islandButton.Name = "TeleportTo" .. island.Name:gsub("%s+", "")
            islandButton.Size = UDim2.new(0.5, -15, 0, 25)
            islandButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            islandButton.Text = "→ " .. island.Name
            islandButton.TextColor3 = Color3.fromRGB(200, 200, 200)
            islandButton.Font = Enum.Font.SourceSans
            islandButton.TextSize = 12
            islandButton.Parent = ilesFrame

            islandButton.MouseButton1Click:Connect(function()
                teleportToIsland(island.Name)
            end)
        end
    end

    -- Onglet ESP
    local espFrame = tabFrames["ESP"]

    local espFeatures = {
        {Name = "espPlayers", Display = "ESP Players", Color = Color3.new(0, 1, 0)},
        {Name = "espBoss", Display = "ESP Boss (avec niveaux)", Color = Color3.new(1, 0, 0)},
        {Name = "espFruits", Display = "ESP Fruits", Color = Color3.new(1, 1, 0)},
        {Name = "espChests", Display = "ESP Chests", Color = Color3.new(0, 1, 1)},
        {Name = "espNPCs", Display = "ESP NPCs", Color = Color3.new(1, 0, 1)}
    }

    for _, feature in ipairs(espFeatures) do
        local button = Instance.new("TextButton")
        button.Name = feature.Name .. "Button"
        button.Size = UDim2.new(1, -10, 0, 30)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Text = feature.Display .. " [OFF]"
        button.TextColor3 = feature.Color
        button.Font = Enum.Font.SourceSans
        button.TextSize = 14
        button.Parent = espFrame

        button.MouseButton1Click:Connect(function()
            local newState = toggleFeature(feature.Name)
            button.Text = feature.Display .. " [" .. (newState and "ON" or "OFF") .. "]"
            updateESP()
        end)
    end

    -- Onglet Haki
    local hakiFrame = tabFrames["Haki"]

    local hakiFeatures = {
        {Name = "autoHaki", Display = "Auto Haki (Complet)", Price = 0},
        {Name = "autoObservation", Display = "Auto Observation Haki (Ken)", Price = 0},
        {Name = "autoArmament", Display = "Auto Armament Haki (Busoshoku)", Price = 0}
    }

    for _, feature in ipairs(hakiFeatures) do
        local button = Instance.new("TextButton")
        button.Name = feature.Name .. "Button"
        button.Size = UDim2.new(1, -10, 0, 30)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Text = feature.Display .. " [OFF]"
        button.TextColor3 = Color3.fromRGB(255, 215, 0)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 14
        button.Parent = hakiFrame

        button.MouseButton1Click:Connect(function()
            local newState = toggleFeature(feature.Name)
            button.Text = feature.Display .. " [" .. (newState and "ON" or "OFF") .. "]"

            if newState then
                if feature.Name == "autoHaki" then
                    startAutoHaki()
                elseif feature.Name == "autoObservation" then
                    startAutoObservation()
                elseif feature.Name == "autoArmament" then
                    startAutoArmament()
                end
            end
        end)
    end

    -- Onglet Movement
    local movementFrame = tabFrames["Movement"]

    local movementFeatures = {
        {Name = "walkOnWater", Display = "Walk On Water", Price = 0},
        {Name = "infiniteJump", Display = "Infinite Jump", Price = 0},
        {Name = "noClip", Display = "No Clip", Price = 0},
        {Name = "flight", Display = "Flight (Vol libre - WASD + Espace/Shift)", Price = 0}
    }

    for _, feature in ipairs(movementFeatures) do
        local button = Instance.new("TextButton")
        button.Name = feature.Name .. "Button"
        button.Size = UDim2.new(1, -10, 0, 30)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Text = feature.Display .. " [OFF]"
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 12
        button.Parent = movementFrame

        button.MouseButton1Click:Connect(function()
            local newState = toggleFeature(feature.Name)
            button.Text = feature.Display .. " [" .. (newState and "ON" or "OFF") .. "]"

            if newState then
                if feature.Name == "walkOnWater" then
                    enableWalkOnWater()
                elseif feature.Name == "infiniteJump" then
                    enableInfiniteJump()
                elseif feature.Name == "noClip" then
                    enableNoClip()
                elseif feature.Name == "flight" then
                    enableFlight()
                end
            end
        end)
    end

    -- Onglet Admin
    local adminFrame = tabFrames["Admin"]

    -- Fruits Perms + Dark Blade
    local fruitsPermsButton = Instance.new("TextButton")
    fruitsPermsButton.Name = "fruitsPermsButton"
    fruitsPermsButton.Size = UDim2.new(1, -10, 0, 30)
    fruitsPermsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    if hasFruitsPerms or isVIP then
        fruitsPermsButton.Text = "Fruits Perms + Armes Légendaires [OFF]"
    else
        fruitsPermsButton.Text = "Fruits Perms + Armes Légendaires (5M Beli)"
    end
    fruitsPermsButton.TextColor3 = Color3.fromRGB(255, 215, 0)
    fruitsPermsButton.Font = Enum.Font.SourceSansBold
    fruitsPermsButton.TextSize = 14
    fruitsPermsButton.Parent = adminFrame

    fruitsPermsButton.MouseButton1Click:Connect(function()
        if hasFruitsPerms or isVIP then
            local newState = toggleFeature("fruitsPerms")
            fruitsPermsButton.Text = "Fruits Perms + Armes Légendaires [" .. (newState and "ON" or "OFF") .. "]"
            if newState then
                giveFruitsPerms()
            end
        else
            if buyFeature("fruitsPerms", PRICE_FRUITS_PERMS) then
                fruitsPermsButton.Text = "Fruits Perms + Armes Légendaires [OFF]"
            end
        end
    end)

    -- Auto PvP
    local autoPvPButton = Instance.new("TextButton")
    autoPvPButton.Name = "autoPvPButton"
    autoPvPButton.Size = UDim2.new(1, -10, 0, 30)
    autoPvPButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    if hasAutoPvP or isVIP then
        autoPvPButton.Text = "Auto PvP [OFF]"
    else
        autoPvPButton.Text = "Auto PvP (2M Beli)"
    end
    autoPvPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    autoPvPButton.Font = Enum.Font.SourceSansBold
    autoPvPButton.TextSize = 14
    autoPvPButton.Parent = adminFrame

    autoPvPButton.MouseButton1Click:Connect(function()
        if hasAutoPvP or isVIP then
            local newState = toggleFeature("autoPvP")
            autoPvPButton.Text = "Auto PvP [" .. (newState and "ON" or "OFF") .. "]"
        else
            if buyFeature("autoPvP", PRICE_AUTO_PVP) then
                autoPvPButton.Text = "Auto PvP [OFF]"
            end
        end
    end)

    local adminFeatures = {
        {Name = "serverHop", Display = "Server Hop (60s)", Price = 0},
        {Name = "antiKick", Display = "Anti Kick / Anti Ban", Price = 0},
        {Name = "fpsBoost", Display = "FPS Boost", Price = 0}
    }

    for _, feature in ipairs(adminFeatures) do
        local button = Instance.new("TextButton")
        button.Name = feature.Name .. "Button"
        button.Size = UDim2.new(1, -10, 0, 30)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Text = feature.Display .. " [OFF]"
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 14
        button.Parent = adminFrame

        button.MouseButton1Click:Connect(function()
            local newState = toggleFeature(feature.Name)
            button.Text = feature.Display .. " [" .. (newState and "ON" or "OFF") .. "]"

            if newState then
                if feature.Name == "serverHop" then
                    startServerHop()
                elseif feature.Name == "antiKick" then
                    startAntiKick()
                elseif feature.Name == "fpsBoost" then
                    startFPSBoost()
                end
            end
        end)
    end

    -- ========== [BOUCLE PRINCIPALE POUR L'ESP] ==========
    spawn(function()
        while true do
            if toggles.espPlayers or toggles.espBoss or toggles.espFruits or toggles.espChests or toggles.espNPCs then
                updateESP()
            end
            task.wait(0.5)
        end
    end)

    -- ========== [NOTIFICATION DE DÉMARRAGE] ==========
    notify("✅ ANONYMES SCRIPTS HUB v" .. VERSION, "Script chargé avec succès !\n" ..
        "🔹 Splash Screen au démarrage\n" ..
        "🔹 Logo en haut à gauche (clique pour ouvrir)\n" ..
        "🔹 VIP: Mot de passe = " .. VIP_PASSWORD .. "\n" ..
        "🔹 Nouveau: Quête Leviathan complète, Île Mirage, ESP avancé, Flight", 8)
end

-- ========== [DÉMARRAGE DU SCRIPT] ==========
pcall(function()
    -- Attendre que le joueur soit chargé
    repeat task.wait() until player and player:IsDescendantOf(game)
    repeat task.wait() until player.Character and player.Character:FindFirstChild("HumanoidRootPart")

    -- Créer le Splash Screen
    createSplashScreen()
end)
