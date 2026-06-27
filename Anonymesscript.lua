-- =============================================
-- ANONYMES SCRIPT v2.0 | BLOX FRUITS
-- LOGO ANIMÉ + GLISSEMENT (version téléphone)
-- =============================================
local SCRIPT_VERSION = "2.0"
local LOGO_ASSET_ID = "rbxassetid://73393542095412" -- Change ici ton asset ID

-- SERVICES
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local VU = game:GetService("VirtualUser")
local UIS = game:GetService("UserInputService")
local RunS = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local plr = Players.LocalPlayer
repeat task.wait() until plr.Character
local char = plr.Character
local hum = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

local Remotes = RS:WaitForChild("Remotes")
local CF = Remotes:WaitForChild("CommF_")
local CE = Remotes:WaitForChild("CommE_")

-- UTILITIES
local function cmd(...) return pcall(CF.InvokeServer, CF, ...) end
local function getC() return plr.Character or plr.CharacterAdded:Wait() end
local function getR() local c = getC(); return c:FindFirstChild("HumanoidRootPart") or c:WaitForChild("HumanoidRootPart") end
local function getH() local c = getC(); return c:FindFirstChild("Humanoid") or c:WaitForChild("Humanoid") end
local function getLv() return plr.Data.Level.Value end

local function tweenTo(pos)
    local r = getR()
    if not r then return end
    r.CFrame = CFrame.new(pos.X, pos.Y + 5, pos.Z)
end

local function findEnemy(name)
    local e = workspace:FindFirstChild("Enemies")
    if not e then return nil end
    for _, v in pairs(e:GetChildren()) do
        if v.Name == name and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
    return nil
end

local function attackTarget(target)
    local r = getR()
    if not r or not target then return end
    local tp = target:FindFirstChild("HumanoidRootPart") or target:FindFirstChild("Torso") or target
    r.CFrame = tp.CFrame * CFrame.new(0, 0, 5)
    local tool = char:FindFirstChildOfClass("Tool")
    if tool then tool:Activate() end
    VU:ClickButton1(Vector2.new(), workspace.CurrentCamera.CFrame)
end

-- ANTI-AFK
spawn(function() while task.wait(30) do pcall(function() VU:ClickButton2(Vector2.new()) local r = getR(); if r then r.Velocity = Vector3.new(0,0.1,0) end end) end end)

-- =============================================
-- TOGGLES
-- =============================================
local T = {}
local toggleList = {
    "autoFarm","autoLevel","autoMastery","autoStats","autoQuest","autoChest","autoBeli","autoDungeon",
    "autoBoss","autoElite","autoRaid",
    "autoSeaBeast","autoTerrorshark","autoLeviathan","autoShipRaid","autoRoughSea","autoKitsune",
    "autoFactory","autoCastle",
    "autoAllBosses","autoDoughKing","autoCakePrince","autoRipIndra","autoCyborg","autoStone","autoIslandEmpress",
    "autoSword","autoGun","autoFightingStyle",
    "autoBounty","autoPvP","killAura","fastAttack","noCooldown","godMode",
    "autoCollectFruit","autoStoreFruit","autoRandomFruit","autoFruitSniper","autoFruitRain",
    "autoBones","autoEctoplasm","autoCandy","autoAllMaterials","autoFragments",
    "autoMagnetite","autoQuartz","autoSamurai","autoDragonScale","autoLeather","autoFishScales",
    "autoWood","autoIron","autoGems","autoScrap","autoSpikes",
    "autoRaceV2","autoRaceV3","autoRaceV4","autoObservation","autoKenHaki","autoHakiColor",
    "autoYama","autoTushita","autoCDK","autoSoulGuitar","autoGodhuman","autoSuperhuman",
    "autoBartilo","autoCitizen","autoFlowerQuest","autoMirage",
    "fly","infiniteJump","noClip","walkOnWater","speed",
    "fruitESP","chestESP","playerESP","enemyESP","islandESP","shipESP",
    "antiBan","autoRejoin","autoServerHop","fpsBoost",
    "autoRaidChip","autoRaidStart","autoRaidFarm","autoLawRaid","autoFlameRaid","autoIceRaid",
    "autoQuakeRaid","autoLightRaid","autoDarkRaid","autoDoughRaid","autoRubyRaid",
    "autoBuySwords","autoBuyGuns","autoBuyFightingStyles","autoBuyAccessories","autoBuyBoats",
    "autoBuyFruits","autoUpgradeSword","autoUpgradeGun","autoUpgradeFightingStyle",
    "autoFishing","autoFishFarm","autoSummonBoat","autoDriveBoat","autoBoatSpeed",
    "autoDragonTrident","autoDarkDagger","autoPoleV2","autoWando","autoCanvander",
    "autoKoko","autoBuddySword","autoSerpentBoss","autoLongsword",
    "autoCursedCaptain","autoBeautifulPirate","autoTyrantSkies","autoCakeQueen","autoSoulReaper",
    "autoDonSwan","autoOrder","autoViceAdmiral","autoSaberExpert","autoMagmaAdmiral",
    "autoGorillaKing","autoKilAdmiral","autoCaptainElephant"
}
for _, k in ipairs(toggleList) do T[k] = false end

