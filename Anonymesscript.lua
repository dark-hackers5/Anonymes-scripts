-- ANONYMES SCRIPTS HUB v13.0 | Blox Fruits | Delta + Game Pass Gratuits + Boutique Auto
local VERSION = "13.0"
local LOGO_URL = "rbxassetid://88742532715379"

-- ===== CHARGEMENT DE DELTA =====
local Delta
local success, err = pcall(function()
    Delta = loadstring(game:HttpGet("https://raw.githubusercontent.com/dark-hackers5/Anonymes-scripts/main/Anonymesscript.lua"))()
end)
if not success then
    Delta = {}
    function Delta.NewTable(t)
        local proxy = {}
        for k, v in pairs(t) do
            proxy[k] = {Value = v}
        end
        return proxy
    end
    function Delta.NewValue(v)
        return {
            Value = v,
            Connect = function(self, f)
                local last = self.Value
                spawn(function()
                    while true do
                        if self.Value ~= last then
                            last = self.Value
                            f(last)
                        end
                        task.wait()
                    end
                end)
            end,
            Toggle = function(self)
                self.Value = not self.Value
            end,
            Set = function(self, val)
                self.Value = val
            end
        }
    end
end

-- ===== TAILLES DE L'INTERFACE =====
local SIZES = {
    small = {window = UDim2.new(0, 500, 0, 350), titleBar = 40, categoryText = 8, buttonHeight = 18, buttonText = 12},
    medium = {window = UDim2.new(0, 600, 0, 420), titleBar = 50, categoryText = 10, buttonHeight = 20, buttonText = 14},
    large = {window = UDim2.new(0, 700, 0, 500), titleBar = 60, categoryText = 12, buttonHeight = 25, buttonText = 16}
}
local currentSize = "medium"

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
    SEA = Color3.fromRGB(0, 150, 255),
    SHOP = Color3.fromRGB(255, 150, 0),
    GAMEPASS = Color3.fromRGB(255, 0, 255)  -- Violet pour les Game Pass
}

-- ===== TOGGLES AVEC DELTA (TOUS LES GAME PASS AJOUTÉS) =====
local toggles = Delta.NewTable({
    -- Combat
    killAura = false,
    triggerBot = false,
    autoAttack = false,
    autoPvP = false,
    -- Auto Farm
    autoFarm = false,
    autoSeaQuests = false,
    autoAllBosses = false,
    autoLevel = false,
    autoMastery = false,
    autoNearest = false,
    autoEctoplasm = false,
    autoCandy = false,
    -- Bosses
    autoSeaBeast = false,
    autoLeviathan = false,
    autoPirateRaid = false,
    autoTerrorshark = false,
    autoDoughKing = false,
    autoCakePrince = false,
    autoCyborg = false,
    -- Boutique
    buyAllSwords = false,
    buyAllGuns = false,
    buyCutlass = false,
    buyKatana = false,
    buyDualKatana = false,
    buyLongsword = false,
    buyFlintlock = false,
    buyMusket = false,
    buyBlunderbuss = false,
    buyCannon = false,
    -- Game Pass (NOUVEAU)
    buyAllGamepasses = false,
    buy2xExp = false,
    buyAutoBuso = false,
    buySuperhumanV2 = false,
    buySharkmanV2 = false,
    buyDeathStepV2 = false,
    buyElectricClawV2 = false,
    buyDragonClawV2 = false,
    buyGodsChalice = false,
    buyTushita = false,
    buyYama = false,
    buyBuddhaV2 = false,
    buyRumbleV2 = false,
    buyPainV2 = false,
    buyGravityV2 = false,
    buyLightV2 = false,
    buyLoveV2 = false,
    buyPhoenixV2 = false,
    buyStringV2 = false,
    buyPawV2 = false,
    buyIceV2 = false,
    buyMagmaV2 = false,
    buyQuakeV2 = false,
    buyLeopardV2 = false,
    buyDragonV2 = false,
    -- Fruits
    autoStoreFruit = false,
    autoRandomFruit = false,
    autoDarkBlade = false,
    autoPermFruit = false,
    -- Trade
    autoTrade = false,
    -- Quêtes
    autoBandit = false,
    autoPirate = false,
    autoMarine = false,
    autoSkyBandit = false,
    -- Défense
    antiKick = false,
    antiStun = false,
    godMode = false,
    bossGodMode = false,
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
    vipTeleport = false,
    -- Paramètres
    sizeSmall = false,
    sizeMedium = true,
    sizeLarge = false
})

