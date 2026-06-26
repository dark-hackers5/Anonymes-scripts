-- =============================================
-- ANONYMES SCRIPTS HUB v13.0 | Blox Fruits
-- Boss Selector + God Mode + Tout fonctionnel
-- =============================================
local VERSION = "13.0"
local LOGO_ASSET_ID = "73393542095412"  -- Ton ID personnalisé
local LOGO_URL = "rbxassetid://" .. LOGO_ASSET_ID

-- =============================================
-- SERVICES
-- =============================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_ = Remotes:WaitForChild("CommF_")

-- Anti-AFK
spawn(function()
    while task.wait(60) do
        pcall(function() VirtualUser:ClickButton2(Vector2.new()) end)
    end
end)

-- =============================================
-- FONCTIONS UTILES
-- =============================================
local function cmd(...)
    local args = {...}
    local s, r = pcall(function() return CommF_:InvokeServer(unpack(args)) end)
    return r
end

local function getChar()
    return player.Character or player.CharacterAdded:Wait()
end

local function getRoot()
    local c = getChar()
    return c:FindFirstChild("HumanoidRootPart")
end

-- =============================================
-- LISTE DES BOSS (Sélecteur)
-- =============================================
local BOSSES = {
    {name = "Gorilla King", level = 25, sea = "1er Sea"},
    {name = "Vice Admiral", level = 130, sea = "1er Sea"},
    {name = "Saber Expert", level = 200, sea = "1er Sea"},
    {name = "Magma Admiral", level = 600, sea = "1er Sea"},
    {name = "Cursed Captain", level = 1000, sea = "2e Sea"},
    {name = "Don Swan", level = 1500, sea = "2e Sea"},
    {name = "Order", level = 2300, sea = "3e Sea"},
    {name = "RIP Indra", level = 2400, sea = "3e Sea"},
    {name = "Dough King", level = 2300, sea = "3e Sea"},
    {name = "Cake Prince", level = 2475, sea = "3e Sea"},
    {name = "Sea Beast", level = 1500, sea = "2e Sea"},
    {name = "Leviathan", level = 2000, sea = "3e Sea"},
    {name = "Terrorshark", level = 2000, sea = "3e Sea"},
    {name = "Cyborg", level = 2000, sea = "3e Sea"}
}

-- =============================================
-- TOGGLES
-- =============================================
local toggles = {}
local toggleKeys = {
    -- Farm
    "autoLevel", "autoFarm", "autoMastery", "autoStats", "autoQuest", "autoChest", "autoBeli", "autoDungeon",
    -- Combat
    "killAura", "autoAttack", "autoPvP", "autoBounty", "fastAttack", "noCooldown", "godMode",
    -- Boss
    "autoAllBosses", "autoSeaBeast", "autoLeviathan", "autoTerrorshark", "autoDoughKing", "autoCakePrince", "autoCyborg", "autoRipIndra",
    -- Raid
    "autoRaid",
    -- Matériaux
    "autoAllMaterials", "autoBones", "autoEctoplasm", "autoCandy",
    -- Boutique
    "buyAllSwords", "buyAllGuns", "buyCutlass", "buyKatana", "buyDualKatana",
    -- Fruits
    "autoCollectFruit", "autoStoreFruit", "autoRandomFruit", "autoGachaElite",
    -- Déplacement
    "fly", "infiniteJump", "noClip", "walkOnWater", "teleportIsland",
    -- Race
    "autoRaceV4", "autoObservation", "autoKenHaki",
    -- ESP
    "fruitESP", "chestESP", "playerESP"
}
for _, k in ipairs(toggleKeys) do toggles[k] = false end

-- Boss individuels
for _, boss in ipairs(BOSSES) do
    toggles["boss_" .. boss.name] = false
end

-- =============================================
-- GOD MODE
-- =============================================
local godModeConnected = false
local godModeConnections = {}

local function enableGodMode()
    if godModeConnected then return end
    godModeConnected = true
    local char = getChar()
    local hum = char:FindFirstChild("Humanoid")
    if not hum then
        player.CharacterAdded:Wait()
        char = getChar()
        hum = char:FindFirstChild("Humanoid")
    end
    if hum then
        local conn1 = RunService.Heartbeat:Connect(function()
            if toggles.godMode and hum and hum.Health > 0 then
                hum.Health = hum.MaxHealth
            end
        end)
        table.insert(godModeConnections, conn1)
        local conn2 = hum:Connect("HealthChanged", function()
            if toggles.godMode and hum and hum.Health < hum.MaxHealth and hum.Health > 0 then
                hum.Health = hum.MaxHealth
            end
        end)
        table.insert(godModeConnections, conn2)
    end
end

