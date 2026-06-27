-- =============================================
-- ANONYMES SCRIPT v2.0 | BLOX FRUITS
-- VERSION CORRIGÉE - Menu visible
-- =============================================
local SCRIPT_VERSION = "2.0"

-- SERVICES
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local VU = game:GetService("VirtualUser")
local UIS = game:GetService("UserInputService")
local RunS = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local plr = Players.LocalPlayer
repeat task.wait() until plr.Character
local char = plr.Character
local hum = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

local Remotes = RS:WaitForChild("Remotes")
local CF = Remotes:WaitForChild("CommF_")
local CE = Remotes:WaitForChild("CommE_")

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

spawn(function() while task.wait(30) do pcall(function() VU:ClickButton2(Vector2.new()) local r = getR(); if r then r.Velocity = Vector3.new(0,0.1,0) end end) end end)

-- TOGGLES
local T = {}
local toggleList = {
    "autoFarm","autoLevel","autoMastery","autoStats","autoQuest","autoChest","autoBeli","autoDungeon",
    "autoBoss","autoElite","autoRaid","autoSeaBeast","autoTerrorshark","autoLeviathan","autoShipRaid",
    "autoRoughSea","autoKitsune","autoFactory","autoCastle","autoAllBosses",
    "autoBounty","autoPvP","killAura","fastAttack","noCooldown","godMode",
    "autoCollectFruit","autoStoreFruit","autoRandomFruit","autoFruitSniper","autoFruitRain",
    "autoBones","autoEctoplasm","autoCandy","autoAllMaterials","autoFragments",
    "autoRaceV2","autoRaceV3","autoRaceV4","autoObservation","autoKenHaki","autoHakiColor",
    "autoYama","autoTushita","autoCDK","autoSoulGuitar","autoGodhuman","autoSuperhuman",
    "autoBartilo","autoCitizen","autoFlowerQuest","autoMirage",
    "fly","infiniteJump","noClip","walkOnWater","speed",
    "fruitESP","chestESP","playerESP","enemyESP","islandESP","shipESP",
    "antiBan","autoRejoin","autoServerHop","fpsBoost",
    "autoRaidChip","autoRaidStart","autoRaidFarm",
    "autoBuySwords","autoBuyGuns","autoBuyFightingStyles","autoBuyAccessories","autoBuyBoats",
    "autoBuyFruits","autoUpgradeSword","autoUpgradeGun","autoUpgradeFightingStyle",
    "autoFishing","autoFishFarm","autoSummonBoat","autoDriveBoat","autoBoatSpeed",
}
for _, k in ipairs(toggleList) do T[k] = false end

local BOSSES = {"Gorilla King","Vice Admiral","Saber Expert","Magma Admiral","Cursed Captain","Don Swan","Order","RIP Indra","Dough King","Cake Prince","Sea Beast","Leviathan","Terrorshark","Cyborg","Stone","Island Empress","Kilo Admiral","Captain Elephant","Beautiful Pirate","Soul Reaper","Cake Queen","Tyrant of the Skies"}
for _, b in ipairs(BOSSES) do T["boss_"..b:gsub(" ","")] = false end

-- ÎLES
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
    {"Graveyard", Vector3.new(2883.1, 60.2, -12054.8)},
    {"Snow Mountain", Vector3.new(1004.6, 90.2, -13025.3)},
    {"Port Town", Vector3.new(-1286.4, 22.5, 12288.5)},
    {"Hydra Island", Vector3.new(5224.5, 86.5, -1932.5)},
    {"Great Tree", Vector3.new(2555.1, 92.5, -2200.5)},
    {"Floating Turtle", Vector3.new(-697.3, 145.5, 13970.8)},
    {"Haunted Castle", Vector3.new(-9515.3, 315.8, -6960.7)},
    {"Sea of Treats", Vector3.new(1162.4, 138.5, 20360.2)},
    {"Tiki Outpost", Vector3.new(-11308.8, 108.5, 8084.8)},
    {"Submerged Island", Vector3.new(-6011.7, 28.5, -11522.8)},
}
local ISLAND_NAMES = {}
for _, v in ipairs(ISLANDS) do ISLAND_NAMES[v[1]] = v[2] end

-- BOUCLES AUTOMATION
spawn(function()
    while task.wait(0.3) do
        pcall(function()
            if T.autoFarm or T.autoLevel then
                local lv = getLv()
                for _, e in pairs(workspace.Enemies:GetChildren()) do
                    if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 and e:FindFirstChild("HumanoidRootPart") then
                        attackTarget(e); break
                    end
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
        end)
    end
end)

spawn(function()
    while task.wait(0.15) do
        pcall(function()
            if T.killAura then
                for _, e in pairs(workspace.Enemies:GetChildren()) do
                    if e:FindFirstChild("Humanoid") and e:FindFirstChild("HumanoidRootPart") and e.Humanoid.Health > 0 then
                        attackTarget(e)
                    end
                end
            end
        end)
    end
end)

