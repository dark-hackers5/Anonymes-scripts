-- =============================================
-- ANONYMES SCRIPTS HUB v13.0 | Blox Fruits
-- Script complet : Raids payants + Gacha fruits d'élite
-- =============================================
local VERSION = "13.0"

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
-- LISTE DE TOUS LES RAIDS (noms exacts)
-- =============================================
local RAIDS = {
    -- Raids du 2e Sea (fruits awakenable)
    {name = "Flame", cost = 1000, fruit = "Flame-Flame"},
    {name = "Ice", cost = 1000, fruit = "Ice-Ice"},
    {name = "Dark", cost = 1000, fruit = "Dark-Dark"},
    {name = "Light", cost = 1000, fruit = "Light-Light"},
    {name = "Magma", cost = 1000, fruit = "Magma-Magma"},
    {name = "Sand", cost = 1000, fruit = "Sand-Sand"},
    {name = "Quake", cost = 1000, fruit = "Quake-Quake"},
    {name = "Buddha", cost = 1000, fruit = "Buddha-Buddha"},
    {name = "Dough", cost = 1000, fruit = "Dough-Dough"},
    {name = "Rumble", cost = 1000, fruit = "Rumble-Rumble"},
    -- Raids du 3e Sea (boss raids)
    {name = "DoughKing", cost = 0, fruit = nil, isBoss = true},
    {name = "CakePrince", cost = 0, fruit = nil, isBoss = true},
    {name = "RipIndra", cost = 0, fruit = nil, isBoss = true},
    {name = "Order", cost = 0, fruit = nil, isBoss = true},
    {name = "SeaBeast", cost = 0, fruit = nil, isBoss = true},
    {name = "Leviathan", cost = 0, fruit = nil, isBoss = true},
    {name = "Terrorshark", cost = 0, fruit = nil, isBoss = true},
    {name = "Cyborg", cost = 0, fruit = nil, isBoss = true}
}

-- =============================================
-- MEILLEURS FRUITS DU GACHA (target prioritaires)
-- =============================================
local BEST_FRUITS = {
    -- Mythiques (priorité max)
    "Dragon-Dragon", "Kitsune-Kitsune", "Leopard-Leopard",
    "Yeti-Yeti", "Gas-Gas",
    -- Légendaires
    "Dough-Dough", "Venom-Venom", "Spirit-Spirit",
    "Shadow-Shadow", "Control-Control",
    "Mammoth-Mammoth", "T-Rex-T-Rex",
    "Portal-Portal", "Rumble-Rumble",
    "Gravity-Gravity", "Blizzard-Blizzard", "Pain-Pain"
}

-- =============================================
-- VARIABLES TOGGLES
-- =============================================
local toggles = {}
local toggleKeys = {
    "autoLevel","autoFarm","autoMastery","autoStats","autoQuest",
    "autoChest","autoBeli","autoDungeon","killAura","autoAttack",
    "autoPvP","autoBounty","fastAttack","noCooldown",
    "autoAllBosses","autoSeaBeast","autoLeviathan","autoTerrorshark",
    "autoDoughKing","autoCakePrince","autoCyborg","autoRipIndra",
    "autoRaid","autoAllMaterials","autoBones","autoEctoplasm","autoCandy",
    "buyAllSwords","buyAllGuns","buyCutlass","buyKatana","buyDualKatana",
    "autoCollectFruit","autoStoreFruit","autoRandomFruit",
    "fly","infiniteJump","noClip","walkOnWater","teleportIsland",
    "autoRaceV4","autoObservation","autoKenHaki",
    "fruitESP","chestESP","playerESP",
    "autoGachaElite"  -- Nouveau toggle pour le gacha élite
}
for _, k in ipairs(toggleKeys) do toggles[k] = false end

-- Variable pour stocker le raid sélectionné
local selectedRaid = RAIDS[1]

-- =============================================
-- FONCTION : PAYER ET LANCER UN RAID
-- =============================================
local function startRaid(raidName)
    -- Payer le raid avec les fragments
    local success = cmd("BuyRaid", raidName)
    if success then
        cmd("StartRaid", raidName)
        cmd("FarmRaid")
        return true
    end
    return false
