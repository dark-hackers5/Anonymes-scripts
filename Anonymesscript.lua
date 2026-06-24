--[[
    ANONYMES SCRIPTS HUB - Blox Fruits (Version ULTIME 3.0)
    Créé par Khaled Salami | Compatible : Synapse X, Krnl, Fluxus, Delta, Script-Ware, etc.
    ✅ Toutes les fonctionnalités du jeu | ✅ Détection intelligente | ✅ Anti-Kick | ✅ VIP System
--]]

-- ========== [CONFIGURATION GLOBALE] ==========
local VERSION = "3.0"
local VIP_PASSWORD = "98961144"
local PRICE_FRUITS_PERMS = 5000000  -- 5M Beli
local PRICE_AUTO_PVP = 2000000       -- 2M Beli
local LOGO_URL = "https://mistralaichatupprodswe.blob.core.windows.net/chat-images/31/dc/45/31dc450a-f325-460f-9cb7-e7b6af1e9b56/2a4bb7b3-f8b7-497b-8390-753b144679bf/d23d3815-3676-4bc4-a5e4-8d9a18f9c78e"

-- ========== [LISTES DE DONNÉES] ==========
-- Liste complète des boss (nom, niveau minimal)
local BOSSES = {
    -- First Sea
    {Name = "Bandit", Level = 150, Sea = 1},
    {Name = "Leader", Level = 300, Sea = 1},
    {Name = "Brute", Level = 500, Sea = 1},
    {Name = "The Saw", Level = 1000, Sea = 1},
    {Name = "Shank", Level = 1100, Sea = 1},

    -- Second Sea
    {Name = "Don Swan", Level = 1000, Sea = 2},
    {Name = "Jeremy", Level = 1050, Sea = 2},
    {Name = "Saber Expert", Level = 1100, Sea = 2},
    {Name = "The Gorilla King", Level = 1200, Sea = 2},

    -- Third Sea
    {Name = "Don Swan [Lv. 1000]", Level = 1000, Sea = 3},
    {Name = "Jeremy [Lv. 1050]", Level = 1050, Sea = 3},
    {Name = "Wysper", Level = 1100, Sea = 3},
    {Name = "Thunder God", Level = 1150, Sea = 3},
    {Name = "Cursed Captain", Level = 1200, Sea = 3},

    -- Raid Boss
    {Name = "Dough King", Level = 0, Sea = 0, Type = "Raid"},
    {Name = "Leviathan", Level = 0, Sea = 0, Type = "Raid"},
    {Name = "Sea Beast", Level = 0, Sea = 0, Type = "Event"},
    {Name = "Terrorshark", Level = 0, Sea = 0, Type = "Event"},

    -- Event Boss
    {Name = "Magma Admiral", Level = 0, Sea = 0, Type = "Volcano"},
    {Name = "Mirror Boss", Level = 0, Sea = 0, Type = "Factory"},
    {Name = "Kitsune", Level = 0, Sea = 0, Type = "Special"},
    {Name = "Longma", Level = 0, Sea = 0, Type = "Special"},

    -- Quête Boss
    {Name = "Cursed Dual Katana", Level = 0, Sea = 0, Type = "Quest"},
    {Name = "Yama", Level = 0, Sea = 0, Type = "Quest"},
    {Name = "Tushita", Level = 0, Sea = 0, Type = "Quest"},
    {Name = "Sanguine Art", Level = 0, Sea = 0, Type = "Quest"}
}

-- Liste complète des îles avec positions exactes
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
    {Name = "Usopp", Sea = 2, Position = CFrame.new(2000, 10, -2000)},
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
    {Name = "Mirage Island", Sea = 0, Position = nil, IsRandom = true}  -- Île aléatoire
}