-- ===== INTERFACE PRINCIPALE =====
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnonymesHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Fenêtre principale
local MainFrame = Instance.new("Frame")
MainFrame.Size = SIZES.medium.window
MainFrame.Position = UDim2.new(0.5, -SIZES.medium.window.X.Offset/2, 0.5, -SIZES.medium.window.Y.Offset/2)
MainFrame.BackgroundColor3 = COLORS.BACKGROUND
MainFrame.Visible = false
MainFrame.ZIndex = 10
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
TitleBar.Size = UDim2.new(1, 0, 0, SIZES.medium.titleBar)
TitleBar.BackgroundColor3 = COLORS.BACKGROUND_LIGHT
TitleBar.Parent = MainFrame
local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 8, 0, 0)
TitleBarCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 150, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "anonymes scripts hub v"..VERSION
Title.TextSize = 14
Title.TextColor3 = COLORS.TEXT
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar
local TitlePadding = Instance.new("UIPadding")
TitlePadding.PaddingLeft = UDim.new(0, 10)
TitlePadding.Parent = Title

-- Bouton Fermer
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, (SIZES.medium.titleBar - 30)/2)
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
CategoriesFrame.Size = UDim2.new(1, -160, 1, 0)
CategoriesFrame.Position = UDim2.new(0, 160, 0, 0)
CategoriesFrame.BackgroundTransparency = 1
CategoriesFrame.Parent = TitleBar

local CategoriesList = Instance.new("Frame")
CategoriesList.Size = UDim2.new(1, 0, 1, 0)
CategoriesList.BackgroundTransparency = 1
CategoriesList.AutomaticSize = Enum.AutomaticSize.X
CategoriesList.Parent = CategoriesFrame
local CategoriesLayout = Instance.new("UIListLayout")
CategoriesLayout.FillDirection = Enum.FillDirection.Horizontal
CategoriesLayout.Padding = UDim.new(0, 5)
CategoriesLayout.Parent = CategoriesList

-- 13 catégories (incluant "Game Pass" et "paramètres")
local categories = {
    {name = "combat", icon = "🗡️", color = COLORS.DANGER},
    {name = "auto farm", icon = "🌾", color = COLORS.SUCCESS},
    {name = "bosses", icon = "👹", color = COLORS.WARNING},
    {name = "mer", icon = "🌊", color = COLORS.SEA},
    {name = "boutique", icon = "🛒", color = COLORS.SHOP},
    {name = "game pass", icon = "🎮", color = COLORS.GAMEPASS},  -- NOUVEAU: Game Pass
    {name = "fruits", icon = "🍎", color = Color3.fromRGB(255, 100, 0)},
    {name = "trade", icon = "💱", color = COLORS.VIP},
    {name = "maîtrises", icon = "🏆", color = COLORS.WARNING},
    {name = "esp", icon = "👁️", color = Color3.fromRGB(200, 0, 255)},
    {name = "déplacement", icon = "⛵", color = COLORS.PRIMARY},
    {name = "défense", icon = "🛡️", color = COLORS.BOUTON_ON},
    {name = "paramètres", icon = "⚙️", color = COLORS.TEXT_MUTED}
}

local categoryButtons = {}
for i, cat in ipairs(categories) do
    local button = Instance.new("TextButton")
    button.Name = cat.name .. "Button"
    button.Size = UDim2.new(0, 0, 1, -5)
    button.AutomaticSize = Enum.AutomaticSize.X
    button.Text = cat.icon .. " " .. cat.name
    button.TextSize = SIZES.medium.categoryText
    button.TextColor3 = COLORS.TEXT_MUTED
    button.BackgroundColor3 = COLORS.CATEGORY_BG
    button.Font = Enum.Font.GothamBold
    button.ZIndex = 10
    button.Parent = CategoriesList
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 4)
    buttonCorner.Parent = button
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = cat.color
    buttonStroke.Thickness = 1
    buttonStroke.Parent = button
    local buttonPadding = Instance.new("UIPadding")
    buttonPadding.PaddingLeft = UDim.new(0, 6)
    buttonPadding.PaddingRight = UDim.new(0, 6)
    buttonPadding.Parent = button

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
    displayCategoryContent(categories[1].name)
end

-- Zone de contenu
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 1, -SIZES.medium.titleBar)
ContentFrame.Position = UDim2.new(0, 0, 0, SIZES.medium.titleBar)
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

-- Logo cliquable
local LogoButton = Instance.new("ImageButton")
LogoButton.Size = UDim2.new(0, 40, 0, 40)
LogoButton.Position = UDim2.new(0, 10, 0, 10)
LogoButton.BackgroundColor3 = COLORS.BACKGROUND_LIGHT
LogoButton.BackgroundTransparency = 0.5
LogoButton.Image = LOGO_URL
LogoButton.ZIndex = 20
LogoButton.Parent = screenGui
local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = LogoButton
local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = COLORS.PRIMARY
LogoStroke.Thickness = 2
LogoStroke.Parent = LogoButton