end

-- =============================================
-- FONCTION : GACHA ÉLITE (fruit d'élite)
-- =============================================
local function buyRandomFruit()
    local success, result = pcall(function()
        return CommF_:InvokeServer("BuyRandomFruit", "Random")
    end)
    return success, result
end

local function getCurrentFruitName()
    local char = getChar()
    for _, tool in pairs(char:GetChildren()) do
        if tool:IsA("Tool") then
            for _, fruitName in ipairs(BEST_FRUITS) do
                if tool.Name == fruitName or tool.Name:find(fruitName:gsub("-.-", "")) then
                    return fruitName
                end
            end
            -- Vérifier aussi dans le backpack
        end
    end
    for _, tool in pairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            for _, fruitName in ipairs(BEST_FRUITS) do
                if tool.Name == fruitName or tool.Name:find(fruitName:gsub("-.-", "")) then
                    return fruitName
                end
            end
        end
    end
    return nil
end

local function isEliteFruit(fruitName)
    for _, elite in ipairs(BEST_FRUITS) do
        if fruitName == elite then
            return true
        end
    end
    return false
end

-- =============================================
-- BOUCLE : AUTO GACHA ÉLITE
-- =============================================
spawn(function()
    while task.wait(2) do
        if toggles.autoGachaElite then
            -- Vérifier si on a déjà un fruit d'élite
            local current = getCurrentFruitName()
            if current and isEliteFruit(current) then
                -- Déjà un bon fruit, on continue
                task.wait(5)
            else
                -- Acheter des fruits aléatoires jusqu'à obtenir un fruit d'élite
                local attempts = 0
                local maxAttempts = 50  -- Sécurité pour éviter de tout dépenser
                
                while attempts < maxAttempts and toggles.autoGachaElite do
                    attempts = attempts + 1
                    local success, result = buyRandomFruit()
                    
                    if success then
                        -- Vérifier quel fruit on a obtenu
                        local char = getChar()
                        local newFruit = nil
                        for _, tool in pairs(char:GetChildren()) do
                            if tool:IsA("Tool") then
                                for _, elite in ipairs(BEST_FRUITS) do
                                    if tool.Name == elite or tool.Name:find(elite:gsub("-.-", "")) then
                                        newFruit = elite
                                        break
                                    end
                                end
                            end
                        end
                        
                        if newFruit and isEliteFruit(newFruit) then
                            -- Fruit d'élite obtenu ! On le stocke
                            cmd("StoreFruit", newFruit)
                            game:GetService("StarterGui"):SetCore("SendNotification", {
                                Title = "🎉 Fruit d'Élite !",
                                Text = "Obtenu : " .. newFruit,
                                Duration = 5
                            })
                            break
                        end
                    end
                    task.wait(1)
                end
            end
        end
    end
end)

-- Les autres boucles (Farm, Combat, Bosses, etc.) restent identiques

-- =============================================
-- CRÉATION DE L'INTERFACE GRAPHIQUE (UI)
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
    ESP = Color3.fromRGB(0, 255, 150)
}

-- ===== LOGO =====
local LogoButton = Instance.new("ImageButton")
LogoButton.Name = "AnonymesLogo"
LogoButton.Size = UDim2.new(0, 44, 0, 44)
LogoButton.Position = UDim2.new(0, 8, 0, 8)
LogoButton.BackgroundColor3 = COLORS.PRIMARY
LogoButton.BackgroundTransparency = 0.3
LogoButton.Image = "rbxasset://textures/face/face.png"
LogoButton.ImageColor3 = COLORS.PRIMARY
LogoButton.ScaleType = Enum.ScaleType.Fit
LogoButton.ZIndex = 20
LogoButton.Draggable = true
LogoButton.Parent = screenGui

