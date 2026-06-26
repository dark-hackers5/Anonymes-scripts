-- ANONYMES SCRIPTS HUB v13.0 | Blox Fruits | Auto Farm + Matériaux + Trade + PvP
local VERSION = "13.0"
local LOGO_URL = "rbxassetid://88742532715379"

-- ===== CHARGEMENT DELTA =====
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

-- ===== SERVICES =====
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
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

local LogoButton = Instance.new("ImageButton")
LogoButton.Size = UDim2.new(0, 44, 0, 44)
LogoButton.Position = UDim2.new(0, 8, 0, 8)
LogoButton.BackgroundColor3 = COLORS.BG_LIGHT
LogoButton.BackgroundTransparency = 0.3
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

local function getLevel()
    local s, l = pcall(function()
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("Level") then
            return tonumber(player.Data.Level.Value) or 0
        end
        return 0
    end)
    return s and l or 0
end

local function getFruit()
    local s, f = pcall(function()
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("DevilFruit") then
            return player.Data.DevilFruit.Value or "None"
        end
        return "None"
    end)
    return s and f or "None"
end

local function getBeli()
    local s, b = pcall(function()
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("Beli") then
            return tonumber(player.Data.Beli.Value) or 0
        end
        return 0
    end)
    return s and b or 0
end

local function getFragments()
    local s, f = pcall(function()
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("Fragments") then
            return tonumber(player.Data.Fragments.Value) or 0
        end
        return 0
    end)
    return s and f or 0
end

local function hasItem(itemName)
    local s, h = pcall(function()
        if player:FindFirstChild("Data") and player.Data:FindFirstChild("Inventory") then
            for _, item in pairs(player.Data.Inventory:GetChildren()) do
                if item:IsA("StringValue") and item.Value == itemName then
                    return true
                end
            end
        end
        return false
    end)
    return s and h or false
end

local function acceptQuest(questName)
    local s, r = pcall(function()
        return CommF:InvokeServer("StartQuest", questName, true)
    end)
    if s then
        notify("✅ Quête", questName, 2)
        return true
    end
    return false
end

local function getNearestMob()
    local root = getRoot()
    if not root then return nil, math.huge end
    local nearest, nearestDist = nil, math.huge
    if workspace:FindFirstChild("Enemies") then
        for _, mob in pairs(workspace.Enemies:GetChildren()) do
            if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                local dist = (root.Position - mob.HumanoidRootPart.Position).Magnitude
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
    local root = getRoot()
    if not root then return nil end
    local nearest, nearestDist = nil, math.huge
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (root.Position - plr.Character.HumanoidRootPart.Position).Magnitude
            if dist < nearestDist and dist <= 80 then
                nearest, nearestDist = plr, dist
            end
        end
    end
    return nearest
end