-- ===== FONCTION POUR CHANGER LA TAILLE =====
local function applySize(sizeName)
    currentSize = sizeName
    local size = SIZES[sizeName]

    MainFrame.Size = size.window
    MainFrame.Position = UDim2.new(0.5, -size.window.X.Offset/2, 0.5, -size.window.Y.Offset/2)
    TitleBar.Size = UDim2.new(1, 0, 0, size.titleBar)
    CloseButton.Position = UDim2.new(1, -35, 0, (size.titleBar - 30)/2)
    ContentFrame.Size = UDim2.new(1, 0, 1, -size.titleBar)
    ContentFrame.Position = UDim2.new(0, 0, 0, size.titleBar)

    for _, btn in pairs(categoryButtons) do
        btn.TextSize = size.categoryText
    end

    for _, child in pairs(ContentScroll:GetChildren()) do
        if child:IsA("Frame") then
            for _, btn in pairs(child:GetDescendants()) do
                if btn:IsA("TextButton") then
                    btn.TextSize = size.buttonText
                    btn.Size = UDim2.new(1, -20, 0, size.buttonHeight)
                end
            end
        end
    end

    for _, btn in pairs(categoryButtons) do
        if btn.Selected then
            displayCategoryContent(btn.Name:gsub("Button", ""))
            break
        end
    end
end

-- ===== FONCTION POUR CRÉER DES BOUTONS =====
local function createToggleButton(name, toggleKey, parent, isVIP)
    local button = Instance.new("TextButton")
    button.Name = toggleKey .. "Button"
    button.Size = UDim2.new(1, -20, 0, SIZES[currentSize].buttonHeight)
    button.Text = name .. ": OFF"
    button.TextSize = SIZES[currentSize].buttonText
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
        button.Text = name .. ": " .. (toggles[toggleKey].Value and "ON" or "OFF")
        button.BackgroundColor3 = toggles[toggleKey].Value and COLORS.BOUTON_ON or COLORS.BOUTON_OFF
    end

    toggles[toggleKey]:Connect(function(newValue)
        updateButton()
    end)

    button.MouseButton1Click:Connect(function()
        toggles[toggleKey]:Toggle()
    end)
    updateButton()
    return button
end