local LogoText = Instance.new("TextLabel")
LogoText.Name = "LogoA"
LogoText.Size = UDim2.new(1, 0, 1, 0)
LogoText.BackgroundTransparency = 1
LogoText.Text = "A"
LogoText.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoText.TextSize = 24
LogoText.Font = Enum.Font.GothamBold
LogoText.TextScaled = true
LogoText.ZIndex = 21
LogoText.Parent = LogoButton

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
MainFrame.Size = UDim2.new(0, 640, 0, 520)  -- Un peu plus grand pour les raids
MainFrame.Position = UDim2.new(0.5, -320, 0.5, -260)
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

-- ===== BARRE DE TITRE =====
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 50)
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
CloseButton.Position = UDim2.new(1, -35, 0, 10)
CloseButton.Text = "X"
CloseButton.TextSize = 16
CloseButton.BackgroundColor3 = COLORS.DANGER
CloseButton.TextColor3 = COLORS.TEXT
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseButton

-- ===== CATÉGORIES =====
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
CategoriesScrolling.Parent = CategoriesScrolling

local CategoriesLayout = Instance.new("UIListLayout")
CategoriesLayout.FillDirection = Enum.FillDirection.Horizontal
CategoriesLayout.Padding = UDim.new(0, 4)
CategoriesLayout.Parent = CategoriesScrolling