local function attackTarget(target)
    pcall(function()
        local root = getRoot()
        if not root or not target then return end
        local targetRoot = target:FindFirstChild("HumanoidRootPart")
        if not targetRoot then return end
        local dist = (root.Position - targetRoot.Position).Magnitude
        if dist > 15 then
            root.CFrame = CFrame.new(targetRoot.Position + Vector3.new(0, 5, 0))
            task.wait(0.1)
        end
        local dir = (targetRoot.Position - root.Position).Unit
        root.CFrame = CFrame.new(targetRoot.Position + (dir * -3)) * CFrame.Angles(0, math.pi, 0)
        VirtualUser:CaptureController()
        VirtualUser:Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(0.05)
        VirtualUser:Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end

local function tpTo(pos)
    local root = getRoot()
    if root then
        root.CFrame = CFrame.new(pos)
    end
end

-- ===== FONCTIONS D'ACHAT BOUTIQUE =====
local function buyItem(itemName)
    pcall(function()
        if hasItem(itemName) then
            notify("⚠️ Achat", "Tu as déjà " .. itemName, 2)
            return
        end
        CommF:InvokeServer("BuyItem", itemName)
        notify("✅ Achat", itemName .. " acheté !", 2)
    end)
end

-- ===== FONCTIONS PVP =====
local function doPvP()
    spawn(function()
        while toggles.autoPvP.Value or toggles.autoBounty.Value do
            pcall(function()
                local target = getNearestPlayer()
                if target and target.Character then
                    attackTarget(target.Character)
                    if toggles.autoBounty.Value then
                        CommF:InvokeServer("Bounty")
                    end
                end
            end)
            task.wait(0.3)
        end
    end)
end

-- ===== FONCTIONS TRADE =====
local function doTrade()
    spawn(function()
        while toggles.autoTrade.Value do
            pcall(function()
                local target = getNearestPlayer()
                if target and target.Character then
                    CommF:InvokeServer("RequestTrade", target)
                    notify("💱 Trade", "Demande envoyée à " .. target.Name, 2)
                else
                    notify("⚠️ Trade", "Aucun joueur à proximité", 2)
                end
            end)
            task.wait(10)
        end
    end)
end

-- ===== FONCTIONS FRUITS =====
local function storeFruit()
    pcall(function()
        local fruit = getFruit()
        if fruit ~= "None" then
            CommF:InvokeServer("StoreFruit", fruit)
            notify("📦 Fruit", fruit .. " stocké !", 2)
        end
    end)
end

local function buyRandomFruit()
    pcall(function()
        CommF:InvokeServer("BuyRandomFruit", "Random")
        notify("🎲 Fruit", "Fruit aléatoire acheté !", 2)
    end)
end

local function collectFruit()
    spawn(function()
        while toggles.autoCollectFruit.Value do
            pcall(function()
                if workspace:FindFirstChild("Fruits") then
                    for _, fruit in pairs(workspace.Fruits:GetChildren()) do
                        if fruit:FindFirstChild("HumanoidRootPart") then
                            local root = getRoot()
                            if root then
                                root.CFrame = fruit.HumanoidRootPart.CFrame
                                task.wait(0.3)
                                firetouchinterest(root, fruit:FindFirstChild("TouchInterest") or fruit, 0)
                                task.wait(0.1)
                                firetouchinterest(root, fruit:FindFirstChild("TouchInterest") or fruit, 1)
                                notify("🍎 Fruit", "Fruit collecté !", 2)
                            end
                        end
                    end
                end
            end)
            task.wait(2)
        end
    end)
end

-- ===== FONCTIONS MATÉRIAUX =====
local materialMobs = {
    Bones = {"Zombie", "Skeleton", "Ghost", "Living Zombie", "Demonic Soul", "Reborn Skeleton"},
    Ectoplasm = {"Ghost", "Demonic Soul", "Reborn Skeleton", "Ship Deckhand"},
    Candy = {"Candy Witch", "Candy Monster", "Cake Prince"},
    DarkFragment = {"Darkbeard", "RIP Indra", "Cursed Captain"},
    DragonScale = {"Dragon", "Dragon Boss", "Sea Dragon"},
    MagmaOre = {"Magma", "Magma Admiral", "Magma NPC"},
    AngelWings = {"Angel", "God's Guard", "Bishop"},
    Leather = {"Boar", "Wolf", "Bat", "Deer"},
    ScrapMetal = {"Factory Staff", "Ship Engineer", "Cyborg"},
    VampireFang = {"Vampire", "Demonic Soul", "Bat"},
    FishTail = {"Fishman", "Fishman Raider", "Fishman Lord"},
    Radioactive = {"Raider", "Radioactive", "Nuclear"}
}

local function farmMaterial(materialName)
    local _, mobs = getMaterialFromName(materialName)
    spawn(function()
        while toggles["auto" .. materialName].Value do
            pcall(function()
                local mob, dist = getNearestMob()
                if mob then
                    for _, mobName in ipairs(mobs) do
                        if mob.Name:find(mobName) then
                            attackTarget(mob)
                            break
                        end
                    end
                else
                    local root = getRoot()
                    if root then
                        root.CFrame = CFrame.new(math.random(-5000, 5000), 100, math.random(-5000, 5000))
                    end
                end
            end)
            task.wait(0.1)
        end
    end)
end

local function getMaterialFromName(materialName)
    for mat, mobs in pairs(materialMobs) do
        if mat:lower() == materialName:lower() then
            return mat, mobs
        end
    end
    return nil, {}
end

local function farmAllMaterials()
    spawn(function()
        while toggles.autoAllMaterials.Value do
            for matName, mobs in pairs(materialMobs) do
                if not toggles.autoAllMaterials.Value then break end
                pcall(function()
                    local mob, dist = getNearestMob()
                    if mob then
                        for _, mobName in ipairs(mobs) do
                            if mob.Name:find(mobName) then
                                attackTarget(mob)
                                break
                            end
                        end
                    end
                    if not mob then
                        local root = getRoot()
                        if root then
                            root.CFrame = CFrame.new(math.random(-6000, 6000), 100, math.random(-6000, 6000))
                        end
                    end
                end)
                task.wait(0.1)
            end
        end
    end)
end

-- ===== FONCTIONS AUTO LEVEL =====
local questData = {
    {name = "BanditQuest1", min = 1, max = 10, pos = CFrame.new(1060, 15, 1500)},
    {name = "PirateQuest1", min = 11, max = 50, pos = CFrame.new(-1000, 15, 2000)},
    {name = "MarineQuest1", min = 51, max = 100, pos = CFrame.new(2000, 15, -2000)},
    {name = "SkyBanditQuest1", min = 101, max = 200, pos = CFrame.new(-5000, 15, 3000)},
    {name = "DarkMasterQuest1", min = 201, max = 300, pos = CFrame.new(0, 15, -5000)},
    {name = "DiableQuest1", min = 301, max = 500, pos = CFrame.new(-2000, 15, -3000)},
    {name = "FishmanQuest1", min = 501, max = 700, pos = CFrame.new(3000, 15, -4000)},
    {name = "SkyQuest", min = 701, max = 800, pos = CFrame.new(-6000, 500, 2000)},
    {name = "PrisonQuest", min = 801, max = 900, pos = CFrame.new(5000, 500, -3000)},
    {name = "MagmaQuest", min = 901, max = 1000, pos = CFrame.new(-7000, 500, 4000)},
    {name = "UnderwaterQuest", min = 1001, max = 1100, pos = CFrame.new(4000, 500, -5000)},
    {name = "FountainQuest", min = 1101, max = 1200, pos = CFrame.new(-8000, 500, 5000)},
    {name = "HauntedQuest", min = 1201, max = 1300, pos = CFrame.new(6000, 500, -6000)},
    {name = "IceQuest", min = 1301, max = 1400, pos = CFrame.new(-9000, 500, 6000)},
    {name = "CursedShipQuest", min = 1401, max = 1500, pos = CFrame.new(7000, 500, -7000)},
    {name = "TikiQuest", min = 1501, max = 1600, pos = CFrame.new(-10000, 500, 7000)},
    {name = "CastleQuest", min = 1601, max = 1750, pos = CFrame.new(8000, 500, -8000)},
    {name = "FloatingTurtleQuest", min = 1751, max = 1900, pos = CFrame.new(-11000, 500, 8000)},
    {name = "MansionQuest", min = 1901, max = 2100, pos = CFrame.new(9000, 500, -9000)},
    {name = "SeaKingdomQuest", min = 2101, max = 2300, pos = CFrame.new(-12000, 500, 9000)},
    {name = "EndGameQuest", min = 2301, max = 2650, pos = CFrame.new(10000, 500, -10000)}
}

local function doAutoLevel()
    spawn(function()
        while toggles.autoLevel.Value do
            pcall(function()
                toggles.godMode:Set(true)
                local level = getLevel()
                for _, q in ipairs(questData) do
                    if not toggles.autoLevel.Value then break end
                    if level >= q.min and level <= q.max then
                        if acceptQuest(q.name) then
                            notify("📈 Niveau " .. level, "Farm: " .. q.name, 3)
                            for i = 1, 25 do
                                if not toggles.autoLevel.Value then break end
                                local mob = getNearestMob()
                                if mob then
                                    attackTarget(mob)
                                    task.wait(0.05)
                                else
                                    tpTo(q.pos.Position)
                                    task.wait(0.5)
                                end
                            end
                            level = getLevel()
                        end
                    end
                end
            end)
            task.wait(1)
        end
    end)
end

-- ===== FONCTIONS AUTO MASTERY =====
local function doAutoMastery()
    spawn(function()
        while toggles.autoMastery.Value do
            pcall(function()
                toggles.godMode:Set(true)
                local char = waitChar()
                local tool = char:FindFirstChildOfClass("Tool")
                if not tool then
                    for _, t in pairs(player.Backpack:GetChildren()) do
                        if t:IsA("Tool") then
                            t.Parent = char
                            tool = t
                            break
                        end
                    end
                end
                if tool then
                    local mob = getNearestMob()
                    if mob then
                        attackTarget(mob)
                    else
                        local root = getRoot()
                        if root then
                            root.CFrame = CFrame.new(math.random(-5000, 5000), 100, math.random(-5000, 5000))
                        end
                    end
                end
            end)
            task.wait(0.1)
        end
    end)
end

-- ===== FONCTIONS AUTO STATS =====
local function doAutoStats()
    spawn(function()
        while toggles.autoStats.Value do
            pcall(function()
                if player:FindFirstChild("Data") and player.Data:FindFirstChild("Stats") then
                    local points = player.Data.Stats.Points
                    if points and points.Value and points.Value > 0 then
                        local melee = player.Data.Stats.Melee
                        local defense = player.Data.Stats.Defense
                        if melee and defense then
                            local ratio = math.ceil(points.Value * 0.6)
                            for i = 1, ratio do
                                CommF:InvokeServer("AddPoint", "Melee", 1)
                            end
                            for i = 1, points.Value do
                                CommF:InvokeServer("AddPoint", "Defense", 1)
                            end
                            notify("📊 Stats", "Points attribués !", 2)
                        end
                    end
                end
            end)
            task.wait(3)
        end
    end)
end

-- ===== FONCTIONS BOSS =====
local bossList = {
    "Sea Beast", "Leviathan", "Terrorshark", "Pirate Raid",
    "Dough King", "Cake Prince", "Cyborg", "RIP Indra",
    "Darkbeard", "Cursed Captain", "Don Swan", "Order"
}

local function farmBosses()
    spawn(function()
        while toggles.autoAllBosses.Value do
            pcall(function()
                toggles.bossGodMode:Set(true)
                for _, bossName in ipairs(bossList) do
                    if not toggles.autoAllBosses.Value then break end
                    notify("👹 Boss", "Recherche: " .. bossName, 2)
                    local boss = getBoss(bossName)
                    if boss then
                        local root = getRoot()
                        if root then
                            root.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10)
                        end
                        while boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and toggles.autoAllBosses.Value do
                            attackTarget(boss)
                            task.wait(0.05)
                        end
                        notify("✅ Boss", bossName .. " vaincu !", 3)
                    else
                        local root = getRoot()
                        if root then
                            root.CFrame = CFrame.new(math.random(-6000, 6000), 100, math.random(-6000, 6000))
                        end
                    end
                    task.wait(2)
                end
            end)
            task.wait(1)
        end
    end)