-- GOD MODE
local godCons = {}
local function enableG()
    if #godCons > 0 then return end
    local h = getH(); if not h then return end
    table.insert(godCons, RunS.Heartbeat:Connect(function()
        if T.godMode and h and h.Health > 0 then h.Health = h.MaxHealth end
    end))
    table.insert(godCons, h.HealthChanged:Connect(function()
        if T.godMode and h and h.Health < h.MaxHealth and h.Health > 0 then h.Health = h.MaxHealth end
    end))
end
local function disableG() for _, c in ipairs(godCons) do pcall(c.Disconnect, c) end; godCons = {} end

-- FLY
local flying, bg, bv = false, nil, nil
local jumpCon = nil
spawn(function()
    while task.wait(0.1) do
        pcall(function()
            local r = getR(); if not r then return end
            if T.fly then
                if not flying then
                    flying = true; bg = Instance.new("BodyGyro", r); bg.MaxTorque = Vector3.new(0, math.huge, 0); bg.P = 10000
                    bv = Instance.new("BodyVelocity", r); bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge); bv.Velocity = Vector3.new(0, 0, 0)
                end
                local d = Vector3.new((UIS:IsKeyDown(Enum.KeyCode.D) and 1 or 0)-(UIS:IsKeyDown(Enum.KeyCode.A) and 1 or 0),(UIS:IsKeyDown(Enum.KeyCode.Space) and 1 or 0)-(UIS:IsKeyDown(Enum.KeyCode.LeftShift) and 1 or 0),(UIS:IsKeyDown(Enum.KeyCode.W) and -1 or 0)-(UIS:IsKeyDown(Enum.KeyCode.S) and -1 or 0))
                r.Velocity = d * (T.speed and 100 or 50)
            elseif flying then
                flying = false; if bg then bg:Destroy() end; if bv then bv:Destroy() end; bg, bv = nil, nil
            end
            if T.infiniteJump then
                if not jumpCon then jumpCon = UIS.JumpRequest:Connect(function() local rr = getR(); if rr then rr.Velocity = Vector3.new(rr.Velocity.X, 50, rr.Velocity.Z) end end) end
            elseif jumpCon then jumpCon:Disconnect(); jumpCon = nil end
            if T.walkOnWater and r.Position.Y < 0 then r.CFrame = CFrame.new(r.Position.X, 3, r.Position.Z) end
        end)
    end
end)

local function tpToIsland(name)
    local pos = ISLAND_NAMES[name]
    if pos then tweenTo(pos) end
end

-- =============================================
-- UI
-- =============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AnonymeHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = plr:WaitForChild("PlayerGui")

-- LOGO VIOLET
local Logo = Instance.new("ImageButton")
Logo.Parent = ScreenGui
Logo.Size = UDim2.new(0,70,0,70)
Logo.Position = UDim2.new(0.05,0,0.45,0)
Logo.BackgroundColor3 = Color3.fromRGB(15,15,30)
Logo.BackgroundTransparency = 0.2
Logo.Image = "rbxassetid://73393542095412"
Logo.Draggable = true
Logo.Active = true
local Corner = Instance.new("UICorner"); Corner.CornerRadius = UDim.new(1,0); Corner.Parent = Logo
local Stroke = Instance.new("UIStroke"); Stroke.Parent = Logo; Stroke.Color = Color3.fromRGB(170,0,255); Stroke.Thickness = 3
local Glow = Instance.new("UIGradient"); Glow.Parent = Stroke
Glow.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(120,0,255))}

-- TEXTE DE SECOURS
local Fallback = Instance.new("TextLabel", Logo)
Fallback.Size = UDim2.new(1,0,1,0); Fallback.BackgroundTransparency = 1
Fallback.Text = "AS"; Fallback.TextColor3 = Color3.fromRGB(255,255,255)
Fallback.TextSize = 24; Fallback.Font = Enum.Font.GothamBold
Fallback.Visible = false
task.spawn(function() task.wait(3)
    if Logo.ImageContentId == "" or Logo.ImageContentId == "rbxassetid://0" then
        Fallback.Visible = true; Logo.Image = ""
    end
end)

-- MENU (visible au départ pour test)
local Menu = Instance.new("Frame"); Menu.Parent = ScreenGui
Menu.Size = UDim2.new(0,380,0,500)
Menu.Position = UDim2.new(0.5,-190,0.5,-250)
Menu.BackgroundColor3 = Color3.fromRGB(10,10,25)
Menu.Visible = true  -- ← visible directement !
Menu.Active = true
Menu.Draggable = true
local MenuCorner = Instance.new("UICorner"); MenuCorner.CornerRadius = UDim.new(0,12); MenuCorner.Parent = Menu
local MenuStroke = Instance.new("UIStroke", Menu); MenuStroke.Color = Color3.fromRGB(170,0,255); MenuStroke.Thickness = 1.5; MenuStroke.Transparency = 0.3