-- ===== AFFICHAGE DES CATÉGORIES =====
local function displayCategoryContent(categoryName)
    for _, child in pairs(ContentScroll:GetChildren()) do
        child:Destroy()
    end

    local mainContainer = Instance.new("Frame")
    mainContainer.Size = UDim2.new(1, 0, 0, 0)
    mainContainer.BackgroundTransparency = 1
    mainContainer.Parent = ContentScroll

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 5)
    layout.Parent = mainContainer

    local categoryTitle = Instance.new("TextLabel")
    categoryTitle.Size = UDim2.new(1, 0, 0, SIZES[currentSize].titleBar - 10)
    categoryTitle.BackgroundTransparency = 1
    categoryTitle.Text = categoryName:upper()
    categoryTitle.TextSize = SIZES[currentSize].buttonText + 2
    categoryTitle.TextColor3 = COLORS.PRIMARY
    categoryTitle.Font = Enum.Font.GothamBold
    categoryTitle.TextXAlignment = Enum.TextXAlignment.Left
    categoryTitle.Parent = mainContainer
    local titlePadding = Instance.new("UIPadding")
    titlePadding.PaddingLeft = UDim.new(0, 10)
    titlePadding.Parent = categoryTitle

    local buttonsContainer = Instance.new("Frame")
    buttonsContainer.Size = UDim2.new(1, 0, 0, 0)
    buttonsContainer.BackgroundTransparency = 1
    buttonsContainer.Parent = mainContainer
    local buttonsLayout = Instance.new("UIListLayout")
    buttonsLayout.Padding = UDim.new(0, 5)
    buttonsLayout.Parent = buttonsContainer

    if categoryName == "combat" then
        createToggleButton("Kill Aura", "killAura", buttonsContainer)
        createToggleButton("Trigger Bot", "triggerBot", buttonsContainer)
        createToggleButton("Auto Attack", "autoAttack", buttonsContainer)
        createToggleButton("Auto PvP", "autoPvP", buttonsContainer)
    elseif categoryName == "auto farm" then
        createToggleButton("Auto Farm (Niveau)", "autoLevel", buttonsContainer, true)
        createToggleButton("Auto Farm (Quêtes)", "autoFarm", buttonsContainer, true)
        createToggleButton("Auto Sea Quests", "autoSeaQuests", buttonsContainer, true)
        createToggleButton("Auto All Bosses", "autoAllBosses", buttonsContainer, true)
    elseif categoryName == "bosses" then
        createToggleButton("Auto Sea Beast", "autoSeaBeast", buttonsContainer)
        createToggleButton("Auto Leviathan", "autoLeviathan", buttonsContainer)
        createToggleButton("Auto Pirate Raid", "autoPirateRaid", buttonsContainer)
        createToggleButton("Auto Terrorshark", "autoTerrorshark", buttonsContainer)
    elseif categoryName == "mer" then
        createToggleButton("Toutes Quêtes de Mer", "autoSeaQuests", buttonsContainer, true)
        createToggleButton("Tous Boss de Mer", "autoAllBosses", buttonsContainer, true)
        createToggleButton("Invincible vs Boss", "bossGodMode", buttonsContainer, true)
    elseif categoryName == "boutique" then
        createToggleButton("Acheter TOUTES Épées", "buyAllSwords", buttonsContainer, true)
        createToggleButton("Acheter TOUS Guns", "buyAllGuns", buttonsContainer, true)
        createToggleButton("Cutlass", "buyCutlass", buttonsContainer)
        createToggleButton("Katana", "buyKatana", buttonsContainer)
        createToggleButton("Dual Katana", "buyDualKatana", buttonsContainer)
        createToggleButton("Flintlock", "buyFlintlock", buttonsContainer)
        createToggleButton("Musket", "buyMusket", buttonsContainer)
    elseif categoryName == "game pass" then  -- NOUVEAU: Game Pass
        createToggleButton("TOUS Game Pass", "buyAllGamepasses", buttonsContainer, true)
        createToggleButton("2x EXP", "buy2xExp", buttonsContainer, true)
        createToggleButton("Auto Buso", "buyAutoBuso", buttonsContainer, true)
        createToggleButton("Superhuman V2", "buySuperhumanV2", buttonsContainer, true)
        createToggleButton("Sharkman Karate V2", "buySharkmanV2", buttonsContainer, true)
        createToggleButton("Death Step V2", "buyDeathStepV2", buttonsContainer, true)
        createToggleButton("Electric Claw V2", "buyElectricClawV2", buttonsContainer, true)
        createToggleButton("Dragon Claw V2", "buyDragonClawV2", buttonsContainer, true)
        createToggleButton("God's Chalice", "buyGodsChalice", buttonsContainer, true)
        createToggleButton("Tushita", "buyTushita", buttonsContainer, true)
        createToggleButton("Yama", "buyYama", buttonsContainer, true)
    elseif categoryName == "fruits" then
        createToggleButton("Auto Store Fruit", "autoStoreFruit", buttonsContainer)
        createToggleButton("Auto Dark Blade (GRATUIT)", "autoDarkBlade", buttonsContainer, true)
        createToggleButton("Tous Fruits Perms (GRATUIT)", "autoPermFruit", buttonsContainer, true)
    elseif categoryName == "trade" then
        createToggleButton("Auto Trade", "autoTrade", buttonsContainer, true)
    elseif categoryName == "maîtrises" then
        createToggleButton("Auto Maîtrises (Toutes)", "autoMastery", buttonsContainer, true)
    elseif categoryName == "esp" then
        createToggleButton("ESP Players", "espPlayers", buttonsContainer)
        createToggleButton("ESP Boss", "espBoss", buttonsContainer)
    elseif categoryName == "déplacement" then
        createToggleButton("Auto Boat", "autoBoat", buttonsContainer)
        createToggleButton("Boat Speed", "boatSpeed", buttonsContainer)
        createToggleButton("Fly", "fly", buttonsContainer)
    elseif categoryName == "défense" then
        createToggleButton("Anti Kick", "antiKick", buttonsContainer)
        createToggleButton("Anti Stun", "antiStun", buttonsContainer)
        createToggleButton("God Mode", "godMode", buttonsContainer, true)
        createToggleButton("Boss God Mode", "bossGodMode", buttonsContainer, true)
    elseif categoryName == "paramètres" then
        createToggleButton("Petit", "sizeSmall", buttonsContainer)
        createToggleButton("Moyen", "sizeMedium", buttonsContainer)
        createToggleButton("Grand", "sizeLarge", buttonsContainer)
    end
end

-- ===== OUVERTURE/FERMETURE =====
LogoButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    if MainFrame.Visible then
        for _, btn in pairs(categoryButtons) do
            if btn.Selected then
                displayCategoryContent(btn.Name:gsub("Button", ""))
                break
            end
        end
    end
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
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("Level") then
            return tonumber(player.Data.Level.Value) or 0
        end
    end)
    return 0
end

local function getPlayerFruit()
    pcall(function()
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("DevilFruit") then
            return player.Data.DevilFruit.Value
        end
    end)
    return "None"
end

-- Vérifie si le joueur a déjà un Game Pass
local function hasGamepass(gamepassName)
    pcall(function()
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("Gamepasses") then
            for _, gp in pairs(player.Data.Gamepasses:GetChildren()) do
                if gp.Name == gamepassName or (gp:IsA("StringValue") and gp.Value == gamepassName) then
                    return true
                end
            end
        end
    end)
    return false
end

