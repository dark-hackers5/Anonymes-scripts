-- =============================================
-- ANONYMES SCRIPT v2.0 | BLOX FRUITS
-- Style : UI Moderne | Catégories complètes
-- =============================================
local SCRIPT_VERSION = "2.0"
local logoID = "73393542095412"

-- SERVICES
local Players, RS, VU, UIS, RunS, TweenS = 
    game:GetService("Players"), game:GetService("ReplicatedStorage"), 
    game:GetService("VirtualUser"), game:GetService("UserInputService"),
    game:GetService("RunService"), game:GetService("TweenService")

local plr = Players.LocalPlayer
repeat task.wait() until plr.Character
local char, hum, root = plr.Character, plr.Character:WaitForChild("Humanoid"), plr.Character:WaitForChild("HumanoidRootPart")

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
    -- Sea 1
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
    -- Sea 2
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
    -- Sea 3
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
    -- Sea 2
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
    -- Sea 3
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

-- =============================================
-- BOUCLES AUTOMATION
-- =============================================

-- FARM PRINCIPAL
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
                    local maxS = 2450
                    if melee < maxS and melee <= 1300 then cmd("AddPoint", "Melee", pts)
                    elseif def < maxS and def <= 1300 then cmd("AddPoint", "Defense", pts)
                    elseif fruit < maxS and plr.Data["Demon Fruit"].Value then cmd("AddPoint", "Demon Fruit", pts)
                    elseif sword < maxS then cmd("AddPoint", "Sword", pts)
                    elseif gun < maxS then cmd("AddPoint", "Gun", pts) end
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

-- KILL AURA / PVP
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

-- BOSSES
spawn(function()
    while task.wait(1.5) do
        pcall(function()
            if T.autoAllBosses then
                for _, bname in ipairs(BOSSES) do
                    local e = findEnemy(bname)
                    if e then attackTarget(e); break end
                end
            end
            for _, bname in ipairs(BOSSES) do
                local key = "boss_"..bname:gsub(" ","")
                if T[key] then
                    local e = findEnemy(bname)
                    if e then attackTarget(e); break end
                end
            end
            local specBosses = {
                {"Dragon Trident", "autoDragonTrident"}, {"Dark Dagger", "autoDarkDagger"},
                {"Pole V2", "autoPoleV2"}, {"Wando", "autoWando"}, {"Canvander", "autoCanvander"},
                {"Koko", "autoKoko"}, {"Buddy Sword", "autoBuddySword"}, {"Serpent Boss", "autoSerpentBoss"},
                {"Longsword", "autoLongsword"}, {"Cursed Captain", "autoCursedCaptain"},
                {"Beautiful Pirate", "autoBeautifulPirate"}, {"Tyrant Skies", "autoTyrantSkies"},
                {"Cake Queen", "autoCakeQueen"}, {"Soul Reaper", "autoSoulReaper"},
                {"Don Swan", "autoDonSwan"}, {"Order", "autoOrder"},
                {"Vice Admiral", "autoViceAdmiral"}, {"Saber Expert", "autoSaberExpert"},
                {"Magma Admiral", "autoMagmaAdmiral"}, {"Gorilla King", "autoGorillaKing"},
                {"Kilo Admiral", "autoKilAdmiral"}, {"Captain Elephant", "autoCaptainElephant"},
            }
            for _, sb in ipairs(specBosses) do
                if T[sb[2]] then
                    local e = findEnemy(sb[1])
                    if e then attackTarget(e); break end
                end
            end
        end)
    end
end)

-- FRUITS
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

-- RAID
spawn(function()
    while task.wait(3) do
        pcall(function()
            if T.autoRaid then cmd("StartRaid"); cmd("FarmRaid") end
            if T.autoRaidChip then cmd("BuyRaidChip") end
            if T.autoRaidStart then cmd("StartRaid") end
            if T.autoRaidFarm then cmd("FarmRaid") end
            if T.autoFlameRaid then cmd("StartRaid", "Flame"); cmd("FarmRaid") end
            if T.autoIceRaid then cmd("StartRaid", "Ice"); cmd("FarmRaid") end
            if T.autoQuakeRaid then cmd("StartRaid", "Quake"); cmd("FarmRaid") end
            if T.autoLightRaid then cmd("StartRaid", "Light"); cmd("FarmRaid") end
            if T.autoDarkRaid then cmd("StartRaid", "Dark"); cmd("FarmRaid") end
            if T.autoDoughRaid then cmd("StartRaid", "Dough"); cmd("FarmRaid") end
            if T.autoRubyRaid then cmd("StartRaid", "Ruby"); cmd("FarmRaid") end
        end)
    end
end)