-- Liste des quêtes disponibles
local QUESTS = {
    {Name = "Leviathan", NPC = "Old Man", Reward = "Leviathan Gun"},
    {Name = "Dough King", NPC = "Cake Prince", Reward = "Dough Fruit"},
    {Name = "Cursed Dual Katana", NPC = "Hitman", Reward = "CDK"},
    {Name = "Yama", NPC = "Monk", Reward = "Yama Sword"},
    {Name = "Tushita", NPC = "Monk", Reward = "Tushita Sword"},
    {Name = "Sanguine Art", NPC = "Art Dealer", Reward = "Sanguine Art"},
    {Name = "Kitsune", NPC = "Mystic Lady", Reward = "Kitsune"},
    {Name = "Race V4", NPC = "Race Expert", Reward = "Race V4"}
}

-- ========== [VARIABLES GLOBALES] ==========
local player = game.Players.LocalPlayer
local isVIP = false
local hasFruitsPerms = false
local hasAutoPvP = false
local clickCount = 0
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

    -- Quêtes
    autoDoughKing = false,
    autoYama = false,
    autoTushita = false,
    autoCDK = false,
    autoSanguineArt = false,
    autoKitsune = false,
    autoRaceV4 = false,
    autoMirageIsland = false,

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

-- ========== [FONCTIONS UTILITAIRES] ==========
local function notify(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 3
    })
end

local function getBeli()
    local beliValue = player.Data and player.Data.Beli and player.Data.Beli.Value or "0"
    return tonumber(string.match(tostring(beliValue), "%d+")) or 0
end

local function hasEnoughBeli(amount)
    return getBeli() >= amount
end

local function payBeli(amount)
    if hasEnoughBeli(amount) then
        pcall(function()
            player.Data.Beli.Value = player.Data.Beli.Value - amount
        end)
        return true
    else
        notify("❌ Erreur", "Pas assez de Beli !", 3)
        return false
    end
end

local function toggleFeature(feature)
    toggles[feature] = not toggles[feature]
    return toggles[feature]
end

local function waitForCharacter()
    repeat task.wait() until player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    return player.Character
end

-- ========== [FONCTIONS DE DÉTECTION] ==========
local function getCurrentSea()
    if player.Data and player.Data.Level.Value >= 700 then
        return 3
    elseif player.Data and player.Data.Level.Value >= 150 then
        return 2
    else
        return 1
    end
end

local function getBoss(bossName)
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
    local nearestBoss, nearestDist = nil, math.huge
    for _, bossInfo in ipairs(BOSSES) do
        local boss = getBoss(bossInfo.Name)
        if boss and boss:FindFirstChild("HumanoidRootPart") then
            local dist = (player.Character and player.Character:FindFirstChild("HumanoidRootPart") and
                (player.Character.HumanoidRootPart.Position - boss.HumanoidRootPart.Position).Magnitude) or math.huge
            if dist < nearestDist then
                nearestBoss, nearestDist = boss, dist
            end
        end
    end
    return nearestBoss
end

local function findNPC(npcName)
    for _, npc in pairs(workspace.NPCs:GetChildren()) do
        if npc.Name:find(npcName) then
            return npc
        end
    end
    return nil
end

local function isInBoat()
    if not player.Character then return false end
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid and humanoid.SeatPart then
        return humanoid.SeatPart.Parent and humanoid.SeatPart.Parent.Name:find("Boat")
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
        if island.Name == "MirageIsland" or island.Name:find("Mirage") then
            return true, island
        end
    end
    return false
end

local function hasQuest(questName)
    if not player.Quests then return false end
    for _, quest in pairs(player.Quests:GetChildren()) do
        if quest.Name:find(questName) then
            return true, quest
        end
    end
    return false
end

local function hasSwordEquipped()
    if not player.Character then return false end
    for _, tool in pairs(player.Character:GetChildren()) do
        if tool:IsA("Tool") and (tool.Name:find("Sword") or tool.Name:find("Katana")) then
            return true
        end
    end
    return false
end

-- ========== [FONCTIONS DE COMBAT] ==========
local function attackTarget(target)
    pcall(function()
        if not player.Character or not target then return end
        if not player.Character:FindFirstChild("HumanoidRootPart") or not target:FindFirstChild("HumanoidRootPart") then return end

        -- Se positionner derrière la cible
        local targetPos = target.HumanoidRootPart.Position
        local myPos = player.Character.HumanoidRootPart.Position
        local direction = (targetPos - myPos).Unit
        player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPos + (direction * -5)) * CFrame.Angles(0, math.pi, 0)

        -- Attaquer
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(0.2)
        game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)

        -- Utiliser les compétences (Z, X, C, V)
        for _, key in ipairs({"Z", "X", "C", "V"}) do
            game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, nil)
            task.wait(0.1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, key, false, nil)
            task.wait(0.3)
        end
    end)