local function disableGodMode()
    godModeConnected = false
    for _, conn in ipairs(godModeConnections) do
        pcall(function() conn:Disconnect() end)
    end
    godModeConnections = {}
end

-- =============================================
-- COMBATTRE UN BOSS
-- =============================================
local function fightBoss(bossName)
    local enemies = workspace:FindFirstChild("Enemies")
    if enemies then
        for _, enemy in pairs(enemies:GetChildren()) do
            if enemy.Name:find(bossName) and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") then
                local root = getRoot()
                if root then
                    root.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                    task.wait(0.1)
                    spawn(function()
                        while toggles["boss_" .. bossName] and enemy and enemy.Parent and enemy.Humanoid.Health > 0 do
                            local r = getRoot()
                            if r then
                                r.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                            end
                            cmd("Attack", true)
                            VirtualUser:ClickButton1(Vector2.new(), workspace.CurrentCamera.CFrame)
                            task.wait(0.1)
                        end
                    end)
                    return true
                end
            end
        end
    end
    return false
end

-- =============================================
-- BOUCLES D'ACTION
-- =============================================
-- Boss
spawn(function()
    while task.wait(2) do
        for _, boss in ipairs(BOSSES) do
            local key = "boss_" .. boss.name
            if toggles[key] then
                fightBoss(boss.name)
                task.wait(1)
            end
        end
        if toggles.autoAllBosses then
            cmd("FarmBosses")
        end
    end
end)

-- Farm
spawn(function()
    while task.wait(2) do
        if toggles.autoLevel then cmd("AddPoint","Strength",1); cmd("AddPoint","Defense",1); cmd("SetSpawnPoint"); cmd("FarmNearestMob") end
        if toggles.autoFarm then cmd("SetSpawnPoint"); cmd("FarmNearestMob") end
        if toggles.autoMastery then cmd("FarmMastery") end
        if toggles.autoStats then cmd("AddPoint","Strength",1); cmd("AddPoint","Defense",1); cmd("AddPoint","Melee",1) end
        if toggles.autoQuest then cmd("TakeQuest") end
        if toggles.autoChest then cmd("FarmChest") end
        if toggles.autoBeli then cmd("FarmBeli") end
        if toggles.autoDungeon then cmd("FarmDungeon") end
    end
end)

-- Combat
spawn(function()
    while task.wait(0.3) do
        local root = getRoot()
        if not root then task.wait(1); return end
        if toggles.killAura then
            for _, v in pairs(workspace:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and not v:FindFirstChild("Player") then
                    root.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,5); task.wait(0.05); cmd("Attack", true); VirtualUser:ClickButton1(Vector2.new(), workspace.CurrentCamera.CFrame)
                end
            end
        end
        if toggles.autoPvP then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
                    root.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3); task.wait(0.05)
                    local tool = player.Character:FindFirstChildOfClass("Tool"); if tool then tool:Activate() end; VirtualUser:ClickButton1(Vector2.new(), workspace.CurrentCamera.CFrame)
                end
            end
        end
        if toggles.autoAttack then cmd("Attack", true); VirtualUser:ClickButton1(Vector2.new(), workspace.CurrentCamera.CFrame) end
        if toggles.fastAttack then cmd("FastAttack") end
        if toggles.noCooldown then cmd("NoCooldown") end
    end
end)

-- Raid
spawn(function()
    while task.wait(3) do
        if toggles.autoRaid then cmd("StartRaid"); cmd("FarmRaid") end
    end
end)

-- Matériaux
spawn(function()
    while task.wait(2) do
        if toggles.autoAllMaterials then cmd("FarmMaterials") end
        if toggles.autoBones then cmd("FarmBones") end
        if toggles.autoEctoplasm then cmd("FarmEctoplasm") end
        if toggles.autoCandy then cmd("FarmCandy") end
    end
end)

-- Boutique
local swordsList = {"Cutlass","Katana","Longsword","IronMace","Pipe","DualKatana","Trident","SoulCane","Bisento","TripleKatana","DualHeadedBlade","Rengoku"}
local gunsList = {"Slingshot","Flintlock","Musket","RefinedSlingshot","Cannon","DualFlintlock","Bazooka"}
spawn(function()
    while task.wait(5) do
        if toggles.buyAllSwords then for _, s in ipairs(swordsList) do cmd("BuySword", s) end end
        if toggles.buyAllGuns then for _, g in ipairs(gunsList) do cmd("BuyGun", g) end end
        if toggles.buyCutlass then cmd("BuySword","Cutlass") end
        if toggles.buyKatana then cmd("BuySword","Katana") end
        if toggles.buyDualKatana then cmd("BuySword","DualKatana") end
    end
end)

