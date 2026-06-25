-- ANONYMES SCRIPTS HUB v4.1 | Blox Fruits | LOGO: rbxassetid://88742532715379
local VERSION="4.1"
local VIP_PASSWORD="98961144"
local PRICE_FRUITS_PERMS=5000000
local PRICE_AUTO_PVP=2000000
local LOGO_URL="rbxassetid://88742532715379"

-- ===== NOUVEAU LOGO (remplace l'ancien) =====
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
image.Image = LOGO_URL
image.Parent = frame
-- =============================================

local BOSSES={{
    Name="Bandit",Level=150,Sea=1,Type="Normal"},
    {Name="Leader",Level=300,Sea=1,Type="Normal"},
    {Name="Brute",Level=500,Sea=1,Type="Normal"},
    {Name="The Saw",Level=1000,Sea=1,Type="Normal"},
    {Name="Shank",Level=1100,Sea=1,Type="Normal"},
    {Name="Don Swan",Level=1000,Sea=2,Type="Normal"},
    {Name="Jeremy",Level=1050,Sea=2,Type="Normal"},
    {Name="Saber Expert",Level=1100,Sea=2,Type="Normal"},
    {Name="The Gorilla King",Level=1200,Sea=2,Type="Normal"},
    {Name="Don Swan [Lv. 1000]",Level=1000,Sea=3,Type="Normal"},
    {Name="Jeremy [Lv. 1050]",Level=1050,Sea=3,Type="Normal"},
    {Name="Wysper",Level=1100,Sea=3,Type="Normal"},
    {Name="Thunder God",Level=1150,Sea=3,Type="Normal"},
    {Name="Cursed Captain",Level=1200,Sea=3,Type="Normal"},
    {Name="Stone",Level=1500,Sea=3,Type="Normal"},
    {Name="Island Empress",Level=1600,Sea=3,Type="Normal"},
    {Name="Kilo Admiral",Level=1700,Sea=3,Type="Normal"},
    {Name="Dough King",Level=0,Sea=0,Type="Raid"},
    {Name="Leviathan",Level=0,Sea=0,Type="Raid"},
    {Name="Phantom",Level=0,Sea=0,Type="Raid"},
    {Name="Sea Beast",Level=0,Sea=0,Type="Event"},
    {Name="Terrorshark",Level=0,Sea=0,Type="Event"},
    {Name="Magma Admiral",Level=0,Sea=0,Type="Volcano"},
    {Name="Mirror Boss",Level=0,Sea=0,Type="Factory"},
    {Name="Kitsune",Level=0,Sea=0,Type="Special"},
    {Name="Longma",Level=0,Sea=0,Type="Special"},
    {Name="Soul Reaper",Level=0,Sea=0,Type="Special"},
    {Name="Cursed Dual Katana",Level=0,Sea=0,Type="Quest"},
    {Name="Yama",Level=0,Sea=0,Type="Quest"},
    {Name="Tushita",Level=0,Sea=0,Type="Quest"},
    {Name="Sanguine Art",Level=0,Sea=0,Type="Quest"},
    {Name="Darkbeard",Level=0,Sea=0,Type="Quest"}
}

local ISLANDS={{
    Name="Starter Island",Sea=1,Position=CFrame.new(-1000,10,-1000)},
    {Name="Jungle",Sea=1,Position=CFrame.new(-600,10,-800)},
    {Name="Pirate Village",Sea=1,Position=CFrame.new(-1200,10,-300)},
    {Name="Desert",Sea=1,Position=CFrame.new(-700,10,500)},
    {Name="Snow Island",Sea=1,Position=CFrame.new(-1300,10,1200)},
    {Name="Marine Fortress",Sea=1,Position=CFrame.new(-2500,10,-2000)},
    {Name="Prison",Sea=1,Position=CFrame.new(-5000,10,-5000)},
    {Name="Magma Village",Sea=1,Position=CFrame.new(-5500,10,-5500)},
    {Name="Port Town",Sea=2,Position=CFrame.new(1000,10,-1000)},
    {Name="Kingdom of Rose",Sea=2,Position=CFrame.new(1500,10,-1500)},
    {Name="Usopp Island",Sea=2,Position=CFrame.new(2000,10,-2000)},
    {Name="Fountain City",Sea=2,Position=CFrame.new(3000,10,-3000)},
    {Name="Zou",Sea=2,Position=CFrame.new(4000,10,-4000)},
    {Name="Scrap Island",Sea=2,Position=CFrame.new(4500,10,-4500)},
    {Name="Ghost Island",Sea=2,Position=CFrame.new(5000,10,-5000)},
    {Name="Ice Castle",Sea=2,Position=CFrame.new(5500,10,-5500)},
    {Name="Port Oasis",Sea=3,Position=CFrame.new(1000,10,1000)},
    {Name="Forgotten Island",Sea=3,Position=CFrame.new(1500,10,1500)},
    {Name="Utopia",Sea=3,Position=CFrame.new(2000,10,2000)},
    {Name="Hydra Island",Sea=3,Position=CFrame.new(2500,10,2500)},
    {Name="Great Tree",Sea=3,Position=CFrame.new(3000,10,3000)},
    {Name="Castle on the Sea",Sea=3,Position=CFrame.new(3500,10,3500)},
    {Name="Mage Island",Sea=3,Position=CFrame.new(4000,10,4000)},
    {Name="Pirate Port",Sea=3,Position=CFrame.new(4500,10,4500)},
    {Name="Haunted Castle",Sea=3,Position=CFrame.new(5000,10,5000)},
    {Name="Mirage Island",Sea=0,Position=nil,IsRandom=true}
}

local QUESTS={{
    Name="Leviathan",NPC="Old Man",Reward="Leviathan Gun",Sea=2},
    {Name="Dough King",NPC="Cake Prince",Reward="Dough Fruit",Sea=2},
    {Name="Cursed Dual Katana",NPC="Hitman",Reward="CDK",Sea=1},
    {Name="Yama",NPC="Monk",Reward="Yama Sword",Sea=1},
    {Name="Tushita",NPC="Monk",Reward="Tushita Sword",Sea=2},
    {Name="Sanguine Art",NPC="Art Dealer",Reward="Sanguine Art",Sea=2},
    {Name="Kitsune",NPC="Mystic Lady",Reward="Kitsune",Sea=3},
    {Name="Race V4",NPC="Race Expert",Reward="Race V4",Sea=2},
    {Name="Soul Reaper",NPC="Death",Reward="Soul Cane",Sea=3}
}}

