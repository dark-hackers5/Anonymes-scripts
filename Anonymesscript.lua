-- =============================================
-- ANONYMES SCRIPTS HUB v13.0 | Blox Fruits
-- =============================================
local VERSION = "13.0"
local LOGO_URL = "rbxassetid://19964848466" -- Ton logo hébergé

-- =============================================
-- VÉRIFIE SI LE SCRIPT EST DÉJÀ CHARGÉ
-- =============================================
if game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("AnonymesHub") then
    game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("AnonymesHub"):Destroy()
end

-- =============================================
-- SERVICES ROBLOX
-- =============================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF = Remotes:WaitForChild("CommF_")

-- =============================================
-- CONFIGURATION (COULEURS, TAILLES)
-- =============================================
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
    VIP = Color3.fromRGB(255, 215, 0)
}

local SIZES = {
    medium = {window = UDim2.new(0, 640, 0, 480), titleBar = 50, btnHeight = 22, btnText = 14, catText = 10}
}

-- =============================================
-- INTERFACE PRINCIPALE
-- =============================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnonymesHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- ===== LOGO (1 SEUL + DÉPLAÇABLE) =====
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

-- ===== FENÊTRE PRINCIPALE =====
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = SIZES.medium.window
MainFrame.Position = UDim2.new(0.5, -SIZES.medium.window.X.Offset/2, 0.5, -SIZES.medium.window.Y.Offset/2)
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

-- ===== BARRE DE TITRE + CATÉGORIES =====
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

-- ===== CONTAINER DES CATÉGORIES =====
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

-- ===== CONTENU PRINCIPAL =====
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

-- =============================================
-- CATÉGORIES + LEURS CONTENUS
-- =============================================
local categories = {
    {
        name = "farm",
        icon = "🌾",
        color = COLORS.SUCCESS,
        buttons = {
            {"Auto Level", "autoLevel"},
            {"Auto Farm", "autoFarm"},
            {"Auto Maîtrise", "autoMastery"},
            {"Auto Stats", "autoStats"}
        }
    },
    {
        name = "combat",
        icon = "⚔️",
        color = COLORS.DANGER,
        buttons = {
            {"Kill Aura", "killAura"},
            {"Auto Attack", "autoAttack"},
            {"Auto PvP", "autoPvP"},
            {"Auto Bounty", "autoBounty"}
        }
    },
    {
        name = "bosses",
        icon = "👹",
        color = COLORS.WARNING,
        buttons = {
            {"Tous les Boss", "autoAllBosses"},
            {"Sea Beast", "autoSeaBeast"},
            {"Leviathan", "autoLeviathan"},
            {"Terrorshark", "autoTerrorshark"},
            {"Dough King", "autoDoughKing"},
            {"Cake Prince", "autoCakePrince"},
            {"Cyborg", "autoCyborg"},
            {"RIP Indra", "autoRipIndra"}
        }
    },
    {
        name = "matériaux",
        icon = "🧱",
        color = Color3.fromRGB(200, 100, 255),
        buttons = {
            {"TOUS Matériaux", "autoAllMaterials"},
            {"Os (Bones)", "autoBones"},
            {"Ectoplasme", "autoEctoplasm"},
            {"Bonbons", "autoCandy"}
        }
    },
    {
        name = "boutique",
        icon = "🛒",
        color = Color3.fromRGB(255, 150, 0),
        buttons = {
            {"TOUTES Épées", "buyAllSwords"},
            {"TOUS Guns", "buyAllGuns"},
            {"Cutlass", "buyCutlass"},
            {"Katana", "buyKatana"},
            {"Dual Katana", "buyDualKatana"}
        }
    },
    {
        name = "fruits",
        icon = "🍎",
        color = Color3.fromRGB(255, 100, 0),
        buttons = {
            {"Collecter Fruit", "autoCollectFruit"},
            {"Stocker Fruit", "autoStoreFruit"},
            {"Achat Aléatoire", "autoRandomFruit"}
        }
    },
    {
        name = "déplacement",
        icon = "⛵",
        color = COLORS.PRIMARY,
        buttons = {
            {"Vol (Fly)", "fly"},
            {"Saut Infini", "infiniteJump"},
            {"No Clip", "noClip"},
            {"Marcher sur l'Eau", "walkOnWater"}
        }
    }
}

local categoryButtons = {}