end

local function startKillAura()
    if not toggles.killAura then return end
    spawn(function()
        while toggles.killAura and task.wait(0.1) do
            pcall(function()
                local character = waitForCharacter()
                local nearestPlayer = getNearestPlayer()
                if nearestPlayer and nearestPlayer.Character and nearestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    attackTarget(nearestPlayer.Character.HumanoidRootPart)
                end
            end)
        end
    end)
end

local function getNearestPlayer()
    local nearest, nearestDist = nil, math.huge
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (player.Character and player.Character:FindFirstChild("HumanoidRootPart") and
                (player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude) or math.huge
            if dist < nearestDist and dist <= 50 then
                nearest, nearestDist = plr, dist
            end
        end
    end
    return nearest
end

-- ========== [FONCTIONS DE FARM] ==========
local function startAutoLevel()
    if not toggles.autoLevel then return end
    spawn(function()
        while toggles.autoLevel and task.wait(0.1) do
            pcall(function()
                local character = waitForCharacter()
                local mob = getNearestMob()
                if mob and mob:FindFirstChild("HumanoidRootPart") then
                    attackTarget(mob)
                end
            end)
        end
    end)
end

local function getNearestMob()
    local nearest, nearestDist = nil, math.huge
    for _, mob in pairs(workspace.Enemies:GetChildren()) do
        if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
            local dist = (player.Character and player.Character:FindFirstChild("HumanoidRootPart") and
                (player.Character.HumanoidRootPart.Position - mob.HumanoidRootPart.Position).Magnitude) or math.huge
            if dist < nearestDist then
                nearest, nearestDist = mob, dist
            end
        end
    end
    return nearest
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
                        -- Contrôler le bateau (avant + légèrement à gauche pour éviter les obstacles)
                        boat.VehicleSeat.Steer = 0.1
                        boat.VehicleSeat.Throttle = 1
                    end
                end
            end)
        end
    end)
end