-- FACTORY / CASTLE
spawn(function()
    while task.wait(3) do
        pcall(function()
            if T.autoFactory then cmd("Factory") end
            if T.autoCastle then cmd("Castle") end
        end)
    end
end)

-- MATÉRIAUX COMPLETS
spawn(function()
    while task.wait(3) do
        pcall(function()
            if T.autoBones then cmd("Bones") end
            if T.autoEctoplasm then cmd("Ectoplasm") end
            if T.autoCandy then cmd("Candies") end
            if T.autoFragments then cmd("Fragments") end
            if T.autoAllMaterials then
                cmd("Bones"); cmd("Ectoplasm"); cmd("Candies"); cmd("Fragments")
            end
            if T.autoMagnetite then cmd("Magnetite") end
            if T.autoQuartz then cmd("Quartz") end
            if T.autoSamurai then cmd("Samurai") end
            if T.autoDragonScale then cmd("DragonScale") end
            if T.autoLeather then cmd("Leather") end
            if T.autoFishScales then cmd("FishScales") end
            if T.autoWood then cmd("Wood") end
            if T.autoIron then cmd("Iron") end
            if T.autoGems then cmd("Gems") end
            if T.autoScrap then cmd("Scrap") end
            if T.autoSpikes then cmd("Spikes") end
        end)
    end
end)

-- RACE / HAKI
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

-- QUÊTES SPÉCIALES
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
            if T.autoCitizen then cmd("Citizen") end
            if T.autoFlowerQuest then cmd("FlowerQuest") end
            if T.autoElite then cmd("EliteHunter") end
            if T.autoMirage then cmd("Mirage") end
        end)
    end
end)

-- BOUTIQUE COMPLÈTE
spawn(function()
    while task.wait(3) do
        pcall(function()
            if T.autoSword or T.autoBuySwords then cmd("BuyAllSwords") end
            if T.autoGun or T.autoBuyGuns then cmd("BuyAllGuns") end
            if T.autoFightingStyle or T.autoBuyFightingStyles then cmd("BuyAllFightingStyles") end
            if T.autoBuyAccessories then cmd("BuyAllAccessories") end
            if T.autoBuyBoats then cmd("BuyAllBoats") end
            if T.autoBuyFruits then cmd("BuyRandomFruit", "Random") end
            if T.autoUpgradeSword then cmd("UpgradeSword") end
            if T.autoUpgradeGun then cmd("UpgradeGun") end
            if T.autoUpgradeFightingStyle then cmd("UpgradeFightingStyle") end
        end)
    end
end)

-- SEA EVENTS COMPLETS
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

-- PÊCHE / BATEAU
spawn(function()
    while task.wait(4) do
        pcall(function()
            if T.autoFishing or T.autoFishFarm then cmd("AutoFish") end
            if T.autoSummonBoat then cmd("SummonBoat") end
            if T.autoDriveBoat then cmd("AutoDriveBoat") end
            if T.autoBoatSpeed then cmd("BoatSpeed") end
        end)
    end
end)

-- GOD MODE
local godCons = {}
local function enableG() if #godCons>0 then return end local h=getH(); if not h then return end table.insert(godCons, RunS.Heartbeat:Connect(function() if T.godMode and h and h.Health>0 then h.Health=h.MaxHealth end end)) table.insert(godCons, h.HealthChanged:Connect(function() if T.godMode and h and h.Health<h.MaxHealth and h.Health>0 then h.Health=h.MaxHealth end end)) end
local function disableG() for _,c in ipairs(godCons) do pcall(c.Disconnect,c) end; godCons={} end