-- Fruits
spawn(function()
    while task.wait(3) do
        if toggles.autoCollectFruit then
            for _, obj in pairs(workspace:GetChildren()) do
                if (obj:IsA("Tool") or obj.Name:find("Fruit")) and obj:FindFirstChild("Handle") then
                    local root = getRoot()
                    if root then
                        root.CFrame = obj.Handle.CFrame * CFrame.new(0,2,0); task.wait(0.2)
                        pcall(function() firetouchinterest(root, obj.Handle, 0); task.wait(0.05); firetouchinterest(root, obj.Handle, 1) end)
                    end
                end
            end
        end
        if toggles.autoStoreFruit then cmd("StoreFruit") end
        if toggles.autoRandomFruit then cmd("BuyRandomFruit","Random") end
    end
end)

-- Déplacement
local flying = false; local bg, bv = nil, nil
spawn(function()
    while task.wait(0.1) do
        if toggles.fly then
            if not flying then
                flying = true; local root = getRoot()
                if root then
                    bg = Instance.new("BodyGyro"); bg.Parent = root; bg.MaxTorque = Vector3.new(0,0,0); bg.P = 1000
                    bv = Instance.new("BodyVelocity"); bv.Parent = root; bv.MaxForce = Vector3.new(10000,10000,10000); bv.Velocity = Vector3.new(0,0,0)
                end
            end
            local root = getRoot()
            if root then
                local dir = Vector3.new(
                    (UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.A) and 1 or 0),
                    (UserInputService:IsKeyDown(Enum.KeyCode.Space) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and 1 or 0),
                    (UserInputService:IsKeyDown(Enum.KeyCode.W) and -1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.S) and -1 or 0)
                ); root.Velocity = dir * 50
            end
        else
            if flying then
                flying = false; local root = getRoot()
                if root then if bg then bg:Destroy(); bg = nil end; if bv then bv:Destroy(); bv = nil end end
            end
        end
    end
end)

-- Saut Infini
local jumpCon = nil
spawn(function()
    while task.wait(1) do
        if toggles.infiniteJump then
            if not jumpCon then jumpCon = UserInputService.JumpRequest:Connect(function() local root = getRoot(); if root then root.Velocity = Vector3.new(root.Velocity.X, 50, root.Velocity.Z) end end) end
        else if jumpCon then jumpCon:Disconnect(); jumpCon = nil end end
    end
end)

-- No Clip
spawn(function() while task.wait(0.5) do if toggles.noClip then local c = getChar(); for _, p in pairs(c:GetChildren()) do if p:IsA("BasePart") then p.CanCollide = false end end end end end)

-- Marcher sur l'eau
spawn(function() while task.wait(0.3) do if toggles.walkOnWater then local root = getRoot(); if root and root.Position.Y < 0 then root.CFrame = CFrame.new(root.Position.X, 3, root.Position.Z) end end end end)

-- Téléportation
spawn(function() while task.wait(5) do if toggles.teleportIsland then cmd("TeleportToIsland") end end end)

-- Race / Haki
spawn(function() while task.wait(5) do if toggles.autoRaceV4 then cmd("RaceV4") end; if toggles.autoObservation then cmd("ObservationV2") end; if toggles.autoKenHaki then cmd("KenHaki") end end end)

-- God Mode (boucle de vérification)
spawn(function()
    while task.wait(0.5) do
        if toggles.godMode then
            if not godModeConnected then enableGodMode() end
            local char = getChar()
            local hum = char:FindFirstChild("Humanoid")
            if hum and hum.Health > 0 then hum.Health = hum.MaxHealth end
        else
            if godModeConnected then disableGodMode() end
        end
    end
end)

-- ESP
local espObjects = {}
local function addESP(obj, color, text)
    if espObjects[obj] then return end
    local bill = Instance.new("BillboardGui")
    bill.Name = "AnonymesESP"
    bill.Size = UDim2.new(0, 50, 0, 20)
    bill.Adornee = obj
    bill.AlwaysOnTop = true
    local label = Instance.new("TextLabel", bill)
    label.Size = UDim2.new(1,0,1,0)
    label.BackgroundTransparency = 1
    label.Text = text or obj.Name
    label.TextColor3 = color
    label.TextStrokeColor3 = Color3.new(0,0,0)
    label.TextStrokeTransparency = 0
    label.TextSize = 14
    label.Font = Enum.Font.GothamBold
    bill.Parent = player:WaitForChild("PlayerGui")
    espObjects[obj] = bill
end

local function clearESP()
    for obj, bill in pairs(espObjects) do
        if bill and bill.Parent then bill:Destroy() end
    end
    espObjects = {}
end