local player = game.Players.LocalPlayer
local isVIP = false
local hasFruitsPerms = false
local hasAutoPvP = false
local mainFrame = nil
local screenGui = nil

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

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Fonctions utilitaires
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
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(0.1)
        game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        if hasSwordEquipped() then
            for _, key in ipairs({"Z", "X", "C", "V"}) do
                game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, nil)
                task.wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, key, false, nil)
                task.wait(0.2)
            end
        end
        for _, key in ipairs({"F", "G", "H", "J"}) do
            game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, nil)
            task.wait(0.1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, key, false, nil)
            task.wait(0.2)
        end
    end)
end

-- Fonctions de toggle pour les fonctionnalités
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
                if mob then attackTarget(mob) end
            end)
        end
    end)
end

local function startAutoLevel()
    if not toggles.autoLevel then return end
    spawn(function()
        while toggles.autoLevel and task.wait(0.3) do
            pcall(function()
                local mob = getNearestMob()
                if mob then attackTarget(mob) end
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
                    if mob then attackTarget(mob) end
                end
            end)
        end
    end)
end

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
        if not character or not character:FindFirstChild("HumanoidRootPart") then return end
        local rootPart = character.HumanoidRootPart
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
            if nearestBoat then
                local spawnLocation = nearestBoat:FindFirstChild("SpawnLocation") or nearestBoat:FindFirstChild("VehicleSeat")
                if spawnLocation then
                    rootPart.CFrame = spawnLocation.CFrame * CFrame.new(0, 5, 0)
                    notify("✅ Bateau", "Téléporté vers un bateau !", 2)
                end
            end
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

local function startAutoSeaBeast()
    if not toggles.autoSeaBeast then return end
    spawn(function()
        while toggles.autoSeaBeast and task.wait(1) do
            pcall(function()
                local seaBeast = getBoss("Sea Beast")
                if seaBeast then attackTarget(seaBeast) end
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
                if leviathan then attackTarget(leviathan) end
            end)
        end
    end)
end

local function startLeviathanQuest()
    if not toggles.autoLeviathanQuest then return end
    spawn(function()
        while toggles.autoLeviathanQuest and task.wait(0.5) do
            pcall(function()
                local character = waitForCharacter()
                if not character or not character:FindFirstChild("HumanoidRootPart") then return end
                local rootPart = character.HumanoidRootPart
                local oldMan = findNPC("Old Man")
                if not oldMan then
                    for _, island in ipairs(ISLANDS) do
                        if island.Sea == 2 then
                            rootPart.CFrame = island.Position
                            task.wait(1)
                            oldMan = findNPC("Old Man")
                            if oldMan then break end
                        end
                    end
                end
                if oldMan and oldMan:FindFirstChild("HumanoidRootPart") then
                    rootPart.CFrame = oldMan.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                    task.wait(1)
                    if not hasQuest("Leviathan") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", oldMan)
                        task.wait(2)
                    end
                    for _, waveName in ipairs({"LeviathanWave1", "LeviathanWave2", "LeviathanWave3"}) do
                        local wave = getBoss(waveName)
                        if wave then
                            attackTarget(wave)
                            task.wait(0.5)
                        end
                    end
                    local leviathan = getBoss("Leviathan")
                    if leviathan then attackTarget(leviathan) end
                    if not getBoss("Leviathan") and not getBoss("LeviathanWave1") then
                        rootPart.CFrame = oldMan.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        task.wait(1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", oldMan)
                        notify("✅ Quête Leviathan", "Récompense: Leviathan Gun !", 5)
                        toggles.autoLeviathanQuest = false
                    end
                end
            end)
        end
    end)
end

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
                if terrorshark then attackTarget(terrorshark) end
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
                if magmaAdmiral then attackTarget(magmaAdmiral) end
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
                if mirrorBoss then attackTarget(mirrorBoss) end
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
                if phantom then attackTarget(phantom) end
            end)
        end
    end)
end

local function startAutoDoughKing()
    if not toggles.autoDoughKing then return end
    spawn(function()
        while toggles.autoDoughKing and task.wait(1) do
            pcall(function()
                local doughKing = getBoss("Dough King")
                if doughKing then
                    attackTarget(doughKing)
                else
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
                    local monk = findNPC("Monk")
                    if monk then
                        player.Character.HumanoidRootPart.CFrame = monk.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", monk)
                        task.wait(1)
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
                    local monk = findNPC("Monk")
                    if monk then
                        player.Character.HumanoidRootPart.CFrame = monk.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", monk)
                        task.wait(1)
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
            pcall
