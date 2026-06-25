-- ANONYMES SCRIPTS HUB v6.0 | Blox Fruits | Auto Farm Intelligent + Invincibilité + VIP/Perms
local VERSION = "6.0"
local LOGO_URL = "rbxassetid://88742532715379"

-- ===== COULEURS (Thème Zynex) =====
local COLORS = {
    PRIMARY = Color3.fromRGB(0, 170, 255),
    SECONDARY = Color3.fromRGB(0, 200, 100),
    BACKGROUND = Color3.fromRGB(15, 15, 35),
    BACKGROUND_LIGHT = Color3.fromRGB(25, 25, 50),
    TEXT = Color3.fromRGB(255, 255, 255),
    TEXT_MUTED = Color3.fromRGB(150, 150, 200),
    CATEGORY_BG = Color3.fromRGB(20, 20, 40),
    CATEGORY_HOVER = Color3.fromRGB(30, 30, 60),
    CATEGORY_SELECTED = Color3.fromRGB(0, 100, 200),
    BOUTON_ON = Color3.fromRGB(0, 200, 100),
    BOUTON_OFF = Color3.fromRGB(40, 40, 60),
    DANGER = Color3.fromRGB(255, 50, 50),
    SUCCESS = Color3.fromRGB(0, 200, 100),
    WARNING = Color3.fromRGB(255, 200, 0),
    VIP = Color3.fromRGB(255, 215, 0)  -- Or pour les fonctionnalités VIP
}

-- ===== TOGGLES =====
local toggles = {
    -- Combat
    killAura = false,
    triggerBot = false,
    autoAttack = false,
    autoPvP = false,
    -- Auto Farm (Optimisé)
    autoFarm = false,  -- NOUVEAU: Farm intelligent + quête auto
    autoNearest = false,
    autoEctoplasm = false,
    autoCandy = false,
    autoFactory = false,
    -- Bosses
    autoSeaBeast = false,
    autoLeviathan = false,
    autoPirateRaid = false,
    autoTerrorshark = false,
    autoDoughKing = false,
    -- ESP
    espPlayers = false,
    espBoss = false,
    espFruits = false,
    espChests = false,
    espIslands = false,
    -- Déplacement
    autoBoat = false,
    boatSpeed = false,
    teleportToBoat = false,
    fly = false,
    -- Fruits (Perms + Dark Blade)
    autoStoreFruit = false,
    autoRandomFruit = false,
    autoDarkBlade = false,  -- NOUVEAU: Farm Dark Blade
    autoPermFruit = false,  -- NOUVEAU: Farm fruits perms
    -- Quêtes
    autoQuest = false,
    autoBounty = false,
    -- Défense
    antiKick = false,
    antiStun = false,
    godMode = false,  -- NOUVEAU: Invincibilité totale (mobs t'attaquent mais 0 dégâts)
    -- Utilitaires
    infiniteJump = false,
    noClip = false,
    walkOnWater = false,
    -- Divers
    serverHop = false,
    fpsBoost = false,
    autoRejoin = false,
    -- VIP
    vipAccess = false,  -- NOUVEAU: Accès VIP (téléportations + fonctionnalités exclusives)
    vipTeleport = false
}

-- ===== INTERFACE PRINCIPALE =====
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnonymesHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Fenêtre principale
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = COLORS.BACKGROUND
MainFrame.Visible = false
MainFrame.Parent = screenGui
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = COLORS.PRIMARY
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Titre
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = COLORS.BACKGROUND_LIGHT
TitleBar.Parent = MainFrame
local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 8, 0, 0)
TitleBarCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "anonymes scripts hub v" .. VERSION
Title.TextSize = 18
Title.TextColor3 = COLORS.TEXT
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar
local TitlePadding = Instance.new("UIPadding")
TitlePadding.PaddingLeft = UDim.new(0, 15)
TitlePadding.Parent = Title

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.Text = "X"
CloseButton.TextSize = 16
CloseButton.BackgroundColor3 = COLORS.DANGER
CloseButton.TextColor3 = COLORS.TEXT
CloseButton.Parent = TitleBar
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseButton

-- Logo cliquable
local LogoButton = Instance.new("ImageButton")
LogoButton.Size = UDim2.new(0, 50, 0, 50)
LogoButton.Position = UDim2.new(0.02, 0, 0.02, 0)
LogoButton.BackgroundColor3 = COLORS.BACKGROUND_LIGHT
LogoButton.Image = LOGO_URL
LogoButton.Parent = screenGui
local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = LogoButton
local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = COLORS.PRIMARY
LogoStroke.Thickness = 2
LogoStroke.Parent = LogoButton

-- ===== BARRE LATÉRALE (10 Catégories) =====
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 150, 1, -40)
Sidebar.Position = UDim2.new(0, 0, 0, 40)
Sidebar.BackgroundColor3 = COLORS.BACKGROUND_LIGHT
Sidebar.Parent = MainFrame
local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 0, 0, 8)
SidebarCorner.Parent = Sidebar

local SidebarList = Instance.new("ScrollingFrame")
SidebarList.Size = UDim2.new(1, 0, 1, 0)
SidebarList.BackgroundTransparency = 1
SidebarList.ScrollBarThickness = 5
SidebarList.Parent = Sidebar
local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Padding = UDim.new(0, 5)
SidebarLayout.Parent = SidebarList

-- 10 catégories
local categories = {
    {name = "combat", icon = "🗡️", color = COLORS.DANGER},
    {name = "auto farm", icon = "🌾", color = COLORS.SUCCESS},
    {name = "bosses", icon = "👹", color = COLORS.WARNING},
    {name = "esp", icon = "👁️", color = Color3.fromRGB(200, 0, 255)},
    {name = "déplacement", icon = "⛵", color = COLORS.PRIMARY},
    {name = "fruits", icon = "🍎", color = Color3.fromRGB(255, 100, 0)},
    {name = "quêtes", icon = "📜", color = COLORS.WARNING},
    {name = "défense", icon = "🛡️", color = COLORS.BOUTON_ON},
    {name = "utilitaires", icon = "⚡", color = COLORS.SECONDARY},
    {name = "vip", icon = "👑", color = COLORS.VIP}
}

local categoryButtons = {}
for i, cat in ipairs(categories) do
    local button = Instance.new("TextButton")
    button.Name = cat.name .. "Button"
    button.Size = UDim2.new(1, -10, 0, 30)
    button.Text = cat.icon .. "  " .. cat.name
    button.TextSize = 14
    button.TextColor3 = COLORS.TEXT_MUTED
    button.BackgroundColor3 = COLORS.CATEGORY_BG
    button.Font = Enum.Font.GothamBold
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.Parent = SidebarList
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = button
    local buttonPadding = Instance.new("UIPadding")
    buttonPadding.PaddingLeft = UDim.new(0, 10)
    buttonPadding.Parent = button

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = COLORS.CATEGORY_HOVER
        button.TextColor3 = COLORS.TEXT
    end)
    button.MouseLeave:Connect(function()
        if not button.Selected then
            button.BackgroundColor3 = COLORS.CATEGORY_BG
            button.TextColor3 = COLORS.TEXT_MUTED
        end
    end)

    button.Selected = false
    button.MouseButton1Click:Connect(function()
        for _, btn in pairs(categoryButtons) do
            btn.Selected = false
            btn.BackgroundColor3 = COLORS.CATEGORY_BG
            btn.TextColor3 = COLORS.TEXT_MUTED
        end
        button.Selected = true
        button.BackgroundColor3 = COLORS.CATEGORY_SELECTED
        button.TextColor3 = COLORS.TEXT
        displayCategoryContent(cat.name)
    end)
    table.insert(categoryButtons, button)
end