-- ===== CONTENU =====
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 1, -50)
ContentFrame.Position = UDim2.new(0, 0, 0, 50)
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
-- FONCTION POUR CRÉER LE CONTENU D'UNE CATÉGORIE
-- =============================================
local function createCategoryContent(cat)
    -- Nettoyer
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

    -- CAS SPÉCIAL : CATÉGORIE RAID
    if cat.name == "raid" then
        -- Bouton Auto Raid
        local autoRaidBtn = Instance.new("TextButton")
        autoRaidBtn.Size = UDim2.new(1, -20, 0, 22)
        autoRaidBtn.Text = "Auto Raid: OFF"
        autoRaidBtn.TextSize = 14
        autoRaidBtn.TextColor3 = COLORS.TEXT
        autoRaidBtn.BackgroundColor3 = COLORS.BTN_OFF
        autoRaidBtn.Font = Enum.Font.Gotham
        autoRaidBtn.Parent = container

        local arCorner = Instance.new("UICorner"); arCorner.CornerRadius = UDim.new(0, 4); arCorner.Parent = autoRaidBtn
        local arStroke = Instance.new("UIStroke"); arStroke.Color = COLORS.RAID; arStroke.Thickness = 1; arStroke.Parent = autoRaidBtn
        local arPad = Instance.new("UIPadding"); arPad.PaddingLeft = UDim.new(0, 10); arPad.Parent = autoRaidBtn

        autoRaidBtn.MouseButton1Click:Connect(function()
            if toggles.autoRaid then
                toggles.autoRaid = false
                autoRaidBtn.Text = "Auto Raid: OFF"
                autoRaidBtn.BackgroundColor3 = COLORS.BTN_OFF
            else
                toggles.autoRaid = true
                autoRaidBtn.Text = "Auto Raid: ON"
                autoRaidBtn.BackgroundColor3 = COLORS.BTN_ON
            end
        end)

        -- Titre "Sélectionner un Raid"
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(1, -20, 0, 20)
        titleLabel.Text = "⬇️ Choisis un Raid à payer et lancer :"
        titleLabel.TextSize = 12
        titleLabel.TextColor3 = COLORS.GOLD
        titleLabel.BackgroundTransparency = 1
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Parent = container

        local titlePad = Instance.new("UIPadding"); titlePad.PaddingLeft = UDim.new(0, 10); titlePad.Parent = titleLabel

        -- Liste déroulante des raids
        local raidScroll = Instance.new("ScrollingFrame")
        raidScroll.Size = UDim2.new(1, -20, 0, 150)
        raidScroll.BackgroundColor3 = COLORS.BG_LIGHT
        raidScroll.BackgroundTransparency = 0.3
        raidScroll.ScrollBarThickness = 4
        raidScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
        raidScroll.Parent = container

        local rsCorner = Instance.new("UICorner"); rsCorner.CornerRadius = UDim.new(0, 4); rsCorner.Parent = raidScroll
        local rsPad = Instance.new("UIPadding"); rsPad.PaddingLeft = UDim.new(0, 10); rsPad.Parent = raidScroll

        local raidLayout = Instance.new("UIListLayout")
        raidLayout.Padding = UDim.new(0, 2)
        raidLayout.Parent = raidScroll

        local raidButtons = {}
        for _, raid in ipairs(RAIDS) do
            local raidBtn = Instance.new("TextButton")
            raidBtn.Size = UDim2.new(1, -5, 0, 20)
            raidBtn.Text = raid.name .. (raid.fruit and (" (" .. raid.fruit .. ")") or " ⚔️ Boss")
            raidBtn.TextSize = 11
            raidBtn.TextColor3 = COLORS.TEXT
            raidBtn.BackgroundColor3 = COLORS.CAT_BG
            raidBtn.Font = Enum.Font.Gotham
            raidBtn.Parent = raidScroll

            local rbCorner = Instance.new("UICorner"); rbCorner.CornerRadius = UDim.new(0, 3); rbCorner.Parent = raidBtn

            raidBtn.MouseButton1Click:Connect(function()
                -- Mettre en surbrillance le raid sélectionné
                for _, rb in pairs(raidButtons) do
                    rb.BackgroundColor3 = COLORS.CAT_BG
                end
                raidBtn.BackgroundColor3 = COLORS.CAT_SEL
                selectedRaid = raid
                
                -- Lancer le raid immédiatement
                local success = startRaid(raid.name)
                if success then
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "✅ Raid lancé",
                        Text = raid.name .. " payé et démarré !",
                        Duration = 3
                    })
                else
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "❌ Échec",
                        Text = "Pas assez de fragments pour " .. raid.name,
                        Duration = 3
                    })
                end
            end)

            table.insert(raidButtons, raidBtn)
        end

        -- Petit label info fragments
        local infoLabel = Instance.new("TextLabel")
        infoLabel.Size = UDim2.new(1, -20, 0, 16)
        infoLabel.Text = "💎 Les raids coûtent 1000 fragments (sauf boss)"
        infoLabel.TextSize = 9
        infoLabel.TextColor3 = COLORS.TEXT_MUTED
        infoLabel.BackgroundTransparency = 1
        infoLabel.Font = Enum.Font.Gotham
        infoLabel.TextXAlignment = Enum.TextXAlignment.Left
        infoLabel.Parent = container

        local infoPad = Instance.new("UIPadding"); infoPad.PaddingLeft = UDim.new(0, 10); infoPad.Parent = infoLabel

    -- CAS SPÉCIAL : CATÉGORIE FRUITS (avec Gacha Élite)
    elseif cat.name == "fruits" then
        for _, bd in ipairs(cat.buttons) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -20, 0, 22)
            btn.Text = bd[1] .. ": OFF"
            btn.TextSize = 14
            btn.TextColor3 = COLORS.TEXT
            btn.BackgroundColor3 = COLORS.BTN_OFF
            btn.Font = Enum.Font.Gotham
            btn.Parent = container

            local bnCorner = Instance.new("UICorner"); bnCorner.CornerRadius = UDim.new(0, 4); bnCorner.Parent = btn
            local bnStroke = Instance.new("UIStroke"); bnStroke.Color = COLORS.PRIMARY; bnStroke.Thickness = 1; bnStroke.Parent = btn
            local bnPad = Instance.new("UIPadding"); bnPad.PaddingLeft = UDim.new(0, 10); bnPad.Parent = btn

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

        -- BOUTON SPÉCIAL : Gacha Élite (Golden)
        local gachaBtn = Instance.new("TextButton")
        gachaBtn.Size = UDim2.new(1, -20, 0, 28)
        gachaBtn.Text = "⭐ Gacha Élite (Top Fruits) : OFF"
        gachaBtn.TextSize = 14
        gachaBtn.TextColor3 = COLORS.GOLD
        gachaBtn.BackgroundColor3 = COLORS.BTN_OFF
        gachaBtn.Font = Enum.Font.GothamBold
        gachaBtn.Parent = container

        local gCorner = Instance.new("UICorner"); gCorner.CornerRadius = UDim.new(0, 4); gCorner.Parent = gachaBtn
        local gStroke = Instance.new("UIStroke"); gStroke.Color = COLORS.GOLD; gStroke.Thickness = 2; gStroke.Parent = gachaBtn
        local gPad = Instance.new("UIPadding"); gPad.PaddingLeft = UDim.new(0, 10); gPad.Parent = gachaBtn

        gachaBtn.MouseButton1Click:Connect(function()
            if toggles.autoGachaElite then
                toggles.autoGachaElite = false
                gachaBtn.Text = "⭐ Gacha Élite (Top Fruits) : OFF"
                gachaBtn.BackgroundColor3 = COLORS.BTN_OFF
            else
                toggles.autoGachaElite = true
                gachaBtn.Text = "⭐ Gacha Élite (Top Fruits) : ON"
                gachaBtn.BackgroundColor3 = COLORS.BTN_ON
                -- Notification des fruits ciblés
                local fruitList = ""
                for i = 1, math.min(5, #BEST_FRUITS) do
                    fruitList = fruitList .. BEST_FRUITS[i] .. (i < 5 and ", " or "")
                end
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "🎯 Gacha Élite activé",
                    Text = "Cible : " .. fruitList .. "...",
                    Duration = 4
                })
            end
        end)

        -- Liste des meilleurs fruits (affichage)
        local eliteList = Instance.new("TextLabel")
        eliteList.Size = UDim2.new(1, -20, 0, 60)
        eliteList.Text = "🏆 Fruits d'élite ciblés :\nDragon, Kitsune, Leopard, Dough, Venom, Spirit, Portal..."
        eliteList.TextSize = 10
        eliteList.TextColor3 = COLORS.TEXT_MUTED
        eliteList.BackgroundTransparency = 1
        eliteList.Font = Enum.Font.Gotham
        eliteList.TextXAlignment = Enum.TextXAlignment.Left
        eliteList.TextWrapped = true
        eliteList.Parent = container

    else
        -- COMPORTEMENT NORMAL POUR LES AUTRES CATÉGORIES
        for _, bd in ipairs(cat.buttons) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -20, 0, 22)
            btn.Text = bd[1] .. ": OFF"
            btn.TextSize = 14
            btn.TextColor3 = COLORS.TEXT
            btn.BackgroundColor3 = COLORS.BTN_OFF
            btn.Font = Enum.Font.Gotham
            btn.Parent = container

            local bnCorner = Instance.new("UICorner"); bnCorner.CornerRadius = UDim.new(0, 4); bnCorner.Parent = btn
            local bnStroke = Instance.new("UIStroke"); bnStroke.Color = COLORS.PRIMARY; bnStroke.Thickness = 1; bnStroke.Parent = btn
            local bnPad = Instance.new("UIPadding"); bnPad.PaddingLeft = UDim.new(0, 10); bnPad.Parent = btn

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
-- 10 CATÉGORIES
-- =============================================
local categories = {
    {
        name = "farm", icon = "🌾", color = COLORS.SUCCESS,
        buttons = {
            {"Auto Level","autoLevel"}, {"Auto Farm","autoFarm"},
            {"Auto Maîtrise","autoMastery"}, {"Auto Stats","autoStats"},
            {"Auto Quête","autoQuest"}, {"Auto Chest","autoChest"},
            {"Auto Beli","autoBeli"}, {"Auto Donjon","autoDungeon"}
        }
    },
    {
        name = "combat", icon = "⚔️", color = COLORS.DANGER,
        buttons = {
            {"Kill Aura","killAura"}, {"Auto Attack","autoAttack"},
            {"Auto PvP","autoPvP"}, {"Auto Bounty","autoBounty"},
            {"Fast Attack","fastAttack"}, {"No Cooldown","noCooldown"}
        }
    },
    {
        name = "bosses", icon = "👹", color = COLORS.WARNING,
        buttons = {
            {"Tous les Boss","autoAllBosses"}, {"Sea Beast","autoSeaBeast"},
            {"Leviathan","autoLeviathan"}, {"Terrorshark","autoTerrorshark"},
            {"Dough King","autoDoughKing"}, {"Cake Prince","autoCakePrince"},
            {"Cyborg","autoCyborg"}, {"RIP Indra","autoRipIndra"}
        }
    },
    {
        name = "raid", icon = "⚡", color = COLORS.RAID,
        buttons = {}  -- Les raids sont gérés spécialement dans createCategoryContent
    },
    {
        name = "matériaux", icon = "🧱", color = Color3.fromRGB(200,100,255),
        buttons = {
            {"TOUS Matériaux","autoAllMaterials"}, {"Os (Bones)","autoBones"},
            {"Ectoplasme","autoEctoplasm"}, {"Bonbons","autoCandy"}
        }
    },
    {
        name = "boutique", icon = "🛒", color = Color3.fromRGB(255,150,0),
        buttons = {
            {"TOUTES Épées","buyAllSwords"}, {"TOUS Guns","buyAllGuns"},
            {"Cutlass","buyCutlass"}, {"Katana","buyKatana"},
            {"Dual Katana","buyDualKatana"}
        }
    },
    {
        name = "fruits", icon = "🍎", color = Color3.fromRGB(255,100,0),
        buttons = {
            {"Collecter Fruit","autoCollectFruit"}, {"Stocker Fruit","autoStoreFruit"},
            {"Achat Aléatoire","autoRandomFruit"}
        }
    },
    {
        name = "déplacement", icon = "⛵", color = COLORS.PRIMARY,
        buttons = {
            {"Vol (Fly)","fly"}, {"Saut Infini","infiniteJump"},
            {"No Clip","noClip"}, {"Marcher sur l'Eau","walkOnWater"},
            {"Téléportation Îles","teleportIsland"}
        }
    },
    {
        name = "race", icon = "🧬", color = COLORS.RACE,
        buttons = {
            {"Auto Race V4","autoRaceV4"}, {"Auto Obs. V2","autoObservation"},
            {"Auto Ken Haki","autoKenHaki"}
        }
    },
    {
        name = "esp", icon = "👁️", color = COLORS.ESP,
        buttons = {
            {"Fruit ESP","fruitESP"}, {"Chest ESP","chestESP"},
            {"Player ESP","playerESP"}
        }
    }
}