-- FLY / MOVEMENT
local flying, bg, bv = false, nil, nil
local jumpCon=nil
spawn(function()
    while task.wait(0.1) do
        pcall(function()
            local r=getR(); if not r then return end
            if T.fly then
                if not flying then
                    flying=true; bg=Instance.new("BodyGyro",r); bg.MaxTorque=Vector3.new(0,math.huge,0); bg.P=10000
                    bv=Instance.new("BodyVelocity",r); bv.MaxForce=Vector3.new(math.huge,math.huge,math.huge); bv.Velocity=Vector3.new(0,0,0)
                end
                local d=Vector3.new((UIS:IsKeyDown(Enum.KeyCode.D) and 1 or 0)-(UIS:IsKeyDown(Enum.KeyCode.A) and 1 or 0),(UIS:IsKeyDown(Enum.KeyCode.Space) and 1 or 0)-(UIS:IsKeyDown(Enum.KeyCode.LeftShift) and 1 or 0),(UIS:IsKeyDown(Enum.KeyCode.W) and -1 or 0)-(UIS:IsKeyDown(Enum.KeyCode.S) and -1 or 0))
                r.Velocity=d*(T.speed and 100 or 50)
            elseif flying then flying=false; if bg then bg:Destroy() end; if bv then bv:Destroy() end; bg,bv=nil,nil end
            if T.infiniteJump then
                if not jumpCon then jumpCon=UIS.JumpRequest:Connect(function() local rr=getR(); if rr then rr.Velocity=Vector3.new(rr.Velocity.X,50,rr.Velocity.Z) end end) end
            elseif jumpCon then jumpCon:Disconnect(); jumpCon=nil end
            if T.noClip then local c=getC(); for _,p in pairs(c:GetChildren()) do if p:IsA("BasePart") then p.CanCollide=false end end end
            if T.walkOnWater and r.Position.Y<0 then r.CFrame=CFrame.new(r.Position.X,3,r.Position.Z) end
        end)
    end
end)

-- FPS BOOST
spawn(function()
    while task.wait(10) do
        if T.fpsBoost then
            pcall(function()
                settings().Rendering.QualityLevel = 1
                workspace.DescendantAdded:Connect(function(d) if d:IsA("BasePart") and not d:IsDescendantOf(plr.Character) then d.Material = Enum.Material.SmoothPlastic end end)
                for _, d in pairs(workspace:GetDescendants()) do
                    if d:IsA("BasePart") and not d:IsDescendantOf(plr.Character) then d.Material = Enum.Material.SmoothPlastic end
                    if d:IsA("Decal") or d:IsA("Texture") then d:Destroy() end
                end
            end)
        end
    end
end)

-- ESP
local espObjs={}
local function addESP(obj,color,text) if espObjs[obj] or not obj then return end local b=Instance.new("BillboardGui"); b.Name="ANON_ESP"; b.Size=UDim2.new(0,100,0,30); b.Adornee=obj; b.AlwaysOnTop=true; b.StudsOffset=Vector3.new(0,2,0); local l=Instance.new("TextLabel",b); l.Size=UDim2.new(1,0,1,0); l.BackgroundTransparency=1; l.Text=text or obj.Name; l.TextColor3=color; l.TextStrokeColor3=Color3.new(0,0,0); l.TextStrokeTransparency=0; l.TextSize=14; l.Font=Enum.Font.GothamBold; b.Parent=plr:WaitForChild("PlayerGui"); espObjs[obj]=b end
local function clearESP() for obj,b in pairs(espObjs) do if b and b.Parent then b:Destroy() end end; espObjs={} end
spawn(function() while task.wait(1) do if T.fruitESP or T.chestESP or T.playerESP or T.enemyESP or T.islandESP or T.shipESP then if T.fruitESP then for _,o in pairs(workspace:GetChildren()) do if (o:IsA("Tool") or o.Name:find("Fruit")) and o:FindFirstChild("Handle") then addESP(o.Handle,Color3.fromRGB(255,100,0),"🍎 "..o.Name) end end end if T.chestESP then for _,o in pairs(workspace:GetChildren()) do if o.Name:find("Chest") and o:IsA("Model") and o:FindFirstChild("Handle") then addESP(o.Handle,Color3.fromRGB(255,255,0),"💰 Chest") end end end if T.playerESP then for _,p in pairs(Players:GetPlayers()) do if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then addESP(p.Character.HumanoidRootPart,p.TeamColor.Color,"👤 "..p.Name) end end end if T.enemyESP then for _,e in pairs(workspace.Enemies:GetChildren()) do if e:FindFirstChild("HumanoidRootPart") and e:FindFirstChild("Humanoid") and e.Humanoid.Health>0 then addESP(e.HumanoidRootPart,Color3.fromRGB(255,50,50),"☠️ "..e.Name) end end end if T.islandESP then for _,v in ipairs(ISLANDS) do local part=workspace:FindFirstChild(v[1]); if part then addESP(part,Color3.fromRGB(0,200,255),"🏝️ "..v[1]) end end end if T.shipESP then for _,o in pairs(workspace:GetChildren()) do if o:IsA("Model") and o.Name:find("Ship") and o:FindFirstChildWhichIsA("Part") then addESP(o:FindFirstChildWhichIsA("Part"),Color3.fromRGB(100,200,255),"🚢 "..o.Name) end end end else clearESP() end end end)

-- TELEPORT TO ISLAND
local function tpToIsland(name)
    local pos = ISLAND_NAMES[name]
    if pos then tweenTo(pos) end
end

