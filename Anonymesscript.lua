-- =============================================
-- ANONYMES SCRIPT v2.1 | BLOX FRUITS
-- LOGO ANIMÉ + GLISSEMENT TACTILE + UI MOBILE
-- =============================================
local SCRIPT_VERSION = "2.1"
local LOGO_ASSET_ID = "rbxassetid://73393542095412" -- Remplace par ton ID si nécessaire

-- ======================
-- [SERVICES & INIT]
-- ======================
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local VU = game:GetService("VirtualUser")
local UIS = game:GetService("UserInputService")
local RunS = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local plr = Players.LocalPlayer
repeat task.wait() until plr and plr.Character
repeat task.wait() until plr:FindFirstChild("PlayerGui")
repeat task.wait() until plr.Character:FindFirstChild("HumanoidRootPart")

local char = plr.Character
local hum = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

local Remotes = RS:WaitForChild("Remotes")
local CF = Remotes:WaitForChild("CommF_")
local CE = Remotes:WaitForChild("CommE_")

-- ======================
-- [UTILITIES]
-- ======================
local function cmd(...) return pcall(CF.InvokeServer, CF, ...) end
local function getC() return plr.Character or plr.CharacterAdded:Wait() end
local function getR() local c = getC(); return c:FindFirstChild("HumanoidRootPart") or c:WaitForChild("HumanoidRootPart") end
local function getH() local c = getC(); return c:FindFirstChild("Humanoid") or c:WaitForChild("Humanoid") end
local function getLv() return plr.Data.Level.Value end

local function tweenTo(pos, speed)
    speed = speed or 400
    local r = getR()
    if not r then return end
    local tween = TweenService:Create(r, TweenInfo.new((r.Position - pos).Magnitude/speed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(pos)})
    tween:Play()
end

local function findEnemy(options)
    options = options or {}
    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then return nil end

    local bestTarget, bestScore = nil, -math.huge
    for _, e in pairs(enemies:GetChildren()) do
        if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 and e:FindFirstChild("HumanoidRootPart") then
            if options.name and not e.Name:find(options.name) then continue end
            if options.minLevel then
                local eLv = e:FindFirstChild("Level") and e.Level.Value or 0
                if eLv < options.minLevel then continue end
            end
            local score = (e:FindFirstChild("Level") and e.Level.Value or 0) * 10
            if options.prioritizeClose then
                local r = getR()
                if r then score = score + (1000 - (r.Position - e.HumanoidRootPart.Position).Magnitude) end
            end
            if score > bestScore then bestScore, bestTarget = score, e end
        end
    end
    return bestTarget
end

local function attackTarget(target)
    local r = getR()
    if not r or not target then return end
    local tp = target:FindFirstChild("HumanoidRootPart") or target
    r.CFrame = tp.CFrame * CFrame.new(0, 0, 15)
    local tool = char:FindFirstChildOfClass("Tool")
    if tool then tool:Activate() end
    VU:ClickButton1(Vector2.new(), workspace.CurrentCamera.CFrame)
end