local categoryButtons = {}

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

    local bCorner = Instance.new("UICorner"); bCorner.CornerRadius = UDim.new(0, 4); bCorner.Parent = button
    local bStroke = Instance.new("UIStroke"); bStroke.Color = cat.color; bStroke.Thickness = 1; bStroke.Parent = button
    local bPad = Instance.new("UIPadding"); bPad.PaddingLeft = UDim.new(0, 6); bPad.PaddingRight = UDim.new(0, 6); bPad.Parent = button

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = COLORS.CAT_SEL; button.TextColor3 = COLORS.TEXT
    end)
    button.MouseLeave:Connect(function()
        if not button.Selected then button.BackgroundColor3 = COLORS.CAT_BG; button.TextColor3 = COLORS.TEXT_MUTED end
    end)

    button.Selected = false

    button.MouseButton1Click:Connect(function()
        for _, btn in pairs(categoryButtons) do
            btn.Selected = false; btn.BackgroundColor3 = COLORS.CAT_BG; btn.TextColor3 = COLORS.TEXT_MUTED
        end
        button.Selected = true; button.BackgroundColor3 = COLORS.CAT_SEL; button.TextColor3 = COLORS.TEXT
        createCategoryContent(cat)
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

-- Logo toggle
LogoButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Notification
task.wait(1)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "🚀 Anonymes Hub v" .. VERSION,
    Text = "Raids payants + Gacha Élite activés !",
    Duration = 5
})