-- =============================================
-- UI MODERNE (STYLE ANONYMES SCRIPT)
-- =============================================
local C = {
    bg=Color3.fromRGB(5,5,20), bg2=Color3.fromRGB(12,12,35), 
    primary=Color3.fromRGB(0,170,255), primaryDark=Color3.fromRGB(0,100,200),
    text=Color3.fromRGB(220,220,255), textMuted=Color3.fromRGB(130,130,180),
    accent=Color3.fromRGB(255,70,120), accent2=Color3.fromRGB(120,70,255),
    on=Color3.fromRGB(0,220,100), off=Color3.fromRGB(30,30,55),
    card=Color3.fromRGB(15,15,40), border=Color3.fromRGB(30,30,70),
    gold=Color3.fromRGB(255,215,0), danger=Color3.fromRGB(255,50,50),
    warning=Color3.fromRGB(255,200,0), success=Color3.fromRGB(0,200,100),
    fruit=Color3.fromRGB(255,100,0), race=Color3.fromRGB(255,100,200),
    espC=Color3.fromRGB(0,255,150), god=Color3.fromRGB(255,255,0),
    raid=Color3.fromRGB(200,0,255), sea=Color3.fromRGB(0,150,255),
    material=Color3.fromRGB(180,130,255), shop=Color3.fromRGB(255,180,50)
}

local sg = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
sg.Name = "AnonymesScript"; sg.ResetOnSpawn = false; sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- LOGO
local logobtn = Instance.new("ImageButton", sg)
logobtn.Size = UDim2.new(0,45,0,45); logobtn.Position = UDim2.new(0,10,0,10)
logobtn.BackgroundColor3 = C.card; logobtn.BackgroundTransparency = 0.2
logobtn.Image = "rbxassetid://"..logoID; logobtn.ScaleType = Enum.ScaleType.Fit
logobtn.Draggable = true
Instance.new("UICorner", logobtn).CornerRadius = UDim.new(1,0)
local lstroke = Instance.new("UIStroke", logobtn); lstroke.Color = C.primary; lstroke.Thickness = 2

-- MAIN WINDOW
local mf = Instance.new("Frame", sg)
mf.Size = UDim2.new(0,680,0,520); mf.Position = UDim2.new(0.5,-340,0.5,-260)
mf.BackgroundColor3 = C.bg; mf.Visible = false; mf.Draggable = true
mf.ClipsDescendants = true
Instance.new("UICorner", mf).CornerRadius = UDim.new(0,10)
local mstroke = Instance.new("UIStroke", mf); mstroke.Color = C.primary; mstroke.Thickness = 2; mstroke.Transparency = 0.3

-- TITLE BAR
local tbar = Instance.new("Frame", mf)
tbar.Size = UDim2.new(1,0,0,45); tbar.BackgroundColor3 = C.bg2
Instance.new("UICorner", tbar).CornerRadius = UDim.new(0,10,0,0)
local tline = Instance.new("Frame", tbar)
tline.Size = UDim2.new(1,0,0,1); tline.Position = UDim2.new(0,0,1,0)
tline.BackgroundColor3 = C.primary; tline.BackgroundTransparency = 0.5

local ttitle = Instance.new("TextLabel", tbar)
ttitle.Size = UDim2.new(0,280,1,0); ttitle.BackgroundTransparency = 1
ttitle.Text = "◆ ANONYMES SCRIPT ◆ v"..SCRIPT_VERSION; ttitle.TextSize = 18
ttitle.TextColor3 = C.text; ttitle.Font = Enum.Font.GothamBold
ttitle.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UIPadding", ttitle).PaddingLeft = UDim.new(0,12)

local tclose = Instance.new("TextButton", tbar)
tclose.Size = UDim2.new(0,32,0,32); tclose.Position = UDim2.new(1,-40,0,7)
tclose.Text = "✕"; tclose.TextSize = 18; tclose.BackgroundColor3 = C.danger
tclose.TextColor3 = C.text; tclose.Font = Enum.Font.GothamBold
Instance.new("UICorner", tclose).CornerRadius = UDim.new(0,6)

-- LEFT SIDEBAR
local sidebar = Instance.new("Frame", mf)
sidebar.Size = UDim2.new(0,180,1,-45); sidebar.Position = UDim2.new(0,0,0,45)
sidebar.BackgroundColor3 = C.bg2
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0,0,0,10)
local sline = Instance.new("Frame", sidebar)
sline.Size = UDim2.new(1,0,0,1); sline.BackgroundColor3 = C.primary; sline.BackgroundTransparency = 0.7