spawn(function()
    while task.wait(1) do
        if toggles.fruitESP then
            for _, obj in pairs(workspace:GetChildren()) do
                if (obj:IsA("Tool") or obj.Name:find("Fruit")) and obj:FindFirstChild("Handle") then
                    addESP(obj.Handle, Color3.fromRGB(255,100,0), "🍎 " .. obj.Name)
                end
            end
        end
        if toggles.chestESP then
            for _, obj in pairs(workspace:GetChildren()) do
                if obj.Name:find("Chest") and obj:IsA("Model") and obj:FindFirstChild("Handle") then
                    addESP(obj.Handle, Color3.fromRGB(255,255,0), "💰 Chest")
                end
            end
        end
        if toggles.playerESP then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    addESP(plr.Character.HumanoidRootPart, plr.TeamColor.Color, "👤 " .. plr.Name)
                end
            end
        end
        if not toggles.fruitESP and not toggles.chestESP and not toggles.playerESP then clearESP() end
    end
end)

-- =============================================
-- INTERFACE GRAPHIQUE (UI)
-- =============================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnonymesHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local COLORS = {
    PRIMARY = Color3.fromRGB(0, 170, 255),
    BG = Color3.fromRGB(15, 15, 35),
    BG_LIGHT = Color3.fromRGB(25, 25, 50),
    TEXT = Color3.fromRGB(255, 255, 255),
    TEXT_MUTED = Color3.fromRGB(150, 150, 200),
    CAT_BG = Color3.fromRGB(20, 20, 40),
    CAT_SEL = Color3.fromRGB(0, 100, 200),
    BTN_ON = Color3.fromRGB(0, 200, 100),
    BTN_OFF = Color3.fromRGB(40, 40, 60),
    DANGER = Color3.fromRGB(255, 50, 50),
    SUCCESS = Color3.fromRGB(0, 200, 100),
    WARNING = Color3.fromRGB(255, 200, 0),
    RAID = Color3.fromRGB(200, 0, 255),
    GOLD = Color3.fromRGB(255, 215, 0),
    RACE = Color3.fromRGB(255, 100, 200),
    ESP = Color3.fromRGB(0, 255, 150),
    GOD = Color3.fromRGB(255, 255, 0)
}

-- LOGO
local LogoButton = Instance.new("ImageButton")
LogoButton.Name = "AnonymesLogo"
LogoButton.Size = UDim2.new(0, 44, 0, 44)
LogoButton.Position = UDim2.new(0, 8, 0, 8)
LogoButton.BackgroundColor3 = COLORS.BG_LIGHT
LogoButton.BackgroundTransparency = 0.3
LogoButton.Image = LOGO_URL
LogoButton.ScaleType = Enum.ScaleType.Fit
LogoButton.ZIndex = 20
LogoButton.Draggable = true
LogoButton.Parent = screenGui

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = LogoButton

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = COLORS.PRIMARY
LogoStroke.Thickness = 2
LogoStroke.Parent = LogoButton

-- FENÊTRE PRINCIPALE
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 700, 0, 580)
MainFrame.Position = UDim2.new(0.5, -350, 0.5, -290)
MainFrame.BackgroundColor3 = COLORS.BG
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = screenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = COLORS.PRIMARY
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- BARRE DE TITRE
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = COLORS.BG_LIGHT
TitleBar.Parent = MainFrame

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 8, 0, 0)
TitleBarCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "ANONYMES HUB v" .. VERSION
Title.TextSize = 16
Title.TextColor3 = COLORS.TEXT
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local TitlePadding = Instance.new("UIPadding")
TitlePadding.PaddingLeft = UDim.new(0, 10)
TitlePadding.Parent = Title

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 10)
CloseButton.Text = "X"
CloseButton.TextSize = 16
CloseButton.BackgroundColor3 = COLORS.DANGER
CloseButton.TextColor3 = COLORS.TEXT
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseButton

-- CATÉGORIES (Barre latérale)
local CategoriesFrame = Instance.new("Frame")
CategoriesFrame.Size = UDim2.new(0, 180, 1, -50)
CategoriesFrame.Position = UDim2.new(0, 0, 0, 50)
CategoriesFrame.BackgroundColor3 = COLORS.BG_LIGHT
CategoriesFrame.Parent = MainFrame

local CategoriesCorner = Instance.new("UICorner")
CategoriesCorner.CornerRadius = UDim.new(0, 0, 0, 8)
CategoriesCorner.Parent = CategoriesFrame

local CategoriesScrolling = Instance.new("ScrollingFrame")
CategoriesScrolling.Size = UDim2.new(1, 0, 1, 0)
CategoriesScrolling.BackgroundTransparency = 1
CategoriesScrolling.ScrollBarThickness = 3
CategoriesScrolling.Parent = CategoriesFrame

local CategoriesLayout = Instance.new("UIListLayout")
CategoriesLayout.FillDirection = Enum.FillDirection.Vertical
CategoriesLayout.Padding = UDim.new(0, 4)
CategoriesLayout.Parent = CategoriesScrolling

