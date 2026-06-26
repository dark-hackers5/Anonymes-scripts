-- ANONYMES SCRIPTS HUB v13.0 | Blox Fruits | Auto Farm + Matériaux + Trade + PvP
local VERSION = "13.0"
local LOGO_URL = "rbxassetid://10734909167" -- ID valide pour Blox Fruits

-- ===== IMPLEMENTATION LOCALE DE DELTA (remplace la dépendance externe) =====
local Delta = {}
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

-- ===== SERVICES =====
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF = Remotes:WaitForChild("CommF_")

-- ===== TAILLES =====
local SIZES = {
    small = {window = UDim2.new(0, 500, 0, 350), titleBar = 40, catText = 8, btnHeight = 18, btnText = 12},
    medium = {window = UDim2.new(0, 640, 0, 480), titleBar = 50, catText = 10, btnHeight = 22, btnText = 14},
    large = {window = UDim2.new(0, 750, 0, 560), titleBar = 60, catText = 12, btnHeight = 26, btnText = 16}
}
local currentSize = "medium"

-- ===== COULEURS =====
local COLORS = {
    PRIMARY = Color3.fromRGB(0, 170, 255),
    SECONDARY = Color3.fromRGB(0, 200, 100),
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
    VIP = Color3.fromRGB(255, 215, 0),
    SEA = Color3.fromRGB(0, 150, 255),
    SHOP = Color3.fromRGB(255, 150, 0),
    MAT = Color3.fromRGB(200, 100, 255),
    PVP = Color3.fromRGB(255, 50, 50),
    TRADE = Color3.fromRGB(255, 200, 50)
}

-- ===== TOGGLES =====
local toggles = Delta.NewTable({
    -- Combat
    killAura = false, triggerBot = false, autoAttack = false, autoPvP = false, autoBounty = false,
    -- Auto Farm
    autoLevel = false, autoFarm = false, autoSeaQuests = false, autoAllBosses = false,
    autoNearest = false, autoMastery = false, autoStats = false,
    -- Bosses
    autoSeaBeast = false, autoLeviathan = false, autoPirateRaid = false, autoTerrorshark = false,
    autoDoughKing = false, autoCakePrince = false, autoCyborg = false, autoRipIndra = false,
    -- Matériaux
    autoBones = false, autoEctoplasm = false, autoCandy = false, autoFragments = false,
    autoDarkFragment = false, autoDragonScale = false, autoMagmaOre = false,
    autoAngelWings = false, autoLeather = false, autoScrapMetal = false,
    autoVampireFang = false, autoFishTail = false, autoRadioactive = false,
    autoAllMaterials = false,
    -- Boutique
    buyAllSwords = false, buyAllGuns = false,
    buyCutlass = false, buyKatana = false, buyDualKatana = false, buyLongsword = false,
    buyFlintlock = false, buyMusket = false, buyBlunderbuss = false, buyCannon = false,
    buyRefinedSlingshot = false, buyDualFlintlock = false, buyBisento = false,
    -- Fruits
    autoStoreFruit = false, autoRandomFruit = false, autoBuyFruit = false,
    autoCollectFruit = false, autoDarkBlade = false,
    -- Craft & Upgrade
    autoCraftAll = false, autoUpgradeAll = false,
    -- Trade
    autoTrade = false, autoAcceptTrade = false,
    -- Déplacement
    infiniteJump = false, noClip = false, fly = false, walkOnWater = false, boatSpeed = false,
    -- Défense
    antiKick = false, antiStun = false, godMode = false, bossGodMode = false,
    -- ESP
    espPlayers = false, espBoss = false, espFruits = false, espChests = false,
    -- Utilitaires
    serverHop = false, fpsBoost = false, autoRejoin = false, whiteScreen = false,
    -- Taille
    sizeSmall = false, sizeMedium = true, sizeLarge = false
})

-- ===== VARIABLES GLOBALES =====
local godModeConnected = false
local bossGodModeConnected = false
local currentFruit = "None"
local currentLevel = 0

-- ===== INTERFACE =====
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnonymesHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = SIZES.medium.window
MainFrame.Position = UDim2.new(0.5, -SIZES.medium.window.X.Offset/2, 0.5, -SIZES.medium.window.Y.Offset/2)
MainFrame.BackgroundColor3 = COLORS.BG
MainFrame.Visible = false
MainFrame.ZIndex = 10
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