if #categoryButtons > 0 then
    categoryButtons[1].Selected = true
    categoryButtons[1].BackgroundColor3 = COLORS.CATEGORY_SELECTED
    categoryButtons[1].TextColor3 = COLORS.TEXT
end

-- ===== ZONE DE CONTENU =====
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -160, 1, -40)
ContentFrame.Position = UDim2.new(0, 150, 0, 40)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local ContentScroll = Instance.new("ScrollingFrame")
ContentScroll.Size = UDim2.new(1, 0, 1, 0)
ContentScroll.BackgroundTransparency = 1
ContentScroll.ScrollBarThickness = 5
ContentScroll.Parent = ContentFrame
local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Padding = UDim.new(0, 10)
ContentLayout.Parent = ContentScroll

-- ===== FONCTION POUR CRÉER DES BOUTONS =====
local function createToggleButton(name, toggleKey, parent, isVIP)
    local button = Instance.new("TextButton")
    button.Name = toggleKey .. "Button"
    button.Size = UDim2.new(1, -20, 0, 25)
    button.Text = name .. ": OFF"
    button.TextSize = 14
    button.TextColor3 = isVIP and COLORS.VIP or COLORS.TEXT
    button.BackgroundColor3 = COLORS.BOUTON_OFF
    button.Font = Enum.Font.Gotham
    button.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = button
    local stroke = Instance.new("UIStroke")
    stroke.Color = isVIP and COLORS.VIP or COLORS.PRIMARY
    stroke.Thickness = 1
    stroke.Parent = button
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 10)
    padding.Parent = button

    local function updateButton()
        button.Text = name .. ": " .. (toggles[toggleKey] and "ON" or "OFF")
        button.BackgroundColor3 = toggles[toggleKey] and COLORS.BOUTON_ON or COLORS.BOUTON_OFF
    end

    button.MouseButton1Click:Connect(function()
        toggles[toggleKey] = not toggles[toggleKey]
        updateButton()
    end)
    updateButton()
    return button
end