-- CONTENU (Partie droite)
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -180, 1, -50)
ContentFrame.Position = UDim2.new(0, 180, 0, 50)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local ContentScroll = Instance.new("ScrollingFrame")
ContentScroll.Size = UDim2.new(1, 0, 1, 0)
ContentScroll.BackgroundTransparency = 1
ContentScroll.ScrollBarThickness = 5
ContentScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
ContentScroll.Parent = ContentFrame

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Padding = UDim.new(0, 5)
ContentLayout.Parent = ContentScroll

-- FONCTION POUR CRÉER LE CONTENU D'UNE CATÉGORIE
local function createCategoryContent(cat)
    for _, child in pairs(ContentScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end

    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 0)
    container.BackgroundTransparency = 1
    container.Parent = ContentScroll

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 5)
    layout.Parent = container

    -- CATÉGORIE : BOSSES
    if cat.name == "bosses" then
        -- Bouton "Tous les Boss"
        local allBtn = Instance.new("TextButton")
        allBtn.Size = UDim2.new(1, -20, 0, 28)
        allBtn.Text = "⚔️ Tous les Boss: OFF"
        allBtn.TextSize = 14
        allBtn.TextColor3 = COLORS.TEXT
        allBtn.BackgroundColor3 = COLORS.BTN_OFF
        allBtn.Font = Enum.Font.GothamBold
        allBtn.Parent = container
        local ac = Instance.new("UICorner")
        ac.CornerRadius = UDim.new(0, 4)
        ac.Parent = allBtn
        local as = Instance.new("UIStroke")
        as.Color = COLORS.WARNING
        as.Thickness = 1
        as.Parent = allBtn
        local ap = Instance.new("UIPadding")
        ap.PaddingLeft = UDim.new(0, 10)
        ap.Parent = allBtn
        allBtn.MouseButton1Click:Connect(function()
            if toggles.autoAllBosses then
                toggles.autoAllBosses = false
                allBtn.Text = "⚔️ Tous les Boss: OFF"
                allBtn.BackgroundColor3 = COLORS.BTN_OFF
            else
                toggles.autoAllBosses = true
                allBtn.Text = "⚔️ Tous les Boss: ON"
                allBtn.BackgroundColor3 = COLORS.BTN_ON
            end
        end)

        -- Titre
        local titre = Instance.new("TextLabel")
        titre.Size = UDim2.new(1, -20, 0, 20)
        titre.Text = "👇 Sélectionne un boss :"
        titre.TextSize = 12
        titre.TextColor3 = COLORS.WARNING
        titre.BackgroundTransparency = 1
        titre.Font = Enum.Font.GothamBold
        titre.TextXAlignment = Enum.TextXAlignment.Left
        titre.Parent = container
        local tp = Instance.new("UIPadding")
        tp.PaddingLeft = UDim.new(0, 10)
        tp.Parent = titre

        -- Liste des boss (Scrolling)
        local bossScroll = Instance.new("ScrollingFrame")
        bossScroll.Size = UDim2.new(1, -20, 0, 300)
        bossScroll.BackgroundColor3 = COLORS.BG_LIGHT
        bossScroll.BackgroundTransparency = 0.3
        bossScroll.ScrollBarThickness = 4
        bossScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
        bossScroll.Parent = container
        local bsc = Instance.new("UICorner")
        bsc.CornerRadius = UDim.new(0, 4)
        bsc.Parent = bossScroll
        local bsp = Instance.new("UIPadding")
        bsp.PaddingLeft = UDim.new(0, 10)
        bsp.Parent = bossScroll

        local bLayout = Instance.new("UIListLayout")
        bLayout.Padding = UDim.new(0, 2)
        bLayout.Parent = bossScroll

        for _, boss in ipairs(BOSSES) do
            local bossBtn = Instance.new("TextButton")
            bossBtn.Size = UDim2.new(1, -5, 0, 28)
            bossBtn.Text = "👹 " .. boss.name .. " (Niv. " .. boss.level .. " | " .. boss.sea .. ")"
            bossBtn.TextSize = 12
            bossBtn.TextColor3 = COLORS.TEXT
            bossBtn.BackgroundColor3 = COLORS.CAT_BG
            bossBtn.Font = Enum.Font.Gotham
            bossBtn.Parent = bossScroll
            local bc = Instance.new("UICorner")
            bc.CornerRadius = UDim.new(0, 3)
            bc.Parent = bossBtn

            local bossKey = "boss_" .. boss.name
            bossBtn.MouseButton1Click:Connect(function()
                if toggles[bossKey] then
                    toggles[bossKey] = false
                    bossBtn.BackgroundColor3 = COLORS.CAT_BG
                    bossBtn.Text = "👹 " .. boss.name .. " (Niv. " .. boss.level .. " | " .. boss.sea .. ")"
                else
                    for _, b in ipairs(BOSSES) do
                        toggles["boss_" .. b.name] = false
                    end
                    toggles[bossKey] = true
                    bossBtn.BackgroundColor3 = COLORS.WARNING
                    bossBtn.Text = "🎯 " .. boss.name .. " (Niv. " .. boss.level .. ") ⚔️"
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "🎯 Boss ciblé",
                        Text = "Attaque de " .. boss.name .. " en cours...",
                        Duration = 3
                    })
                end
            end)
        end

    -- CATÉGORIE : COMBAT
    elseif cat.name == "combat" then
        for _, bd in ipairs(cat.buttons) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -20, 0, 28)
            btn.Text = bd[1] .. ": OFF"
            btn.TextSize = 14
            btn.TextColor3 = COLORS.TEXT
            btn.BackgroundColor3 = COLORS.BTN_OFF
            btn.Font = Enum.Font.Gotham
            btn.Parent = container
            local bnc = Instance.new("UICorner")
            bnc.CornerRadius = UDim.new(0, 4)
            bnc.Parent = btn
            local bns = Instance.new("UIStroke")
            bns.Color = COLORS.DANGER
            bns.Thickness = 1
            bns.Parent = btn
            local bnp = Instance.new("UIPadding")
            bnp.PaddingLeft = UDim.new(0, 10)
            bnp.Parent = btn
            local key = bd[2]
            btn.MouseButton1Click:Connect(function()
                if toggles[key] then
                    toggles[key] = false
                    btn.Text = bd[1] .. ": OFF"
                    btn.BackgroundColor3 = COLORS.BTN_OFF
                else
                    toggles[key] = true
                    btn.Text = bd[1] .. ": ON"
                    btn.BackgroundColor3 = COLORS.BTN_ON
                end
            end)
        end

        -- Bouton God Mode (spécial)
        local godBtn = Instance.new("TextButton")
        godBtn.Size = UDim2.new(1, -20, 0, 32)
        godBtn.Text = "🛡️ God Mode (0 dégâts) : OFF"
        godBtn.TextSize = 14
        godBtn.TextColor3 = COLORS.GOD
        godBtn.BackgroundColor3 = COLORS.BTN_OFF
        godBtn.Font = Enum.Font.GothamBold
        godBtn.Parent = container
        local gdc = Instance.new("UICorner")
        gdc.CornerRadius = UDim.new(0, 4)
        gdc.Parent = godBtn
        local gds = Instance.new("UIStroke")
        gds.Color = COLORS.GOD
        gds.Thickness = 2
        gds.Parent = godBtn
        local gdp = Instance.new("UIPadding")
        gdp.PaddingLeft = UDim.new(0, 10)
        gdp.Parent = godBtn
        godBtn.MouseButton1Click:Connect(function()
            if toggles.godMode then
                toggles.godMode = false
                godBtn.Text = "🛡️ God Mode (0 dégâts) : OFF"
                godBtn.BackgroundColor3 = COLORS.BTN_OFF
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "🛡️ God Mode désactivé",
                    Text = "Tu reçois à nouveau des dégâts.",
                    Duration = 3
                })
            else
                toggles.godMode = true
                godBtn.Text = "🛡️ God Mode (0 dégâts) : ON"
                godBtn.BackgroundColor3 = COLORS.BTN_ON
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "🛡️ God Mode activé",
                    Text = "Tu es invincible !",
                    Duration = 3
                })
            end
        end)

    -- CATÉGORIE : RAID
    elseif cat.name == "raid" then
        local raidBtn = Instance.new("TextButton")
        raidBtn.Size = UDim2.new(1, -20, 0, 32)
        raidBtn.Text = "⚡ Auto Raid: OFF"
        raidBtn.TextSize = 14
        raidBtn.TextColor3 = COLORS.TEXT
        raidBtn.BackgroundColor3 = COLORS.BTN_OFF
        raidBtn.Font = Enum.Font.GothamBold
        raidBtn.Parent = container
        local rc = Instance.new("UICorner")
        rc.CornerRadius = UDim.new(0, 4)
        rc.Parent = raidBtn
        local rs = Instance.new("UIStroke")
        rs.Color = COLORS.RAID
        rs.Thickness = 2
        rs.Parent = raidBtn
        local rp = Instance.new("UIPadding")
        rp.PaddingLeft = UDim.new(0, 10)
        rp.Parent = raidBtn
        raidBtn.MouseButton1Click:Connect(function()
            if toggles.autoRaid then
                toggles.autoRaid = false
                raidBtn.Text = "⚡ Auto Raid: OFF"
                raidBtn.BackgroundColor3 = COLORS.BTN_OFF
            else
                toggles.autoRaid = true
                raidBtn.Text = "⚡ Auto Raid: ON"
                raidBtn.BackgroundColor3 = COLORS.BTN_ON
            end
        end)

    -- CATÉGORIE : FRUITS
    elseif cat.name == "fruits" then
        for _, bd in ipairs(cat.buttons) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -20, 0, 28)
            btn.Text = bd[1] .. ": OFF"
            btn.TextSize = 14
            btn.TextColor3 = COLORS.TEXT
            btn.BackgroundColor3 = COLORS.BTN_OFF
            btn.Font = Enum.Font.Gotham
            btn.Parent = container
            local bnc = Instance.new("UICorner")
            bnc.CornerRadius = UDim.new(0, 4)
            bnc.Parent = btn
            local bns = Instance.new("UIStroke")
            bns.Color = COLORS.ESP
            bns.Thickness = 1
            bns.Parent = btn
            local bnp = Instance.new("UIPadding")
            bnp.PaddingLeft = UDim.new(0, 10)
            bnp.Parent = btn
            local key = bd[2]
            btn.MouseButton1Click:Connect(function()
                if toggles[key] then
                    toggles[key] = false
                    btn.Text = bd[1] .. ": OFF"
                    btn.BackgroundColor3 = COLORS.BTN_OFF
                else
                    toggles[key] = true
                    btn.Text = bd[1] .. ": ON"
                    btn.BackgroundColor3 = COLORS.BTN_ON
                end
            end)
        end

        -- Bouton Gacha Élite
        local gachaBtn = Instance.new("TextButton")
        gachaBtn.Size = UDim2.new(1, -20, 0, 32)
        gachaBtn.Text = "⭐ Gacha Élite (Top Fruits) : OFF"
        gachaBtn.TextSize = 14
        gachaBtn.TextColor3 = COLORS.GOLD
        gachaBtn.BackgroundColor3 = COLORS.BTN_OFF
        gachaBtn.Font = Enum.Font.GothamBold
        gachaBtn.Parent = container
        local gc = Instance.new("UICorner")
        gc.CornerRadius = UDim.new(0, 4)
        gc.Parent = gachaBtn
        local gs = Instance.new("UIStroke")
        gs.Color = COLORS.GOLD
        gs.Thickness = 2
        gs.Parent = gachaBtn
        local gp = Instance.new("UIPadding")
        gp.PaddingLeft = UDim.new(0, 10)
        gp.Parent = gachaBtn
        gachaBtn.MouseButton1Click:Connect(function()
            if toggles.autoGachaElite then
                toggles.autoGachaElite = false
                gachaBtn.Text = "⭐ Gacha Élite (Top Fruits) : OFF"
                gachaBtn.BackgroundColor3 = COLORS.BTN_OFF
            else
                toggles.autoGachaElite = true
                gachaBtn.Text = "⭐ Gacha Élite (Top Fruits) : ON"
                gachaBtn.BackgroundColor3 = COLORS.BTN_ON
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "🎯 Gacha Élite",
                    Text = "Cible : Dragon, Kitsune, Leopard...",
                    Duration = 4
                })
            end
        end)

    -- CATÉGORIES STANDARD (Farm, Matériaux, Boutique, etc.)
    else
        for _, bd in ipairs(cat.buttons) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -20, 0, 28)
            btn.Text = bd[1] .. ": OFF"
            btn.TextSize = 14
            btn.TextColor3 = COLORS.TEXT
            btn.BackgroundColor3 = COLORS.BTN_OFF
            btn.Font = Enum.Font.Gotham
            btn.Parent = container
            local bnc = Instance.new("UICorner")
            bnc.CornerRadius = UDim.new(0, 4)
            bnc.Parent = btn
            local bns = Instance.new("UIStroke")
            bns.Color = cat.color
            bns.Thickness = 1
            bns.Parent = btn
            local bnp = Instance.new("UIPadding")
            bnp.PaddingLeft = UDim.new(0, 10)
            bnp.Parent = btn
            local key = bd[2]
            btn.MouseButton1Click:Connect(function()
                if toggles[key] then
                    toggles[key] = false
                    btn.Text = bd[1] .. ": OFF"
                    btn.BackgroundColor3 = COLORS.BTN_OFF
                else
                    toggles[key] = true
                    btn.Text = bd[1] .. ": ON"
                    btn.BackgroundColor3 = COLORS.BTN_ON
                end
            end)
        end
    end