local BOSSES = {"Gorilla King","Vice Admiral","Saber Expert","Magma Admiral","Cursed Captain","Don Swan","Order","RIP Indra","Dough King","Cake Prince","Sea Beast","Leviathan","Terrorshark","Cyborg","Stone","Island Empress","Kilo Admiral","Captain Elephant","Beautiful Pirate","Soul Reaper","Cake Queen","Tyrant of the Skies"}
for _, b in ipairs(BOSSES) do T["boss_"..b:gsub(" ","")] = false end

-- =============================================
-- ÎLES / POSITIONS
-- =============================================
local ISLANDS = {
    {"Jungle", Vector3.new(-3863.5, 461.2, -2392.9)},
    {"Pirate Village", Vector3.new(-1122.7, 4.5, 3855.6)},
    {"Desert", Vector3.new(984.4, 4.5, 4101.8)},
    {"Frozen Village", Vector3.new(1121.3, 5.4, 1111.1)},
    {"Marine Fortress", Vector3.new(-5051.7, 80.2, 4335.1)},
    {"Skylands", Vector3.new(-4859.5, 734.5, -5234.7)},
    {"Prison", Vector3.new(4842.4, 5.4, -740.1)},
    {"Colosseum", Vector3.new(-2269.5, 11.2, 7655.1)},
    {"Magma Village", Vector3.new(-5402.9, 43.6, 8442.1)},
    {"Underwater City", Vector3.new(3562.3, 118.1, -5924.2)},
    {"Upper Skylands", Vector3.new(-6508.6, 5000.0, -132.8)},
    {"Fountain City", Vector3.new(6931.1, 4.5, 7222.1)},
    {"Kingdom of Rose", Vector3.new(-2621.6, 32.3, -7895.4)},
    {"Green Zone", Vector3.new(2020.4, 88.6, -9052.5)},
    {"Factory", Vector3.new(-548.8, 28.5, -10882.3)},
    {"Graveyard", Vector3.new(2883.1, 60.2, -12054.8)},
    {"Snow Mountain", Vector3.new(1004.6, 90.2, -13025.3)},
    {"Hot and Cold", Vector3.new(-5557.7, 28.5, -11082.3)},
    {"Cursed Ship", Vector3.new(916.6, 12.3, -12182.8)},
    {"Ice Castle", Vector3.new(6199.5, 17.5, -1291.7)},
    {"Forgotten Island", Vector3.new(-3093.1, 12.5, -10235.6)},
    {"Mansion", Vector3.new(-3000, 12.5, -9000)},
    {"Port Town", Vector3.new(-1286.4, 22.5, 12288.5)},
    {"Hydra Island", Vector3.new(5224.5, 86.5, -1932.5)},
    {"Great Tree", Vector3.new(2555.1, 92.5, -2200.5)},
    {"Floating Turtle", Vector3.new(-697.3, 145.5, 13970.8)},
    {"Haunted Castle", Vector3.new(-9515.3, 315.8, -6960.7)},
    {"Sea of Treats", Vector3.new(1162.4, 138.5, 20360.2)},
    {"Tiki Outpost", Vector3.new(-11308.8, 108.5, 8084.8)},
    {"Submerged Island", Vector3.new(-6011.7, 28.5, -11522.8)},
    {"Castle on the Sea", Vector3.new(-534.8, 228.5, 5441.5)},
    {"Mirage Island", Vector3.new(0, 100, 0)},
    {"Prehistoric Island", Vector3.new(-1200, 15, -14100)},
    {"Volcano Island", Vector3.new(-6100, 100, 2600)},
    {"Turtle Island", Vector3.new(-2000, 50, 5000)},
}
local ISLAND_NAMES = {}
for _, v in ipairs(ISLANDS) do ISLAND_NAMES[v[1]] = v[2] end