-- ======================
-- [QUÊTES AUTOMATIQUES]
-- ======================
local QUESTS = {
    {min=1, max=9, npc="BanditQuestGiver", mob="Bandit", quest="BanditQuest1", lq=1, island="Jungle"},
    {min=10, max=14, npc="MonkeyQuestGiver", mob="Monkey", quest="JungleQuest", lq=1, island="Jungle"},
    {min=15, max=29, npc="GorillaQuestGiver", mob="Gorilla", quest="JungleQuest", lq=2, island="Jungle"},
    {min=30, max=39, npc="PirateQuestGiver", mob="Pirate", quest="PirateQuest", lq=1, island="Pirate Village"},
    {min=40, max=54, npc="BruteQuestGiver", mob="Brute", quest="PirateQuest", lq=2, island="Pirate Village"},
    {min=60, max=74, npc="DesertBanditQuestGiver", mob="Desert Bandit", quest="DesertQuest", lq=1, island="Desert"},
    {min=75, max=89, npc="DesertOfficerQuestGiver", mob="Desert Officer", quest="DesertQuest", lq=2, island="Desert"},
    {min=90, max=99, npc="SnowBanditQuestGiver", mob="Snow Bandit", quest="SnowQuest", lq=1, island="Frozen Village"},
    {min=100, max=119, npc="SnowmanQuestGiver", mob="Snowman", quest="SnowQuest", lq=2, island="Frozen Village"},
    {min=120, max=134, npc="ChiefPettyQuestGiver", mob="Chief Petty Officer", quest="MarineQuest", lq=1, island="Marine Fortress"},
    {min=135, max=149, npc="ViceAdmiralQuestGiver", mob="Vice Admiral", quest="MarineQuest", lq=2, island="Marine Fortress"},
    {min=150, max=174, npc="SkyBanditQuestGiver", mob="Sky Bandit", quest="SkyQuest", lq=1, island="Skylands"},
    {min=175, max=189, npc="DarkMasterQuestGiver", mob="Dark Master", quest="SkyQuest", lq=2, island="Skylands"},
    {min=190, max=224, npc="TogaWarriorQuestGiver", mob="Toga Warrior", quest="ColosseumQuest", lq=1, island="Colosseum"},
    {min=225, max=249, npc="GladiatorQuestGiver", mob="Gladiator", quest="ColosseumQuest", lq=2, island="Colosseum"},
    {min=250, max=299, npc="MilitarySoldierQuestGiver", mob="Military Soldier", quest="MagmaQuest", lq=1, island="Magma Village"},
    {min=300, max=324, npc="MilitarySpyQuestGiver", mob="Military Spy", quest="MagmaQuest", lq=2, island="Magma Village"},
    {min=325, max=374, npc="FishmanWarriorQuestGiver", mob="Fishman Warrior", quest="FishmanQuest", lq=1, island="Underwater City"},
    {min=375, max=399, npc="FishmanCommandoQuestGiver", mob="Fishman Commando", quest="FishmanQuest", lq=2, island="Underwater City"},
    {min=400, max=449, npc="GodGuardQuestGiver", mob="God's Guard", quest="SkyExpQuest", lq=1, island="Upper Skylands"},
    {min=450, max=474, npc="ShandaQuestGiver", mob="Shanda", quest="SkyExpQuest", lq=2, island="Upper Skylands"},
    {min=475, max=624, npc="GalleyPirateQuestGiver", mob="Galley Pirate", quest="FountainQuest", lq=1, island="Fountain City"},
    {min=625, max=699, npc="GalleyCaptainQuestGiver", mob="Galley Captain", quest="FountainQuest", lq=2, island="Fountain City"},
    {min=700, max=724, npc="RaiderQuestGiver", mob="Raider", quest="PiratePortQuest", lq=1, island="Kingdom of Rose"},
    {min=725, max=874, npc="MercenaryQuestGiver", mob="Mercenary", quest="PiratePortQuest", lq=2, island="Kingdom of Rose"},
    {min=875, max=899, npc="MarineQuestGiver", mob="Marine", quest="MarineTreeQuest", lq=1, island="Green Zone"},
    {min=900, max=949, npc="MarineCaptainQuestGiver", mob="Marine Captain", quest="MarineTreeQuest", lq=2, island="Green Zone"},
    {min=950, max=974, npc="ZombieQuestGiver", mob="Zombie", quest="GraveyardQuest", lq=1, island="Graveyard"},
    {min=975, max=999, npc="VampireQuestGiver", mob="Vampire", quest="GraveyardQuest", lq=2, island="Graveyard"}
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
    local enemy = findEnemy({name = mob, prioritizeClose = true})
    if enemy then
        attackTarget(enemy)
    else
        local pos = ISLAND_NAMES[currentQuest.island]
        if pos then tweenTo(pos) end
    end
end

-- ======================
-- [TOGGLES & CONFIG]
-- ======================
local T = {}
local toggleList = {
    "autoFarm", "autoLevel", "autoMastery", "autoStats", "autoQuest", "autoChest", "autoBeli",
    "killAura", "autoPvP", "godMode", "fastAttack", "noCooldown",
    "autoBoss", "autoAllBosses", "autoSeaBeast", "autoTerrorshark", "autoLeviathan",
    "autoCollectFruit", "autoStoreFruit", "autoRandomFruit", "fruitESP", "chestESP", "enemyESP",
    "fly", "infiniteJump", "noClip", "walkOnWater", "speed",
    "fpsBoost", "antiBan"
}
for _, k in ipairs(toggleList) do T[k] = false end

local BOSSES = {
    {"Gorilla King", Vector3.new(-1122.7, 4.5, 3855.6)},
    {"Vice Admiral", Vector3.new(-4859.5, 734.5, -5234.7)},
    {"Don Swan", Vector3.new(-2284.7, 21.8, 8759.8)},
    {"Order", Vector3.new(-6242.8, 20.8, -5018.4)},
    {"RIP Indra", Vector3.new(-5314.6, 32.4, 8848.3)},
    {"Dough King", Vector3.new(-2218.7, 73.8, 5328.6)},
    {"Cake Prince", Vector3.new(-2117.6, 38.8, -12028.8)},
    {"Cyborg", Vector3.new(6243.8, 20.8, -4958.6)},
    {"Stone", Vector3.new(1392.3, 98.8, -1029.6)},
    {"Island Empress", Vector3.new(5646.7, 20.8, -648.6)}
}
for _, b in ipairs(BOSSES) do T["boss_"..b[1]:gsub(" ","")] = false end

local ISLANDS = {
    {"Jungle", Vector3.new(-3863.5, 461.2, -2392.9)},
    {"Pirate Village", Vector3.new(-1122.7, 4.5, 3855.6)},
    {"Desert", Vector3.new(984.4, 4.5, 4101.8)},
    {"Frozen Village", Vector3.new(1121.3, 5.4, 1111.1)},
    {"Marine Fortress", Vector3.new(-5051.7, 80.2, 4335.1)},
    {"Skylands", Vector3.new(-4859.5, 734.5, -5234.7)},
    {"Magma Village", Vector3.new(-5402.9, 43.6, 8442.1)},
    {"Underwater City", Vector3.new(3562.3, 118.1, -5924.2)},
    {"Kingdom of Rose", Vector3.new(-2621.6, 32.3, -7895.4)},
    {"Green Zone", Vector3.new(2020.4, 88.6, -9052.5)},
    {"Floating Turtle", Vector3.new(-697.3, 145.5, 13970.8)}
}
local ISLAND_NAMES = {}
for _, v in ipairs(ISLANDS) do ISLAND_NAMES[v[1]] = v[2] end

-- ======================
-- [BOUCLES PRINCIPALES]
-- ======================
-- Auto Farm/Level/Quest
spawn(function()
    while task.wait(0.2) do
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
                    if melee < 2450 then cmd("AddPoint", "Melee", pts)
                    elseif def < 2450 then cmd("AddPoint", "Defense", pts) end
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
        end)
    end
end)