local function teleportToNearestBoat()
    pcall(function()
        local nearestBoat, nearestDist = nil, math.huge
        for _, boat in pairs(workspace.Vehicles:GetChildren()) do
            if boat.Name:find("Boat") and boat:FindFirstChild("SpawnLocation") then
                local dist = (player.Character.HumanoidRootPart.Position - boat.SpawnLocation.Position).Magnitude
                if dist < nearestDist then
                    nearestBoat, nearestDist = boat, dist
                end
            end
        end
        if nearestBoat then
            player.Character.HumanoidRootPart.CFrame = nearestBoat.SpawnLocation.CFrame
            notify("✅ Bateau", "Téléporté vers un bateau !", 2)
        else
            notify("❌ Erreur", "Aucun bateau trouvé à proximité.", 2)
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
                        -- Augmenter la vitesse du bateau
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
                if seaBeast and seaBeast:FindFirstChild("HumanoidRootPart") then
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
                if leviathan and leviathan:FindFirstChild("HumanoidRootPart") then
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
        while toggles.autoLeviathanQuest and task.wait(1) do
            pcall(function()
                local character = waitForCharacter()

                -- Étape 1: Trouver le NPC (Old Man)
                local oldMan = findNPC("Old Man")
                if oldMan and oldMan:FindFirstChild("HumanoidRootPart") then
                    -- Se téléporter vers le NPC
                    character.HumanoidRootPart.CFrame = oldMan.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                    task.wait(1)

                    -- Vérifier si on a déjà la quête
                    local hasQuest, quest = hasQuest("Leviathan")
                    if not hasQuest then
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
                        character.HumanoidRootPart.CFrame = oldMan.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", oldMan)
                        notify("✅ Quête Leviathan", "Quête terminée ! Récompense obtenue.", 5)
                        toggles.autoLeviathanQuest = false
                        -- Mettre à jour le bouton
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

-- ========== [FONCTIONS DE PIRATE RAID / SHIP RAID] ==========
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

-- ========== [FONCTIONS DE TERRORSHARK / VOLCANO / FACTORY] ==========
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

-- ========== [FONCTIONS DE QUÊTES SPÉCIALES] ==========
local function startAutoDoughKing()
    if not toggles.autoDoughKing then return end
    spawn(function()
        while toggles.autoDoughKing and task.wait(1) do
            pcall(function()
                local doughKing = getBoss("Dough King")
                if doughKing then
                    attackTarget(doughKing)
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

-- ========== [FONCTIONS D'ÎLES MIrage] ==========
local function teleportToMirageIsland()
    pcall(function()
        local available, island = isMirageIslandAvailable()
        if available and island then
            if island:FindFirstChild("SpawnLocation") then
                player.Character.HumanoidRootPart.CFrame = island.SpawnLocation.CFrame
                notify("✅ Île Mirage", "Téléporté vers l'île Mirage !", 3)
            else
                -- Position par défaut si SpawnLocation n'existe pas
                player.Character.HumanoidRootPart.CFrame = CFrame.new(5000, 100, 5000)
            end
        else
            notify("❌ Erreur", "L'île Mirage n'est pas disponible pour le moment.", 3)
        end
    end)
end

local function startMirageIslandQuest()
    if not toggles.autoMirageIsland then return end
    spawn(function()
        while toggles.autoMirageIsland and task.wait(5) do
            pcall(function()
                -- Vérifier si l'île Mirage est disponible
                local available, island = isMirageIslandAvailable()
                if available then
                    teleportToMirageIsland()
                    task.wait(2)

                    -- Trouver le NPC de quête
                    local mirageNPC = findNPC("Mirage")
                    if mirageNPC and mirageNPC:FindFirstChild("HumanoidRootPart") then
                        player.Character.HumanoidRootPart.CFrame = mirageNPC.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        task.wait(1)

                        -- Accepter la quête
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", mirageNPC)

                        -- Trouver et tuer les ennemis de l'île Mirage
                        for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                            if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                                local dist = (player.Character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
                                if dist < 1000 then  -- Rayon de l'île Mirage
                                    attackTarget(enemy)
                                end
                            end
                        end

                        -- Retourner au NPC pour la récompense
                        if mirageNPC then
                            player.Character.HumanoidRootPart.CFrame = mirageNPC.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk", mirageNPC)
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
                for _, fruit in pairs(workspace:GetChildren()) do
                    if fruit.Name:find("Fruit") and fruit:FindFirstChild("HumanoidRootPart") then
                        player.Character.HumanoidRootPart.CFrame = fruit.HumanoidRootPart.CFrame
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
        while toggles.autoCollectRewards and task.wait(5) do
            pcall(function()
                -- Réclamer les récompenses quotidiennes/hebdomadaires
                local args = { [1] = "CollectAll" }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end)
        end
    end)
end

-- ========== [FONCTIONS DE FRUITS PERMS + DARK BLADE] ==========
local function giveFruitsPerms()
    if not hasFruitsPerms then return end
    pcall(function()
        -- Méthode 1: Utiliser RemoteEvent pour obtenir les fruits
        local fruitsList = {"Flame", "Ice", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Phoenix", "Dragon"}
        for _, fruitName in ipairs(fruitsList) do
            local args = { [1] = "BuyFruit", [2] = fruitName }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            task.wait(0.5)
        end

        -- Méthode 2: Obtenir Dark Blade
        local args = { [1] = "BuyItem", [2] = "Dark Blade" }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

        notify("✅ Fruits Perms", "Tous les fruits perm + Dark Blade obtenus !", 5)
    end)
end

-- ========== [FONCTIONS ESP] ==========
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
        billboardGui.Parent = part

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = text
        textLabel.TextColor3 = color
        textLabel.TextStrokeTransparency = 0
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextSize = 14
        textLabel.Parent = billboardGui
    end
end

local function updateESP()
    pcall(function()
        -- ESP Players
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                manageESP(plr.Character.HumanoidRootPart, "ESP_Player_ANONYMES", plr.Name .. " (" .. math.floor(dist) .. "m)", Color3.new(0, 1, 0))
            end
        end

        -- ESP Boss
        if toggles.espBoss then
            for _, boss in pairs(workspace.Enemies:GetChildren()) do
                if boss:FindFirstChild("HumanoidRootPart") and boss.Humanoid.Health > 0 then
                    local bossLevel = boss:FindFirstChild("Level") and boss.Level.Value or "?"
                    local bossName = boss.Name
                    for _, bossInfo in ipairs(BOSSES) do
                        if bossName:find(bossInfo.Name) then
                            bossName = bossInfo.Name
                            break
                        end
                    end
                    manageESP(boss.HumanoidRootPart, "ESP_Boss_ANONYMES", bossName .. " [Lv. " .. bossLevel .. "]", Color3.new(1, 0, 0))
                end
            end
        end

        -- ESP Fruits
        if toggles.espFruits then
            for _, fruit in pairs(workspace:GetChildren()) do
                if fruit.Name:find("Fruit") and fruit:FindFirstChild("HumanoidRootPart") then
                    manageESP(fruit.HumanoidRootPart, "ESP_Fruit_ANONYMES", fruit.Name, Color3.new(1, 1, 0))
                end
            end
        end

        -- ESP Chests
        if toggles.espChests then
            for _, chest in pairs(workspace:GetChildren()) do
                if chest.Name:find("Chest") and chest:FindFirstChild("PrimaryPart") then
                    manageESP(chest.PrimaryPart, "ESP_Chest_ANONYMES", "Chest", Color3.new(0, 1, 1))
                end
            end
        end

        -- ESP NPCs
        if toggles.espNPCs then
            for _, npc in pairs(workspace.NPCs:GetChildren()) do
                if npc:FindFirstChild("HumanoidRootPart") then
                    manageESP(npc.HumanoidRootPart, "ESP_NPC_ANONYMES", npc.Name, Color3.new(1, 0, 1))
                end
            end
        end
    end)
end

-- ========== [FONCTIONS DE TÉLÉPORTATION] ==========
local function teleportToMob()
    if not toggles.teleportMobs then return end
    spawn(function()
        while toggles.teleportMobs and task.wait(1) do
            pcall(function()
                local mob = getNearestMob()
                if mob and mob:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                end
            end)
        end
    end)
end

local function bringMob()
    if not toggles.bringMob then return end
    spawn(function()
        while toggles.bringMob and task.wait(0.5) do
            pcall(function()
                for _, mob in pairs(workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        mob.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
                        mob.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end)
        end
    end)
end

local function teleportToIsland(islandName)
    for _, island in ipairs(ISLANDS) do
        if island.Name:lower():find(islandName:lower()) then
            if island.Position then
                player.Character.HumanoidRootPart.CFrame = island.Position
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
end

local function autoIslandHop()
    if not toggles.autoIslandHop then return end
    spawn(function()
        while toggles.autoIslandHop and task.wait(60) do
            pcall(function()
                -- Changer de serveur toutes les minutes
                local TeleportService = game:GetService("TeleportService")
                TeleportService:Teleport(game.PlaceId)
            end)
        end
    end)
end

-- ========== [FONCTIONS MOUVEMENT] ==========
local function enableWalkOnWater()
    if toggles.walkOnWater then
        spawn(function()
            while toggles.walkOnWater and task.wait(0.1) do
                pcall(function()
                    if player.Character and player.Character:FindFirstChild("Humanoid") then
                        player.Character.Humanoid.WalkSpeed = 50
                    end
                end)
            end
        end)
    end
end

local function enableInfiniteJump()
    if toggles.infiniteJump then
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end

local function enableNoClip()
    if toggles.noClip then
        spawn(function()
            while toggles.noClip and task.wait(0.1) do
                pcall(function()
                    if player.Character then
                        for _, part in pairs(player.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                end)
            end
        end)
    else
        if player.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end

local function enableFlight()
    if not toggles.flight then return end
    spawn(function()
        local flightSpeed = 100
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)

        while toggles.flight and task.wait(0.1) do
            pcall(function()
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    if not player.Character.HumanoidRootPart:FindFirstChild("FlightVelocity") then
                        bodyVelocity.Parent = player.Character.HumanoidRootPart
                        bodyVelocity.Name = "FlightVelocity"
                    end

                    -- Contrôle du vol avec les touches WASD
                    local moveDirection = Vector3.new(0, 0, 0)
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                        moveDirection = moveDirection + (player.Character.HumanoidRootPart.CFrame.LookVector * flightSpeed)
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                        moveDirection = moveDirection - (player.Character.HumanoidRootPart.CFrame.LookVector * flightSpeed)
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                        moveDirection = moveDirection - (player.Character.HumanoidRootPart.CFrame.RightVector * flightSpeed)
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                        moveDirection = moveDirection + (player.Character.HumanoidRootPart.CFrame.RightVector * flightSpeed)
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
            end)
        end
        bodyVelocity:Destroy()
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
                    if v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") then
                        v.Enabled = false
                    end
                end

                -- Réduire la distance de rendu
                workspace.DescendantAdded:Connect(function(descendant)
                    if descendant:IsA("ParticleEmitter") or descendant:IsA("Fire") or descendant:IsA("Smoke") then
                        descendant.Enabled = false
                    end
                end)

                -- Optimiser les graphismes
                settings().RenderQuality = Enum.RenderQuality.Low
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
            "Fruits Perms + Dark Blade: Gratuit\n" ..
            "Auto PvP: Gratuit", 5)
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
        end
    end
    return false
end

-- ========== [CRÉATION DE L'UI] ==========
local function createUI()
    pcall(function()
        if syn and syn.protect_gui then
            syn.protect_gui(Instance.new("ScreenGui"))
        end
    end)

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ANONYMES_SCRIPTS_HUB"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- ===== LOGO MINIATURE =====
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

    -- Gestion des clics sur l'écran pour le logo
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            clickCount = clickCount + 1
            if clickCount >= 15 then
                logoFrame.Visible = not logoFrame.Visible
                clickCount = 0
            end
        end
    end)

    -- Cliquer sur le logo ouvre le menu principal
    logoImage.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
    end)

    -- ===== FENÊTRE PRINCIPALE =====
    local mainFrame = Instance.new("Frame")
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
    titleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)  -- Couleur or
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
            tabFrames[tabName].Visible = true
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
    welcomeLabel.Size = UDim2.new(1, -20, 0, 100)
    welcomeLabel.BackgroundTransparency = 1
    welcomeLabel.Text = "🏴‍☠️ ANONYMES SCRIPTS HUB v" .. VERSION .. " 🏴‍☠️\n\n" ..
        "✅ Toutes les fonctionnalités de Blox Fruits\n" ..
        "🔒 VIP: Mot de passe = 98961144 (accès gratuit pour toi)\n" ..
        "💰 Public: 5M Beli (Fruits Perms + Dark Blade), 2M Beli (Auto PvP)\n\n" ..
        "📌 Nouveau: Conduite de bateaux, Quête Leviathan complète, Îles Mirage, Détection intelligente des boss"
    welcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    welcomeLabel.TextSize = 14
    welcomeLabel.TextWrapped = true
    welcomeLabel.Font = Enum.Font.SourceSans
    welcomeLabel.Parent = homeFrame

    local vipButton = Instance.new("TextButton")
    vipButton.Name = "VIPButton"
    vipButton.Size = UDim2.new(0, 200, 0, 30)
    vipButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    vipButton.Text = "🔑 Entrer le mot de passe VIP"
    vipButton.TextColor3 = Color3.fromRGB(255, 215, 0)
    vipButton.Parent = homeFrame
    vipButton.MouseButton1Click:Connect(function()
        local password = game.StarterGui:GetCore("PromptInput", {
            Title = "Mot de passe VIP",
            Text = "Entrez le code :"
        })
        if password then
            checkVIP(password)
        end
    end)

    local beliLabel = Instance.new("TextLabel")
    beliLabel.Name = "BeliLabel"
    beliLabel.Size = UDim2.new(1, -20, 0, 20)
    beliLabel.Position = UDim2.new(0, 0, 0, 140)
    beliLabel.BackgroundTransparency = 1
    beliLabel.Text = "💰 Beli: " .. getBeli() .. " | 🌊 Sea: " .. getCurrentSea()
    beliLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    beliLabel.TextSize = 14
    beliLabel.Font = Enum.Font.SourceSansBold
    beliLabel.Parent = homeFrame

    -- Mettre à jour l'affichage du Beli
    spawn(function()
        while true do
            task.wait(5)
            beliLabel.Text = "💰 Beli: " .. getBeli() .. " | 🌊 Sea: " .. getCurrentSea()
        end
    end)

    -- Onglet Farming
    local farmingFrame = tabFrames["Farming"]

    local farmingFeatures = {
        {Name = "autoLevel", Display = "Auto Level", Price = 0, Category = "Farming"},
        {Name = "autoNearest", Display = "Auto Nearest", Price = 0, Category = "Farming"},
        {Name = "autoEctoplasm", Display = "Auto Ectoplasm", Price = 0, Category = "Farming"},
        {Name = "autoCandy", Display = "Auto Candy", Price = 0, Category = "Farming"},
        {Name = "autoGifts", Display = "Auto Gifts", Price = 0, Category = "Farming"},
        {Name = "autoCollect", Display = "Auto Collect Fruits", Price = 0, Category = "Farming"},
        {Name = "autoCollectRewards", Display = "Auto Collect Rewards", Price = 0, Category = "Farming"}
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
        {Name = "autoPvP", Display = "Auto PvP", Price = 2000000, Category = "Combat"},
        {Name = "killAura", Display = "Kill Aura", Price = 0, Category = "Combat"},
        {Name = "triggerBot", Display = "TriggerBot", Price = 0, Category = "Combat"},
        {Name = "autoAttack", Display = "Auto Attack", Price = 0, Category = "Combat"}
    }

    for _, feature in ipairs(combatFeatures) do
        local button = Instance.new("TextButton")
        button.Name = feature.Name .. "Button"
        button.Size = UDim2.new(1, -10, 0, 30)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Text = (feature.Price > 0 and not hasAutoPvP and not isVIP) and feature.Display .. " (2M Beli)" or feature.Display .. " [OFF]"
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 14
        button.Parent = combatFrame

        button.MouseButton1Click:Connect(function()
            if feature.Price > 0 then
                if buyFeature(feature.Name, feature.Price) then
                    button.Text = feature.Display .. " [OFF]"
                end
            else
                local newState = toggleFeature(feature.Name)
                button.Text = feature.Display .. " [" .. (newState and "ON" or "OFF") .. "]"

                if newState then
                    if feature.Name == "killAura" then
                        startKillAura()
                    elseif feature.Name == "triggerBot" then
                        startTriggerBot()
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
        {Name = "autoFactory", Display = "Auto Factory (Mirror Boss)", Price = 0}
    }

    for _, feature in ipairs(eventFeatures) do
        local button = Instance.new("TextButton")
        button.Name = feature.Name .. "Button"
        button.Size = UDim2.new(1, -10, 0, 30)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Text = feature.Display .. (feature.Name == "autoLeviathanQuest" and " [OFF]" or " [OFF]")
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
        {Name = "autoMirageIsland", Display = "⭐ Auto Mirage Island (Quête)", Price = 0}
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
                end
            end
        end)
    end

    -- Onglet Boats
    local boatsFrame = tabFrames["Boats"]

    local boatFeatures = {
        {Name = "autoBoat", Display = "Auto Conduire Bateau", Price = 0},
        {Name = "teleportToBoat", Display = "Téléport vers Bateau", Price = 0},
        {Name = "boatSpeed", Display = "Boat Speed Hack", Price = 0}
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
            local newState = toggleFeature(feature.Name)
            button.Text = feature.Display .. " [" .. (newState and "ON" or "OFF") .. "]"

            if newState then
                if feature.Name == "autoBoat" then
                    startAutoBoat()
                elseif feature.Name == "teleportToBoat" then
                    teleportToNearestBoat()
                elseif feature.Name == "boatSpeed" then
                    boostBoatSpeed()
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
        local newState = toggleFeature("autoMirageIsland")
        mirageButton.Text = "🏝️ Téléport vers Île Mirage [" .. (newState and "ON" or "OFF") .. "]"
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
        if island.Name ~= "Mirage Island" then  -- Mirage a déjà un bouton dédié
            local islandButton = Instance.new("TextButton")
            islandButton.Name = "TeleportTo" .. island.Name:gsub("%s+", "") .. "Button"
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
        {Name = "espPlayers", Display = "ESP Players", Price = 0, Color = Color3.new(0, 1, 0)},
        {Name = "espBoss", Display = "ESP Boss", Price = 0, Color = Color3.new(1, 0, 0)},
        {Name = "espFruits", Display = "ESP Fruits", Price = 0, Color = Color3.new(1, 1, 0)},
        {Name = "espChests", Display = "ESP Chests", Price = 0, Color = Color3.new(0, 1, 1)},
        {Name = "espNPCs", Display = "ESP NPCs", Price = 0, Color = Color3.new(1, 0, 1)}
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
        {Name = "flight", Display = "Flight (Vol libre)", Price = 0}
    }

    for _, feature in ipairs(movementFeatures) do
        local button = Instance.new("TextButton")
        button.Name = feature.Name .. "Button"
        button.Size = UDim2.new(1, -10, 0, 30)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Text = feature.Display .. " [OFF]"
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 14
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
            else
                if feature.Name == "noClip" then
                    enableNoClip()  -- Appel pour désactiver
                elseif feature.Name == "flight" then
                    enableFlight()  -- Appel pour désactiver
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
    fruitsPermsButton.Text = hasFruitsPerms and "Fruits Perms + Dark Blade [OFF]" or (isVIP and "Fruits Perms + Dark Blade [OFF]" or "Fruits Perms + Dark Blade (5M Beli)")
    fruitsPermsButton.TextColor3 = Color3.fromRGB(255, 215, 0)
    fruitsPermsButton.Font = Enum.Font.SourceSansBold
    fruitsPermsButton.TextSize = 14
    fruitsPermsButton.Parent = adminFrame

    fruitsPermsButton.MouseButton1Click:Connect(function()
        if hasFruitsPerms or isVIP then
            local newState = toggleFeature("fruitsPerms")
            fruitsPermsButton.Text = "Fruits Perms + Dark Blade [" .. (newState and "ON" or "OFF") .. "]"
            if newState then
                giveFruitsPerms()
            end
        else
            if buyFeature("fruitsPerms", PRICE_FRUITS_PERMS) then
                fruitsPermsButton.Text = "Fruits Perms + Dark Blade [OFF]"
            end
        end
    end)

    -- Auto PvP
    local autoPvPButton = Instance.new("TextButton")
    autoPvPButton.Name = "autoPvPButton"
    autoPvPButton.Size = UDim2.new(1, -10, 0, 30)
    autoPvPButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    autoPvPButton.Text = hasAutoPvP and "Auto PvP [OFF]" or (isVIP and "Auto PvP [OFF]" or "Auto PvP (2M Beli)")
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
        {Name = "serverHop", Display = "Server Hop", Price = 0},
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
        "🔹 Logo en haut à gauche (15 clics pour cacher).\n" ..
        "🔹 VIP: Mot de passe = 98961144.\n" ..
        "🔹 Nouveau: Bateaux, Quête Leviathan, Îles Mirage, ESP complet, Haki auto.", 8)
end

-- ========== [DÉMARRAGE DU SCRIPT] ==========
pcall(function()
    -- Attendre que le joueur soit chargé
    repeat task.wait() until player and player:IsDescendantOf(game)
    repeat task.wait() until player.Character and player.Character:FindFirstChild("HumanoidRootPart")

    -- Créer l'UI
    createUI()
end)