-- =============================================
-- QUÊTES PAR NIVEAU
-- =============================================
local QUESTS = {
    {min=1,max=9,npc="BanditQuestGiver",mob="Bandit",quest="BanditQuest1",lq=1,island="Jungle"},
    {min=10,max=14,npc="MonkeyQuestGiver",mob="Monkey",quest="JungleQuest",lq=1,island="Jungle"},
    {min=15,max=29,npc="GorillaQuestGiver",mob="Gorilla",quest="JungleQuest",lq=2,island="Jungle"},
    {min=30,max=39,npc="PirateQuestGiver",mob="Pirate",quest="PirateQuest",lq=1,island="Pirate Village"},
    {min=40,max=54,npc="BruteQuestGiver",mob="Brute",quest="PirateQuest",lq=2,island="Pirate Village"},
    {min=55,max=59,npc="QuestGiverBobby",mob="Bobby",quest="PirateQuest",lq=3,island="Pirate Village"},
    {min=60,max=74,npc="DesertBanditQuestGiver",mob="Desert Bandit",quest="DesertQuest",lq=1,island="Desert"},
    {min=75,max=89,npc="DesertOfficerQuestGiver",mob="Desert Officer",quest="DesertQuest",lq=2,island="Desert"},
    {min=90,max=99,npc="SnowBanditQuestGiver",mob="Snow Bandit",quest="SnowQuest",lq=1,island="Frozen Village"},
    {min=100,max=119,npc="SnowmanQuestGiver",mob="Snowman",quest="SnowQuest",lq=2,island="Frozen Village"},
    {min=120,max=134,npc="ChiefPettyQuestGiver",mob="Chief Petty Officer",quest="MarineQuest",lq=1,island="Marine Fortress"},
    {min=135,max=149,npc="ViceAdmiralQuestGiver",mob="Vice Admiral",quest="MarineQuest",lq=2,island="Marine Fortress"},
    {min=150,max=174,npc="SkyBanditQuestGiver",mob="Sky Bandit",quest="SkyQuest",lq=1,island="Skylands"},
    {min=175,max=189,npc="DarkMasterQuestGiver",mob="Dark Master",quest="SkyQuest",lq=2,island="Skylands"},
    {min=190,max=224,npc="TogaWarriorQuestGiver",mob="Toga Warrior",quest="ColosseumQuest",lq=1,island="Colosseum"},
    {min=225,max=249,npc="GladiatorQuestGiver",mob="Gladiator",quest="ColosseumQuest",lq=2,island="Colosseum"},
    {min=250,max=299,npc="MilitarySoldierQuestGiver",mob="Military Soldier",quest="MagmaQuest",lq=1,island="Magma Village"},
    {min=300,max=324,npc="MilitarySpyQuestGiver",mob="Military Spy",quest="MagmaQuest",lq=2,island="Magma Village"},
    {min=325,max=374,npc="FishmanWarriorQuestGiver",mob="Fishman Warrior",quest="FishmanQuest",lq=1,island="Underwater City"},
    {min=375,max=399,npc="FishmanCommandoQuestGiver",mob="Fishman Commando",quest="FishmanQuest",lq=2,island="Underwater City"},
    {min=400,max=449,npc="GodGuardQuestGiver",mob="God's Guard",quest="SkyExpQuest",lq=1,island="Upper Skylands"},
    {min=450,max=474,npc="ShandaQuestGiver",mob="Shanda",quest="SkyExpQuest",lq=2,island="Upper Skylands"},
    {min=475,max=624,npc="GalleyPirateQuestGiver",mob="Galley Pirate",quest="FountainQuest",lq=1,island="Fountain City"},
    {min=625,max=699,npc="GalleyCaptainQuestGiver",mob="Galley Captain",quest="FountainQuest",lq=2,island="Fountain City"},
    {min=700,max=724,npc="RaiderQuestGiver",mob="Raider",quest="PiratePortQuest",lq=1,island="Kingdom of Rose"},
    {min=725,max=874,npc="MercenaryQuestGiver",mob="Mercenary",quest="PiratePortQuest",lq=2,island="Kingdom of Rose"},
    {min=875,max=899,npc="MarineQuestGiver",mob="Marine",quest="MarineTreeQuest",lq=1,island="Green Zone"},
    {min=900,max=949,npc="MarineCaptainQuestGiver",mob="Marine Captain",quest="MarineTreeQuest",lq=2,island="Green Zone"},
    {min=950,max=974,npc="ZombieQuestGiver",mob="Zombie",quest="GraveyardQuest",lq=1,island="Graveyard"},
    {min=975,max=999,npc="VampireQuestGiver",mob="Vampire",quest="GraveyardQuest",lq=2,island="Graveyard"},
    {min=1000,max=1024,npc="SnowTrooperQuestGiver",mob="Snow Trooper",quest="SnowMountainQuest",lq=1,island="Snow Mountain"},
    {min=1025,max=1049,npc="WinterWarriorQuestGiver",mob="Winter Warrior",quest="SnowMountainQuest",lq=2,island="Snow Mountain"},
    {min=1050,max=1099,npc="LabSubQuestGiver",mob="Lab Subordinate",quest="HotColdQuest",lq=1,island="Hot and Cold"},
    {min=1100,max=1124,npc="HornedWarriorQuestGiver",mob="Horned Warrior",quest="HotColdQuest",lq=2,island="Hot and Cold"},
    {min=1125,max=1199,npc="ShipDeckhandQuestGiver",mob="Ship Deckhand",quest="ShipQuest",lq=1,island="Cursed Ship"},
    {min=1200,max=1224,npc="ShipEngineerQuestGiver",mob="Ship Engineer",quest="ShipQuest",lq=2,island="Cursed Ship"},
    {min=1225,max=1249,npc="ShipStewardQuestGiver",mob="Ship Steward",quest="ShipQuest",lq=3,island="Cursed Ship"},
    {min=1250,max=1274,npc="ShipOfficerQuestGiver",mob="Ship Officer",quest="ShipQuest",lq=4,island="Cursed Ship"},
    {min=1275,max=1349,npc="ArcticWarriorQuestGiver",mob="Arctic Warrior",quest="IceCastleQuest",lq=1,island="Ice Castle"},
    {min=1350,max=1399,npc="SnowLurkerQuestGiver",mob="Snow Lurker",quest="IceCastleQuest",lq=2,island="Ice Castle"},
    {min=1400,max=1424,npc="SeaSoldierQuestGiver",mob="Sea Soldier",quest="ForgottenIslandQuest",lq=1,island="Forgotten Island"},
    {min=1425,max=1499,npc="WaterFighterQuestGiver",mob="Water Fighter",quest="ForgottenIslandQuest",lq=2,island="Forgotten Island"},
    {min=1500,max=1524,npc="PirateMillionaireQuestGiver",mob="Pirate Millionaire",quest="PortTownQuest",lq=1,island="Port Town"},
    {min=1525,max=1549,npc="PistolBillionaireQuestGiver",mob="Pistol Billionaire",quest="PortTownQuest",lq=2,island="Port Town"},
    {min=1550,max=1574,npc="DragonWarriorQuestGiver",mob="Dragon Crew Warrior",quest="HydraIslandQuest",lq=1,island="Hydra Island"},
    {min=1575,max=1599,npc="DragonArcherQuestGiver",mob="Dragon Crew Archer",quest="HydraIslandQuest",lq=2,island="Hydra Island"},
    {min=1600,max=1624,npc="FemaleIslanderQuestGiver",mob="Female Islander",quest="HydraIslandQuest",lq=3,island="Hydra Island"},
    {min=1625,max=1649,npc="GiantIslanderQuestGiver",mob="Giant Islander",quest="HydraIslandQuest",lq=4,island="Hydra Island"},
    {min=1650,max=1699,npc="MarineCommandoQuestGiver",mob="Marine Commodore",quest="GreatTreeQuest",lq=1,island="Great Tree"},
    {min=1700,max=1724,npc="MarineRearAdmiralQuestGiver",mob="Marine Rear Admiral",quest="GreatTreeQuest",lq=2,island="Great Tree"},
    {min=1725,max=1774,npc="FishmanRaiderQuestGiver",mob="Fishman Raider",quest="FloatingTurtleQuest",lq=1,island="Floating Turtle"},
    {min=1775,max=1799,npc="FishmanCaptainQuestGiver",mob="Fishman Captain",quest="FloatingTurtleQuest",lq=2,island="Floating Turtle"},
    {min=1800,max=1824,npc="ForestPirateQuestGiver",mob="Forest Pirate",quest="FloatingTurtleQuest",lq=3,island="Floating Turtle"},
    {min=1825,max=1849,npc="MythologicalPirateQuestGiver",mob="Mythological Pirate",quest="FloatingTurtleQuest",lq=4,island="Floating Turtle"},
    {min=1850,max=1874,npc="JunglePirateQuestGiver",mob="Jungle Pirate",quest="FloatingTurtleQuest",lq=5,island="Floating Turtle"},
    {min=1875,max=1899,npc="MusketeerPirateQuestGiver",mob="Musketeer Pirate",quest="FloatingTurtleQuest",lq=6,island="Floating Turtle"},
    {min=1900,max=1974,npc="RebornSkeletonQuestGiver",mob="Reborn Skeleton",quest="HauntedCastleQuest",lq=1,island="Haunted Castle"},
    {min=1975,max=1999,npc="LivingZombieQuestGiver",mob="Living Zombie",quest="HauntedCastleQuest",lq=2,island="Haunted Castle"},
    {min=2000,max=2024,npc="DemonicSoulQuestGiver",mob="Demonic Soul",quest="HauntedCastleQuest",lq=3,island="Haunted Castle"},
    {min=2025,max=2049,npc="PossessedMummyQuestGiver",mob="Possessed Mummy",quest="HauntedCastleQuest",lq=4,island="Haunted Castle"},
    {min=2050,max=2074,npc="PeanutScoutQuestGiver",mob="Peanut Scout",quest="SeaOfTreatsQuest",lq=1,island="Sea of Treats"},
    {min=2075,max=2099,npc="PeanutPresidentQuestGiver",mob="Peanut President",quest="SeaOfTreatsQuest",lq=2,island="Sea of Treats"},
    {min=2100,max=2124,npc="IceCreamChefQuestGiver",mob="Ice Cream Chef",quest="SeaOfTreatsQuest",lq=3,island="Sea of Treats"},
    {min=2125,max=2149,npc="IceCreamCommanderQuestGiver",mob="Ice Cream Commander",quest="SeaOfTreatsQuest",lq=4,island="Sea of Treats"},
    {min=2150,max=2199,npc="CookieCrafterQuestGiver",mob="Cookie Crafter",quest="SeaOfTreatsQuest",lq=5,island="Sea of Treats"},
    {min=2200,max=2249,npc="CakeGuardQuestGiver",mob="Cake Guard",quest="SeaOfTreatsQuest",lq=6,island="Sea of Treats"},
    {min=2250,max=2299,npc="BakingStaffQuestGiver",mob="Baking Staff",quest="SeaOfTreatsQuest",lq=7,island="Sea of Treats"},
    {min=2300,max=2349,npc="HeadBakerQuestGiver",mob="Head Baker",quest="SeaOfTreatsQuest",lq=8,island="Sea of Treats"},
    {min=2350,max=2449,npc="IslandBoyQuestGiver",mob="Island Boy",quest="TikiOutpostQuest",lq=1,island="Tiki Outpost"},
    {min=2450,max=2499,npc="IslandGirlQuestGiver",mob="Island Girl",quest="TikiOutpostQuest",lq=2,island="Tiki Outpost"},
    {min=2500,max=2549,npc="SunKissedWarriorQuestGiver",mob="Sun-kissed Warrior",quest="TikiOutpostQuest",lq=3,island="Tiki Outpost"},
    {min=2550,max=2599,npc="IsleChampionQuestGiver",mob="Isle Champion",quest="TikiOutpostQuest",lq=4,island="Tiki Outpost"},
    {min=2600,max=2800,npc="SubmergedIslandQuestGiver",mob="Submerged Enemy",quest="SubmergedIslandQuest",lq=1,island="Submerged Island"},
}