local function getCurrentQuest()
    pcall(function()
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("Quest") then
            return player.Data.Quest.Value
        end
    end)
    return nil
end

local function hasItem(itemName)
    pcall(function()
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("Inventory") then
            for _, item in pairs(player.Data.Inventory:GetChildren()) do
                if item:IsA("StringValue") and item.Value == itemName then
                    return true
                end
            end
        end
    end)
    return false
end

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

local function getNearestMob()
    local character = waitForCharacter()
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil, 0 end
    local rootPart = character.HumanoidRootPart
    local nearest, nearestDist = nil, math.huge

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

local function getBoss(bossName)
    if workspace:FindFirstChild("Enemies") then
        for _, enemy in pairs(workspace.Enemies:GetChildren()) do
            if enemy.Name:find(bossName) and enemy:FindFirstChild("HumanoidRootPart") then
                return enemy
            end
        end
    end
    return nil
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

        local distance = (rootPart.Position - targetRoot.Position).Magnitude
        if distance > 15 then
            rootPart.CFrame = CFrame.new(targetRoot.Position + Vector3.new(0, 5, 0))
            task.wait(0.1)
        end

        local direction = (targetRoot.Position - rootPart.Position).Unit
        rootPart.CFrame = CFrame.new(targetRoot.Position + (direction * -3)) * CFrame.Angles(0, math.pi, 0)

        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(0.05)
        game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end

-- ===== NOUVELLES FONCTIONS (GAME PASS) =====
-- Liste de TOUS les Game Pass de Blox Fruits
local allGamepasses = {
    "2x EXP Gamepass",
    "Auto Buso",
    "Superhuman V2",
    "Sharkman Karate V2",
    "Death Step V2",
    "Electric Claw V2",
    "Dragon Claw V2",
    "God's Chalice",
    "Tushita",
    "Yama",
    "Buddha V2",
    "Rumble V2",
    "Pain V2",
    "Gravity V2",
    "Light V2",
    "Love V2",
    "Phoenix V2",
    "String V2",
    "Paw V2",
    "Ice V2",
    "Magma V2",
    "Quake V2",
    "Leopard V2",
    "Dragon V2"
}

-- Acheter un Game Pass spécifique
local function buyGamepass(gamepassName)
    pcall(function()
        if hasGamepass(gamepassName) then
            notify("⚠️ Game Pass", "Tu as déjà " .. gamepassName, 2)
            return
        end

        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        if ReplicatedStorage:FindFirstChild("Remotes") then
            local remotes = ReplicatedStorage.Remotes
            if remotes:FindFirstChild("CommF_") then
                remotes.CommF_:InvokeServer("BuyGamepass", gamepassName)
                notify("✅ Game Pass", gamepassName .. " obtenu !", 3)
            end
        end
    end)
end

-- Acheter TOUS les Game Pass
local function buyAllGamepasses()
    spawn(function()
        while toggles.buyAllGamepasses.Value do
            pcall(function()
                for _, gamepass in ipairs(allGamepasses) do
                    if not toggles.buyAllGamepasses.Value then break end
                    buyGamepass(gamepass)
                    task.wait(2)  -- Délai pour éviter le ban
                end
                notify("✅ Tous Game Pass", "Tous les Game Pass obtenus !", 5)
                toggles.buyAllGamepasses:Set(false)
            end)
            task.wait(1)
        end
    end)
end

-- ===== FONCTIONS BOUTIQUE =====
local swords = {"Cutlass", "Katana", "Dual Katana", "Longsword", "Iron Mace", "Pipe", "Dual Hooks", "Triple Katana", "Soul Cane"}
local guns = {"Flintlock", "Musket", "Blunderbuss", "Cannon"}

local function buyItem(itemName, itemType)
    pcall(function()
        if hasItem(itemName) then
            notify("⚠️ Achat", "Tu as déjà " .. itemName, 2)
            return
        end

        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        if ReplicatedStorage:FindFirstChild("Remotes") then
            local remotes = ReplicatedStorage.Remotes
            if remotes:FindFirstChild("CommF_") then
                if itemType == "Sword" then
                    remotes.CommF_:InvokeServer("BuySword", itemName)
                elseif itemType == "Gun" then
                    remotes.CommF_:InvokeServer("BuyGun", itemName)
                else
                    remotes.CommF_:InvokeServer("BuyItem", itemName)
                end
                notify("✅ Achat", itemName .. " acheté !", 2)
            end
        end
    end)
end

local function buyAllSwords()
    spawn(function()
        while toggles.buyAllSwords.Value do
            pcall(function()
                for _, sword in ipairs(swords) do
                    if not toggles.buyAllSwords.Value then break end
                    buyItem(sword, "Sword")
                    task.wait(2)
                end
                notify("✅ Épées", "Toutes les épées achetées !", 5)
                toggles.buyAllSwords:Set(false)
            end)
            task.wait(1)
        end
    end)