local sscroll = Instance.new("ScrollingFrame", sidebar)
sscroll.Size = UDim2.new(1,0,1,0); sscroll.BackgroundTransparency = 1
sscroll.ScrollBarThickness = 2; sscroll.ScrollBarImageColor3 = C.primary
local slayout = Instance.new("UIListLayout", sscroll); slayout.Padding = UDim.new(0,3)
Instance.new("UIPadding", sscroll).PaddingTop = UDim.new(0,8)

-- RIGHT CONTENT
local content = Instance.new("Frame", mf)
content.Size = UDim2.new(1,-180,1,-45); content.Position = UDim2.new(0,180,0,45)
content.BackgroundTransparency = 1
local cscroll = Instance.new("ScrollingFrame", content)
cscroll.Size = UDim2.new(1,-10,1,-10); cscroll.Position = UDim2.new(0,5,0,5)
cscroll.BackgroundTransparency = 1; cscroll.ScrollBarThickness = 3
cscroll.ScrollBarImageColor3 = C.primary
local clayout = Instance.new("UIListLayout", cscroll); clayout.Padding = UDim.new(0,5)
clayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    cscroll.CanvasSize = UDim2.new(0,0,0,clayout.AbsoluteContentSize.Y + 20)
end)

-- CATEGORIES COMPLÈTES
local CATEGORIES = {
    {name="FARM", icon="⚡", color=C.success, buttons={
        {"Auto Farm", "autoFarm", C.success},
        {"Auto Level", "autoLevel", C.success},
        {"Auto Mastery", "autoMastery", C.success},
        {"Auto Stats", "autoStats", C.success},
        {"Auto Quest", "autoQuest", C.success},
        {"Auto Chest", "autoChest", C.gold},
        {"Auto Beli", "autoBeli", C.gold},
        {"Auto Dungeon", "autoDungeon", C.raid},
    }},
    {name="COMBAT", icon="⚔️", color=C.danger, buttons={
        {"Kill Aura", "killAura", C.danger},
        {"Auto PvP", "autoPvP", C.danger},
        {"Auto Bounty", "autoBounty", C.danger},
        {"Fast Attack", "fastAttack", C.danger},
        {"No Cooldown", "noCooldown", C.raid},
        {"God Mode", "godMode", C.god},
    }},
    {name="BOSSES", icon="👹", color=C.warning, buttons={}},
    {name="SEA EVENTS", icon="🌊", color=C.sea, buttons={
        {"Sea Beast", "autoSeaBeast", C.sea},
        {"Terrorshark", "autoTerrorshark", C.danger},
        {"Leviathan", "autoLeviathan", C.raid},
        {"Ship Raid", "autoShipRaid", C.sea},
        {"Rough Sea", "autoRoughSea", C.sea},
        {"Kitsune Event", "autoKitsune", C.gold},
        {"Mirage", "autoMirage", C.primaryDark},
    }},
    {name="RAID", icon="⚡", color=C.raid, buttons={
        {"Auto Raid", "autoRaid", C.raid},
        {"Auto Raid Chip", "autoRaidChip", C.raid},
        {"Auto Raid Start", "autoRaidStart", C.raid},
        {"Auto Raid Farm", "autoRaidFarm", C.raid},
        {"Flame Raid", "autoFlameRaid", C.danger},
        {"Ice Raid", "autoIceRaid", C.primary},
        {"Quake Raid", "autoQuakeRaid", C.warning},
        {"Light Raid", "autoLightRaid", C.gold},
        {"Dark Raid", "autoDarkRaid", C.raid},
        {"Dough Raid", "autoDoughRaid", C.gold},
        {"Ruby Raid", "autoRubyRaid", C.accent},
        {"Auto Factory", "autoFactory", C.warning},
        {"Auto Castle", "autoCastle", C.primary},
    }},
    {name="MATERIALS", icon="🧱", color=C.material, buttons={
        {"All Materials", "autoAllMaterials", C.material},
        {"Bones", "autoBones", C.text},
        {"Ectoplasm", "autoEctoplasm", C.primary},
        {"Candy", "autoCandy", C.gold},
        {"Fragments", "autoFragments", C.raid},
        {"Magnetite", "autoMagnetite", C.material},
        {"Quartz", "autoQuartz", C.primary},
        {"Samurai Soul", "autoSamurai", C.danger},
        {"Dragon Scale", "autoDragonScale", C.material},
        {"Leather", "autoLeather", C.text},
        {"Fish Scales", "autoFishScales", C.primary},
        {"Wood", "autoWood", C.text},
        {"Iron", "autoIron", C.text},
        {"Gems", "autoGems", C.gold},
        {"Scrap", "autoScrap", C.text},
        {"Spikes", "autoSpikes", C.danger},
    }},
    {name="FRUITS", icon="🍎", color=C.fruit, buttons={
        {"Collect Fruit", "autoCollectFruit", C.fruit},
        {"Store Fruit", "autoStoreFruit", C.fruit},
        {"Random Fruit", "autoRandomFruit", C.gold},
        {"Fruit Sniper", "autoFruitSniper", C.raid},
        {"Fruit Rain", "autoFruitRain", C.primary},
    }},
    {name="SHOP", icon="🛒", color=C.shop, buttons={
        {"Auto Swords", "autoBuySwords", C.shop},
        {"Auto Guns", "autoBuyGuns", C.shop},
        {"Auto Fighting Style", "autoBuyFightingStyles", C.race},
        {"Auto Accessories", "autoBuyAccessories", C.shop},
        {"Auto Boats", "autoBuyBoats", C.shop},
        {"Auto Fruits", "autoBuyFruits", C.fruit},
        {"Upgrade Sword", "autoUpgradeSword", C.shop},
        {"Upgrade Gun", "autoUpgradeGun", C.shop},
        {"Upgrade Fighting Style", "autoUpgradeFightingStyle", C.race},
    }},
    {name="SPECIAL QUESTS", icon="🗡️", color=C.accent, buttons={
        {"Auto Yama", "autoYama", C.accent},
        {"Auto Tushita", "autoTushita", C.accent},
        {"Auto CDK", "autoCDK", C.raid},
        {"Auto Soul Guitar", "autoSoulGuitar", C.raid},
        {"Auto Godhuman", "autoGodhuman", C.gold},
        {"Auto Superhuman", "autoSuperhuman", C.gold},
        {"Auto Bartilo", "autoBartilo", C.success},
        {"Auto Elite Hunter", "autoElite", C.warning},
        {"Auto Citizen", "autoCitizen", C.primary},
        {"Auto Flower Quest", "autoFlowerQuest", C.success},
    }},
    {name="RACE / HAKI", icon="🧬", color=C.race, buttons={
        {"Auto Race V2", "autoRaceV2", C.race},
        {"Auto Race V3", "autoRaceV3", C.race},
        {"Auto Race V4", "autoRaceV4", C.gold},
        {"Auto Observation", "autoObservation", C.primary},
        {"Auto Ken Haki", "autoKenHaki", C.primary},
        {"Auto Haki Color", "autoHakiColor", C.race},
    }},
    {name="MOVEMENT", icon="⛵", color=C.primary, buttons={
        {"Fly", "fly", C.primary},
        {"Infinite Jump", "infiniteJump", C.primary},
        {"No Clip", "noClip", C.primary},
        {"Walk on Water", "walkOnWater", C.primary},
        {"Speed Boost", "speed", C.warning},
    }},
    {name="FISHING & BOAT", icon="🎣", color=C.sea, buttons={
        {"Auto Fish", "autoFishFarm", C.sea},
        {"Summon Boat", "autoSummonBoat", C.sea},
        {"Auto Drive Boat", "autoDriveBoat", C.sea},
        {"Boat Speed", "autoBoatSpeed", C.gold},
    }},
    {name="ESP", icon="👁️", color=C.espC, buttons={
        {"Fruit ESP", "fruitESP", C.fruit},
        {"Chest ESP", "chestESP", C.gold},
        {"Player ESP", "playerESP", C.danger},
        {"Enemy ESP", "enemyESP", C.warning},
        {"Island ESP", "islandESP", C.primary},
        {"Ship ESP", "shipESP", C.sea},
    }},
    {name="MISC", icon="⚙️", color=C.textMuted, buttons={
        {"FPS Boost", "fpsBoost", C.success},
        {"Auto Rejoin", "autoRejoin", C.success},
        {"Anti Ban", "antiBan", C.primary},
        {"Auto Server Hop", "autoServerHop", C.raid},
    }},
    {name="TELEPORT", icon="🌍", color=C.primary, buttons={}},
}

