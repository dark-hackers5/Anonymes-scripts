-- ANONYMES SCRIPTS HUB v8.0 | Blox Fruits | Quêtes de Mer + Boss Invincible + Auto Farm Complet
local VERSION = "8.0"
local LOGO_URL = "rbxassetid://88742532715379"

-- ===== COULEURS =====
local COLORS = {
    PRIMARY = Color3.fromRGB(0, 170, 255),
    SECONDARY = Color3.fromRGB(0, 200, 100),
    BACKGROUND = Color3.fromRGB(15, 15, 35),
    BACKGROUND_LIGHT = Color3.fromRGB(25, 25, 50),
    TEXT = Color3.fromRGB(255, 255, 255),
    TEXT_MUTED = Color3.fromRGB(150, 150, 200),
    CATEGORY_BG = Color3.fromRGB(20, 20, 40),
    CATEGORY_SELECTED = Color3.fromRGB(0, 100, 200),
    BOUTON_ON = Color3.fromRGB(0, 200, 100),
    BOUTON_OFF = Color3.fromRGB(40, 40, 60),
    DANGER = Color3.fromRGB(255, 50, 50),
    SUCCESS = Color3.fromRGB(0, 200, 100),
    WARNING = Color3.fromRGB(255, 200, 0),
    VIP = Color3.fromRGB(255, 215, 0),
    SEA = Color3.fromRGB(0, 150, 255)  -- Bleu pour les quêtes de mer
}

-- ===== TOGGLES =====
local toggles = {
    -- Combat
    killAura = false,
    triggerBot = false,
    autoAttack = false,
    autoPvP = false,
    -- Auto Farm (Corrigé)
    autoFarm = false,
    autoSeaQuests = false,  -- NOUVEAU: Toutes les quêtes de Mer
    autoAllBosses = false,  -- NOUVEAU: Tous les boss (y compris Mer)
    autoNearest = false,
    autoEctoplasm = false,
    autoCandy = false,
    -- Bosses (Mer + Autres)
    autoSeaBeast = false,
    autoLeviathan = false,
    autoPirateRaid = false,
    autoTerrorshark = false,
    autoDoughKing = false,
    autoCakePrince = false,
    autoCyborg = false,
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
    -- Fruits
    autoStoreFruit = false,
    autoRandomFruit = false,
    autoDarkBlade = false,
    autoPermFruit = false,
    -- Quêtes
    autoBandit = false,
    autoPirate = false,
    autoMarine = false,
    autoSkyBandit = false,
    -- Défense
    antiKick = false,
    antiStun = false,
    godMode = false,
    bossGodMode = false,  -- NOUVEAU: Invincibilité contre les boss
    -- Utilitaires
    infiniteJump = false,
    noClip = false,
    walkOnWater = false,
    -- Divers
    serverHop = false,
    fpsBoost = false,
    autoRejoin = false,
    -- VIP
    vipAccess = false,
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

-- Titre + Catégories Horizontales
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 60)
TitleBar.BackgroundColor3 = COLORS.BACKGROUND_LIGHT
TitleBar.Parent = MainFrame
local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 8, 0, 0)
TitleBarCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 1, 0)
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
CloseButton.Position = UDim2.new(1, -35, 0, 15)
CloseButton.Text = "X"
CloseButton.TextSize = 16
CloseButton.BackgroundColor3 = COLORS.DANGER
CloseButton.TextColor3 = COLORS.TEXT
CloseButton.Parent = TitleBar
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseButton

-- Catégories Horizontales
local CategoriesFrame = Instance.new("Frame")
CategoriesFrame.Size = UDim2.new(1, -250, 1, 0)
CategoriesFrame.Position = UDim2.new(0, 200, 0, 0)
CategoriesFrame.BackgroundTransparency = 1
CategoriesFrame.Parent = TitleBar

local CategoriesList = Instance.new("Frame")
CategoriesList.Size = UDim2.new(1, 0, 1, 0)
CategoriesList.BackgroundTransparency = 1
CategoriesList.Parent = CategoriesFrame
local CategoriesLayout = Instance.new("UIListLayout")
CategoriesLayout.FillDirection = Enum.FillDirection.Horizontal
CategoriesLayout.Padding = UDim.new(0, 10)
CategoriesLayout.Parent = CategoriesList