-- Kill Aura / Auto Boss
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
            if T.autoAllBosses then
                for _, bname in ipairs(BOSSES) do
                    local e = findEnemy({name = bname})
                    if e then attackTarget(e); break end
                end
            end
            for _, bname in ipairs(BOSSES) do
                local key = "boss_"..bname[1]:gsub(" ","")
                if T[key] then
                    local e = findEnemy({name = bname[1]})
                    if e then attackTarget(e) end
                end
            end
        end)
    end
end)

-- Fruits / ESP
spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if T.autoCollectFruit then
                for _, obj in pairs(workspace:GetChildren()) do
                    if (obj:IsA("Tool") or obj.Name:find("Fruit")) and obj:FindFirstChild("Handle") then
                        local r = getR(); if r then r.CFrame = obj.Handle.CFrame * CFrame.new(0,2,0) end
                        task.wait(0.15)
                    end
                end
            end
            if T.autoStoreFruit then
                for _, obj in pairs(plr.Backpack:GetChildren()) do
                    if obj:IsA("Tool") and obj.Name:find("Fruit") then cmd("StoreFruit", obj.Name) end
                end
            end
            if T.autoRandomFruit then cmd("BuyRandomFruit", "Random") end
        end)
    end
end)

-- ======================
-- [GOD MODE / FLY / MOVEMENT]
-- ======================
local godCons = {}
spawn(function()
    while task.wait() do
        pcall(function()
            if T.godMode then
                local h = getH()
                if h and h.Health > 0 then h.Health = h.MaxHealth end
            end
        end)
    end
end)