end

local function buyAllGuns()
    spawn(function()
        while toggles.buyAllGuns.Value do
            pcall(function()
                for _, gun in ipairs(guns) do
                    if not toggles.buyAllGuns.Value then break end
                    buyItem(gun, "Gun")
                    task.wait(2)
                end
                notify("✅ Guns", "Tous les guns achetés !", 5)
                toggles.buyAllGuns:Set(false)
            end)
            task.wait(1)
        end
    end)
end

-- ===== AUTRES FONCTIONS (CONSERVÉES) =====
local permFruits = {
    "Dark Blade", "Dragon Claw", "Superhuman", "Electric Claw", "Sharkman Karate",
    "Death Step", "Soru", "Buddha", "Rumble", "Pain", "Gravity", "Light", "Love",
    "Phoenix", "String", "Paw", "Ice", "Magma", "Quake", "Leopard", "Dragon"
}

local function givePermFruit(fruitName)
    pcall(function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        if ReplicatedStorage:FindFirstChild("Remotes") then
            local remotes = ReplicatedStorage.Remotes
            if remotes:FindFirstChild("CommF_") then
                remotes.CommF_:InvokeServer("LoadFruit", fruitName)
                notify("🍎 Fruit Perm", "Fruit obtenu: " .. fruitName, 3)
            end
        end
    end)
end

local function autoPermFruit()
    spawn(function()
        while toggles.autoPermFruit.Value do
            pcall(function()
                for _, fruitName in ipairs(permFruits) do
                    if not toggles.autoPermFruit.Value then break end
                    givePermFruit(fruitName)
                    task.wait(2)
                end
                notify("✅ Fruits Perms", "Tous les fruits perms obtenus !", 5)
            end)
            task.wait(10)
        end
    end)
end

local function farmDarkBlade()
    spawn(function()
        while toggles.autoDarkBlade.Value do
            pcall(function()
                local currentFruit = getPlayerFruit()
                if currentFruit == "Dark Blade" then
                    notify("✅ Dark Blade", "Tu as déjà Dark Blade !", 3)
                    toggles.autoDarkBlade:Set(false)
                    return
                end

                local character = waitForCharacter()
                if not character then return end

                if workspace:FindFirstChild("Fruits") then
                    for _, fruit in pairs(workspace.Fruits:GetChildren()) do
                        if fruit.Name == "Dark Blade" or fruit.Name:find("Dark Blade") then
                            character.HumanoidRootPart.CFrame = fruit.HumanoidRootPart.CFrame
                            task.wait(0.5)
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                            task.wait(0.1)
                            game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                            notify("🔪 Dark Blade", "Dark Blade obtenu !", 3)
                            return
                        end
                    end
                end

                character.HumanoidRootPart.CFrame = CFrame.new(-5000, 100, -2000)
                notify("🔍 Recherche", "Recherche de Dark Blade...", 2)
            end)
            task.wait(5)
        end
    end)
end

local function autoTrade()
    spawn(function()
        while toggles.autoTrade.Value do
            pcall(function()
                local character = waitForCharacter()
                if not character then return end

                local nearestPlayer = getNearestPlayer()
                if nearestPlayer and nearestPlayer.Character then
                    local ReplicatedStorage = game:GetService("ReplicatedStorage")
                    if ReplicatedStorage:FindFirstChild("Remotes") then
                        local remotes = ReplicatedStorage.Remotes
                        if remotes:FindFirstChild("CommF_") then
                            remotes.CommF_:InvokeServer("RequestTrade", nearestPlayer)
                            notify("💱 Trade", "Demande envoyée à " .. nearestPlayer.Name, 2)
                        end
                    end
                else
                    notify("⚠️ Trade", "Aucun joueur à proximité", 2)
                end
            end)
            task.wait(10)
        end
    end)
end

local function autoMastery()
    spawn(function()
        while toggles.autoMastery.Value do
            pcall(function()
                toggles.godMode:Set(true)
                toggles.bossGodMode:Set(true)

                local character = waitForCharacter()
                if not character then return end

                local tool = character:FindFirstChildOfClass("Tool")
                if not tool then
                    for _, t in pairs(player.Backpack:GetChildren()) do
                        if t:IsA("Tool") then
                            t.Parent = character
                            tool = t
                            break
                        end
                    end
                end

                if tool then
                    local mob = getNearestMob()
                    if mob then
                        attackTarget(mob)
                        notify("🏆 Maîtrise", "Farm: " .. tool.Name, 1)
                    else
                        character.HumanoidRootPart.CFrame = CFrame.new(math.random(-5000, 5000), 100, math.random(-5000, 5000))
                    end
                else
                    notify("⚠️ Maîtrise", "Aucune arme équipée", 2)
                end
            end)
            task.wait(0.1)
        end
    end)
end