-- =============================================
-- On réinjecte les boucles auto qui manquaient
-- =============================================

-- FARM
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

-- KILL AURA / PVP / ATTACK
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

-- BOUNTY
spawn(function() while task.wait(5) do if toggles.autoBounty then cmd("Bounty") end end end)

-- BOSSES
local bossMap = {autoSeaBeast="SeaBeast", autoLeviathan="Leviathan", autoTerrorshark="Terrorshark", autoDoughKing="DoughKing", autoCakePrince="CakePrince", autoCyborg="Cyborg", autoRipIndra="RipIndra"}
spawn(function()
    while task.wait(3) do
        if toggles.autoAllBosses then cmd("FarmBosses")
        else for k, name in pairs(bossMap) do if toggles[k] then cmd("FarmBoss", name) end end end
    end
end)

-- RAID
spawn(function()
    while task.wait(3) do
        if toggles.autoRaid and selectedRaid then
            startRaid(selectedRaid.name)
        end
    end
end)

-- MATÉRIAUX
spawn(function()
    while task.wait(2) do
        if toggles.autoAllMaterials then cmd("FarmMaterials") end
        if toggles.autoBones then cmd("FarmBones") end
        if toggles.autoEctoplasm then cmd("FarmEctoplasm") end
        if toggles.autoCandy then cmd("FarmCandy") end
    end
end)