end

-- ===== FONCTIONS SEA QUESTS =====
local seaQuestList = {"SeaBeastQuest", "LeviathanQuest", "TerrorsharkQuest", "PirateRaidQuest"}

local function farmSeaQuests()
    spawn(function()
        while toggles.autoSeaQuests.Value do
            pcall(function()
                toggles.godMode:Set(true)
                toggles.bossGodMode:Set(true)
                for _, qName in ipairs(seaQuestList) do
                    if not toggles.autoSeaQuests.Value then break end
                    if acceptQuest(qName) then
                        notify("🌊 Mer", "Farm: " .. qName, 3)
                        for i = 1, 20 do
                            if not toggles.autoSeaQuests.Value then break end
                            local mob = getNearestMob()
                            if mob then
                                attackTarget(mob)
                                task.wait(0.05)
                            else
                                local root = getRoot()
                                if root then
                                    root.CFrame = CFrame.new(math.random(-5000, 5000), 100, math.random(-5000, 5000))
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

-- ===== FONCTIONS ESP =====
local function doESP()
    spawn(function()
        while toggles.espPlayers.Value or toggles.espBoss.Value or toggles.espFruits.Value or toggles.espChests.Value do
            pcall(function()
                if toggles.espPlayers.Value then
                    for _, plr in pairs(Players:GetPlayers()) do
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
                                text.Text = plr.Name .. " [" .. math.floor((getRoot().Position - plr.Character.HumanoidRootPart.Position).Magnitude) .. "m]"
                                text.TextScaled = true
                                text.TextColor3 = COLORS.DANGER
                                text.BackgroundTransparency = 1
                                text.Font = Enum.Font.GothamBold
                                text.Parent = esp
                            end
                        end
                    end
                end
                if toggles.espBoss.Value and workspace:FindFirstChild("Enemies") then
                    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                        if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                            local isBoss = false
                            for _, bName in ipairs(bossList) do
                                if enemy.Name:find(bName) then
                                    isBoss = true
                                    break
                                end
                            end
                            if isBoss then
                                local esp = enemy:FindFirstChild("ESP_Boss")
                                if not esp then
                                    esp = Instance.new("BillboardGui")
                                    esp.Name = "ESP_Boss"
                                    esp.Size = UDim2.new(0, 200, 0, 50)
                                    esp.StudsOffset = Vector3.new(0, 3, 0)
                                    esp.Adornee = enemy.HumanoidRootPart
                                    esp.Parent = enemy.HumanoidRootPart
                                    local text = Instance.new("TextLabel")
                                    text.Size = UDim2.new(1, 0, 1, 0)
                                    text.Text = "👹 " .. enemy.Name .. " [" .. math.floor(enemy.Humanoid.Health) .. "HP]"
                                    text.TextScaled = true
                                    text.TextColor3 = COLORS.WARNING
                                    text.BackgroundTransparency = 1
                                    text.Font = Enum.Font.GothamBold
                                    text.Parent = esp
                                end
                            end
                        end
                    end
                end
                if toggles.espFruits.Value and workspace:FindFirstChild("Fruits") then
                    for _, fruit in pairs(workspace.Fruits:GetChildren()) do
                        local esp = fruit:FindFirstChild("ESP_Fruit")
                        if not esp and fruit:FindFirstChild("HumanoidRootPart") then
                            esp = Instance.new("BillboardGui")
                            esp.Name = "ESP_Fruit"
                            esp.Size = UDim2.new(0, 200, 0, 50)
                            esp.StudsOffset = Vector3.new(0, 2, 0)
                            esp.Adornee = fruit.HumanoidRootPart
                            esp.Parent = fruit.HumanoidRootPart
                            local text = Instance.new("TextLabel")
                            text.Size = UDim2.new(1, 0, 1, 0)
                            text.Text = "🍎 Fruit"
                            text.TextScaled = true
                            text.TextColor3 = COLORS.SHOP
                            text.BackgroundTransparency = 1
                            text.Font = Enum.Font.GothamBold
                            text.Parent = esp
                        end
                    end
                end
            end)
            task.wait(1)
        end
    end)
end

-- ===== FONCTIONS GOD MODE =====
local function enableGodMode()
    spawn(function()
        while toggles.godMode.Value do
            pcall(function()
                local char = waitChar()
                if char and char:FindFirstChild("Humanoid") then
                    char.Humanoid.Health = math.huge
                    char.Humanoid.MaxHealth = math.huge
                    if not godModeConnected then
                        godModeConnected = true
                        char.Humanoid.HealthChanged:Connect(function()
                            if toggles.godMode.Value and char.Humanoid then
                                char.Humanoid.Health = math.huge
                            end
                        end)
                    end
                end
            end)
            task.wait(0.1)
        end
    end)
end

local function enableBossGodMode()
    spawn(function()
        while toggles.bossGodMode.Value do
            pcall(function()
                local char = waitChar()
                if char and char:FindFirstChild("Humanoid") then
                    char.Humanoid.Health = math.huge
                    char.Humanoid.MaxHealth = math.huge
                    if not bossGodModeConnected then
                        bossGodModeConnected = true
                        char.Humanoid.HealthChanged:Connect(function()
                            if toggles.bossGodMode.Value and char.Humanoid then
                                char.Humanoid.Health = math.huge
                            end
                        end)
                    end
                end
            end)
            task.wait(0.1)
        end
    end)
end

-- ===== FONCTIONS TAILLE =====
local function applySize(sizeName)
    currentSize = sizeName
    local size = SIZES[sizeName]
    MainFrame.Size = size.window
    MainFrame.Position = UDim2.new(0.5, -size.window.X.Offset / 2, 0.5, -size.window.Y.Offset / 2)
    TitleBar.Size = UDim2.new(1, 0, 0, size.titleBar)
    CloseButton.Position = UDim2.new(1, -35, 0, (size.titleBar - 30) / 2)
    ContentFrame.Size = UDim2.new(1, 0, 1, -size.titleBar)
    ContentFrame.Position = UDim2.new(0, 0, 0, size.titleBar)
    for _, btn in pairs(categoryButtons) do
        btn.TextSize = size.catText
    end
    for _, child in pairs(ContentScroll:GetChildren()) do
        if child:IsA("Frame") then
            for _, btn in pairs(child:GetDescendants()) do
                if btn:IsA("TextButton") then
                    btn.TextSize = size.btnText
                    btn.Size = UDim2.new(1, -20, 0, size.btnHeight)
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

-- ===== CRÉATION BOUTONS =====
local function createToggleButton(name, toggleKey, parent, isVIP)
    local button = Instance.new("TextButton")
    button.Name = toggleKey .. "Button"
    button.Size = UDim2.new(1, -20, 0, SIZES[currentSize].btnHeight)
    button.Text = name .. ": OFF"
    button.TextSize = SIZES[currentSize].btnText
    button.TextColor3 = isVIP and COLORS.VIP or COLORS.TEXT
    button.BackgroundColor3 = COLORS.BTN_OFF
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
    local function update()
        button.Text = name .. ": " .. (toggles[toggleKey].Value and "ON" or "OFF")
        button.BackgroundColor3 = toggles[toggleKey].Value and COLORS.BTN_ON or COLORS.BTN_OFF
    end
    toggles[toggleKey]:Connect(function() update() end)
    button.MouseButton1Click:Connect(function() toggles[toggleKey]:Toggle() end)
    update()
    return button
end

-- ===== AFFICHAGE CATÉGORIES =====
local function displayCategoryContent(categoryName)
    for _, child in pairs(ContentScroll:GetChildren()) do child:Destroy() end

    local mainContainer = Instance.new("Frame")
    mainContainer.Size = UDim2.new(1, 0, 0, 0)
    mainContainer.BackgroundTransparency = 1
    mainContainer.Parent = ContentScroll

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 5)
    layout.Parent = mainContainer

    local catTitle = Instance.new("TextLabel")
    catTitle.Size = UDim2.new(1, 0, 0, SIZES[currentSize].titleBar - 10)
    catTitle.BackgroundTransparency = 1
    catTitle.Text = categoryName:upper()
    catTitle.TextSize = SIZES[currentSize].btnText + 2
    catTitle.TextColor3 = COLORS.PRIMARY
    catTitle.Font = Enum.Font.GothamBold
    catTitle.TextXAlignment = Enum.TextXAlignment.Left
    catTitle.Parent = mainContainer

    local titlePad = Instance.new("UIPadding")
    titlePad.PaddingLeft = UDim.new(0, 10)
    titlePad.Parent = catTitle

    local buttonsContainer = Instance.new("Frame")
    buttonsContainer.Size = UDim2.new(1, 0, 0, 0)
    buttonsContainer.BackgroundTransparency = 1
    buttonsContainer.Parent = mainContainer

    local buttonsLayout = Instance.new("UIListLayout")
    buttonsLayout.Padding = UDim.new(0, 5)
    buttonsLayout.Parent = buttonsContainer

    if categoryName == "farm" then
        createToggleButton("Auto Level", "autoLevel", buttonsContainer, true)
        createToggleButton("Auto Farm (Quêtes)", "autoFarm", buttonsContainer, true)
        createToggleButton("Auto Maîtrise", "autoMastery", buttonsContainer, true)
        createToggleButton("Auto Stats", "autoStats", buttonsContainer, true)
        createToggleButton("Auto Plus Proche", "autoNearest", buttonsContainer)
    elseif categoryName == "combat" then
        createToggleButton("Kill Aura", "killAura", buttonsContainer)
        createToggleButton("Trigger Bot", "triggerBot", buttonsContainer)
        createToggleButton("Auto Attack", "autoAttack", buttonsContainer)
    elseif categoryName == "bosses" then
        createToggleButton("Tous les Boss", "autoAllBosses", buttonsContainer, true)
        createToggleButton("Sea Beast", "autoSeaBeast", buttonsContainer)
        createToggleButton("Leviathan", "autoLeviathan", buttonsContainer)
        createToggleButton("Terrorshark", "autoTerrorshark", buttonsContainer)
        createToggleButton("Pirate Raid", "autoPirateRaid", buttonsContainer)
        createToggleButton("Dough King", "autoDoughKing", buttonsContainer)
        createToggleButton("Cake Prince", "autoCakePrince", buttonsContainer)
        createToggleButton("Cyborg", "autoCyborg", buttonsContainer)
        createToggleButton("RIP Indra", "autoRipIndra", buttonsContainer)
    elseif categoryName == "mer" then
        createToggleButton("Quêtes de Mer", "autoSeaQuests", buttonsContainer, true)
        createToggleButton("Tous Boss de Mer", "autoAllBosses", buttonsContainer, true)
        createToggleButton("Invincible Boss", "bossGodMode", buttonsContainer, true)
    elseif categoryName == "matériaux" then
        createToggleButton("TOUS Matériaux", "autoAllMaterials", buttonsContainer, true)
        createToggleButton("Os (Bones)", "autoBones", buttonsContainer)
        createToggleButton("Ectoplasme", "autoEctoplasm", buttonsContainer)
        createToggleButton("Bonbons (Candy)", "autoCandy", buttonsContainer)
        createToggleButton("Fragment Sombre", "autoDarkFragment", buttonsContainer)
        createToggleButton("Écaille Dragon", "autoDragonScale", buttonsContainer)
        createToggleButton("Minerai Magma", "autoMagmaOre", buttonsContainer)
        createToggleButton("Ailes d'Ange", "autoAngelWings", buttonsContainer)
        createToggleButton("Cuir", "autoLeather", buttonsContainer)
        createToggleButton("Ferraille", "autoScrapMetal", buttonsContainer)
        createToggleButton("Croc Vampire", "autoVampireFang", buttonsContainer)
        createToggleButton("Queue Poisson", "autoFishTail", buttonsContainer)
        createToggleButton("Radioactif", "autoRadioactive", buttonsContainer)
    elseif categoryName == "boutique" then
        createToggleButton("TOUTES Épées", "buyAllSwords", buttonsContainer, true)
        createToggleButton("TOUS Guns", "buyAllGuns", buttonsContainer, true)
        createToggleButton("Cutlass", "buyCutlass", buttonsContainer)
        createToggleButton("Katana", "buyKatana", buttonsContainer)
        createToggleButton("Dual Katana", "buyDualKatana", buttonsContainer)
        createToggleButton("Longsword", "buyLongsword", buttonsContainer)
        createToggleButton("Flintlock", "buyFlintlock", buttonsContainer)
        createToggleButton("Musket", "buyMusket", buttonsContainer)
        createToggleButton("Blunderbuss", "buyBlunderbuss", buttonsContainer)
        createToggleButton("Cannon", "buyCannon", buttonsContainer)
        createToggleButton("Refined Slingshot", "buyRefinedSlingshot", buttonsContainer)
        createToggleButton("Dual Flintlock", "buyDualFlintlock", buttonsContainer)
        createToggleButton("Bisento", "buyBisento", buttonsContainer)
    elseif categoryName == "craft" then
        createToggleButton("Craft Tout", "autoCraftAll", buttonsContainer, true)
        createToggleButton("Upgrade Tout", "autoUpgradeAll", buttonsContainer, true)
    elseif categoryName == "fruits" then
        createToggleButton("Collecter Fruit", "autoCollectFruit", buttonsContainer, true)
        createToggleButton("Stocker Fruit", "autoStoreFruit", buttonsContainer)
        createToggleButton("Achat Aléatoire", "autoRandomFruit", buttonsContainer)
    elseif categoryName == "trade" then
        createToggleButton("Auto Trade", "autoTrade", buttonsContainer, true)
        createToggleButton("Accepter Trade", "autoAcceptTrade", buttonsContainer)
    elseif categoryName == "pvp" then
        createToggleButton("Auto PvP", "autoPvP", buttonsContainer, true)
        createToggleButton("Auto Bounty", "autoBounty", buttonsContainer, true)
        createToggleButton("Kill Aura", "killAura", buttonsContainer)
    elseif categoryName == "défense" then
        createToggleButton("Anti Kick", "antiKick", buttonsContainer)
        createToggleButton("Anti Stun", "antiStun", buttonsContainer)
        createToggleButton("God Mode", "godMode", buttonsContainer, true)
        createToggleButton("God Mode Boss", "bossGodMode", buttonsContainer, true)
    elseif categoryName == "esp" then
        createToggleButton("ESP Joueurs", "espPlayers", buttonsContainer)
        createToggleButton("ESP Boss", "espBoss", buttonsContainer)
        createToggleButton("ESP Fruits", "espFruits", buttonsContainer)
        createToggleButton("ESP Coffres", "espChests", buttonsContainer)
    elseif categoryName == "déplacement" then
        createToggleButton("Vol (Fly)", "fly", buttonsContainer)
        createToggleButton("Saut Infini", "infiniteJump", buttonsContainer)
        createToggleButton("No Clip", "noClip", buttonsContainer)
        createToggleButton("Marcher sur l'Eau", "walkOnWater", buttonsContainer)
        createToggleButton("Vitesse Bateau", "boatSpeed", buttonsContainer)
    elseif categoryName == "paramètres" then
        createToggleButton("Petit", "sizeSmall", buttonsContainer)
        createToggleButton("Moyen", "sizeMedium", buttonsContainer)
        createToggleButton("Grand", "sizeLarge", buttonsContainer)
        createToggleButton("FPS Boost", "fpsBoost", buttonsContainer)
        createToggleButton("Écran Blanc", "whiteScreen", buttonsContainer)
        createToggleButton("Auto Rejoin", "autoRejoin", buttonsContainer)
        createToggleButton("Server Hop", "serverHop", buttonsContainer)
    end
end

-- ===== BOUTONS CATÉGORIES =====
for i, cat in ipairs(categories) do
    local button = Instance.new("TextButton")
    button.Name = cat.name .. "Button"
    button.Size = UDim2.new(0, 0, 1, -5)
    button.AutomaticSize = Enum.AutomaticSize.X
    button.Text = cat.icon .. " " .. cat.name
    button.TextSize = SIZES.medium.catText
    button.TextColor3 = COLORS.TEXT_MUTED
    button.BackgroundColor3 = COLORS.CAT_BG
    button.Font = Enum.Font.GothamBold
    button.ZIndex = 10
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
        displayCategoryContent(cat.name)
    end)
    table.insert(categoryButtons, button)