end

-- =============================================
-- 10 CATÉGORIES (avec icônes + couleurs)
-- =============================================
local categories = {
    {name = "farm", icon = "🌾", color = COLORS.SUCCESS, buttons = {
        {"Auto Level", "autoLevel"},
        {"Auto Farm", "autoFarm"},
        {"Auto Maîtrise", "autoMastery"},
        {"Auto Stats", "autoStats"},
        {"Auto Quête", "autoQuest"},
        {"Auto Chest", "autoChest"},
        {"Auto Beli", "autoBeli"},
        {"Auto Donjon", "autoDungeon"}
    }},
    {name = "combat", icon = "⚔️", color = COLORS.DANGER, buttons = {
        {"Kill Aura", "killAura"},
        {"Auto Attack", "autoAttack"},
        {"Auto PvP", "autoPvP"},
        {"Auto Bounty", "autoBounty"},
        {"Fast Attack", "fastAttack"},
        {"No Cooldown", "noCooldown"}
    }},
    {name = "bosses", icon = "👹", color = COLORS.WARNING, buttons = {}},
    {name = "raid", icon = "⚡", color = COLORS.RAID, buttons = {}},
    {name = "matériaux", icon = "🧱", color = Color3.fromRGB(200, 100, 255), buttons = {
        {"TOUS Matériaux", "autoAllMaterials"},
        {"Os (Bones)", "autoBones"},
        {"Ectoplasme", "autoEctoplasm"},
        {"Bonbons", "autoCandy"}
    }},
    {name = "boutique", icon = "🛒", color = Color3.fromRGB(255, 150, 0), buttons = {
        {"TOUTES Épées", "buyAllSwords"},
        {"TOUS Guns", "buyAllGuns"},
        {"Cutlass", "buyCutlass"},
        {"Katana", "buyKatana"},
        {"Dual Katana", "buyDualKatana"}
    }},
    {name = "fruits", icon = "🍎", color = Color3.fromRGB(255, 100, 0), buttons = {
        {"Collecter Fruit", "autoCollectFruit"},
        {"Stocker Fruit", "autoStoreFruit"},
        {"Achat Aléatoire", "autoRandomFruit"}
    }},
    {name = "déplacement", icon = "⛵", color = COLORS.PRIMARY, buttons = {
        {"Vol (Fly)", "fly"},
        {"Saut Infini", "infiniteJump"},
        {"No Clip", "noClip"},
        {"Marcher sur l'Eau", "walkOnWater"},
        {"Téléportation Îles", "teleportIsland"}
    }},
    {name = "race", icon = "🧬", color = COLORS.RACE, buttons = {
        {"Auto Race V4", "autoRaceV4"},
        {"Auto Obs. V2", "autoObservation"},
        {"Auto Ken Haki", "autoKenHaki"}
    }},
    {name = "esp", icon = "👁️", color = COLORS.ESP, buttons = {
        {"Fruit ESP", "fruitESP"},
        {"Chest ESP", "chestESP"},
        {"Player ESP", "playerESP"}
    }}
}