-- ===== CRÉATION DES BOUTONS DE CATÉGORIES =====
for i, cat in ipairs(categories) do
    local button = Instance.new("TextButton")
    button.Name = cat.name .. "Button"
    button.Size = UDim2.new(0, 0, 1, -5)
    button.AutomaticSize = Enum.AutomaticSize.X
    button.Text = cat.icon .. " " .. cat.name
    button.TextSize = 10
    button.TextColor3 = COLORS.TEXT_MUTED
    button.BackgroundColor3 = COLORS.CAT_BG
    button.Font = Enum.Font.GothamBold
    button.ZIndex = 11
    button.Parent = CategoriesScrolling

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
        button.BackgroundColor3 = COLORS.CAT_SEL
        button.TextColor3 = COLORS.TEXT
    end)

    button.MouseLeave:Connect(function()
        if not button.Selected then
            button.BackgroundColor3 = COLORS.CAT_BG
            button.TextColor3 = COLORS.TEXT_MUTED
        end
    end)

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

        -- AFFICHER LE CONTENU DE LA CATÉGORIE
        for _, child in pairs(ContentScroll:GetChildren()) do
            child:Destroy()
        end

        local buttonsContainer = Instance.new("Frame")
        buttonsContainer.Size = UDim2.new(1, 0, 0, 0)
        buttonsContainer.BackgroundTransparency = 1
        buttonsContainer.Parent = ContentScroll

        local buttonsLayout = Instance.new("UIListLayout")
        buttonsLayout.Padding = UDim.new(0, 5)
        buttonsLayout.Parent = buttonsContainer

        for _, btnData in ipairs(cat.buttons) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -20, 0, 22)
            btn.Text = btnData[1] .. ": OFF"
            btn.TextSize = 14
            btn.TextColor3 = COLORS.TEXT
            btn.BackgroundColor3 = COLORS.BTN_OFF
            btn.Font = Enum.Font.Gotham
            btn.Parent = buttonsContainer

            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 4)
            btnCorner.Parent = btn

            local btnStroke = Instance.new("UIStroke")
            btnStroke.Color = COLORS.PRIMARY
            btnStroke.Thickness = 1
            btnStroke.Parent = btn

            local btnPadding = Instance.new("UIPadding")
            btnPadding.PaddingLeft = UDim.new(0, 10)
            btnPadding.Parent = btn

            -- TOGGLE SIMPLE (sans Delta pour éviter les bugs)
            btn.MouseButton1Click:Connect(function()
                local currentText = btn.Text:gsub(" .*", "")
                btn.Text = btnData[1] .. (currentText == "OFF" and ": ON" or ": OFF")
                btn.BackgroundColor3 = (currentText == "OFF" and COLORS.BTN_ON or COLORS.BTN_OFF)
            end)
        end
    end)

    table.insert(categoryButtons, button)
end

-- Sélectionner la première catégorie par défaut
if #categoryButtons > 0 then
    categoryButtons[1].Selected = true
    categoryButtons[1].BackgroundColor3 = COLORS.CAT_SEL
    categoryButtons[1].TextColor3 = COLORS.TEXT
    categoryButtons[1].MouseButton1Click:Connect(function()
        categoryButtons[1].Selected = true
        categoryButtons[1].BackgroundColor3 = COLORS.CAT_SEL
        categoryButtons[1].TextColor3 = COLORS.TEXT
        for _, child in pairs(ContentScroll:GetChildren()) do
            child:Destroy()
        end
        local buttonsContainer = Instance.new("Frame")
        buttonsContainer.Size = UDim2.new(1, 0, 0, 0)
        buttonsContainer.BackgroundTransparency = 1
        buttonsContainer.Parent = ContentScroll
        local buttonsLayout = Instance.new("UIListLayout")
        buttonsLayout.Padding = UDim.new(0, 5)
        buttonsLayout.Parent = buttonsContainer
        for _, btnData in ipairs(categories[1].buttons) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -20, 0, 22)
            btn.Text = btnData[1] .. ": OFF"
            btn.TextSize = 14
            btn.TextColor3 = COLORS.TEXT
            btn.BackgroundColor3 = COLORS.BTN_OFF
            btn.Font = Enum.Font.Gotham
            btn.Parent = buttonsContainer
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 4)
            btnCorner.Parent = btn
            local btnStroke = Instance.new("UIStroke")
            btnStroke.Color = COLORS.PRIMARY
            btnStroke.Thickness = 1
            btnStroke.Parent = btn
            local btnPadding = Instance.new("UIPadding")
            btnPadding.PaddingLeft = UDim.new(0, 10)
            btnPadding.Parent = btn
            btn.MouseButton1Click:Connect(function()
                local currentText = btn.Text:gsub(" .*", "")
                btn.Text = btnData[1] .. (currentText == "OFF" and ": ON" or ": OFF")
                btn.BackgroundColor3 = (currentText == "OFF" and COLORS.BTN_ON or COLORS.BTN_OFF)
            end)
        end
    end)()
end

-- =============================================
-- GESTION DU LOGO (OUVRIR/FERMER)
-- =============================================
LogoButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- =============================================
-- NOTIFICATION DE DÉMARRAGE
-- =============================================
task.wait(1)
game.StarterGui:SetCore("SendNotification", {
    Title = "🚀 Anonymes Hub v" .. VERSION,
    Text = "Clique sur le logo pour ouvrir le menu!",
    Duration = 5,
    Icon = LOGO_URL
})