-- ===== AFFICHAGE DES CATÉGORIES =====
local function displayCategoryContent(categoryName)
    for _, child in pairs(ContentScroll:GetChildren()) do
        if child:IsA("Frame") or child:IsA("TextLabel") then
            child:Destroy()
        end
    end

    local categoryTitle = Instance.new("TextLabel")
    categoryTitle.Size = UDim2.new(1, 0, 0, 30)
    categoryTitle.BackgroundTransparency = 1
    categoryTitle.Text = categoryName:upper()
    categoryTitle.TextSize = 18
    categoryTitle.TextColor3 = COLORS.PRIMARY
    categoryTitle.Font = Enum.Font.GothamBold
    categoryTitle.TextXAlignment = Enum.TextXAlignment.Left
    categoryTitle.Parent = ContentScroll
    local titlePadding = Instance.new("UIPadding")
    titlePadding.PaddingLeft = UDim.new(0, 10)
    titlePadding.Parent = categoryTitle

    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 0)
    container.BackgroundTransparency = 1
    container.Parent = ContentScroll
    local containerLayout = Instance.new("UIListLayout")
    containerLayout.Padding = UDim.new(0, 5)
    containerLayout.Parent = container

    if categoryName == "combat" then
        createToggleButton("Kill Aura", "killAura", container)
        createToggleButton("Trigger Bot", "triggerBot", container)
        createToggleButton("Auto Attack", "autoAttack", container)
        createToggleButton("Auto PvP", "autoPvP", container)
    elseif categoryName == "auto farm" then
        createToggleButton("Auto Farm (Intelligent)", "autoFarm", container)  -- NOUVEAU
        createToggleButton("Auto Nearest", "autoNearest", container)
        createToggleButton("Auto Ectoplasm", "autoEctoplasm", container)
        createToggleButton("Auto Candy", "autoCandy", container)
        createToggleButton("Auto Factory", "autoFactory", container)
    elseif categoryName == "bosses" then
        createToggleButton("Auto Sea Beast", "autoSeaBeast", container)
        createToggleButton("Auto Leviathan", "autoLeviathan", container)
        createToggleButton("Auto Pirate Raid", "autoPirateRaid", container)
        createToggleButton("Auto Terrorshark", "autoTerrorshark", container)
        createToggleButton("Auto Dough King", "autoDoughKing", container)
    elseif categoryName == "esp" then
        createToggleButton("ESP Players", "espPlayers", container)
        createToggleButton("ESP Boss", "espBoss", container)
        createToggleButton("ESP Fruits", "espFruits", container)
        createToggleButton("ESP Chests", "espChests", container)
        createToggleButton("ESP Islands", "espIslands", container)
    elseif categoryName == "déplacement" then
        createToggleButton("Auto Boat", "autoBoat", container)
        createToggleButton("Boat Speed", "boatSpeed", container)
        createToggleButton("Teleport to Boat", "teleportToBoat", container)
        createToggleButton("Fly", "fly", container)
    elseif categoryName == "fruits" then
        createToggleButton("Auto Store Fruit", "autoStoreFruit", container)
        createToggleButton("Auto Random Fruit", "autoRandomFruit", container)
        createToggleButton("Auto Dark Blade", "autoDarkBlade", container, true)  -- VIP
        createToggleButton("Auto Perm Fruits", "autoPermFruit", container, true)  -- VIP
    elseif categoryName == "quêtes" then
        createToggleButton("Auto Quest", "autoQuest", container)
        createToggleButton("Auto Bounty", "autoBounty", container)
    elseif categoryName == "défense" then
        createToggleButton("Anti Kick", "antiKick", container)
        createToggleButton("Anti Stun", "antiStun", container)
        createToggleButton("God Mode (Invincible)", "godMode", container, true)  -- VIP
    elseif categoryName == "utilitaires" then
        createToggleButton("Infinite Jump", "infiniteJump", container)
        createToggleButton("No Clip", "noClip", container)
        createToggleButton("Walk On Water", "walkOnWater", container)
    elseif categoryName == "vip" then
        createToggleButton("Accès VIP", "vipAccess", container, true)
        createToggleButton("Téléportation VIP", "vipTeleport", container, true)
    end
end

-- Affiche la première catégorie par défaut
if #categoryButtons > 0 then
    displayCategoryContent(categories[1].name)
end

-- ===== OUVERTURE/FERMETURE =====
LogoButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)
CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)
MainFrame.Active = true
MainFrame.Draggable = true

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

local function waitForCharacter()
    repeat task.wait() until player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    return player.Character
end

local function getPlayerLevel()
    pcall(function()
        local level = player.Data.Level.Value
        return tonumber(level) or 0
    end)
    return 0
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

local function getNearestMob()
    local character = waitForCharacter()
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
    local rootPart = character.HumanoidRootPart
    local nearest, nearestDist = nil, math.huge
    if workspace:FindFirstChild("Enemies") then
        for _, mob in pairs(workspace.Enemies:GetChildren()) do
            if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") then
                local dist = (rootPart.Position - mob.HumanoidRootPart.Position).Magnitude
                if dist < nearestDist and dist < 1000 then
                    nearest, nearestDist = mob, dist
                end
            end
        end
    end
    return nearest, nearestDist
end