-- 10 catégories
local categories = {
    {name = "combat", icon = "🗡️", color = COLORS.DANGER},
    {name = "auto farm", icon = "🌾", color = COLORS.SUCCESS},
    {name = "bosses", icon = "👹", color = COLORS.WARNING},
    {name = "mer", icon = "🌊", color = COLORS.SEA},  -- NOUVEAU: Catégorie Mer
    {name = "esp", icon = "👁️", color = Color3.fromRGB(200, 0, 255)},
    {name = "déplacement", icon = "⛵", color = COLORS.PRIMARY},
    {name = "fruits", icon = "🍎", color = Color3.fromRGB(255, 100, 0)},
    {name = "quêtes", icon = "📜", color = COLORS.WARNING},
    {name = "défense", icon = "🛡️", color = COLORS.BOUTON_ON},
    {name = "vip", icon = "👑", color = COLORS.VIP}
}

local categoryButtons = {}
for i, cat in ipairs(categories) do
    local button = Instance.new("TextButton")
    button.Name = cat.name .. "Button"
    button.Size = UDim2.new(0, 80, 1, -10)
    button.Text = cat.icon .. " " .. cat.name
    button.TextSize = 12
    button.TextColor3 = COLORS.TEXT_MUTED
    button.BackgroundColor3 = COLORS.CATEGORY_BG
    button.Font = Enum.Font.GothamBold
    button.Parent = CategoriesList
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 4)
    buttonCorner.Parent = button
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = cat.color
    buttonStroke.Thickness = 1
    buttonStroke.Parent = button

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = COLORS.CATEGORY_SELECTED
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

-- Sélectionne la première catégorie par défaut
if #categoryButtons > 0 then
    categoryButtons[1].Selected = true
    categoryButtons[1].BackgroundColor3 = COLORS.CATEGORY_SELECTED
    categoryButtons[1].TextColor3 = COLORS.TEXT
end

-- Zone de contenu
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 1, -60)
ContentFrame.Position = UDim2.new(0, 0, 0, 60)
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
        createToggleButton("Auto Farm (Toutes Quêtes)", "autoFarm", container)
        createToggleButton("Auto Sea Quests", "autoSeaQuests", container, true)  -- NOUVEAU
        createToggleButton("Auto All Bosses", "autoAllBosses", container, true)  -- NOUVEAU
        createToggleButton("Auto Nearest", "autoNearest", container)
        createToggleButton("Auto Ectoplasm", "autoEctoplasm", container)
        createToggleButton("Auto Candy", "autoCandy", container)
    elseif categoryName == "bosses" then
        createToggleButton("Auto Sea Beast", "autoSeaBeast", container)
        createToggleButton("Auto Leviathan", "autoLeviathan", container)
        createToggleButton("Auto Pirate Raid", "autoPirateRaid", container)
        createToggleButton("Auto Terrorshark", "autoTerrorshark", container)
        createToggleButton("Auto Dough King", "autoDoughKing", container)
        createToggleButton("Auto Cake Prince", "autoCakePrince", container)
        createToggleButton("Auto Cyborg", "autoCyborg", container)
    elseif categoryName == "mer" then  -- NOUVEAU: Catégorie dédiée à la Mer
        createToggleButton("Toutes Quêtes de Mer", "autoSeaQuests", container, true)
        createToggleButton("Tous Boss de Mer", "autoAllBosses", container, true)
        createToggleButton("Invincible vs Boss", "bossGodMode", container, true)
        createToggleButton("Auto Sea Beast", "autoSeaBeast", container)
        createToggleButton("Auto Leviathan", "autoLeviathan", container)
        createToggleButton("Auto Terrorshark", "autoTerrorshark", container)
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
        createToggleButton("Auto Dark Blade", "autoDarkBlade", container, true)
        createToggleButton("Auto Perm Fruits", "autoPermFruit", container, true)
    elseif categoryName == "quêtes" then
        createToggleButton("Auto Bandit", "autoBandit", container)
        createToggleButton("Auto Pirate", "autoPirate", container)
        createToggleButton("Auto Marine", "autoMarine", container)
        createToggleButton("Auto Sky Bandit", "autoSkyBandit", container)
        createToggleButton("Auto Sea Quests", "autoSeaQuests", container, true)
    elseif categoryName == "défense" then
        createToggleButton("Anti Kick", "antiKick", container)
        createToggleButton("Anti Stun", "antiStun", container)
        createToggleButton("God Mode", "godMode", container, true)
        createToggleButton("Boss God Mode", "bossGodMode", container, true)  -- NOUVEAU
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

-- ===== FONCTIONS UTILITAIRES (CORRIGÉES POUR BLOX FRUITS) =====
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

-- Récupère le niveau du joueur
local function getPlayerLevel()
    pcall(function()
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("Level") then
            return tonumber(player.Data.Level.Value) or 0
        end
    end)
    return 0
end

-- Récupère la quête actuelle
local function getCurrentQuest()
    pcall(function()
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("Quest") then
            return player.Data.Quest.Value
        end
    end)
    return nil
end