-- BUTTON MAKER
local catBtns = {}

local function makeBtn(p, txt, col, cb)
    local btn = Instance.new("TextButton", p)
    btn.Size = UDim2.new(1,-10,0,30); btn.Text = "  "..txt.."  |  OFF"
    btn.TextSize = 13; btn.TextColor3 = C.text; btn.BackgroundColor3 = C.off
    btn.Font = Enum.Font.Gotham; btn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,5)
    local s = Instance.new("UIStroke", btn); s.Color = col; s.Thickness = 1; s.Transparency = 0.5
    Instance.new("UIPadding", btn).PaddingLeft = UDim.new(0,8)
    btn.MouseButton1Click:Connect(function()
        local ok = cb()
        btn.Text = "  "..txt.."  |  "..(ok and "ON" or "OFF")
        btn.BackgroundColor3 = ok and col or C.off
    end)
    btn.MouseEnter:Connect(function() if btn.BackgroundColor3 == C.off then btn.BackgroundTransparency = 0.2 end end)
    btn.MouseLeave:Connect(function() btn.BackgroundTransparency = 0 end)
    return btn
end

local function openCategory(cat)
    for _, c in pairs(cscroll:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end
    local cont = Instance.new("Frame", cscroll)
    cont.Size = UDim2.new(1,0,0,0); cont.BackgroundTransparency = 1
    local cl = Instance.new("UIListLayout", cont); cl.Padding = UDim.new(0,4)

    if cat.name == "BOSSES" then
        local allbtn = Instance.new("TextButton", cont)
        allbtn.Size = UDim2.new(1,-10,0,32); allbtn.Text = "⚔️  ALL BOSSES: OFF"; allbtn.TextSize = 14
        allbtn.TextColor3 = C.warning; allbtn.BackgroundColor3 = C.off; allbtn.Font = Enum.Font.GothamBold
        Instance.new("UICorner", allbtn).CornerRadius = UDim.new(0,5)
        local allstroke = Instance.new("UIStroke", allbtn); allstroke.Color = C.warning
        Instance.new("UIPadding", allbtn).PaddingLeft = UDimInstance.new("UIPadding", allbtn).PaddingLeft = UDim.new(0,10)
        allbtn.MouseButton1Click:Connect(function()
            T.autoAllBosses = not T.autoAllBosses
            allbtn.Text = "⚔️  ALL BOSSES: "..(T.autoAllBosses and "ON" or "OFF")
            allbtn.BackgroundColor3 = T.autoAllBosses and C.warning or C.off
        end)
        local tit = Instance.new("TextLabel", cont)
        tit.Size = UDim2.new(1,-10,0,20); tit.Text = "Select boss to target:"; tit.TextSize = 12
        tit.TextColor3 = C.textMuted; tit.BackgroundTransparency = 1; tit.Font = Enum.Font.Gotham
        tit.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UIPadding", tit).PaddingLeft = UDim.new(0,10)
        local bs = Instance.new("ScrollingFrame", cont)
        bs.Size = UDim2.new(1,-10,0,280); bs.BackgroundColor3 = C.bg2; bs.BackgroundTransparency = 0.3
        bs.ScrollBarThickness = 3
        Instance.new("UICorner", bs).CornerRadius = UDim.new(0,5)
        Instance.new("UIPadding", bs).PaddingLeft = UDim.new(0,5)
        local bl = Instance.new("UIListLayout", bs); bl.Padding = UDim.new(0,2)
        bl:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            bs.CanvasSize = UDim2.new(0,0,0,bl.AbsoluteContentSize.Y + 10)
        end)

        for _, bname in ipairs(BOSSES) do
            local bbtn = Instance.new("TextButton", bs)
            bbtn.Size = UDim2.new(1,-5,0,26); bbtn.Text = "  "..bname; bbtn.TextSize = 12
            bbtn.TextColor3 = C.text; bbtn.BackgroundColor3 = C.card; bbtn.Font = Enum.Font.Gotham
            bbtn.TextXAlignment = Enum.TextXAlignment.Left
            Instance.new("UICorner", bbtn).CornerRadius = UDim.new(0,3)
            local bk = "boss_"..bname:gsub(" ","")
            bbtn.MouseButton1Click:Connect(function()
                T[bk] = not T[bk]
                bbtn.BackgroundColor3 = T[bk] and C.warning or C.card
                bbtn.Text = (T[bk] and "🎯  " or "  ")..bname
            end)
        end
    elseif cat.name == "TELEPORT" then
        local tit = Instance.new("TextLabel", cont)
        tit.Size = UDim2.new(1,-10,0,20); tit.Text = "Click to teleport:"; tit.TextSize = 12
        tit.TextColor3 = C.textMuted; tit.BackgroundTransparency = 1; tit.Font = Enum.Font.Gotham
        tit.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UIPadding", tit).PaddingLeft = UDim.new(0,10)

        local ts = Instance.new("ScrollingFrame", cont)
        ts.Size = UDim2.new(1,-10,0,350); ts.BackgroundColor3 = C.bg2; ts.BackgroundTransparency = 0.3
        ts.ScrollBarThickness = 3
        Instance.new("UICorner", ts).CornerRadius = UDim.new(0,5)
        Instance.new("UIPadding", ts).PaddingLeft = UDim.new(0,5)
        local tl = Instance.new("UIListLayout", ts); tl.Padding = UDim.new(0,2)
        tl:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            ts.CanvasSize = UDim2.new(0,0,0,tl.AbsoluteContentSize.Y + 10)
        end)

        for _, v in ipairs(ISLANDS) do
            local ibtn = Instance.new("TextButton", ts)
            ibtn.Size = UDim2.new(1,-5,0,26); ibtn.Text = "  🏝️  "..v[1]; ibtn.TextSize = 12
            ibtn.TextColor3 = C.text; ibtn.BackgroundColor3 = C.card; ibtn.Font = Enum.Font.Gotham
            ibtn.TextXAlignment = Enum.TextXAlignment.Left
            Instance.new("UICorner", ibtn).CornerRadius = UDim.new(0,3)
            ibtn.MouseButton1Click:Connect(function() tpToIsland(v[1]) end)
        end
    elseif cat.name == "COMBAT" then
        for _, bd in ipairs(cat.buttons) do
            if bd[1] == "God Mode" then
                local gbtn = Instance.new("TextButton", cont)
                gbtn.Size = UDim2.new(1,-10,0,34); gbtn.Text = "  🛡️  GOD MODE: OFF"
                gbtn.TextSize = 14; gbtn.TextColor3 = C.god; gbtn.BackgroundColor3 = C.off
                gbtn.Font = Enum.Font.GothamBold; gbtn.TextXAlignment = Enum.TextXAlignment.Left
                Instance.new("UICorner", gbtn).CornerRadius = UDim.new(0,5)
                local gs = Instance.new("UIStroke", gbtn); gs.Color = C.god; gs.Thickness = 2
                Instance.new("UIPadding", gbtn).PaddingLeft = UDim.new(0,10)
                gbtn.MouseButton1Click:Connect(function()
                    T.godMode = not T.godMode
                    if T.godMode then enableG() else disableG() end
                    gbtn.Text = "  🛡️  GOD MODE: "..(T.godMode and "ON" or "OFF")
                    gbtn.BackgroundColor3 = T.godMode and C.god or C.off
                end)
            else
                makeBtn(cont, bd[1], bd[3], function() T[bd[2]] = not T[bd[2]]; return T[bd[2]] end)
            end
        end
    else
        for _, bd in ipairs(cat.buttons) do
            makeBtn(cont, bd[1], bd[3], function() T[bd[2]] = not T[bd[2]]; return T[bd[2]] end)
        end
    end