local flying, bg, bv = false, nil, nil
spawn(function()
    while task.wait(0.05) do
        pcall(function()
            local r = getR(); if not r then return end
            if T.fly then
                if not flying then
                    flying = true
                    bg = Instance.new("BodyGyro", r); bg.MaxTorque = Vector3.new(0, math.huge, 0); bg.P = 10000
                    bv = Instance.new("BodyVelocity", r); bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge); bv.Velocity = Vector3.new(0, 0, 0)
                end
                local d = Vector3.new(
                    (UIS:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (UIS:IsKeyDown(Enum.KeyCode.A) and 1 or 0),
                    (UIS:IsKeyDown(Enum.KeyCode.Space) and 1 or 0) - (UIS:IsKeyDown(Enum.KeyCode.LeftShift) and 1 or 0),
                    (UIS:IsKeyDown(Enum.KeyCode.W) and -1 or 0) - (UIS:IsKeyDown(Enum.KeyCode.S) and -1 or 0)
                )
                r.Velocity = d * (T.speed and 150 or 75)
            elseif flying then
                flying = false
                if bg then bg:Destroy() end
                if bv then bv:Destroy() end
                bg, bv = nil, nil
            end
            if T.infiniteJump and UIS:IsKeyDown(Enum.KeyCode.Space) then
                local r = getR()
                if r then r.Velocity = Vector3.new(r.Velocity.X, 50, r.Velocity.Z) end
            end
            if T.noClip then
                for _, p in pairs(getC():GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end
            if T.walkOnWater and r.Position.Y < 0 then
                r.CFrame = CFrame.new(r.Position.X, 3, r.Position.Z)
            end
        end)
    end
end)

-- ESP System
local espObjs = {}
spawn(function()
    while task.wait(1) do
        pcall(function()
            clearESP()
            if T.fruitESP then
                for _, o in pairs(workspace:GetChildren()) do
                    if (o:IsA("Tool") or o.Name:find("Fruit")) and o:FindFirstChild("Handle") then
                        addESP(o.Handle, Color3.fromRGB(255,100,0), "🍎 "..o.Name)
                    end
                end
            end
            if T.chestESP then
                for _, o in pairs(workspace:GetChildren()) do
                    if o.Name:find("Chest") and o:IsA("Model") and o:FindFirstChild("Handle") then
                        addESP(o.Handle, Color3.fromRGB(255,255,0), "💰 Chest")
                    end
                end
            end
            if T.enemyESP then
                for _, e in pairs(workspace.Enemies:GetChildren()) do
                    if e:FindFirstChild("HumanoidRootPart") and e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then
                        addESP(e.HumanoidRootPart, Color3.fromRGB(255,50,50), "☠️ "..e.Name)
                    end
                end
            end
        end)
    end
end)

local function addESP(obj, color, text)
    if espObjs[obj] or not obj then return end
    local b = Instance.new("BillboardGui")
    b.Name = "ANON_ESP"; b.Size = UDim2.new(0,100,0,30); b.Adornee = obj; b.AlwaysOnTop = true; b.StudsOffset = Vector3.new(0,2,0)
    local l = Instance.new("TextLabel", b)
    l.Size = UDim2.new(1,0,1,0); l.BackgroundTransparency = 1; l.Text = text; l.TextColor3 = color
    l.TextStrokeColor3 = Color3.new(0,0,0); l.TextStrokeTransparency = 0; l.TextSize = 14; l.Font = Enum.Font.GothamBold
    b.Parent = plr:WaitForChild("PlayerGui")
    espObjs[obj] = b
end

local function clearESP()
    for obj, b in pairs(espObjs) do
        if b and b.Parent then b:Destroy() end
    end
    espObjs = {}
end

local function tpToIsland(name)
    local pos = ISLAND_NAMES[name]
    if pos then tweenTo(pos) end
end

-- ======================
-- [UI MOBILE + LOGO ANIMÉ]
-- ======================
local C = {
    bg = Color3.fromRGB(5,5,20), bg2 = Color3.fromRGB(12,12,35),
    primary = Color3.fromRGB(0,170,255), text = Color3.fromRGB(220,220,255),
    accent = Color3.fromRGB(255,70,120), on = Color3.fromRGB(0,220,100), off = Color3.fromRGB(30,30,55),
    card = Color3.fromRGB(15,15,40), danger = Color3.fromRGB(255,50,50), warning = Color3.fromRGB(255,200,0),
    success = Color3.fromRGB(0,200,100), fruit = Color3.fromRGB(255,100,0)
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AnonymeHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui") -- CoreGui pour éviter les conflits

-- LOGO (glissable + cliquable)
local Logo = Instance.new("ImageButton")
Logo.Parent = ScreenGui
Logo.Size = UDim2.new(0, 70, 0, 70)
Logo.Position = UDim2.new(0.05, 0, 0.45, 0)
Logo.BackgroundTransparency = 1
Logo.Image = LOGO_ASSET_ID
Logo.Draggable = true
Logo.Active = true

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = Logo

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Parent = Logo
LogoStroke.Color = Color3.fromRGB(170, 0, 255)
LogoStroke.Thickness = 3

local LogoGradient = Instance.new("UIGradient")
LogoGradient.Parent = LogoStroke
LogoGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 0, 255))
}

