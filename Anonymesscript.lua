

-- ANONYMES SCRIPTS HUB v4.2 | UI EDITION | Blox Fruits

-- 🔥 Logo cliquable → Panneau avec boutons ON/OFF pour chaque fonction.


-- ========== [CONFIG] ==========

local VERSION = "4.2"

local VIP_PASSWORD_HASH = "OTg5NjExNDQ=" -- 98961144 en base64

local PRICE_FRUITS_PERMS = 5000000

local LOGO_URL = "rbxassetid://88742532715379"

local STEALTH_MODE = true

local MIN_DELAY = 0.1

local MAX_DELAY = 0.8


-- ========== [DONNÉES] ==========

local BOSSES = {

    {Name = "Bandit", Level = 150, Sea = 1, Type = "Normal"}, {Name = "Leader", Level = 300, Sea = 1, Type = "Normal"},

    {Name = "Brute", Level = 500, Sea = 1, Type = "Normal"}, {Name = "The Saw", Level = 1000, Sea = 1, Type = "Normal"},

    {Name = "Shank", Level = 1100, Sea = 1, Type = "Normal"}, {Name = "Don Swan", Level = 1000, Sea = 2, Type = "Normal"},

    {Name = "Jeremy", Level = 1050, Sea = 2, Type = "Normal"}, {Name = "Saber Expert", Level = 1100, Sea = 2, Type = "Normal"},

    {Name = "The Gorilla King", Level = 1200, Sea = 2, Type = "Normal"}, {Name = "Don Swan [Lv. 1000]", Level = 1000, Sea = 3, Type = "Normal"},

    {Name = "Jeremy [Lv. 1050]", Level = 1050, Sea = 3, Type = "Normal"}, {Name = "Wysper", Level = 1100, Sea = 3, Type = "Normal"},

    {Name = "Thunder God", Level = 1150, Sea = 3, Type = "Normal"}, {Name = "Cursed Captain", Level = 1200, Sea = 3, Type = "Normal"},

    {Name = "Stone", Level = 1500, Sea = 3, Type = "Normal"}, {Name = "Island Empress", Level = 1600, Sea = 3, Type = "Normal"},

    {Name = "Kilo Admiral", Level = 1700, Sea = 3, Type = "Normal"}, {Name = "Dough King", Level = 0, Sea = 0, Type = "Raid"},

    {Name = "Leviathan", Level = 0, Sea = 0, Type = "Raid"}, {Name = "Phantom", Level = 0, Sea = 0, Type = "Raid"},

    {Name = "Sea Beast", Level = 0, Sea = 0, Type = "Event"}, {Name = "Terrorshark", Level = 0, Sea = 0, Type = "Event"},

    {Name = "Magma Admiral", Level = 0, Sea = 0, Type = "Volcano"}, {Name = "Mirror Boss", Level = 0, Sea = 0, Type = "Factory"},

    {Name = "Kitsune", Level = 0, Sea = 0, Type = "Special"}, {Name = "Longma", Level = 0, Sea = 0, Type = "Special"},

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

local mainFrame = nil

local screenGui = nil


local toggles = {

    -- Combat

    killAura = false, triggerBot = false, autoAttack = false, autoPvP = false,

    -- Farm

    autoLevel = false, autoNearest = false, autoSeaBeast = false, autoLeviathan = false,

    autoPirateRaid = false, autoShipRaid = false, autoTerrorshark = false, autoVolcano = false,

    autoFactory = false, autoPhantom = false, autoDoughKing = false,

    -- Quêtes

    autoLeviathanQuest = false, autoYama = false, autoTushita = false, autoCDK = false,

    autoSanguineArt = false, autoKitsune = false, autoRaceV4 = false, autoMirageIsland = false,

    autoSoulReaper = false,

    -- Déplacement

    autoBoat = false, teleportToBoat = false, boatSpeed = false, teleportMobs = false,

    bringMob = false, autoIslandHop = false,

    -- ESP

    espPlayers = false, espBoss = false, espFruits = false, espChests = false, espNPCs = false,

    -- Mouvement

    walkOnWater = false, infiniteJump = false, noClip = false, flight = false,

    -- Haki

    autoHaki = false, autoObservation = false, autoArmament = false,

    -- Système

    serverHop = false, antiKick = false, fpsBoost = false,

    -- VIP

    fruitsPerms = false

}


-- ========== [SERVICES] ==========

local TweenService = game:GetService("TweenService")

local UserInputService = game:GetService("UserInputService")

local TeleportService = game:GetService("TeleportService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RunService = game:GetService("RunService")

local HttpService = game:GetService("HttpService")


-- ========== [ANTI-LOG + BYPASS] ==========

print = function() end

warn = function() end

error = function() end


local oldCommF

local function setupRemoteBypass()

    if not ReplicatedStorage:FindFirstChild("Remotes") then return end

    local CommF = ReplicatedStorage.Remotes:FindFirstChild("CommF_")

    if not CommF then return end

    oldCommF = CommF.InvokeServer

    CommF.InvokeServer = function(self, ...)

        local args = {...}

        if STEALTH_MODE and (args[1] == "BuyFruit" or args[1] == "Talk" or args[1] == "SelectQuest") then

            task.wait(math.random() * 0.1)

        end

        return oldCommF(self, ...)

    end

end

setupRemoteBypass()


-- ========== [FONCTIONS UTILITAIRES] ==========

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

        notify("❌ Erreur", "Pas assez de Beli ("..getBeli().." / "..amount..")", 3)

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


local function randomDelay(min, max)

    return math.random() * (max - min) + min

end


local function isBanned()

    if not player then return true end

    if not player:IsDescendantOf(game) then return true end

    return false

end


-- ========== [FONCTIONS DE CIBLAGE] ==========

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


-- ========== [FONCTION D'ATTAQUE] ==========

local function attackTarget(target)

    pcall(function()

        local character = waitForCharacter()

        if not character or not target then return end

        local rootPart = character:FindFirstChild("HumanoidRootPart")

        local targetRoot = target:FindFirstChild("HumanoidRootPart")

        if not rootPart or not targetRoot then return end

        task.wait(randomDelay(0.05, 0.2))

        local direction = (targetRoot.Position - rootPart.Position).Unit

        local offsetX = math.random(-3, 3)

        local offsetZ = math.random(-3, 3)

        rootPart.CFrame = CFrame.new(targetRoot.Position + (direction * -5) + Vector3.new(offsetX, 0, offsetZ)) * CFrame.Angles(0, math.pi, 0)

        game:GetService("VirtualUser"):CaptureController()

        if math.random() > 0.3 then

            game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)

            task.wait(randomDelay(0.05, 0.15))

            game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)

        end

        if hasSwordEquipped() then

            local keys = {"Z", "X", "C", "V", "F", "G", "H", "J"}

            local randomKey = keys[math.random(1, #keys)]

            game:GetService("VirtualInputManager"):SendKeyEvent(true, randomKey, false, nil)

            task.wait(randomDelay(0.05, 0.1))

            game:GetService("VirtualInputManager"):SendKeyEvent(false, randomKey, false, nil)

        end

    end)

end


-- ========== [FONCTIONS PRINCIPALES] ==========

local function startKillAura()

    if not toggles.killAura then return end

    spawn(function()

        while toggles.killAura and task.wait(randomDelay(0.1, 0.4)) do

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

        while toggles.autoAttack and task.wait(randomDelay(0.2, 0.5)) do

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

        while toggles.autoLevel and task.wait(randomDelay(0.2, 0.6)) do

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

        while toggles.autoNearest and task.wait(randomDelay(0.3, 0.7)) do

            pcall(function()

                local boss = getNearestBoss()

                if boss then attackTarget(boss)

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

        while toggles.autoBoat and task.wait(randomDelay(0.05, 0.15)) do

            pcall(function()

                if isInBoat() then

                    local boat = getBoat()

                    if boat and boat:FindFirstChild("VehicleSeat") then

                        boat.VehicleSeat.Steer = math.random(-0.2, 0.2)

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

                        if dist < nearestDist then nearestBoat, nearestDist = boat, dist end

                    end

                end

            end

            if nearestBoat then

                local spawnLocation = nearestBoat:FindFirstChild("SpawnLocation") or nearestBoat:FindFirstChild("VehicleSeat")

                if spawnLocation then

                    local offsetX = math.random(-2, 2)

                    local offsetZ = math.random(-2, 2)

                    rootPart.CFrame = spawnLocation.CFrame * CFrame.new(offsetX, 5, offsetZ)

                    notify("✅ Bateau", "Téléporté vers un bateau !", 2)

                end

            end

        end

    end)

end


local function boostBoatSpeed()

    if not toggles.boatSpeed then return end

    spawn(function()

        while toggles.boatSpeed and task.wait(randomDelay(0.05, 0.15)) do

            pcall(function()

                if isInBoat() then

                    local boat = getBoat()

                    if boat and boat:FindFirstChild("VehicleSeat") then

                        boat.VehicleSeat.MaxSpeed = 200 + math.random(-10, 10)

                        boat.VehicleSeat.Torque = 50000

                    end

                end

            end)

        end

    end)

end


local function startLeviathanQuest()

    if not toggles.autoLeviathanQuest then return end

    spawn(function()

        while toggles.autoLeviathanQuest and task.wait(randomDelay(0.3, 0.8)) do

            pcall(function()

                local character = waitForCharacter()

                if not character or not character:FindFirstChild("HumanoidRootPart") then return end

                local rootPart = character.HumanoidRootPart

                local oldMan = findNPC("Old Man")

                if not oldMan then

                    for _, island in ipairs(ISLANDS) do

                        if island.Sea == 2 then

                            rootPart.CFrame = island.Position

                            task.wait(randomDelay(0.5, 1.5))

                            oldMan = findNPC("Old Man")

                            if oldMan then break end

                        end

                    end

                end

                if oldMan and oldMan:FindFirstChild("HumanoidRootPart") then

                    rootPart.CFrame = oldMan.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5 + math.random(-2, 2))

                    task.wait(randomDelay(0.5, 1.5))

                    if not hasQuest("Leviathan") then

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", oldMan)

                        task.wait(randomDelay(1, 2))

                    end

                    for _, waveName in ipairs({"LeviathanWave1", "LeviathanWave2", "LeviathanWave3"}) do

                        local wave = getBoss(waveName)

                        if wave then attackTarget(wave) task.wait(randomDelay(0.3, 0.7)) end

                    end

                    local leviathan = getBoss("Leviathan")

                    if leviathan then attackTarget(leviathan) end

                    if not getBoss("Leviathan") and not getBoss("LeviathanWave1") then

                        rootPart.CFrame = oldMan.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)

                        task.wait(randomDelay(0.5, 1.5))

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", oldMan)

                        notify("✅ Quête Leviathan", "Récompense: Leviathan Gun !", 5)

                        toggles.autoLeviathanQuest = false

                    end

                end

            end)

        end

    end)

end


local function startAutoDoughKing()

    if not toggles.autoDoughKing then return end

    spawn(function()

        while toggles.autoDoughKing and task.wait(randomDelay(0.5, 1.5)) do

            pcall(function()

                local doughKing = getBoss("Dough King")

                if doughKing then attackTarget(doughKing)

                else

                    local cakePrince = findNPC("Cake Prince")

                    if cakePrince then

                        player.Character.HumanoidRootPart.CFrame = cakePrince.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5 + math.random(-2, 2))

                        task.wait(randomDelay(0.5, 1.5))

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

        while toggles.autoYama and task.wait(randomDelay(0.5, 1.5)) do

            pcall(function()

                local yama = getBoss("Yama")

                if yama then attackTarget(yama)

                else

                    local monk = findNPC("Monk")

                    if monk then

                        player.Character.HumanoidRootPart.CFrame = monk.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", monk)

                        task.wait(randomDelay(1, 2))

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

        while toggles.autoTushita and task.wait(randomDelay(0.5, 1.5)) do

            pcall(function()

                local tushita = getBoss("Tushita")

                if tushita then attackTarget(tushita)

                else

                    local monk = findNPC("Monk")

                    if monk then

                        player.Character.HumanoidRootPart.CFrame = monk.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", monk)

                        task.wait(randomDelay(1, 2))

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

        while toggles.autoCDK and task.wait(randomDelay(0.5, 1.5)) do

            pcall(function()

                local cdk = getBoss("Cursed Dual Katana")

                if cdk then attackTarget(cdk)

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


-- ========== [ESP] ==========

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

        if not character or not character:FindFirstChild("HumanoidRootPart") then return end

        local rootPart = character.HumanoidRootPart

        if toggles.espPlayers then

            for _, plr in pairs(game.Players:GetPlayers()) do

                if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then

                    local dist = (rootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude

                    manageESP(plr.Character.HumanoidRootPart, "ESP_Player_ANONYMES", plr.Name.." ("..math.floor(dist).."m)", Color3.new(0, 1, 0))

                end

            end

        end

        if toggles.espBoss and workspace:FindFirstChild("Enemies") then

            for _, boss in pairs(workspace.Enemies:GetChildren()) do

                if boss:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then

                    local bossLevel = boss:FindFirstChild("Level") and boss.Level.Value or "?"

                    local bossName = boss.Name

                    for _, bossInfo in ipairs(BOSSES) do

                        if bossName:find(bossInfo.Name) then bossName = bossInfo.Name break end

                    end

                    local dist = (rootPart.Position - boss.HumanoidRootPart.Position).Magnitude

                    manageESP(boss.HumanoidRootPart, "ESP_Boss_ANONYMES", bossName.." [Lv. "..bossLevel.."] ("..math.floor(dist).."m)", Color3.new(1, 0, 0))

                end

            end

        end

        if toggles.espFruits then

            for _, fruit in pairs(workspace:GetChildren()) do

                if fruit.Name:find("Fruit") and fruit:FindFirstChild("HumanoidRootPart") then

                    local dist = (rootPart.Position - fruit.HumanoidRootPart.Position).Magnitude

                    manageESP(fruit.HumanoidRootPart, "ESP_Fruit_ANONYMES", fruit.Name.." ("..math.floor(dist).."m)", Color3.new(1, 1, 0))

                end

            end

        end

        if toggles.espChests then

            for _, chest in pairs(workspace:GetChildren()) do

                if chest.Name:find("Chest") and chest:FindFirstChild("PrimaryPart") then

                    local dist = (rootPart.Position - chest.PrimaryPart.Position).Magnitude

                    manageESP(chest.PrimaryPart, "ESP_Chest_ANONYMES", "Chest ("..math.floor(dist).."m)", Color3.new(0, 1, 1))

                end

            end

        end

        if toggles.espNPCs and workspace:FindFirstChild("NPCs") then

            for _, npc in pairs(workspace.NPCs:GetChildren()) do

                if npc:FindFirstChild("HumanoidRootPart") then

                    local dist = (rootPart.Position - npc.HumanoidRootPart.Position).Magnitude

                    manageESP(npc.HumanoidRootPart, "ESP_NPC_ANONYMES", npc.Name.." ("..math.floor(dist).."m)", Color3.new(1, 0, 1))

                end

            end

        end

    end)

end


-- ========== [TÉLÉPORTATION & DÉPLACEMENT] ==========

local function teleportToMob()

    if not toggles.teleportMobs then return end

    spawn(function()

        while toggles.teleportMobs and task.wait(randomDelay(0.3, 0.7)) do

            pcall(function()

                local character = waitForCharacter()

                if not character or not character:FindFirstChild("HumanoidRootPart") then return end

                local rootPart = character.HumanoidRootPart

                local mob = getNearestMob()

                if mob and mob:FindFirstChild("HumanoidRootPart") then

                    local offsetX = math.random(-3, 3)

                    local offsetZ = math.random(-3, 3)

                    rootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(offsetX, 0, offsetZ)

                end

            end)

        end

    end)

end


local function bringMob()

    if not toggles.bringMob then return end

    spawn(function()

        while toggles.bringMob and task.wait(randomDelay(0.2, 0.5)) do

            pcall(function()

                local character = waitForCharacter()

                if not character or not character:FindFirstChild("HumanoidRootPart") then return end

                local rootPart = character.HumanoidRootPart

                if workspace:FindFirstChild("Enemies") then

                    for _, mob in pairs(workspace.Enemies:GetChildren()) do

                        if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then

                            local dist = (rootPart.Position - mob.HumanoidRootPart.Position).Magnitude

                            if dist < 100 then

                                local offsetX = math.random(-2, 2)

                                local offsetZ = math.random(-2, 2)

                                mob.HumanoidRootPart.CFrame = rootPart.CFrame * CFrame.new(offsetX, 0, offsetZ)

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

        if not character or not character:FindFirstChild("HumanoidRootPart") then return end

        local rootPart = character.HumanoidRootPart

        for _, island in ipairs(ISLANDS) do

            if island.Name:lower():find(islandName:lower()) then

                if island.Position then

                    local offsetX = math.random(-5, 5)

                    local offsetZ = math.random(-5, 5)

                    rootPart.CFrame = island.Position * CFrame.new(offsetX, 0, offsetZ)

                    notify("✅ Téléportation", "Téléporté vers "..island.Name, 2)

                    return true

                else

                    notify("❌ Erreur", island.Name.." n'a pas de position.", 2)

                    return false

                end

            end

        end

        notify("❌ Erreur", "Île non trouvée: "..islandName, 2)

        return false

    end)

end


local function autoIslandHop()

    if not toggles.autoIslandHop then return end

    spawn(function()

        while toggles.autoIslandHop and task.wait(60 + math.random(0, 30)) do

            pcall(function() TeleportService:Teleport(game.PlaceId) end)

        end

    end)

end


local function enableWalkOnWater()

    if not toggles.walkOnWater then return end

    spawn(function()

        while toggles.walkOnWater and task.wait(0.1) do

            pcall(function()

                local character = player.Character

                if character and character:FindFirstChild("Humanoid") then

                    character.Humanoid.WalkSpeed = 50 + math.random(-2, 2)

                end

            end)

        end

    end)

end


local function enableInfiniteJump()

    if not toggles.infiniteJump then return end

    UserInputService.JumpRequest:Connect(function()

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

                        local moveDirection = Vector3.new(0, 0, 0)

                        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDirection = moveDirection + (character.HumanoidRootPart.CFrame.LookVector * flightSpeed) end

                        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDirection = moveDirection - (character.HumanoidRootPart.CFrame.LookVector * flightSpeed) end

                        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDirection = moveDirection - (character.HumanoidRootPart.CFrame.RightVector * flightSpeed) end

                        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDirection = moveDirection + (character.HumanoidRootPart.CFrame.RightVector * flightSpeed) end

                        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDirection = moveDirection + Vector3.new(0, flightSpeed, 0) end

                        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDirection = moveDirection - Vector3.new(0, flightSpeed, 0) end

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


-- ========== [HAKI] ==========

local function startAutoHaki()

    if not toggles.autoHaki then return end

    spawn(function()

        while toggles.autoHaki and task.wait(randomDelay(0.3, 0.8)) do

            pcall(function()

                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ken")

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

        while toggles.autoObservation and task.wait(randomDelay(0.3, 0.8)) do

            pcall(function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ken") end)

        end

    end)

end


local function startAutoArmament()

    if not toggles.autoArmament then return end

    spawn(function()

        while toggles.autoArmament and task.wait(randomDelay(0.3, 0.8)) do

            pcall(function()

                if hasSwordEquipped() then

                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Busoshoku")

                end

            end)

        end

    end)

end


-- ========== [SYSTÈME] ==========

local function startServerHop()

    if not toggles.serverHop then return end

    spawn(function()

        while toggles.serverHop and task.wait(60 + math.random(0, 30)) do

            pcall(function() TeleportService:Teleport(game.PlaceId) end)

        end

    end)

end


local function startAntiKick()

    if not toggles.antiKick then return end

    spawn(function()

        while toggles.antiKick and task.wait(randomDelay(0.5, 1.5)) do

            pcall(function()

                settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnvironmentalPhysicsThrottle.Disabled

                settings().Physics.AllowSleep = false

                setfpscap(60)

            end)

        end

    end)

end


local function startFPSBoost()

    if not toggles.fpsBoost then return end

    spawn(function()

        while toggles.fpsBoost and task.wait(randomDelay(0.3, 0.8)) do

            pcall(function()

                for _, v in pairs(workspace:GetDescendants()) do

                    if v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then

                        v.Enabled = false

                    end

                end

                workspace.DescendantAdded:Connect(function(descendant)

                    if descendant:IsA("ParticleEmitter") or descendant:IsA("Fire") or descendant:IsA("Smoke") or descendant:IsA("Sparkles") then

                        descendant.Enabled = false

                    end

                end)

                settings().RenderQuality = Enum.RenderQuality.Low

                settings().Technology = Enum.Technology.Future

            end)

        end

    end)

end


-- ========== [VIP] ==========

local function checkVIP(password)

    local decodedPassword = HttpService:Base64Decode(VIP_PASSWORD_HASH)

    if password == decodedPassword then

        isVIP = true

        hasFruitsPerms = true

        hasAutoPvP = true

        notify("✅ VIP Activé", "Toutes les fonctionnalités débloquées !", 8)

    else

        notify("❌ Erreur", "Mot de passe incorrect.", 3)

    end

end


local function giveFruitsPerms()

    if not hasFruitsPerms then return end

    pcall(function()

        local fruitsList = {"Flame-Flame", "Ice-Ice", "Light-Light", "Dark-Dark", "String-String", "Rumble-Rumble", "Magma-Magma", "Human: Buddha", "Phoenix-Phoenix", "Dragon-Dragon"}

        for _, fruitName in ipairs(fruitsList) do

            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFruit", fruitName)

            task.wait(randomDelay(0.2, 0.5))

        end

        local legendaryWeapons = {"Dark Blade", "Shisui", "Wando", "Saddi", "True Triple Katana", "Yama", "Tushita", "Cursed Dual Katana", "Sanguine Art"}

        for _, weapon in ipairs(legendaryWeapons) do

            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", weapon)

            task.wait(randomDelay(0.2, 0.5))

        end

        notify("✅ Fruits Perms", "Tous les fruits + armes légendaires obtenus !", 5)

    end)

end


-- ========== [UI] ==========

screenGui = Instance.new("ScreenGui")

screenGui.Name = "ANONYMES_HUB"

screenGui.ResetOnSpawn = false

screenGui.Parent = player:WaitForChild("PlayerGui")


-- Logo (bouton cliquable)

local logoButton = Instance.new("ImageButton")

logoButton.Name = "LogoButton"

logoButton.Image = LOGO_URL

logoButton.Size = UDim2.new(0, 50, 0, 50)

logoButton.Position = UDim2.new(1, -60, 1, -60)

logoButton.BackgroundTransparency = 1

logoButton.Draggable = true

logoButton.Parent = screenGui


-- Frame principal (masqué par défaut)

mainFrame = Instance.new("Frame")

mainFrame.Name = "MainFrame"

mainFrame.Size = UDim2.new(0, 450, 0, 550)

mainFrame.Position = UDim2.new(0.5, -225, 0.5, -275)

mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

mainFrame.BorderSizePixel = 0

mainFrame.Visible = false

mainFrame.Parent = screenGui


-- Titre

local titleBar = Instance.new("Frame")

titleBar.Size = UDim2.new(1, 0, 0, 30)

titleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

titleBar.BorderSizePixel = 0

titleBar.Parent = mainFrame


local titleLabel = Instance.new("TextLabel")

titleLabel.Size = UDim2.new(1, 0, 1, 0)

titleLabel.Text = "ANONYMES SCRIPTS HUB v"..VERSION.." | Blox Fruits"

titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

titleLabel.TextStrokeTransparency = 0

titleLabel.Font = Enum.Font.SourceSansBold

titleLabel.TextSize = 16

titleLabel.BackgroundTransparency = 1

titleLabel.Parent = titleBar


-- Bouton fermer

local closeButton = Instance.new("TextButton")

closeButton.Size = UDim2.new(0, 30, 0, 30)

closeButton.Position = UDim2.new(1, -30, 0, 0)

closeButton.Text = "X"

closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

closeButton.BorderSizePixel = 0

closeButton.Parent = titleBar

closeButton.MouseButton1Click:Connect(function()

    mainFrame.Visible = false

end)


-- ScrollingFrame pour les boutons

local scrollFrame = Instance.new("ScrollingFrame")

scrollFrame.Size = UDim2.new(1, -10, 1, -40)

scrollFrame.Position = UDim2.new(0, 5, 0, 35)

scrollFrame.BackgroundTransparency = 1

scrollFrame.ScrollBarThickness = 5

scrollFrame.Parent = mainFrame


local uiListLayout = Instance.new("UIListLayout")

uiListLayout.Padding = UDim.new(0, 5)

uiListLayout.Parent = scrollFrame


-- Catégories et boutons

local categories = {

    {"🗡️ COMBAT", {"killAura", "triggerBot", "autoAttack", "autoPvP"}},

    {"🌱 FARM", {"autoLevel", "autoNearest", "autoSeaBeast", "autoLeviathan", "autoPirateRaid", "autoShipRaid", "autoTerrorshark"}},

    {"📜 QUÊTES", {"autoLeviathanQuest", "autoDoughKing", "autoYama", "autoTushita", "autoCDK", "autoSanguineArt", "autoKitsune", "autoRaceV4", "autoSoulReaper", "autoMirageIsland"}},

    {"⛵ DÉPLACEMENT", {"autoBoat", "teleportToBoat", "boatSpeed", "teleportMobs", "bringMob", "autoIslandHop"}},

    {"👁️ ESP", {"espPlayers", "espBoss", "espFruits", "espChests", "espNPCs"}},

    {"🚀 MOUVEMENT", {"walkOnWater", "infiniteJump", "noClip", "flight"}},

    {"⚔️ HAKI", {"autoHaki", "autoObservation", "autoArmament"}},

    {"⚙️ SYSTÈME", {"serverHop", "antiKick", "fpsBoost"}},

    {"👑 VIP", {"fruitsPerms"}}

}


-- Fonction pour créer un bouton toggle

local function createToggleButton(parent, name, toggleKey)

    local button = Instance.new("TextButton")

    button.Name = toggleKey

    button.Size = UDim2.new(1, -10, 0, 25)

    button.Text = name

    button.TextColor3 = Color3.fromRGB(255, 255, 255)

    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    button.BorderSizePixel = 0

    button.Font = Enum.Font.SourceSans

    button.TextSize = 14

    button.Parent = parent


    local function updateButton()

        if toggles[toggleKey] then

            button.BackgroundColor3 = Color3.fromRGB(0, 150, 0)

            button.Text = name .. " [ON]"

        else

            button.BackgroundColor3 = Color3.fromRGB(150, 0, 0)

            button.Text = name .. " [OFF]"

        end

    end


    button.MouseButton1Click:Connect(function()

        toggles[toggleKey] = not toggles[toggleKey]

        updateButton()

        -- Appeler la fonction correspondante

        if toggleKey == "killAura" then startKillAura()

        elseif toggleKey == "triggerBot" then startTriggerBot()

        elseif toggleKey == "autoAttack" then startAutoAttack()

        elseif toggleKey == "autoLevel" then startAutoLevel()

        elseif toggleKey == "autoNearest" then startAutoNearest()

        elseif toggleKey == "autoBoat" then startAutoBoat()

        elseif toggleKey == "teleportToBoat" then teleportToNearestBoat()

        elseif toggleKey == "boatSpeed" then boostBoatSpeed()

        elseif toggleKey == "teleportMobs" then teleportToMob()

        elseif toggleKey == "bringMob" then bringMob()

        elseif toggleKey == "autoIslandHop" then autoIslandHop()

        elseif toggleKey == "espPlayers" or toggleKey == "espBoss" or toggleKey == "espFruits" or toggleKey == "espChests" or toggleKey == "espNPCs" then updateESP()

        elseif toggleKey == "walkOnWater" then enableWalkOnWater()

        elseif toggleKey == "infiniteJump" then enableInfiniteJump()

        elseif toggleKey == "noClip" then enableNoClip()

        elseif toggleKey == "flight" then enableFlight()

        elseif toggleKey == "autoHaki" then startAutoHaki()

        elseif toggleKey == "autoObservation" then startAutoObservation()

        elseif toggleKey == "autoArmament" then startAutoArmament()

        elseif toggleKey == "serverHop" then startServerHop()

        elseif toggleKey == "antiKick" then startAntiKick()

        elseif toggleKey == "fpsBoost" then startFPSBoost()

        elseif toggleKey == "autoLeviathanQuest" then startLeviathanQuest()

        elseif toggleKey == "autoDoughKing" then startAutoDoughKing()

        elseif toggleKey == "autoYama" then startAutoYama()

        elseif toggleKey == "autoTushita" then startAutoTushita()

        elseif toggleKey == "autoCDK" then startAutoCDK()

        elseif toggleKey == "fruitsPerms" and isVIP then giveFruitsPerms() end

    end)


    updateButton()

    return button

end


-- Créer les catégories et boutons

for _, category in ipairs(categories) do

    local categoryName, categoryToggles = category[1], category[2]


    local categoryFrame = Instance.new("Frame")

    categoryFrame.Size = UDim2.new(1, -10, 0, 20 + (#categoryToggles * 25))

    categoryFrame.BackgroundTransparency = 0.5

    categoryFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    categoryFrame.BorderSizePixel = 0

    categoryFrame.Parent = scrollFrame


    local categoryLabel = Instance.new("TextLabel")

    categoryLabel.Size = UDim2.new(1, 0, 0, 20)

    categoryLabel.Text = categoryName

    categoryLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    categoryLabel.BackgroundTransparency = 1

    categoryLabel.Font = Enum.Font.SourceSansBold

    categoryLabel.TextSize = 14

    categoryLabel.Parent = categoryFrame


    local categoryLayout = Instance.new("UIListLayout")

    categoryLayout.Padding = UDim.new(0, 5)

    categoryLayout.Parent = categoryFrame


    for _, toggleKey in ipairs(categoryToggles) do

        createToggleButton(categoryFrame, toggleKey, toggleKey)

    end

end


-- Bouton VIP (en bas du frame)

local vipButton = Instance.new("TextButton")

vipButton.Size = UDim2.new(1, -10, 0, 30)

vipButton.Position = UDim2.new(0, 5, 1, -35)

vipButton.Text = isVIP and "VIP [ACTIF]" or "VIP [INACTIF]"

vipButton.TextColor3 = Color3.fromRGB(255, 215, 0)

vipButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

vipButton.BorderSizePixel = 0

vipButton.Font = Enum.Font.SourceSansBold

vipButton.TextSize = 14

vipButton.Parent = mainFrame


vipButton.MouseButton1Click:Connect(function()

    if isVIP then

        giveFruitsPerms()

        notify("✅ VIP", "Fruits Perms activés !", 5)

    else

        -- Popup pour entrer le mot de passe

        local popup = Instance.new("Frame")

        popup.Size = UDim2.new(0, 250, 0, 120)

        popup.Position = UDim2.new(0.5, -125, 0.5, -60)

        popup.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

        popup.BorderSizePixel = 0

        popup.Parent = screenGui


        local popupTitle = Instance.new("TextLabel")

        popupTitle.Size = UDim2.new(1, 0, 0, 25)

        popupTitle.Text = "Mot de passe VIP"

        popupTitle.TextColor3 = Color3.fromRGB(255, 255, 255)

        popupTitle.BackgroundTransparency = 1

        popupTitle.Font = Enum.Font.SourceSansBold

        popupTitle.TextSize = 14

        popupTitle.Parent = popup


        local textBox = Instance.new("TextBox")

        textBox.Size = UDim2.new(1, -10, 0, 30)

        textBox.Position = UDim2.new(0, 5, 0, 30)

        textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

        textBox.TextColor3 = Color3.fromRGB(255, 255, 255)

        textBox.PlaceholderText = "Entrez le mot de passe..."

        textBox.Font = Enum.Font.SourceSans

        textBox.TextSize = 14

        textBox.Text = ""

        textBox.Parent = popup


        local submitButton = Instance.new("TextButton")

        submitButton.Size = UDim2.new(0.45, -5, 0, 25)

        submitButton.Position = UDim2.new(0, 5, 0, 70)

        submitButton.Text = "Valider"

        submitButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)

        submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)

        submitButton.BorderSizePixel = 0

        submitButton.Font = Enum.Font.SourceSans

        submitButton.TextSize = 14

        submitButton.Parent = popup


        local cancelButton = Instance.new("TextButton")

        cancelButton.Size = UDim2.new(0.45, -5, 0, 25)

        cancelButton.Position = UDim2.new(0.5, 5, 0, 70)

        cancelButton.Text = "Annuler"

        cancelButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)

        cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)

        cancelButton.BorderSizePixel = 0

        cancelButton.Font = Enum.Font.SourceSans

        cancelButton.TextSize = 14

        cancelButton.Parent = popup


        submitButton.MouseButton1Click:Connect(function()

            checkVIP(textBox.Text)

            popup:Destroy()

            vipButton.Text = isVIP and "VIP [ACTIF]" or "VIP [INACTIF]"

            vipButton.BackgroundColor3 = isVIP and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(40, 40, 40)

        end)


        cancelButton.MouseButton1Click:Connect(function()

            popup:Destroy()

        end)

    end

end)


-- Gestion du clic sur le logo

logoButton.MouseButton1Click:Connect(function()

    mainFrame.Visible = not mainFrame.Visible

end)


-- Mise à jour de l'ESP en boucle

spawn(function()

    while true do

        if not isBanned() then

            updateESP()

        end

        task.wait(0.5)

    end

end)


-- Notification de démarrage

notify("🔥 ANONYMES SCRIPTS HUB v"..VERSION, "Cliquez sur le logo pour ouvrir le menu !", 5)