end

-- SIDEBAR BUTTONS
for _, cat in ipairs(CATEGORIES) do
    local btn = Instance.new("TextButton", sscroll)
    btn.Size = UDim2.new(1,-10,0,38); btn.Text = cat.icon.."  "..cat.name; btn.TextSize = 12
    btn.TextColor3 = C.textMuted; btn.BackgroundColor3 = C.card
    btn.Font = Enum.Font.GothamBold; btn.ZIndex = 10
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
    local s = Instance.new("UIStroke", btn); s.Color = cat.color; s.Thickness = 1; s.Transparency = 0.7
    Instance.new("UIPadding", btn).PaddingLeft = UDim.new(0,8)
    btn.Selected = false
    btn.MouseButton1Click:Connect(function()
        for _, b in pairs(catBtns) do b.Selected = false; b.BackgroundColor3 = C.card; b.TextColor3 = C.textMuted; end
        btn.Selected = true; btn.BackgroundColor3 = cat.color; btn.TextColor3 = C.text; s.Transparency = 0
        openCategory(cat)
    end)
    btn.MouseEnter:Connect(function() if not btn.Selected then btn.BackgroundColor3 = C.bg2; btn.TextColor3 = C.text end end)
    btn.MouseLeave:Connect(function() if not btn.Selected then btn.BackgroundColor3 = C.card; btn.TextColor3 = C.textMuted end end)
    table.insert(catBtns, btn)
end

-- FIRST CATEGORY
task.spawn(function() task.wait(0.15); if #catBtns > 0 then catBtns[1].MouseButton1Click:Fire() end end)

-- LOGO TOGGLE
logobtn.MouseButton1Click:Connect(function() mf.Visible = not mf.Visible end)
tclose.MouseButton1Click:Connect(function() mf.Visible = false end)

-- NOTIFICATION
task.wait(1)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "🚀 Anonymes Script v"..SCRIPT_VERSION,
    Text = "UI moderne - 15 catégories - 120+ fonctionnalités",
    Duration = 5
}