local currentQuest = nil

local function takeQuest()
    local lv = getLv()
    for _, q in ipairs(QUESTS) do
        if lv >= q.min and lv <= q.max then
            pcall(cmd, "AbandonQuest")
            local pos = ISLAND_NAMES[q.island]
            if pos then tweenTo(pos) task.wait(0.8) end
            local ok = pcall(cmd, "SetQuest", q.quest, q.lq)
            if ok then currentQuest = q end
            break
        end
    end
end

local function farmCurrent()
    if not currentQuest then takeQuest(); return end
    local mob = currentQuest.mob
    local enemy = findEnemy(mob)
    if enemy then
        attackTarget(enemy)
    else
        local pos = ISLAND_NAMES[currentQuest.island]
        if pos then tweenTo(pos) end
    end
end

-- BOUCLES AUTOMATION
spawn(function()
    while task.wait(0.3) do
        pcall(function()
            if T.autoFarm or T.autoLevel then farmCurrent() end
            if T.autoMastery then
                local tool = char:FindFirstChildOfClass("Tool") or plr.Backpack:FindFirstChildOfClass("Tool")
                if tool and getH() and getH().Health > 0 then
                    local target = findEnemy(currentQuest and currentQuest.mob or "Bandit")
                    if target then attackTarget(target) end
                end
            end
            if T.autoStats then
                local pts = plr.Data.Points.Value or 0
                if pts > 0 then
                    local melee = plr.Data.Melee.Value or 0
                    local def = plr.Data.Defense.Value or 0
                    local fruit = plr.Data["Demon Fruit"].Value or 0
                    local sword = plr.Data.Sword.Value or 0
                    local gun = plr.Data.Gun.Value or 0
                    if melee < 2450 and melee <= 1300 then cmd("AddPoint", "Melee", pts)
                    elseif def < 2450 and def <= 1300 then cmd("AddPoint", "Defense", pts)
                    elseif fruit < 2450 and plr.Data["Demon Fruit"].Value then cmd("AddPoint", "Demon Fruit", pts)
                    elseif sword < 2450 then cmd("AddPoint", "Sword", pts)
                    elseif gun < 2450 then cmd("AddPoint", "Gun", pts) end
                end
            end
            if T.autoChest then
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj.Name:find("Chest") and obj:IsA("Model") and obj:FindFirstChild("Handle") then
                        local r = getR(); if r then r.CFrame = obj.Handle.CFrame * CFrame.new(0,2,0) end
                        task.wait(0.1)
                    end
                end
            end
            if T.autoBeli then cmd("Beli") end
            if T.autoDungeon then cmd("Dungeon") end
        end)
    end
end)