-- Texte de secours si l'image ne charge pas
local FallbackText = Instance.new("TextLabel", Logo)
FallbackText.Size = UDim2.new(1, 0, 1, 0)
FallbackText.BackgroundTransparency = 1
FallbackText.Text = "AS"
FallbackText.TextColor3 = Color3.fromRGB(255, 255, 255)
FallbackText.TextSize = 24
FallbackText.Font = Enum.Font.GothamBold
FallbackText.Visible = false

task.spawn(function()
    task.wait(3)
    if Logo.ImageContentId == "" or Logo.ImageContentId == "rbxassetid://0" then
        FallbackText.Visible = true
        Logo.Image = ""
    end
end)

-- MENU PRINCIPAL
local Menu = Instance.new("Frame")
Menu.Parent = ScreenGui
Menu.Size = UDim2.new(0, 0, 0, 0) -- Commence à 0 pour l'animation
Menu.Position = UDim2.new(0.5, -300, 0.5, -175)
Menu.BackgroundColor3 = C.bg
Menu.Visible = false
Menu.Active = true

local MenuCorner = Instance.new("UICorner")
MenuCorner.CornerRadius = UDim.new(0, 12)
MenuCorner.Parent = Menu

local MenuStroke = Instance.new("UIStroke", Menu)
MenuStroke.Color = C.primary
MenuStroke.Thickness = 1.5

