-- ANONYMES SCRIPTS HUB v4.1 | Blox Fruits
local VERSION = "4.1"
local VIP_PASSWORD = "98961144"
local PRICE_FRUITS_PERMS = 5000000
local PRICE_AUTO_PVP = 2000000
local LOGO_URL = "rbxassetid://88742532715379"

local BOSSES = {
    {Name = "Bandit", Level = 150, Sea = 1, Type = "Normal"},
    {Name = "Leader", Level = 300, Sea = 1, Type = "Normal"},
    {Name = "Brute", Level = 500, Sea = 1, Type = "Normal"},
    {Name = "The Saw", Level = 1000, Sea = 1, Type = "Normal"},
    {Name = "Shank", Level = 1100, Sea = 1, Type = "Normal"},
    {Name = "Don Swan", Level = 1000, Sea = 2, Type = "Normal"},
    {Name = "Jeremy", Level = 1050, Sea = 2, Type = "Normal"},
    {Name = "Saber Expert", Level = 1100, Sea = 2, Type = "Normal"},
    {Name = "The Gorilla King", Level = 1200, Sea = 2, Type = "Normal"},
    {Name = "Don Swan [Lv. 1000]", Level = 1000, Sea = 3, Type = "Normal"},
    {Name = "Jeremy [Lv. 1050]", Level = 1050, Sea = 3, Type = "Normal"},
    {Name = "Wysper", Level = 1100, Sea = 3, Type = "Normal"},
    {Name = "Thunder God", Level = 1150, Sea = 3, Type = "Normal"},
    {Name = "Cursed Captain", Level = 1200, Sea = 3, Type = "Normal"},
    {Name = "Stone", Level = 1500, Sea = 3, Type = "Normal"},
    {Name = "Island Empress", Level = 1600, Sea = 3, Type = "Normal"},
    {Name = "Kilo Admiral", Level = 1700, Sea = 3, Type = "Normal"},
    {Name = "Dough King", Level = 0, Sea = 0, Type = "Raid"},
    {Name = "Leviathan", Level = 0, Sea = 0, Type = "Raid"},
    {Name = "Phantom", Level = 0, Sea = 0, Type = "Raid"},
    {Name = "Sea Beast", Level = 0, Sea = 0, Type = "Event"},
    {Name = "Terrorshark", Level = 0, Sea = 0, Type = "Event"},
    {Name = "Magma Admiral", Level = 0, Sea = 0, Type = "Volcano"},
    {Name = "Mirror Boss", Level = 0, Sea = 0, Type = "Factory"},
    {Name = "Kitsune", Level = 0, Sea = 0, Type = "Special"},
    {Name = "Longma", Level = 0, Sea = 0, Type = "Special"},
    {Name = "Soul Reaper", Level = 0, Sea = 0, Type = "Special"}
}

local ISLANDS = {
    {Name = "Starter Island", Sea = 1, Position = CFrame.new(-1000, 10, -1000)},
    {Name = "Jungle", Sea = 1, Position = CFrame.new(-600, 10, -800)},
    {Name = "Pirate Village", Sea = 1, Position = CFrame.new(-1200, 10, -300)},
    {Name = "Desert", Sea = 1, Position = CFrame.new(-700, 10, 500)},
    {Name = "Snow Island", Sea = 1, Position = CFrame.new(-1300, 10, 1200)},
    {Name = "Marine Fortress", Sea = 1, Position = CFrame.new(-2500, 10, -2000)},
    {Name = "Prison", Sea = 1, Position = CFrame.new(-5000, 10, -5000)},
    {Name = "Magma Village", Sea = 1, Position = CFrame.new(-5500, 10, -5500)},
    {Name = "Port Town", Sea = 2, Position = CFrame.new(1000, 10, -1000)},
    {Name = "Kingdom of Rose", Sea = 2, Position = CFrame.new(1500, 10, -1500)},
    {Name = "Usopp Island", Sea = 2, Position = CFrame.new(2000, 10, -2000)},
    {Name = "Fountain City", Sea = 2, Position = CFrame.new(3000, 10, -3000)},
    {Name = "Zou", Sea = 2, Position = CFrame.new(4000, 10, -4000)},
    {Name = "Scrap Island", Sea = 2, Position = CFrame.new(4500, 10, -4500)},
    {Name = "Ghost Island", Sea = 2, Position = CFrame.new(5000, 10, -5000)},
    {Name = "Ice Castle", Sea = 2, Position = CFrame.new(5500, 10, -5500)},
    {Name = "Port Oasis", Sea = 3, Position = CFrame.new(1000, 10, 1000)},
    {Name = "Forgotten Island", Sea = 3, Position = CFrame.new(1500, 10, 1500)},
    {Name = "Utopia", Sea = 3, Position = CFrame.new(2000, 10, 2000)},
    {Name = "Hydra Island", Sea = 3, Position = CFrame.new(2500, 10, 2500)},
    {Name = "Great Tree", Sea = 3, Position = CFrame.new(3000, 10, 3000)},
    {Name = "Castle on the Sea", Sea = 3, Position = CFrame.new(3500, 10, 3500)},
    {Name = "Mage Island", Sea = 3, Position = CFrame.new(4000, 10, 4000)},
    {Name = "Pirate Port", Sea = 3, Position = CFrame.new(4500, 10, 4500)},
    {Name = "Haunted Castle", Sea = 3, Position = CFrame.new(5000, 10, 5000)},
    {Name = "Mirage Island", Sea = 0, Position = nil, IsRandom = true}
}

local player = game.Players.LocalPlayer
local isVIP = false
local hasFruitsPerms = false
local hasAutoPvP = false