spawn(function()
    while task.wait(0.15) do
        pcall(function()
            if T.killAura then
                for _, e in pairs(workspace.Enemies:GetChildren()) do
                    if e:FindFirstChild("Humanoid") and e:FindFirstChild("HumanoidRootPart") and e.Humanoid.Health > 0 then
                        attackTarget(e); task.wait(0.03)
                    end
                end
            end
            if T.autoPvP then
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character.Humanoid.Health > 0 then
                        attackTarget(p.Character); task.wait(0.03)
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait(1.5) do
        pcall(function()
            if T.autoAllBosses then
                for _, bname in ipairs(BOSSES) do
                    local e = findEnemy(bname); if e then attackTarget(e); break end
                end
            end
            for _, bname in ipairs(BOSSES) do
                local key = "boss_"..bname:gsub(" ","")
                if T[key] then
                    local e = findEnemy(bname); if e then attackTarget(e); break end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait(1.5) do
        pcall(function()
            if T.autoCollectFruit then
                for _, obj in pairs(workspace:GetChildren()) do
                    if (obj:IsA("Tool") or obj.Name:find("Fruit")) and obj:FindFirstChild("Handle") then
                        local r = getR(); if r then r.CFrame = obj.Handle.CFrame * CFrame.new(0,2,0); task.wait(0.15) end
                    end
                end
            end
            if T.autoStoreFruit then
                for _, obj in pairs(plr.Backpack:GetChildren()) do
                    if obj:IsA("Tool") and obj.Name:find("Fruit") then cmd("StoreFruit", obj.Name, obj) end
                end
            end
            if T.autoRandomFruit then cmd("BuyRandomFruit", "Random") end
            if T.autoFruitSniper then pcall(cmd, "CheckFruitStock") end
            if T.autoFruitRain then pcall(cmd, "FruitRain") end
        end)
    end
end)

spawn(function()
    while task.wait(3) do
        pcall(function()
            if T.autoRaid then cmd("StartRaid"); cmd("FarmRaid") end
            if T.autoRaidChip then cmd("BuyRaidChip") end
            if T.autoRaidStart then cmd("StartRaid") end
            if T.autoRaidFarm then cmd("FarmRaid") end
        end)
    end
end)

spawn(function()
    while task.wait(3) do
        pcall(function()
            if T.autoBones then cmd("Bones") end
            if T.autoEctoplasm then cmd("Ectoplasm") end
            if T.autoCandy then cmd("Candies") end
            if T.autoFragments then cmd("Fragments") end
            if T.autoAllMaterials then cmd("Bones"); cmd("Ectoplasm"); cmd("Candies"); cmd("Fragments") end
        end)
    end
end)

spawn(function()
    while task.wait(5) do
        pcall(function()
            if T.autoRaceV2 then cmd("RaceV2") end
            if T.autoRaceV3 then cmd("RaceV3") end
            if T.autoRaceV4 then cmd("RaceV4") end
            if T.autoObservation then cmd("ObservationV2") end
            if T.autoKenHaki then cmd("KenHaki") end
            if T.autoHakiColor then cmd("HakiColor") end
        end)
    end
end)

spawn(function()
    while task.wait(4) do
        pcall(function()
            if T.autoYama then cmd("Yama") end
            if T.autoTushita then cmd("Tushita") end
            if T.autoCDK then cmd("CursedDualKatana") end
            if T.autoSoulGuitar then cmd("SoulGuitar") end
            if T.autoGodhuman then cmd("Godhuman") end
            if T.autoSuperhuman then cmd("Superhuman") end
            if T.autoBartilo then cmd("Bartilo") end
            if T.autoElite then cmd("EliteHunter") end
        end)
    end
end)

spawn(function()
    while task.wait(3) do
        pcall(function()
            if T.autoBuySwords then cmd("BuyAllSwords") end
            if T.autoBuyGuns then cmd("BuyAllGuns") end
            if T.autoBuyFightingStyles then cmd("BuyAllFightingStyles") end
        end)
    end
end)

spawn(function()
    while task.wait(5) do
        pcall(function()
            if T.autoSeaBeast then cmd("SeaBeast") end
            if T.autoTerrorshark then cmd("Terrorshark") end
            if T.autoLeviathan then cmd("Leviathan") end
            if T.autoShipRaid then cmd("ShipRaid") end
            if T.autoRoughSea then cmd("RoughSea") end
            if T.autoKitsune then cmd("KitsuneEvent") end
        end)
    end
end)

-- GOD MODE
local godCons = {}
local function enableG()
    if #godCons > 0 then return end
    local h = getH(); if not h then return end
    table.insert(godCons, RunS.Heartbeat:Connect(function()
        if T.godMode and h and h.Health > 0 then h.Health = h.MaxHealth end
    end))
    table.insert(godCons, h.HealthChanged:Connect(function()
        if T.godMode and h and h.Health < h.MaxHealth and h.Health > 0 then h.Health = h.MaxHealth end
    end))
end
local function disableG() for _, c in ipairs(godCons) do pcall(c.Disconnect, c) end; godCons = {} end

-- FLY / MOVEMENT
local flying, bg, bv = false, nil, nil
local jumpCon = nil
spawn(function()
    while task.wait(0.1) do
        pcall(function()
            local r = getR(); if not r then return end
            if T.fly then
                if not flying then
                    flying = true; bg = Instance.new("BodyGyro", r); bg.MaxTorque = Vector3.new(0, math.huge, 0); bg.P = 10000
                    bv = Instance.new("BodyVelocity", r); bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge); bv.Velocity = Vector3.new(0, 0, 0)
                end
                local d = Vector3.new((UIS:IsKeyDown(Enum.KeyCode.D) and 1 or 0)-(UIS:IsKeyDown(Enum.KeyCode.A) and 1 or 0),(UIS:IsKeyDown(Enum.KeyCode.Space) and 1 or 0)-(UIS:IsKeyDown(Enum.KeyCode.LeftShift) and 1 or 0),(UIS:IsKeyDown(Enum.KeyCode.W) and -1 or 0)-(UIS:IsKeyDown(Enum.KeyCode.S) and -1 or 0))
                r.Velocity = d * (T.speed and 100 or 50)
            elseif flying then
                flying = false; if bg then bg:Destroy() end; if bv then bv:Destroy() end; bg, bv = nil, nil
            end
            if T.infiniteJump then
                if not jumpCon then jumpCon = UIS.JumpRequest:Connect(function() local rr = getR(); if rr then rr.Velocity = Vector3.new(rr.Velocity.X, 50, rr.Velocity.Z) end end) end
            elseif jumpCon then jumpCon:Disconnect(); jumpCon = nil end
            if T.noClip then local c = getC(); for _, p in pairs(c:GetChildren()) do if p:IsA("BasePart") then p.CanCollide = false end end end
            if T.walkOnWater and r.Position.Y < 0 then r.CFrame = CFrame.new(r.Position.X, 3, r.Position.Z) end
        end)
    end
end)

-- ESP
local espObjs = {}
local function addESP(obj, color, text)
    if espObjs[obj] or not obj then return end
    local b = Instance.new("BillboardGui"); b.Name = "ANON_ESP"; b.Size = UDim2.new(0,100,0,30); b.Adornee = obj; b.AlwaysOnTop = true; b.StudsOffset = Vector3.new(0,2,0)
    local l = Instance.new("TextLabel", b); l.Size = UDim2.new(1,0,1,0); l.BackgroundTransparency = 1; l.Text = text or obj.Name; l.TextColor3 = color; l.TextStrokeColor3 = Color3.new(0,0,0); l.TextStrokeTransparency = 0; l.TextSize = 14; l.Font = Enum.Font.GothamBold
    b.Parent = plr:WaitForChild("PlayerGui"); espObjs[obj] = b
end
local function clearESP() for obj, b in pairs(espObjs) do if b and b.Parent then b:Destroy() end end; espObjs = {} end
spawn(function()
    while task.wait(1) do
        if T.fruitESP or T.chestESP or T.playerESP or T.enemyESP or T.islandESP or T.shipESP then
            if T.fruitESP then for _, o in pairs(workspace:GetChildren()) do if (o:IsA("Tool") or o.Name:find("Fruit")) and o:FindFirstChild("Handle") then addESP(o.Handle, Color3.fromRGB(255,100,0), "🍎 "..o.Name) end end end
            if T.chestESP then for _, o in pairs(workspace:GetChildren()) do if o.Name:find("Chest") and o:IsA("Model") and o:FindFirstChild("Handle") then addESP(o.Handle, Color3.fromRGB(255,255,0), "💰 Chest") end end end
            if T.playerESP then for _, p in pairs(Players:GetPlayers()) do if p ~= plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then addESP(p.Character.HumanoidRootPart, p.TeamColor.Color, "👤 "..p.Name) end end end
            if T.enemyESP then for _, e in pairs(workspace.Enemies:GetChildren()) do if e:FindFirstChild("HumanoidRootPart") and e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then addESP(e.HumanoidRootPart, Color3.fromRGB(255,50,50), "☠️ "..e.Name) end end end
            if T.islandESP then for _, v in ipairs(ISLANDS) do local part = workspace:FindFirstChild(v[1]); if part then addESP(part, Color3.fromRGB(0,200,255), "🏝️ "..v[1]) end end end
            if T.shipESP then for _, o in pairs(workspace:GetChildren()) do if o:IsA("Model") and o.Name:find("Ship") and o:FindFirstChildWhichIsA("Part") then addESP(o:FindFirstChildWhichIsA("Part"), Color3.fromRGB(100,200,255), "🚢 "..o.Name) end end end
        else clearESP() end
    end
end)

local function tpToIsland(name)
    local pos = ISLAND_NAMES[name]
    if pos then tweenTo(pos) end
end

-- =============================================
-- UI AVEC TON LOGO ANIMÉ ET GLISSANT
-- =============================================
local C = {
    bg = Color3.fromRGB(5,5,20), bg2 = Color3.fromRGB(12,12,35), 
    primary = Color3.fromRGB(0,170,255), primaryDark = Color3.fromRGB(0,100,200),
    text = Color3.fromRGB(220,220,255), textMuted = Color3.fromRGB(130,130,180),
    accent = Color3.fromRGB(255,70,120), accent2 = Color3.fromRGB(120,70,255),
    on = Color3.fromRGB(0,220,100), off = Color3.fromRGB(30,30,55),
    card = Color3.fromRGB(15,15,40), border = Color3.fromRGB(30,30,70),
    gold = Color3.fromRGB(255,215,0), danger = Color3.fromRGB(255,50,50),
    warning = Color3.fromRGB(255,200,0), success = Color3.fromRGB(0,200,100),
    fruit = Color3.fromRGB(255,100,0), race = Color3.fromRGB(255,100,200),
    espC = Color3.fromRGB(0,255,150), god = Color3.fromRGB(255,255,0),
    raid = Color3.fromRGB(200,0,255), sea = Color3.fromRGB(0,150,255),
    material = Color3.fromRGB(180,130,255), shop = Color3.fromRGB(255,180,50)
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AnonymeHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

-- TON LOGO
local Logo = Instance.new("ImageButton")
Logo.Parent = ScreenGui
Logo.Size = UDim2.new(0,70,0,70)
Logo.Position = UDim2.new(0.05,0,0.45,0)
Logo.BackgroundTransparency = 1
Logo.Image = LOGO_ASSET_ID
local Corner = Instance.new("UICorner"); Corner.CornerRadius = UDim.new(1,0); Corner.Parent = Logo
local Stroke = Instance.new("UIStroke"); Stroke.Parent = Logo; Stroke.Color = Color3.fromRGB(170,0,255); Stroke.Thickness = 3
local Glow = Instance.new("UIGradient"); Glow.Parent = Stroke
Glow.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(120,0,255))}