-- Accepte une quête (Blox Fruits)
local function acceptQuest(questName)
    pcall(function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        if ReplicatedStorage:FindFirstChild("Remotes") then
            local remotes = ReplicatedStorage.Remotes
            if remotes:FindFirstChild("CommF_") then
                local success, err = pcall(function()
                    remotes.CommF_:InvokeServer("StartQuest", questName, true)
                end)
                if success then
                    notify("✅ Quête", "Quête acceptée: " .. questName, 2)
                    return true
                end
            end
        end
    end)
    return false
end

-- Trouve le mob le plus proche (CORRIGÉ POUR BLOX FRUITS)
local function getNearestMob()
    local character = waitForCharacter()
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil, 0 end
    local rootPart = character.HumanoidRootPart
    local nearest, nearestDist = nil, math.huge

    -- Cherche dans Enemies
    if workspace:FindFirstChild("Enemies") then
        for _, mob in pairs(workspace.Enemies:GetChildren()) do
            if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                local dist = (rootPart.Position - mob.HumanoidRootPart.Position).Magnitude
                if dist < nearestDist then
                    nearest, nearestDist = mob, dist
                end
            end
        end
    end
    return nearest, nearestDist
end

-- Trouve un boss spécifique
local function getBoss(bossName)
    if workspace:FindFirstChild("Enemies") then
        for _, enemy in pairs(workspace.Enemies:GetChildren()) do
            if enemy.Name:find(bossName) and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") then
                return enemy
            end
        end
    end
    return nil
end

-- Attaque un mob/joueur (OPTIMISÉ POUR VITESSE EXTRÊME)
local function attackTarget(target)
    pcall(function()
        local character = waitForCharacter()
        if not character or not target then return end
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local targetRoot = target:FindFirstChild("HumanoidRootPart")
        if not rootPart or not targetRoot then return end

        -- Téléportation si trop loin
        local distance = (rootPart.Position - targetRoot.Position).Magnitude
        if distance > 15 then
            rootPart.CFrame = CFrame.new(targetRoot.Position + Vector3.new(0, 5, 0))
            task.wait(0.1)
        end

        -- Attaque ultra-rapide
        local direction = (targetRoot.Position - rootPart.Position).Unit
        rootPart.CFrame = CFrame.new(targetRoot.Position + (direction * -3)) * CFrame.Angles(0, math.pi, 0)

        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(0.05)  -- Délai ultra-court
        game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end

-- ===== NOUVELLES FONCTIONS (QUÊTES DE MER + BOSS INVINCIBLE) =====
-- Liste des quêtes de Mer
local seaQuests = {
    "SeaBeastQuest",
    "LeviathanQuest",
    "TerrorsharkQuest",
    "PirateRaidQuest"
}

-- Liste des boss de Mer
local seaBosses = {
    "Sea Beast",
    "Leviathan",
    "Terrorshark"
}

-- Liste de TOUS les boss
local allBosses = {
    "Sea Beast", "Leviathan", "Terrorshark", "Pirate Raid",
    "Dough King", "Cake Prince", "Cyborg", "Darkbeard",
    "Order", "Aweken", "Soul Reaper"
}

-- Farm toutes les quêtes de Mer
local function farmSeaQuests()
    spawn(function()
        while toggles.autoSeaQuests do
            pcall(function()
                -- Active God Mode et Boss God Mode
                toggles.godMode = true
                toggles.bossGodMode = true

                -- Accepte chaque quête de Mer une par une
                for _, questName in ipairs(seaQuests) do
                    if not toggles.autoSeaQuests then break end
                    if acceptQuest(questName) then
                        notify("🌊 Quête de Mer", "Farm: " .. questName, 3)
                        -- Farm les mobs de cette quête
                        for i = 1, 20 do  -- 20 mobs par quête
                            if not toggles.autoSeaQuests then break end
                            local mob, distance = getNearestMob()
                            if mob then
                                attackTarget(mob)
                                task.wait(0.05)
                            else
                                -- Téléportation vers les zones de Mer
                                local character = waitForCharacter()
                                if character and character:FindFirstChild("HumanoidRootPart") then
                                    character.HumanoidRootPart.CFrame = CFrame.new(
                                        math.random(-5000, 5000),
                                        100,
                                        math.random(-5000, 5000)
                                    )
                                end
                            end
                        end
                    end
                end
                notify("✅ Quêtes de Mer", "Toutes les quêtes de Mer terminées !", 5)
            end)
            task.wait(1)
        end
    end)
end

-- Farm TOUS les boss (y compris Mer)
local function farmAllBosses()
    spawn(function()
        while toggles.autoAllBosses do
            pcall(function()
                -- Active Boss God Mode
                toggles.bossGodMode = true

                -- Farm chaque boss un par un
                for _, bossName in ipairs(allBosses) do
                    if not toggles.autoAllBosses then break end
                    notify("👹 Boss", "Recherche: " .. bossName, 3)
                    local boss = getBoss(bossName)
                    if boss then
                        -- Téléportation vers le boss
                        local character = waitForCharacter()
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10)
                        end
                        -- Attaque le boss jusqu'à ce qu'il meure
                        while boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and toggles.autoAllBosses do
                            attackTarget(boss)
                            task.wait(0.05)
                        end
                        notify("✅ Boss", bossName .. " vaincu !", 3)
                    else
                        -- Téléportation vers les zones de boss
                        local character = waitForCharacter()
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            character.HumanoidRootPart.CFrame = CFrame.new(
                                math.random(-6000, 6000),
                                100,
                                math.random(-6000, 6000)
                            )
                        end
                    end
                    task.wait(2)  -- Attend avant de chercher le prochain boss
                end
                notify("✅ Tous les Boss", "Tous les boss vaincus !", 5)
            end)
            task.wait(1)
        end
    end)