end

if #categoryButtons > 0 then
    categoryButtons[1].Selected = true
    categoryButtons[1].BackgroundColor3 = COLORS.CAT_SEL
    categoryButtons[1].TextColor3 = COLORS.TEXT
    displayCategoryContent(categories[1].name)
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

CloseButton.MouseButton1Click:Connect(function() MainFrame.Visible = false end)

-- ===== CONNEXIONS TOGGLES =====
toggles.killAura:Connect(function(v)
    if v then
        spawn(function()
            while toggles.killAura.Value do
                pcall(function()
                    local target = getNearestPlayer()
                    if target and target.Character then attackTarget(target.Character) end
                end)
                task.wait(0.2)
            end
        end)
    end
end)

toggles.autoAttack:Connect(function(v)
    if v then
        spawn(function()
            while toggles.autoAttack.Value do
                pcall(function()
                    local mob = getNearestMob()
                    if mob then attackTarget(mob) end
                end)
                task.wait(0.3)
            end
        end)
    end
end)

toggles.autoPvP:Connect(function(v) if v then doPvP() end end)
toggles.autoBounty:Connect(function(v) if v then doPvP() end end)
toggles.autoLevel:Connect(function(v) if v then doAutoLevel() end end)
toggles.autoMastery:Connect(function(v) if v then doAutoMastery() end end)
toggles.autoStats:Connect(function(v) if v then doAutoStats() end end)
toggles.autoSeaQuests:Connect(function(v) if v then farmSeaQuests() end end)
toggles.autoAllBosses:Connect(function(v) if v then farmBosses() end end)
toggles.autoAllMaterials:Connect(function(v) if v then farmAllMaterials() end end)