-- TITRE
local Title = Instance.new("TextLabel", Menu)
Title.Size = UDim2.new(1,-20,0,40); Title.Position = UDim2.new(0,10,0,5)
Title.Text = "◆ ANONYMES SCRIPT ◆ v"..SCRIPT_VERSION
Title.TextSize = 16; Title.TextColor3 = Color3.fromRGB(220,220,255)
Title.BackgroundTransparency = 1; Title.Font = Enum.Font.GothamBold

-- BOUTON FERMER
local CloseBtn = Instance.new("TextButton", Menu)
CloseBtn.Size = UDim2.new(0,30,0,30); CloseBtn.Position = UDim2.new(1,-40,0,8)
CloseBtn.Text = "✕"; CloseBtn.TextSize = 18; CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200,30,30); CloseBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0,6)
CloseBtn.MouseButton1Click:Connect(function() Menu.Visible = false end)

-- SCROLL
local Scroll = Instance.new("ScrollingFrame", Menu)
Scroll.Size = UDim2.new(1,-20,1,-60); Scroll.Position = UDim2.new(0,10,0,50)
Scroll.BackgroundTransparency = 1; Scroll.ScrollBarThickness = 3
Scroll.ScrollBarImageColor3 = Color3.fromRGB(170,0,255)
local Layout = Instance.new("UIListLayout", Scroll); Layout.Padding = UDim.new(0,4)
Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Scroll.CanvasSize = UDim2.new(0,0,0,Layout.AbsoluteContentSize.Y + 10)
end)

-- CATÉGORIES
local CATS = {
    {name="FARM", color=Color3.fromRGB(0,200,100), toggles={"autoFarm","autoLevel","autoMastery","autoStats","autoChest","autoBeli"}},
    {name="COMBAT", color=Color3.fromRGB(255,50,50), toggles={"killAura","autoPvP","godMode"}},
    {name="BOSSES", color=Color3.fromRGB(255,200,0), toggles={"autoAllBosses"}},
    {name="FRUITS", color=Color3.fromRGB(255,100,0), toggles={"autoCollectFruit","autoStoreFruit","autoRandomFruit"}},
    {name="MOVEMENT", color=Color3.fromRGB(0,170,255), toggles={"fly","infiniteJump","walkOnWater","speed"}},
    {name="ESP", color=Color3.fromRGB(0,255,150), toggles={"fruitESP","chestESP","playerESP","enemyESP"}},
    {name="MISC", color=Color3.fromRGB(130,130,180), toggles={"fpsBoost"}},
}

for _, cat in ipairs(CATS) do
    local frame = Instance.new("Frame", Scroll)
    frame.Size = UDim2.new(1,0,0,0); frame.BackgroundColor3 = Color3.fromRGB(15,15,35)
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0,6)
    local catLayout = Instance.new("UIListLayout", frame); catLayout.Padding = UDim.new(0,2)
    Instance.new("UIPadding", frame).PaddingLeft = UDim.new(0,8)

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1,-10,0,26); title.Text = "▶ "..cat.name; title.TextSize = 13
    title.TextColor3 = cat.color; title.BackgroundTransparency = 1; title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left

    for _, t in ipairs(cat.toggles) do
        local btn = Instance.new("TextButton", frame)
        btn.Size = UDim2.new(1,-10,0,24); btn.Text = "  "..t.."  |  OFF"
        btn.TextSize = 11; btn.TextColor3 = Color3.fromRGB(200,200,220); btn.BackgroundColor3 = Color3.fromRGB(25,25,45)
        btn.Font = Enum.Font.Gotham; btn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,4)
        Instance.new("UIPadding", btn).PaddingLeft = UDim.new(0,5)

        if t == "godMode" then
            btn.MouseButton1Click:Connect(function()
                T.godMode = not T.godMode
                if T.godMode then enableG() else disableG() end
                btn.Text = "  🛡️ God Mode  |  "..(T.godMode and "ON" or "OFF")
                btn.BackgroundColor3 = T.godMode and Color3.fromRGB(255,255,0) or Color3.fromRGB(25,25,45)
                btn.TextColor3 = T.godMode and Color3.new(0,0,0) or Color3.fromRGB(200,200,220)
            end)
        else
            btn.MouseButton1Click:Connect(function()
                T[t] = not T[t]
                btn.Text = "  "..t.."  |  "..(T[t] and "ON" or "OFF")
                btn.BackgroundColor3 = T[t] and cat.color or Color3.fromRGB(25,25,45)
            end)
        end
    end
end

-- LOGO TOGGLE
Logo.MouseButton1Click:Connect(function()
    Menu.Visible = not Menu.Visible
end)

-- NOTIFICATION
task.wait(1)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "✅ Anonymes Script v"..SCRIPT_VERSION,
    Text = "Menu visible - clique sur le logo violet",
    Duration = 3
})

print("✅ Script chargé - Logo: "..tostring(Logo.ImageContentId))