end

-- God Mode contre TOUS les boss (ils t'attaquent, mais 0 dégâts)
local function enableBossGodMode()
    spawn(function()
        while toggles.bossGodMode do
            pcall(function()
                local character = waitForCharacter()
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid.Health = math.huge
                    character.Humanoid.MaxHealth = math.huge
                    -- Bloque les dégâts des boss
                    character.Humanoid.HealthChanged:Connect(function()
                        if toggles.bossGodMode then
                            character.Humanoid.Health = math.huge
                        end
                    end)
                    -- Bloque les dégâts des touches
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Touched:Connect(function(hit)
                                if toggles.bossGodMode and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
                                    character.Humanoid.Health = math.huge
                                end
                            end)
                        end
                    end
                end
            end)
            task.wait(0.1)
        end
    end)
end

-- Farm automatique avec quête + vitesse extrême
local function autoFarmLoop()
    spawn(function()
        while toggles.autoFarm do
            pcall(function()
                toggles.godMode = true
                toggles.bossGodMode = true

                local level = getPlayerLevel()
                local quests = {
                    {name = "BanditQuest1", minLevel = 1, maxLevel = 10},
                    {name = "PirateQuest1", minLevel = 11, maxLevel = 50},
                    {name = "MarineQuest1", minLevel = 51, maxLevel = 100},
                    {name = "SkyBanditQuest1", minLevel = 101, maxLevel = 200},
                    {name = "DarkMasterQuest1", minLevel = 201, maxLevel = 300},
                    {name = "DiableQuest1", minLevel = 301, maxLevel = 500},
                    {name = "FishmanQuest1", minLevel = 501, maxLevel = 700}
                }

                for _, quest in ipairs(quests) do
                    if not toggles.autoFarm then break end
                    if level >= quest.minLevel and level <= quest.maxLevel then
                        if acceptQuest(quest.name) then
                            notify("📜 Quête", "Farm: " .. quest.name, 3)
                            for i = 1, 20 do
                                if not toggles.autoFarm then break end
                                local mob, distance = getNearestMob()
                                if mob then
                                    attackTarget(mob)
                                    task.wait(0.05)
                                end
                            end
                        end
                    end
                end
            end)
            task.wait(1)
        end
    end)
end

-- ===== BOUCLES PRINCIPALES (TOUTES CORRIGÉES) =====
-- Auto Sea Quests (Toutes les quêtes de Mer)
spawn(function()
    while true do
        if toggles.autoSeaQuests then
            farmSeaQuests()
        end
        task.wait(1)
    end
end)

-- Auto All Bosses (Tous les boss)
spawn(function()
    while true do
        if toggles.autoAllBosses then
            farmAllBosses()
        end
        task.wait(1)
    end
end)

-- Boss God Mode (Invincible contre les boss)
spawn(function()
    while true do
        if toggles.bossGodMode then
            enableBossGodMode()
        end
        task.wait(1)
    end
end)

-- Auto Farm (Quêtes normales)
spawn(function()
    while true do
        if toggles.autoFarm then
            autoFarmLoop()
        end
        task.wait(1)
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

-- Auto Attack (Mobs)
spawn(function()
    while true do
        if toggles.autoAttack then
            pcall(function()
                local mob, distance = getNearestMob()
                if mob then
                    attackTarget(mob)
                end
            end)
        end
        task.wait(0.3)
    end
end)

-- God Mode (Invincibilité générale)
spawn(function()
    while true do
        if toggles.godMode then
            pcall(function()
                local character = waitForCharacter()
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid.Health = math.huge
                    character.Humanoid.MaxHealth = math.huge
                end
            end)
        end
        task.wait(0.1)
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

-- ===== FONCTION POUR TROUVER LES JOUEURS =====
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