-- ===== LOGO (CORRIGÉ + DÉPLAÇABLE) =====
local LogoButton = Instance.new("ImageButton")
LogoButton.Name = "AnonymesLogo"
LogoButton.Size = UDim2.new(0, 44, 0, 44)
LogoButton.Position = UDim2.new(0, 8, 0, 8)
LogoButton.BackgroundColor3 = COLORS.BG_LIGHT
LogoButton.BackgroundTransparency = 0.3
LogoButton.Image = LOGO_URL
LogoButton.ScaleType = Enum.ScaleType.Fit
LogoButton.ZIndex = 20
LogoButton.Draggable = true -- 👈 DÉPLAÇABLE
LogoButton.Active = true
LogoButton.Selectable = true
LogoButton.Parent = screenGui

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = LogoButton

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = COLORS.PRIMARY
LogoStroke.Thickness = 2
LogoStroke.Parent = LogoButton

-- ===== RESTE DE L'INTERFACE =====
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, SIZES.medium.titleBar)
TitleBar.BackgroundColor3 = COLORS.BG_LIGHT
TitleBar.Parent = MainFrame

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 8, 0, 0)
TitleBarCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 180, 1, 0)
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
CloseButton.Position = UDim2.new(1, -35, 0, (SIZES.medium.titleBar - 30) / 2)
CloseButton.Text = "X"
CloseButton.TextSize = 16
CloseButton.BackgroundColor3 = COLORS.DANGER
CloseButton.TextColor3 = COLORS.TEXT
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseButton

local CategoriesFrame = Instance.new("Frame")
CategoriesFrame.Size = UDim2.new(1, -190, 1, 0)
CategoriesFrame.Position = UDim2.new(0, 190, 0, 0)
CategoriesFrame.BackgroundTransparency = 1
CategoriesFrame.Parent = TitleBar

local CategoriesScrolling = Instance.new("ScrollingFrame")
CategoriesScrolling.Size = UDim2.new(1, 0, 1, 0)
CategoriesScrolling.BackgroundTransparency = 1
CategoriesScrolling.ScrollBarThickness = 3
CategoriesScrolling.AutomaticCanvasSize = Enum.AutomaticSize.X
CategoriesScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
CategoriesScrolling.Parent = CategoriesFrame

local CategoriesLayout = Instance.new("UIListLayout")
CategoriesLayout.FillDirection = Enum.FillDirection.Horizontal
CategoriesLayout.Padding = UDim.new(0, 4)
CategoriesLayout.Parent = CategoriesScrolling

local categories = {
    {name = "farm", icon = "🌾", color = COLORS.SUCCESS},
    {name = "combat", icon = "⚔️", color = COLORS.DANGER},
    {name = "bosses", icon = "👹", color = COLORS.WARNING},
    {name = "mer", icon = "🌊", color = COLORS.SEA},
    {name = "matériaux", icon = "🧱", color = COLORS.MAT},
    {name = "boutique", icon = "🛒", color = COLORS.SHOP},
    {name = "craft", icon = "🔧", color = COLORS.VIP},
    {name = "fruits", icon = "🍎", color = Color3.fromRGB(255, 100, 0)},
    {name = "trade", icon = "💱", color = COLORS.TRADE},
    {name = "pvp", icon = "🏴", color = COLORS.PVP},
    {name = "défense", icon = "🛡️", color = COLORS.BTN_ON},
    {name = "esp", icon = "👁️", color = Color3.fromRGB(200, 0, 255)},
    {name = "déplacement", icon = "⛵", color = COLORS.PRIMARY},
    {name = "paramètres", icon = "⚙️", color = COLORS.TEXT_MUTED}
}

local categoryButtons = {}

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
ContentScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentScroll.Parent = ContentFrame

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Padding = UDim.new(0, 5)
ContentLayout.Parent = ContentScroll

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

local function waitChar()
    repeat task.wait() until player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    return player.Character
end

local function getRoot()
    local char = waitChar()
    return char:FindFirstChild("HumanoidRootPart")
end

-- ===== OUVERTURE/FERMETURE =====
LogoButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- ===== NOTIFICATION DE DÉMARRAGE =====
task.wait(1) -- Attend que le jeu charge
notify("🚀 Anonymes Hub v" .. VERSION, "Script chargé ! Clique sur le logo pour ouvrir.", 5)
MainFrame.Visible = false -- Masque le menu au démarrage