local categoryButtons = {}

for i, cat in ipairs(categories) do
    local button = Instance.new("TextButton")
    button.Name = cat.name .. "Button"
    button.Size = UDim2.new(1, -10, 0, 35)
    button.Text = cat.icon .. "  " .. cat.name
    button.TextSize = 12
    button.TextColor3 = COLORS.TEXT_MUTED
    button.BackgroundColor3 = COLORS.CAT_BG
    button.Font = Enum.Font.GothamBold
    button.ZIndex = 11
    button.Parent = CategoriesScrolling

    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 4)
    bc.Parent = button

    local bs = Instance.new("UIStroke")
    bs.Color = cat.color
    bs.Thickness = 1
    bs.Parent = button

    local bp = Instance.new("UIPadding")
    bp.PaddingLeft = UDim.new(0, 10)
    bp.Parent = button

    button.Selected = false
    button.MouseButton1Click:Connect(function()
        for _, btn in pairs(categoryButtons) do
            btn.Selected = false
            btn.BackgroundColor3 = COLORS.CAT_BG
            btn.TextColor3 = COLORS.TEXT_MUTED
        end
        button.Selected = true
        button.BackgroundColor3 = COLORS.CAT_SEL
        button.TextColor3 = COLORS.TEXT
        createCategoryContent(cat)
    end)

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = COLORS.CAT_SEL
        button.TextColor3 = COLORS.TEXT
    end)

    button.MouseLeave:Connect(function()
        if not button.Selected then
            button.BackgroundColor3 = COLORS.CAT_BG
            button.TextColor3 = COLORS.TEXT_MUTED
        end
    end)

    table.insert(categoryButtons, button)
end

-- Première catégorie par défaut
if #categoryButtons > 0 then
    task.spawn(function()
        task.wait(0.1)
        categoryButtons[1].MouseButton1Click:Fire()
    end)
end

-- TOGGLE LOGO
LogoButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Notification de démarrage
task.wait(1)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "🚀 Anonymes Hub v" .. VERSION,
    Text = "Boss Selector + God Mode + Gacha Élite activés !",
    Duration = 5
})