-- ANIMATION OUVERTURE/FERMETURE
Logo.MouseButton1Click:Connect(function()
    if Menu.Visible then
        local closeTween = TweenService:Create(Menu, TweenInfo.new(0.25), {Size = UDim2.new(0, 0, 0, 0)})
        closeTween:Play()
        closeTween.Completed:Wait()
        Menu.Visible = false
        Menu.Size = UDim2.new(0, 600, 0, 350)
    else
        Menu.Size = UDim2.new(0, 0, 0, 0)
        Menu.Visible = true
        TweenService:Create(Menu, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Size = UDim2.new(0, 600, 0, 350)}):Play()
    end
end)

-- GLISSEMENT DU LOGO (tactile + souris)
local dragging = false
local dragInput, dragStart, startPos

Logo.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Logo.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Logo.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Logo.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- CONTENU DU MENU
local MenuContent = Instance.new("ScrollingFrame", Menu)
MenuContent.Size = UDim2.new(1, -10, 1, -40)
MenuContent.Position = UDim2.new(0, 5, 0, 30)
MenuContent.BackgroundTransparency = 1
MenuContent.ScrollBarThickness = 5
MenuContent.ScrollBarImageColor3 = C.primary

local MenuLayout = Instance.new("UIListLayout", MenuContent)
MenuLayout.Padding = UDim.new(0, 8)
MenuLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    MenuContent.CanvasSize = UDim2.new(0, 0, 0, MenuLayout.AbsoluteContentSize.Y + 20)
end)

-- BARRE DE RECHERCHE
local SearchBar = Instance.new("TextBox", Menu)
SearchBar.Size = UDim2.new(1, -20, 0, 30)
SearchBar.Position = UDim2.new(0, 10, 0, 5)
SearchBar.BackgroundColor3 = C.card
SearchBar.TextColor3 = C.text
SearchBar.PlaceholderText = "🔍 Rechercher..."
SearchBar.PlaceholderColor3 = C.textMuted
SearchBar.TextSize = 14
SearchBar.Font = Enum.Font.Gotham
SearchBar.Text = ""

local SearchCorner = Instance.new("UICorner", SearchBar)
SearchCorner.CornerRadius = UDim.new(0, 6)

local SearchStroke = Instance.new("UIStroke", SearchBar)
SearchStroke.Color = C.primary
SearchStroke.Thickness = 1

-- CATÉGORIES
local CATEGORIES = {
    {name = "🔥 FARM", color = C.success, toggles = {"autoFarm", "autoLevel", "autoMastery", "autoStats", "autoQuest", "autoChest", "autoBeli"}},
    {name = "⚔️ COMBAT", color = C.danger, toggles = {"killAura", "autoPvP", "godMode", "fastAttack", "noCooldown"}},
    {name = "👹 BOSSES", color = C.warning, toggles = {"autoAllBosses"}},
    {name = "🍎 FRUITS", color = C.fruit, toggles = {"autoCollectFruit", "autoStoreFruit", "autoRandomFruit", "fruitESP"}},
    {name = "🌊 SEA EVENTS", color = C.primary, toggles = {"autoSeaBeast", "autoTerrorshark", "autoLeviathan"}},
    {name = "👁️ ESP", color = Color3.fromRGB(0, 255, 150), toggles = {"chestESP", "enemyESP"}},
    {name = "🛩️ MOVEMENT", color = Color3.fromRGB(0, 170, 255), toggles = {"fly", "infiniteJump", "noClip", "walkOnWater", "speed"}},
    {name = "🏝️ TELEPORT", color = Color3.fromRGB(150, 0, 255), toggles = {}}
}

-- Ajouter les toggles des boss individuels
for _, boss in ipairs(BOSSES) do
    table.insert(CATEGORIES[3].toggles, "boss_"..boss[1]:gsub(" ", ""))
end