-- ===== INTERFACE (1 seul ScreenGui) =====
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnonymesHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Logo cliquable (ImageButton)
local LogoButton = Instance.new("ImageButton")
LogoButton.Size = UDim2.new(0, 80, 0, 80)
LogoButton.Position = UDim2.new(0.88, 0, 0.08, 0)
LogoButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
LogoButton.Image = LOGO_URL
LogoButton.Parent = screenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(1, 0)
Corner.Parent = LogoButton

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(255, 0, 0)
Stroke.Thickness = 3
Stroke.Parent = LogoButton

-- Fenêtre principale
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Visible = false
MainFrame.Parent = screenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 0, 0)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Titre
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "ANONYMES SCRIPTS HUB v" .. VERSION
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- Bouton Fermer
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 35, 0, 35)
Close.Position = UDim2.new(1, -40, 0, 5)
Close.Text = "X"
Close.TextScaled = true
Close.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Close.TextColor3 = Color3.new(1, 1, 1)
Close.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = Close

-- Ouverture/Fermeture
LogoButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

Close.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Déplacement de la fenêtre
MainFrame.Active = true
MainFrame.Draggable = true

-- ===== TOGGLES =====
local toggles = {
    autoLevel = false, autoNearest = false, autoEctoplasm = false, autoCandy = false,
    autoGifts = false, autoCollect = false, autoCollectRewards = false, autoPvP = false,
    killAura = false, triggerBot = false, autoAttack = false, autoSeaBeast = false,
    autoLeviathan = false, autoLeviathanQuest = false, autoPirateRaid = false, autoShipRaid = false,
    autoTerrorshark = false, autoVolcano = false, autoFactory = false, autoPhantom = false,
    autoDoughKing = false, autoYama = false, autoTushita = false, autoCDK = false,
    autoSanguineArt = false, autoKitsune = false, autoRaceV4 = false, autoMirageIsland = false,
    autoSoulReaper = false, autoBoat = false, teleportToBoat = false, boatSpeed = false,
    teleportMobs = false, bringMob = false, autoIslandHop = false, espPlayers = false,
    espBoss = false, espFruits = false, espChests = false, espNPCs = false, walkOnWater = false,
    infiniteJump = false, noClip = false, flight = false, autoHaki = false,
    autoObservation = false, autoArmament = false, serverHop = false, antiKick = false,
    fpsBoost = false, fruitsPerms = false
}

-- ===== SERVICES =====
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- ===== FONCTIONS UTILITAIRES =====
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
    return beli and tonumber(tostring(beli.Value)) or 0
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
    return true
end

local function waitForCharacter()
    repeat task.wait() until player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    return player.Character
end

local function getCurrentSea()
    if not player.Data then return 1 end
    local level = player.Data:FindFirstChild("Level")
    if level then
        if level.Value >= 2000 then return 3 end
        if level.Value >= 700 then return 3 end
        if level.Value >= 150 then return 2 end
    end
    return 1
end

local function getBoss(bossName)
    if not workspace:FindFirstChild("Enemies") then return nil end
    for _, boss in pairs(workspace.Enemies:GetChildren()) do
        if (boss.Name == bossName or boss.Name:find(bossName)) and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
            return boss
        end
    end
    return nil
end

local function getNearestBoss()
    local character = waitForCharacter()
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
    local rootPart = character.HumanoidRootPart
    local nearestBoss, nearestDist = nil, math.huge
    for _, bossInfo in ipairs(BOSSES) do
        local boss = getBoss(bossInfo.Name)
        if boss and boss:FindFirstChild("HumanoidRootPart") then
            local dist = (rootPart.Position - boss.HumanoidRootPart.Position).Magnitude
            if dist < nearestDist and dist < 5000 then
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
        return humanoid and humanoid.SeatPart and humanoid.SeatPart.Parent
    end
    return nil
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
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
    local rootPart = character.HumanoidRootPart
    local nearest, nearestDist = nil, math.huge
    if not workspace:FindFirstChild("Enemies") then return nil end
    for _, mob in pairs(workspace.Enemies:GetChildren()) do
        if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") then
            local dist = (rootPart.Position - mob.HumanoidRootPart.Position).Magnitude
            if dist < nearestDist and dist < 1000 then
                nearest, nearestDist = mob, dist
            end
        end
    end
    return nearest
end

local function getNearestPlayer()
    local character = waitForCharacter()
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
    local rootPart = character.HumanoidRootPart
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

local function attackTarget(target)
    pcall(function()
        local character = waitForCharacter()
        if not character or not target then return end
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local targetRoot = target:FindFirstChild("HumanoidRootPart")
        if not rootPart or not targetRoot then return end

        local direction = (targetRoot.Position - rootPart.Position).Unit
        rootPart.CFrame = CFrame.new(targetRoot.Position + (direction * -5)) * CFrame.Angles(0, math.pi, 0)

        VirtualUser:CaptureController()
        VirtualUser:Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(0.1)
        VirtualUser:Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)

        if hasSwordEquipped() then
            for _, key in ipairs({"Z", "X", "C", "V"}) do
                VirtualInputManager:SendKeyEvent(true, key, false, nil)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, key, false, nil)
                task.wait(0.2)
            end
        end

        for _, key in ipairs({"F", "G", "H", "J"}) do
            VirtualInputManager:SendKeyEvent(true, key, false, nil)
            task.wait(0.1)
            VirtualInputManager:SendKeyEvent(false, key, false, nil)
            task.wait(0.2)
        end
    end)
end

-- ===== FONCTIONS PRINCIPALES =====
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
                if mob then attackTarget(mob) end
            end)
        end
    end)
end

-- ===== EXECUTION =====
LogoButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

Close.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Initialisation des toggles (à compléter avec tes boutons UI)
-- Exemple pour activer/désactiver :
-- toggles.killAura = true; startKillAura()
-- toggles.triggerBot = true; startTriggerBot()