for matName, _ in pairs(materialMobs) do
    local key = "auto" .. matName
    if toggles[key] then
        toggles[key]:Connect(function(v) if v then farmMaterial(matName) end end)
    end
end

local swordList = {"Cutlass", "Katana", "Dual Katana", "Longsword", "Iron Mace", "Pipe", "Triple Katana", "Dual-Headed Blade", "Bisento", "Soul Cane"}
local gunList = {"Flintlock", "Musket", "Blunderbuss", "Cannon", "Refined Slingshot", "Dual Flintlock", "Magma Blaster"}

local function buyAllSwords()
    spawn(function()
        while toggles.buyAllSwords.Value do
            for _, sword in ipairs(swordList) do
                if not toggles.buyAllSwords.Value then break end
                buyItem(sword)
                task.wait(1.5)
            end
            notify("✅ Épées", "Toutes achetées !", 3)
            toggles.buyAllSwords:Set(false)
        end
    end)
end

local function buyAllGuns()
    spawn(function()
        while toggles.buyAllGuns.Value do
            for _, gun in ipairs(gunList) do
                if not toggles.buyAllGuns.Value then break end
                buyItem(gun)
                task.wait(1.5)
            end
            notify("✅ Guns", "Tous achetés !", 3)
            toggles.buyAllGuns:Set(false)
        end
    end)