local function attackTarget(target)
    pcall(function()
        local character = waitForCharacter()
        if not character or not target then return end
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local targetRoot = target:FindFirstChild("HumanoidRootPart")
        if not rootPart or not targetRoot then return end

        -- Téléportation si trop loin (pour farm au sol)
        local distance = (rootPart.Position - targetRoot.Position).Magnitude
        if distance > 10 then
            rootPart.CFrame = CFrame.new(targetRoot.Position + Vector3.new(0, 5, 0))
            task.wait(0.1)
        end

        -- Attaque ultra-rapide
        local direction = (targetRoot.Position - rootPart.Position).Unit
        rootPart.CFrame = CFrame.new(targetRoot.Position + (direction * -5)) * CFrame.Angles(0, math.pi, 0)
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(0.05)  -- Délai ultra-court pour vitesse inattendue
        game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end

-- ===== NOUVELLES FONCTIONS (Auto Farm Intelligent + Invincibilité + VIP) =====
-- Détecte la quête actuelle du joueur
local function getCurrentQuest()
    pcall(function()
        if player:FindFirstChild("PlayerData") and player.PlayerData:FindFirstChild("CurrentQuest") then
            return player.PlayerData.CurrentQuest.Value
        end
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("Quest") then
            return player.Data.Quest.Value
        end
    end)
    return nil
end

-- Accepte une quête automatiquement
local function acceptQuest(questName)
    pcall(function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        if ReplicatedStorage:FindFirstChild("Remotes") then
            local remotes = ReplicatedStorage.Remotes
            if remotes:FindFirstChild("CommF_") then
                remotes.CommF_:InvokeServer("StartQuest", questName, true)
                notify("✅ Quête", "Quête acceptée: " .. questName, 2)
            end
        end
    end)
end

-- Trouve la quête optimale selon le niveau
local function getOptimalQuest()
    local level = getPlayerLevel()
    local quests = {
        {name = "Bandit", minLevel = 1, maxLevel = 10},
        {name = "Pirate", minLevel = 11, maxLevel = 50},
        {name = "Marine", minLevel = 51, maxLevel = 100},
        {name = "Sky Bandit", minLevel = 101, maxLevel = 200},
        {name = "Dark Master", minLevel = 201, maxLevel = 300},
        {name = "Diable", minLevel = 301, maxLevel = 500},
        {name = "Fishman", minLevel = 501, maxLevel = 700},
        {name = "Cyborg", minLevel = 701, maxLevel = 1000}
    }

    for _, quest in ipairs(quests) do
        if level >= quest.minLevel and level <= quest.maxLevel then
            return quest.name
        end
    end
    return "Bandit"  -- Par défaut
end

-- Active God Mode (les mobs t'attaquent mais tu ne perds pas de PV)
local function enableGodMode(enable)
    spawn(function()
        while toggles.godMode do
            pcall(function()
                local character = waitForCharacter()
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid.Health = math.huge
                    character.Humanoid.MaxHealth = math.huge
                    -- Bloquer les dégâts des mobs
                    character.Humanoid.HealthChanged:Connect(function()
                        if toggles.godMode then
                            character.Humanoid.Health = math.huge
                        end
                    end)
                end
            end)
            task.wait(0.1)
        end
    end)
end

-- Farm Dark Blade (spawn dans les îles spécifiques)
local function farmDarkBlade()
    spawn(function()
        while toggles.autoDarkBlade do
            pcall(function()
                if workspace:FindFirstChild("Fruits") then
                    for _, fruit in pairs(workspace.Fruits:GetChildren()) do
                        if fruit.Name == "Dark Blade" or fruit.Name:find("Dark Blade") then
                            local character = waitForCharacter()
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                character.HumanoidRootPart.CFrame = fruit.HumanoidRootPart.CFrame
                                task.wait(0.5)
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                                task.wait(0.1)
                                game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                            end
                        end
                    end
                end
                -- Si pas trouvé, téléportation vers les îles connues
                if not workspace:FindFirstChild("Fruits") or #workspace.Fruits:GetChildren() == 0 then
                    local character = waitForCharacter()
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        -- Île de Dark Blade (coordonnées approximatives)
                        character.HumanoidRootPart.CFrame = CFrame.new(-5000, 100, -2000)
                        notify("🔍 Dark Blade", "Recherche en cours...", 2)
                    end
                end
            end)
            task.wait(5)
        end
    end)
end

-- Farm les fruits perms (stockage automatique)
local function farmPermFruits()
    spawn(function()
        while toggles.autoPermFruit do
            pcall(function()
                if workspace:FindFirstChild("Fruits") then
                    for _, fruit in pairs(workspace.Fruits:GetChildren()) do
                        if fruit:FindFirstChild("HumanoidRootPart") then
                            local character = waitForCharacter()
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                character.HumanoidRootPart.CFrame = fruit.HumanoidRootPart.CFrame
                                task.wait(0.5)
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                                task.wait(0.1)
                                game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                                notify("🍎 Fruit Perm", "Fruit obtenu: " .. fruit.Name, 1)
                            end
                        end
                    end
                end
            end)
            task.wait(3)
        end
    end)
end

-- Accès VIP (téléportations + fonctionnalités exclusives)
local function enableVIPAccess()
    spawn(function()
        while toggles.vipAccess do
            pcall(function()
                if toggles.vipTeleport then
                    local character = waitForCharacter()
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        -- Téléportation vers les zones VIP
                        local vipLocations = {
                            CFrame.new(-1000, 100, -1000),  -- Île VIP 1
                            CFrame.new(5000, 100, 5000),   -- Île VIP 2
                            CFrame.new(-3000, 100, 3000)   -- Île VIP 3
                        }
                        character.HumanoidRootPart.CFrame = vipLocations[math.random(1, #vipLocations)]
                        notify("👑 VIP", "Téléporté en zone VIP !", 3)
                        toggles.vipTeleport = false  -- Désactive après téléportation
                    end
                end
            end)
            task.wait(10)
        end
    end)
end

-- ===== BOUCLES PRINCIPALES (Toutes optimisées) =====
-- Auto Farm Intelligent (détection de quête + vitesse extrême)
spawn(function()
    while true do
        if toggles.autoFarm then
            pcall(function()
                -- Active God Mode automatiquement
                toggles.godMode = true
                enableGodMode(true)

                -- Vérifie et accepte la quête optimale
                local currentQuest = getCurrentQuest()
                local optimalQuest = getOptimalQuest()
                if not currentQuest or currentQuest == "" then
                    acceptQuest(optimalQuest)
                end

                -- Farm les mobs de la quête
                local mob, distance = getNearestMob()
                if mob then
                    attackTarget(mob)
                else
                    -- Si pas de mobs, téléportation vers les zones de quête
                    local character = waitForCharacter()
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        local questAreas = {
                            Bandit = CFrame.new(1000, 100, 1000),
                            Pirate = CFrame.new(-1000, 100, -1000),
                            Marine = CFrame.new(2000, 100, -2000)
                        }
                        character.HumanoidRootPart.CFrame = questAreas[optimalQuest] or CFrame.new(0, 100, 0)
                    end
                end
            end)
        else
            toggles.godMode = false
        end
        task.wait(0.05)  -- Vitesse ultra-rapide
    end
end)

-- Kill Aura
spawn(function()
    while true do
        if toggles.killAura then
            pcall(function()
                local nearestPlayer = getNearestPlayer()
                if nearestPlayer and nearestPlayer.Character then
                    attackTarget(nearestPlayer.Character)
                end
            end)
        end
        task.wait(0.2)
    end
end)

-- Trigger Bot
spawn(function()
    while true do
        if toggles.triggerBot then
            game:GetService("UserInputService").InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    pcall(function()
                        local nearestPlayer = getNearestPlayer()
                        if nearestPlayer and nearestPlayer.Character then
                            attackTarget(nearestPlayer.Character)
                        end
                    end)
                end
            end)
            break
        end
        task.wait(1)
    end
end)

-- Auto Attack
spawn(function()
    while true do
        if toggles.autoAttack then
            pcall(function()
                local mob = getNearestMob()
                if mob then
                    attackTarget(mob)
                end
            end)
        end
        task.wait(0.3)
    end
end)

-- Auto PvP
spawn(function()
    while true do
        if toggles.autoPvP then
            pcall(function()
                local nearestPlayer = getNearestPlayer()
                if nearestPlayer and nearestPlayer.Character then
                    attackTarget(nearestPlayer.Character)
                end
            end)
        end
        task.wait(0.5)
    end
end)

-- God Mode (Invincibilité)
spawn(function()
    while true do
        if toggles.godMode then
            enableGodMode(true)
        end
        task.wait(1)
    end
end)

-- Auto Dark Blade
spawn(function()
    while true do
        if toggles.autoDarkBlade then
            farmDarkBlade()
        end
        task.wait(1)
    end
end)

-- Auto Perm Fruits
spawn(function()
    while true do
        if toggles.autoPermFruit then
            farmPermFruits()
        end
        task.wait(1)
    end
end)

-- VIP Access
spawn(function()
    while true do
        if toggles.vipAccess then
            enableVIPAccess()
        end
        task.wait(1)
    end
end)

-- ESP Players
spawn(function()
    while true do
        if toggles.espPlayers then
            pcall(function()
                for _, plr in pairs(game.Players:GetPlayers()) do
                    if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        local esp = plr.Character:FindFirstChild("ESP_Player")
                        if not esp then
                            esp = Instance.new("BillboardGui")
                            esp.Name = "ESP_Player"
                            esp.Size = UDim2.new(0, 200, 0, 50)
                            esp.StudsOffset = Vector3.new(0, 2, 0)
                            esp.Adornee = plr.Character.HumanoidRootPart
                            esp.Parent = plr.Character.HumanoidRootPart
                            local text = Instance.new("TextLabel")
                            text.Size = UDim2.new(1, 0, 1, 0)
                            text.Text = plr.Name
                            text.TextScaled = true
                            text.TextColor3 = COLORS.TEXT
                            text.BackgroundTransparency = 1
                            text.Font = Enum.Font.GothamBold
                            text.Parent = esp
                        end
                    end
                end
            end)
        else
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr.Character then
                    local esp = plr.Character:FindFirstChild("ESP_Player")
                    if esp then esp:Destroy() end
                end
            end
        end
        task.wait(0.5)
    end
end)

-- No Clip
spawn(function()
    while true do
        if toggles.noClip then
            pcall(function()
                local character = waitForCharacter()
                if character then
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            local character = player.Character
            if character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
        task.wait(0.1)
    end
end)

-- Fly
spawn(function()
    while true do
        if toggles.fly then
            pcall(function()
                local character = waitForCharacter()
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local bodyVelocity = character:FindFirstChild("FlightVelocity")
                    if not bodyVelocity then
                        bodyVelocity = Instance.new("BodyVelocity")
                        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                        bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
                        bodyVelocity.Name = "FlightVelocity"
                        bodyVelocity.Parent = character.HumanoidRootPart
                    end
                    local bodyGyro = character:FindFirstChild("FlightGyro")
                    if not bodyGyro then
                        bodyGyro = Instance.new("BodyGyro")
                        bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                        bodyGyro.CFrame = character.HumanoidRootPart.CFrame
                        bodyGyro.Name = "FlightGyro"
                        bodyGyro.Parent = character.HumanoidRootPart
                    end
                    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                end
            end)
        else
            local character = player.Character
            if character then
                local velocity = character:FindFirstChild("FlightVelocity")
                local gyro = character:FindFirstChild("FlightGyro")
                if velocity then velocity:Destroy() end
                if gyro then gyro:Destroy() end
            end
        end
        task.wait()
    end
end)

-- FPS Boost
spawn(function()
    while true do
        if toggles.fpsBoost then
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Material = Enum.Material.Plastic
                        v.CastShadow = false
                    end
                end
                game:GetService("Lighting").Technology = Enum.Technology.Future
                game:GetService("Lighting").GraphicsMode = Enum.GraphicsMode.Performance
            end)
        else
            pcall(function()
                game:GetService("Lighting").Technology = Enum.Technology.Legacy
            end)
        end
        task.wait(5)
    end
end)