-- BOUTIQUE
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

-- FRUITS (collect)
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

-- FLY
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

-- INFINITE JUMP
local jumpCon = nil
spawn(function()
    while task.wait(1) do
        if toggles.infiniteJump then
            if not jumpCon then jumpCon = UserInputService.JumpRequest:Connect(function() local root = getRoot(); if root then root.Velocity = Vector3.new(root.Velocity.X, 50, root.Velocity.Z) end end) end
        else if jumpCon then jumpCon:Disconnect(); jumpCon = nil end end
    end
end)

-- NO CLIP
spawn(function() while task.wait(0.5) do if toggles.noClip then local c = getChar(); for _, p in pairs(c:GetChildren()) do if p:IsA("BasePart") then p.CanCollide = false end end end end end)

-- WALK ON WATER
spawn(function() while task.wait(0.3) do if toggles.walkOnWater then local root = getRoot(); if root and root.Position.Y < 0 then root.CFrame = CFrame.new(root.Position.X, 3, root.Position.Z) end end end end)

-- TELEPORT
spawn(function() while task.wait(5) do if toggles.teleportIsland then cmd("TeleportToIsland") end end end)

-- RACE / HAKI
spawn(function() while task.wait(5) do if toggles.autoRaceV4 then cmd("RaceV4") end; if toggles.autoObservation then cmd("ObservationV2") end; if toggles.autoKenHaki then cmd("KenHaki") end end end)

-- ESP
local espObjects = {}
local function addESP(obj, color, text)
    if espObjects[obj] then return end
    local bill = Instance.new("BillboardGui"); bill.Name = "AnonymesESP"; bill.Size = UDim2.new(0, 50, 0, 20); bill.Adornee = obj; bill.AlwaysOnTop = true
    local label = Instance.new("TextLabel", bill); label.Size = UDim2.new(1,0,1,0); label.BackgroundTransparency = 1; label.Text = text or obj.Name; label.TextColor3 = color; label.TextStrokeColor3 = Color3.new(0,0,0); label.TextStrokeTransparency = 0; label.TextSize = 14; label.Font = Enum.Font.GothamBold
    bill.Parent = player:WaitForChild("PlayerGui"); espObjects[obj] = bill
end
local function clearESP() for obj, bill in pairs(espObjects) do if bill and bill.Parent then bill:Destroy() end end; espObjects = {} end
spawn(function()
    while task.wait(1) do
        if toggles.fruitESP then for _, obj in pairs(workspace:GetChildren()) do if (obj:IsA("Tool") or obj.Name:find("Fruit")) and obj:FindFirstChild("Handle") then addESP(obj.Handle, Color3.fromRGB(255,100,0), "🍎 " .. obj.Name) end end end
        if toggles.chestESP then for _, obj in pairs(workspace:GetChildren()) do if obj.Name:find("Chest") and obj:IsA("Model") and obj:FindFirstChild("Handle") then addESP(obj.Handle, Color3.fromRGB(255,255,0), "💰 Chest") end end end
        if toggles.playerESP then for _, plr in pairs(Players:GetPlayers()) do if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then addESP(plr.Character.HumanoidRootPart, plr.TeamColor.Color, "👤 " .. plr.Name) end end end
        if not toggles.fruitESP and not toggles.chestESP and not toggles.playerESP then clearESP() end
    end
end)