end

toggles.buyAllSwords:Connect(function(v) if v then buyAllSwords() end end)
toggles.buyAllGuns:Connect(function(v) if v then buyAllGuns() end end)

local individualBuys = {
    buyCutlass = "Cutlass", buyKatana = "Katana", buyDualKatana = "Dual Katana",
    buyLongsword = "Longsword", buyFlintlock = "Flintlock", buyMusket = "Musket",
    buyBlunderbuss = "Blunderbuss", buyCannon = "Cannon",
    buyRefinedSlingshot = "Refined Slingshot", buyDualFlintlock = "Dual Flintlock",
    buyBisento = "Bisento"
}

for key, itemName in pairs(individualBuys) do
    if toggles[key] then
        toggles[key]:Connect(function(v)
            if v then buyItem(itemName) toggles[key]:Set(false) end
        end)
    end
end

toggles.autoStoreFruit:Connect(function(v) if v then storeFruit() toggles.autoStoreFruit:Set(false) end end)
toggles.autoRandomFruit:Connect(function(v) if v then buyRandomFruit() toggles.autoRandomFruit:Set(false) end end)
toggles.autoCollectFruit:Connect(function(v) if v then collectFruit() end end)
toggles.autoTrade:Connect(function(v) if v then doTrade() end end)
toggles.godMode:Connect(function(v) if v then enableGodMode() end end)
toggles.bossGodMode:Connect(function(v) if v then enableBossGodMode() end end)
toggles.espPlayers:Connect(function(v) if v then doESP() end end)
toggles.espBoss:Connect(function(v) if v then doESP() end end)
toggles.espFruits:Connect(function(v) if v then doESP() end end)
toggles.espChests:Connect(function(v) if v then doESP() end end)