-- MENU PRINCIPAL
local Menu = Instance.new("Frame"); Menu.Parent = ScreenGui
Menu.Size = UDim2.new(0,600,0,350); Menu.Position = UDim2.new(0.5,-300,0.5,-175)
Menu.BackgroundColor3 = Color3.fromRGB(20,20,30); Menu.Visible = false
local MenuCorner = Instance.new("UICorner"); MenuCorner.CornerRadius = UDim.new(0,12); MenuCorner.Parent = Menu

-- ANIMATION OUVERTURE/FERMETURE
Logo.MouseButton1Click:Connect(function()
    if Menu.Visible then
        local Close = TweenService:Create(Menu, TweenInfo.new(0.25), {Size = UDim2.new(0,0,0,0)})
        Close:Play()
        Close.Completed:Wait()
        Menu.Visible = false
        Menu.Size = UDim2.new(0,600,0,350)
    else
        Menu.Size = UDim2.new(0,0,0,0)
        Menu.Visible = true
        TweenService:Create(Menu, TweenInfo.new(0.25, Enum.EasingStyle.Back), {Size = UDim2.new(0,600,0,350)}):Play()
    end
end)

-- GLISSEMENT DU LOGO (tactile + souris)
local dragging = false; local dragInput; local dragStart; local startPos
Logo.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = Logo.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
Logo.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
end)
UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Logo.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- INTÉRIEUR DU MENU (CATÉGORIES)
local MenuContent = Instance.new("ScrollingFrame", Menu)
MenuContent.Size = UDim2.new(1,-10,1,-10); MenuContent.Position = UDim2.new(0,5,0,5)
MenuContent.BackgroundTransparency = 1; MenuContent.ScrollBarThickness = 3
MenuContent.ScrollBarImageColor3 = C.primary
local MenuLayout = Instance.new("UIListLayout", MenuContent); MenuLayout.Padding = UDim.new(0,5)
MenuLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    MenuContent.CanvasSize = UDim2.new(0,0,0,MenuLayout.AbsoluteContentSize.Y + 20)
end)