local function autoLevel()
    spawn(function()
        while toggles.autoLevel.Value do
            pcall(function()
                toggles.godMode:Set(true)
                toggles.bossGodMode:Set(true)

                local level = getPlayerLevel()
                local quests = {
                    {name = "BanditQuest1", minLevel = 1, maxLevel = 10, cframe = CFrame.new(1060, 15, 1500)},
                    {name = "PirateQuest1", minLevel = 11, maxLevel = 50, cframe = CFrame.new(-1000, 15, 2000)},
                    {name = "MarineQuest1", minLevel = 51, maxLevel = 100, cframe = CFrame.new(2000, 15, -2000)},
                    {name = "SkyBanditQuest1", minLevel = 101, maxLevel = 200, cframe = CFrame.new(-5000, 15, 3000)},
                    {name = "DarkMasterQuest1", minLevel = 201, maxLevel = 300, cframe = CFrame.new(0, 15, -5000)},
                    {name = "DiableQuest1", minLevel = 301, maxLevel = 500, cframe = CFrame.new(-2000, 15, -3000)},
                    {name = "FishmanQuest1", minLevel = 501, maxLevel = 700, cframe = CFrame.new(3000, 15, -4000)}
                }

                for _, quest in ipairs(quests) do
                    if not toggles.autoLevel.Value then break end
                    if level >= quest.minLevel and level <= quest.maxLevel then
                        if acceptQuest(quest.name) then
                            notify("📈 Niveau "..level, "Farm: "..quest.name, 3)
                            for i = 1, 20 do
                                if not toggles.autoLevel.Value then break end
                                local mob = getNearestMob()
                                if mob then
                                    attackTarget(mob)
                                    task.wait(0.05)
                                else
                                    character.HumanoidRootPart.CFrame = quest.cframe
                                end
                            end
                            level = getPlayerLevel()
                        end
                    end
                end
            end)
            task.wait(1)
        end
    end)
end