toggles.antiKick:Connect(function(v)
    if v then
        spawn(function()
            while toggles.antiKick.Value do
                pcall(function()
                    if player:FindFirstChild("Data") and player.Data:FindFirstChild("Kick") then
                        player.Data.Kick:Destroy()
                    end
                end)
                task.wait(1)
            end
        end)
    end
end)

toggles.infiniteJump:Connect(function(v)
    if v then
        local UserInputService = game:GetService("UserInputService")
        UserInputService.JumpRequest:Connect(function()
            if toggles.infiniteJump.Value then
                local char = waitChar()
                if char and char:FindFirstChild("Humanoid") then
                    char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
    end
end)

toggles.fly:Connect(function(v)
    if v then
        spawn(function()
            local bodyGyro = Instance.new("BodyGyro")
            local bodyVelocity = Instance.new("BodyVelocity")
            while toggles.fly.Value do
                pcall(function()
                    local root = getRoot()
                    if not root then task.wait(0.1) return end
                    bodyGyro.Parent = root
                    bodyGyro.MaxTorque = Vector3.new(9e5, 9e5, 9e5)
                    bodyGyro.CFrame = root.CFrame
                    bodyVelocity.Parent = root
                    bodyVelocity.MaxForce = Vector3.new(9e5, 9e5, 9e5)
                    bodyVelocity.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50
                end)
                task.wait()
            end
            bodyGyro:Destroy()
            bodyVelocity:Destroy()
        end)
    end
end)

toggles.walkOnWater:Connect(function(v)
    if v then
        spawn(function()
            while toggles.walkOnWater.Value do
                pcall(function()
                    local root = getRoot()
                    if root and root.Position.Y < 0 then
                        root.CFrame = root.CFrame + Vector3.new(0, 5, 0)
                    end
                end)
                task.wait(0.1)
            end
        end)
    end
end)

toggles.noClip:Connect(function(v)
    if v then
        spawn(function()
            while toggles.noClip.Value do
                pcall(function()
                    local char = waitChar()
                    if char then
                        for _, part in pairs(char:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                end)
                task.wait(0.5)
            end
        end)
    end
end)

toggles.sizeSmall:Connect(function(v)
    if v then applySize("small") toggles.sizeMedium:Set(false) toggles.sizeLarge:Set(false) end
end)
toggles.sizeMedium:Connect(function(v)
    if v then applySize("medium") toggles.sizeSmall:Set(false) toggles.sizeLarge:Set(false) end
end)
toggles.sizeLarge:Connect(function(v)
    if v then applySize("large") toggles.sizeSmall:Set(false) toggles.sizeMedium:Set(false) end
end)

toggles.fpsBoost:Connect(function(v)
    if v then
        spawn(function()
            while toggles.fpsBoost.Value do
                pcall(function()
                    game:GetService("Lighting").GlobalShadows = false
                    game:GetService("Lighting").Technology = Enum.Technology.Compatibility
                    workspace.Terrain.WaterWaveSize = 0
                    workspace.Terrain.WaterWaveSpeed = 0
                end)
                task.wait(5)
            end
        end)
    end
end)

toggles.whiteScreen:Connect(function(v)
    if v then
        spawn(function()
            while toggles.whiteScreen.Value do
                pcall(function()
                    local gui = player:FindFirstChild("PlayerGui"):FindFirstChild("WhiteScreen")
                    if not gui then
                        gui = Instance.new("ScreenGui")
                        gui.Name = "WhiteScreen"
                        gui.Parent = player:WaitForChild("PlayerGui")
                        local frame = Instance.new("Frame")
                        frame.Size = UDim2.new(1, 0, 1, 0)
                        frame.BackgroundColor3 = Color3.new(1, 1, 1)
                        frame.BackgroundTransparency = 0.9
                        frame.ZIndex = 999
                        frame.Parent = gui
                    end
                end)
                task.wait(5)
            end
        end)
    end
end)

toggles.serverHop:Connect(function(v)
    if v then
        spawn(function()
            while toggles.serverHop.Value do
                pcall(function()
                    local tps = game:GetService("TeleportService")
                    local placeId = game.PlaceId
                    local servers = {}
                    local success, response = pcall(function()
                        return game:GetService("HttpService"):JSONDecode(
                            game:HttpGetAsync("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?limit=100")
                        ).data
                    end)
                    if success then
                        for _, server in pairs(response) do
                            if server.playing < server.maxPlayers then
                                table.insert(servers, server.id)
                            end
                        endfor _, server in pairs(response) do
                            if server.playing < server.maxPlayers then
                                table.insert(servers, server.id)
                            end
                        end
                        if #servers > 0 then
                            tps:TeleportToPlaceInstance(placeId, servers[math.random(1, #servers)], player)
                        end
                    end
                end)
                task.wait(30)
            end
        end)
    end
end)

toggles.autoRejoin:Connect(function(v)
    if v then
        spawn(function()
            while toggles.autoRejoin.Value do
                pcall(function()
                    local char = player.Character
                    if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then
                        task.wait(3)
                        player:LoadCharacter()
                        notify("🔄 Rejoin", "Personnage respawn", 2)
                    end
                end)
                task.wait(5)
            end
        end)
    end
end)

-- ===== NOTIFICATION DE DÉMARRAGE =====
notify("🚀 Anonymes Hub v" .. VERSION, "Script chargé ! Clique sur le logo pour ouvrir.", 5)

-- ===== BOUCLE PRINCIPALE DE MISE À JOUR =====
spawn(function()
    while true do
        pcall(function()
            currentLevel = getLevel()
            currentFruit = getFruit()
        end)
        task.wait(5)
    end
end)