-- CATÉGORIES
local CATEGORIES = {
    {name="FARM", icon="⚡", color=C.success, toggles={"autoFarm","autoLevel","autoMastery","autoStats","autoQuest","autoChest","autoBeli","autoDungeon"}},
    {name="COMBAT", icon="⚔️", color=C.danger, toggles={"killAura","autoPvP","autoBounty","fastAttack","noCooldown","godMode"}},
    {name="BOSSES", icon="👹", color=C.warning, toggles={"autoAllBosses","boss_GorillaKing","boss_ViceAdmiral","boss_DoughKing"}},
    {name="SEA EVENTS", icon="🌊", color=C.sea, toggles={"autoSeaBeast","autoTerrorshark","autoLeviathan","autoShipRaid","autoRoughSea","autoKitsune","autoMirage"}},
    {name="RAID", icon="⚡", color=C.raid, toggles={"autoRaid","autoRaidChip","autoRaidStart","autoRaidFarm","autoFactory","autoCastle"}},
    {name="MATERIALS", icon="🧱", color=C.material, toggles={"autoAllMaterials","autoBones","autoEctoplasm","autoCandy","autoFragments"}},
    {name="FRUITS", icon="🍎", color=C.fruit, toggles={"autoCollectFruit","autoStoreFruit","autoRandomFruit","autoFruitSniper","autoFruitRain"}},
    {name="MOVEMENT", icon="⛵", color=C.primary, toggles={"fly","infiniteJump","noClip","walkOnWater","speed"}},
    {name="ESP", icon="👁️", color=C.espC, toggles={"fruitESP","chestESP","playerESP","enemyESP","islandESP","shipESP"}},
    {name="MISC", icon="⚙️", color=C.textMuted, toggles={"fpsBoost","antiBan","autoRejoin","autoServerHop"}},
}