local function farmSeaQuests()
    spawn(function()
        while toggles.autoSeaQuests.Value do
            pcall(function()
                toggles.godMode:Set(true)
                toggles.bossGodMode:Set(true)
                local seaQuests = {"SeaBeastQuest", "LeviathanQuest", "TerrorsharkQuest", "PirateRaidQuest"}
                for _, questName in ipairs(seaQuests) do
                    if not toggles.autoSeaQuests.Value then break end
                    if acceptQuest(questName) then
                        notify("🌊 Quête de Mer", "Farm: " .. questName, 3)
                        for i = 1, 20 do
                            if not toggles.autoSeaQuests.Value then break end
                            local mob, distance = getNearestMob()
                            if mob then
                                attackTarget(mob)
                                task.wait(0.05)
                            else
                                local character = waitForCharacter()
                                if character and character:FindFirstChild("HumanoidRootPart") then
                                    character.HumanoidRootPart.CFrame = CFrame.new(math.random(-5000, 5000), 100, math.random(-5000, 5000))
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

local function farmAllBosses()
    spawn(function()
        while toggles.autoAllBosses.Value do
            pcall(function()
                toggles.bossGodMode:Set(true)
                local allBosses = {"Sea Beast", "Leviathan", "Terrorshark", "Pirate Raid", "Dough King", "Cake Prince", "Cyborg"}
                for _, bossName in ipairs(allBosses) do
                    if not toggles.autoAllBosses.Value then break end
                    notify("👹 Boss", "Recherche: " .. bossName, 3)
                    local boss = getBoss(bossName)
                    if boss then
                        local character = waitForCharacter()
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10)
                        end
                        while boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and toggles.autoAllBosses.Value do
                            attackTarget(boss)
                            task.wait(0.05)
                        end
                        notify("✅ Boss", bossName .. " vaincu !", 3)
                    else
                        local character = waitForCharacter()
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            character.HumanoidRootPart.CFrame = CFrame.new(math.random(-6000, 6000), 100, math.random(-6000, 6000))
                        end
                    end
                    task.wait(2)
                end
                notify("✅ Tous les Boss", "Tous les boss vaincus !", 5)
            end)
            task.wait(1)
        end
    end)
end

local function enableBossGodMode()
    spawn(function()
        while toggles.bossGodMode.Value do
            pcall(function()
                local character = waitForCharacter()
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid.Health = math.huge
                    character.Humanoid.MaxHealth = math.huge
                    character.Humanoid.HealthChanged:Connect(function()
                        if toggles.bossGodMode.Value then
                            character.Humanoid.Health = math.huge
                        end
                    end)
                end
            end)
            task.wait(0.1)
        end
    end)
end

-- ===== CONNEXIONS DES TOGGLES =====
-- Game Pass
toggles.buyAllGamepasses:Connect(function(newValue)
    if newValue then
        buyAllGamepasses()
    end
end)

toggles.buy2xExp:Connect(function(newValue)
    if newValue then
        buyGamepass("2x EXP Gamepass")
        toggles.buy2xExp:Set(false)
    end
end)

toggles.buyAutoBuso:Connect(function(newValue)
    if newValue then
        buyGamepass("Auto Buso")
        toggles.buyAutoBuso:Set(false)
    end
end)

toggles.buySuperhumanV2:Connect(function(newValue)
    if newValue then
        buyGamepass("Superhuman V2")
        toggles.buySuperhumanV2:Set(false)
    end
end)

toggles.buySharkmanV2:Connect(function(newValue)
    if newValue then
        buyGamepass("Sharkman Karate V2")
        toggles.buySharkmanV2:Set(false)
    end
end)

toggles.buyDeathStepV2:Connect(function(newValue)
    if newValue then
        buyGamepass("Death Step V2")
        toggles.buyDeathStepV2:Set(false)
    end
end)

toggles.buyElectricClawV2:Connect(function(newValue)
    if newValue then
        buyGamepass("Electric Claw V2")
        toggles.buyElectricClawV2:Set(false)
    end
end)

toggles.buyDragonClawV2:Connect(function(newValue)
    if newValue then
        buyGamepass("Dragon Claw V2")
        toggles.buyDragonClawV2:Set(false)
    end
end)

toggles.buyGodsChalice:Connect(function(newValue)
    if newValue then
        buyGamepass("God's Chalice")
        toggles.buyGodsChalice:Set(false)
    end
end)

toggles.buyTushita:Connect(function(newValue)
    if newValue then
        buyGamepass("Tushita")
        toggles.buyTushita:Set(false)
    end
end)

toggles.buyYama:Connect(function(newValue)
    if newValue then
        buyGamepass("Yama")
        toggles.buyYama:Set(false)
    end
end)

-- Boutique
toggles.buyAllSwords:Connect(function(newValue)
    if newValue then
        buyAllSwords()
    end
end)

toggles.buyAllGuns:Connect(function(newValue)
    if newValue then
        buyAllGuns()
    end
end)

toggles.buyCutlass:Connect(function(newValue)
    if newValue then
        buyItem("Cutlass", "Sword")
        toggles.buyCutlass:Set(false)
    end
end)

toggles.buyKatana:Connect(function(newValue)
    if newValue then
        buyItem("Katana", "Sword")
        toggles.buyKatana:Set(false)
    end
end)

toggles.buyDualKatana:Connect(function(newValue)
    if newValue then
        buyItem("Dual Katana", "Sword")
        toggles.buyDualKatana:Set(false)
    end
end)

toggles.buyFlintlock:Connect(function(newValue)
    if newValue then
        buyItem("Flintlock", "Gun")
        toggles.buyFlintlock:Set(false)
    end
end)

toggles.buyMusket:Connect(function(newValue)
    if newValue then
        buyItem("Musket", "Gun")
        toggles.buyMusket:Set(false)
    end
end)

-- Fruits
toggles.autoPermFruit:Connect(function(newValue)
    if newValue then
        autoPermFruit()
    end
end)

toggles.autoDarkBlade:Connect(function(newValue)
    if newValue then
        farmDarkBlade()
    end
end)

-- Autres
toggles.autoTrade:Connect(function(newValue)
    if newValue then
        autoTrade()
    end
end)

toggles.autoMastery:Connect(function(newValue)
    if newValue then
        autoMastery()
    end
end)

toggles.autoLevel:Connect(function(newValue)
    if newValue then
        autoLevel()
    end
end)

toggles.autoSeaQuests:Connect(function(newValue)
    if newValue then
        farmSeaQuests()
    end
end)

toggles.autoAllBosses:Connect(function(newValue)
    if newValue then
        farmAllBosses()
    end
end)

toggles.bossGodMode:Connect(function(newValue)
    if newValue then
        enableBossGodMode()
    end
end)

-- Paramètres
toggles.sizeSmall:Connect(function(newValue)
    if newValue then
        applySize("small")
        toggles.sizeMedium:Set(false)
        toggles.sizeLarge:Set(false)
    end
end)

toggles.sizeMedium:Connect(function(newValue)
    if newValue then
        applySize("medium")
        toggles.sizeSmall:Set(false)
        toggles.sizeLarge:Set(false)
    end
end)

toggles.sizeLarge:Connect(function(newValue)
    if newValue then
        applySize("large")
        toggles.sizeSmall:Set(false)
        toggles.sizeMedium:Set(false)
    end
end)

-- ===== BOUCLES PRINCIPALES =====
spawn(function()
    while true do
        if toggles.killAura.Value then
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

spawn(function()
    while true do
        if toggles.autoAttack.Value then
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

spawn(function()
    while true do
        if toggles.godMode.Value then
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

spawn(function()
    while true do
        if toggles.espPlayers.Value then
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