-- Créer les catégories
for _, cat in ipairs(CATEGORIES) do
    local catFrame = Instance.new("Frame", MenuContent)
    catFrame.Size = UDim2.new(1, -10, 0, 0)
    catFrame.BackgroundColor3 = C.card
    catFrame.BackgroundTransparency = 0.3

    local catCorner = Instance.new("UICorner", catFrame)
    catCorner.CornerRadius = UDim.new(0, 8)

    local catStroke = Instance.new("UIStroke", catFrame)
    catStroke.Color = cat.color
    catStroke.Thickness = 1

    local catLayout = Instance.new("UIListLayout", catFrame)
    catLayout.Padding = UDim.new(0, 4)

    local catPadding = Instance.new("UIPadding", catFrame)
    catPadding.PaddingLeft = UDim.new(0, 10)
    catPadding.PaddingTop = UDim.new(0, 8)
    catPadding.PaddingBottom = UDim.new(0, 8)

    -- Titre de catégorie
    local title = Instance.new("TextLabel", catFrame)
    title.Size = UDim2.new(1, -10, 0, 28)
    title.Text = cat.name
    title.TextSize = 14
    title.TextColor3 = cat.color
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left

    -- Toggles
    for _, toggleName in ipairs(cat.toggles) do
        if toggleName:find("boss_") then
            local btn = Instance.new("TextButton", catFrame)
            btn.Size = UDim2.new(1, -10, 0, 28)
            btn.Text = "  "..toggleName:gsub("boss_", ""):gsub("^(.)", string.upper, 1).."  |  OFF"
            btn.TextSize = 12
            btn.TextColor3 = C.text
            btn.BackgroundColor3 = C.off
            btn.Font = Enum.Font.Gotham
            btn.TextXAlignment = Enum.TextXAlignment.Left

            local btnCorner = Instance.new("UICorner", btn)
            btnCorner.CornerRadius = UDim.new(0, 4)

            local btnStroke = Instance.new("UIStroke", btn)
            btnStroke.Color = cat.color
            btnStroke.Thickness = 1
            btnStroke.Transparency = 0.5

            local btnPadding = Instance.new("UIPadding", btn)
            btnPadding.PaddingLeft = UDim.new(0, 5)

            btn.MouseButton1Click:Connect(function()
                T[toggleName] = not T[toggleName]
                btn.Text = "  "..toggleName:gsub("boss_", ""):gsub("^(.)", string.upper, 1).."  |  "..(T[toggleName] and "ON" or "OFF")
                btn.BackgroundColor3 = T[toggleName] and C.warning or C.off
            end)

            -- Effet hover
            btn.MouseEnter:Connect(function()
                if btn.BackgroundColor3 == C.off then
                    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
                end
            end)
            btn.MouseLeave:Connect(function()
                if btn.BackgroundColor3 ~= C.warning then
                    btn.BackgroundColor3 = C.off
                end
            end)

        elseif toggleName == "godMode" then
            local btn = Instance.new("TextButton", catFrame)
            btn.Size = UDim2.new(1, -10, 0, 28)
            btn.Text = "  🛡️ God Mode  |  OFF"
            btn.TextSize = 12
            btn.TextColor3 = C.text
            btn.BackgroundColor3 = C.off
            btn.Font = Enum.Font.GothamBold
            btn.TextXAlignment = Enum.TextXAlignment.Left

            local btnCorner = Instance.new("UICorner", btn)
            btnCorner.CornerRadius = UDim.new(0, 4)

            local btnStroke = Instance.new("UIStroke", btn)
            btnStroke.Color = C.god or Color3.fromRGB(255, 255, 0)
            btnStroke.Thickness = 2

            local btnPadding = Instance.new("UIPadding", btn)
            btnPadding.PaddingLeft = UDim.new(0, 5)

            btn.MouseButton1Click:Connect(function()
                T.godMode = not T.godMode
                btn.Text = "  🛡️ God Mode  |  "..(T.godMode and "ON" or "OFF")
                btn.BackgroundColor3 = T.godMode and Color3.fromRGB(255, 255, 0) or C.off
                btn.TextColor3 = T.godMode and Color3.new(0, 0, 0) or C.text
            end)

        else
            local btn = Instance.new("TextButton", catFrame)
            btn.Size = UDim2.new(1, -10, 0, 28)
            btn.Text = "  "..toggleName:gsub("auto", ""):gsub("ESP", ""):gsub("^(.)", string.upper, 1).."  |  OFF"
            btn.TextSize = 12
            btn.TextColor3 = C.text
            btn.BackgroundColor3 = C.off
            btn.Font = Enum.Font.Gotham
            btn.TextXAlignment = Enum.TextXAlignment.Left

            local btnCorner = Instance.new("UICorner", btn)
            btnCorner.CornerRadius = UDim.new(0, 4)

            local btnStroke = Instance.new("UIStroke", btn)
            btnStroke.Color = cat.color
            btnStroke.Thickness = 1
            btnStroke.Transparency = 0.5

            local btnPadding = Instance.new("UIPadding", btn)
            btnPadding.PaddingLeft = UDim.new(0, 5)

            btn.MouseButton1Click:Connect(function()
                T[toggleName] = not T[toggleName]
                btn.Text = "  "..toggleName:gsub("auto", ""):gsub("ESP", ""):gsub("^(.)", string.upper, 1).."  |  "..(T[toggleName] and "ON" or "OFF")
                btn.BackgroundColor3 = T[toggleName] and cat.color or C.off
            end)

            -- Effet hover
            btn.MouseEnter:Connect(function()
                if btn.BackgroundColor3 == C.off then
                    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
                end
            end)
            btn.MouseLeave:Connect(function()
                if btn.BackgroundColor3 ~= cat.color then
                    btn.BackgroundColor3 = C.off
                end
            end)
        end
    end

    -- Boutons de téléportation pour la catégorie TELEPORT
    if cat.name == "🏝️ TELEPORT" then
        for _, island in ipairs(ISLANDS) do
            local btn = Instance.new("TextButton", catFrame)
            btn.Size = UDim2.new(1, -10, 0, 28)
            btn.Text = "  🏝️ "..island[1]
            btn.TextSize = 12
            btn.TextColor3 = C.text
            btn.BackgroundColor3 = C.card
            btn.Font = Enum.Font.Gotham
            btn.TextXAlignment = Enum.TextXAlignment.Left

            local btnCorner = Instance.new("UICorner", btn)
            btnCorner.CornerRadius = UDim.new(0, 4)

            local btnPadding = Instance.new("UIPadding", btn)
            btnPadding.PaddingLeft = UDim.new(0, 5)

            btn.MouseButton1Click:Connect(function()
                tpToIsland(island[1])
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "✅ Téléportation",
                    Text = "Direction: "..island[1],
                    Duration = 2
                })
            end)

            -- Effet hover
            btn.MouseEnter:Connect(function()
                btn.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
            end)
            btn.MouseLeave:Connect(function()
                btn.BackgroundColor3 = C.card
            end)
        end
    end
end

-- Bouton fermer
local CloseBtn = Instance.new("TextButton", Menu)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0, 5)
CloseBtn.Text = "✕"
CloseBtn.TextSize = 18
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
CloseBtn.Font = Enum.Font.GothamBold

local CloseCorner = Instance.new("UICorner", CloseBtn)
CloseCorner.CornerRadius = UDim.new(0, 6)

CloseBtn.MouseButton1Click:Connect(function()
    Menu.Visible = false
end)

-- Anti-AFK
spawn(function()
    while task.wait(30) do
        pcall(function()
            VU:ClickButton2(Vector2.new())
            local r = getR()
            if r then r.Velocity = Vector3.new(0, 0.1, 0) end
        end)
    end
end)

-- Notification
task.wait(1)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "✅ Anonymes Script v"..SCRIPT_VERSION,
    Text = "Logo glissant + UI mobile - Clique sur le logo",
    Duration = 5
})

print("✅ Script chargé - Logo animé + glissement tactile activé")