local catBtns = {}

for _, cat in ipairs(CATEGORIES) do
    local catFrame = Instance.new("Frame", MenuContent)
    catFrame.Size = UDim2.new(1,-10,0,0); catFrame.BackgroundColor3 = C.card; catFrame.BackgroundTransparency = 0.5
    Instance.new("UICorner", catFrame).CornerRadius = UDim.new(0,8)
    local catStroke = Instance.new("UIStroke", catFrame); catStroke.Color = cat.color; catStroke.Thickness = 1; catStroke.Transparency = 0.5
    local catLayout = Instance.new("UIListLayout", catFrame); catLayout.Padding = UDim.new(0,2)
    Instance.new("UIPadding", catFrame).PaddingLeft = UDim.new(0,10)

    local title = Instance.new("TextLabel", catFrame)
    title.Size = UDim2.new(1,-10,0,28); title.Text = cat.icon.."  "..cat.name; title.TextSize = 14
    title.TextColor3 = cat.color; title.BackgroundTransparency = 1; title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left

    for _, toggleName in ipairs(cat.toggles) do
        local btn = Instance.new("TextButton", catFrame)
        btn.Size = UDim2.new(1,-10,0,26); btn.Text = "  "..toggleName.."  |  OFF"
        btn.TextSize = 12; btn.TextColor3 = C.text; btn.BackgroundColor3 = C.off
        btn.Font = Enum.Font.Gotham; btn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,4)
        local bStroke = Instance.new("UIStroke", btn); bStroke.Color = cat.color; bStroke.Thickness = 1; bStroke.Transparency = 0.3
        Instance.new("UIPadding", btn).PaddingLeft = UDim.new(0,5)

        -- Gestion du toggle
        if toggleName:find("boss_") then
            btn.MouseButton1Click:Connect(function()
                T[toggleName] = not T[toggleName]
                btn.Text = "  "..toggleName.."  |  "..(T[toggleName] and "ON" or "OFF")
                btn.BackgroundColor3 = T[toggleName] and C.warning or C.off
            end)
        elseif toggleName == "godMode" then
            btn.MouseButton1Click:Connect(function()
                T.godMode = not T.godMode
                if T.godMode then enableG() else disableG() end
                btn.Text = "  🛡️  God Mode  |  "..(T.godMode and "ON" or "OFF")
                btn.BackgroundColor3 = T.godMode and C.god or C.off
                btn.TextColor3 = T.godMode and Color3.new(0,0,0) or C.text
            end)
        else
            btn.MouseButton1Click:Connect(function()
                T[toggleName] = not T[toggleName]
                btn.Text = "  "..toggleName.."  |  "..(T[toggleName] and "ON" or "OFF")
                btn.BackgroundColor3 = T[toggleName] and cat.color or C.off
            end)
        end
    end
end

-- NOTIFICATION
task.wait(1)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "🚀 Anonymes Script v"..SCRIPT_VERSION,
    Text = "Logo animé + glissement - compatible mobile",
    Duration = 5
})
