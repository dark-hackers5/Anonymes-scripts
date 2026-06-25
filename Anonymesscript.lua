-- ANONYMES SCRIPTS HUB v4.1 | Blox Fruits | Delta + Boutons ON/OFF
local VERSION = "4.1"
local LOGO_URL = "rbxassetid://88742532715379"

-- ===== DELTA (Gestion d'état réactive) =====
local Delta
local success, err = pcall(function()
    Delta = loadstring(game:HttpGet("https://raw.githubusercontent.com/PlrACF/Delta/main/Source.lua"))()
end)
if not success then
    Delta = {}
    function Delta.NewTable(t) return setmetatable(t, {__index = function(_, k) return false end}) end
    function Delta.NewValue(v)
        return {
            Value = v,
            Connect = function(_, f) f(v) end,
            Toggle = function(self) self.Value = not self.Value end,
            Set = function(self, val) self.Value = val end
        }
    end
end

-- ===== INTERFACE =====
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnonymesHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Logo cliquable
local LogoButton = Instance.new("ImageButton")
LogoButton.Size = UDim2.new(0, 80, 0, 80)
LogoButton.Position = UDim2.new(0.88, 0, 0.08, 0)
LogoButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
LogoButton.Image = LOGO_URL
LogoButton.Parent = screenGui

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = LogoButton

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = Color3.fromRGB(255, 0, 0)
LogoStroke.Thickness = 3
LogoStroke.Parent = LogoButton

-- Fenêtre principale
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Visible = false
MainFrame.Parent = screenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 0, 0)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Titre
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "ANONYMES SCRIPTS HUB v" .. VERSION
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- Bouton Fermer
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 35, 0, 35)
Close.Position = UDim2.new(1, -40, 0, 5)
Close.Text = "X"
Close.TextScaled = true
Close.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Close.TextColor3 = Color3.new(1, 1, 1)
Close.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = Close

-- ScrollingFrame pour les boutons
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, -20, 1, -80)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 50)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 5
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.Parent = ScrollingFrame

-- Ouverture/Fermeture
LogoButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

Close.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

MainFrame.Active = true
MainFrame.Draggable = true

-- ===== TOGGLES AVEC DELTA =====
local toggles = Delta.NewTable({
    -- Combat
    killAura = false,
    triggerBot = false,
    autoAttack = false,
    autoPvP = false,
    -- Auto Farm
    autoLevel = false,
    autoNearest = false,
    autoEctoplasm = false,
    autoCandy = false,
    -- Bosses
    autoSeaBeast = false,
    autoLeviathan = false,
    autoPirateRaid = false,
    autoTerrorshark = false,
    -- Déplacement
    autoBoat = false,
    boatSpeed = false,
    -- ESP
    espPlayers = false,
    espBoss = false,
    -- Autres
    infiniteJump = false,
    flight = false,
    noClip = false
})

-- ===== FONCTION POUR CRÉER DES BOUTONS ON/OFF =====
local function createToggleButton(name, toggleKey, parent)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 30)
    button.Text = name .. ": OFF"
    button.TextScaled = true
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Font = Enum.Font.Gotham
    button.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = button

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 0, 0)
    stroke.Parent = button

    -- Connexion à Delta
    toggles[toggleKey]:Connect(function(newValue)
        button.Text = name .. ": " .. (newValue and "ON 🔥" or "OFF")
        button.BackgroundColor3 = newValue and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(40, 40, 40)
    end)

    button.MouseButton1Click:Connect(function()
        toggles[toggleKey]:Toggle()
    end)

    return button
end

-- ===== CRÉATION DES BOUTONS =====
-- Catégorie Combat
local CombatFrame = Instance.new("Frame")
CombatFrame.Size = UDim2.new(1, 0, 0, 150)
CombatFrame.BackgroundTransparency = 0.8
CombatFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CombatFrame.Parent = ScrollingFrame

local CombatTitle = Instance.new("TextLabel")
CombatTitle.Size = UDim2.new(1, 0, 0, 30)
CombatTitle.Text = "🗡️ COMBAT"
CombatTitle.TextScaled = true
CombatTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
CombatTitle.BackgroundTransparency = 1
CombatTitle.Font = Enum.Font.GothamBold
CombatTitle.Parent = CombatFrame

createToggleButton("Kill Aura", "killAura", CombatFrame).Position = UDim2.new(0, 0, 0, 35)
createToggleButton("Trigger Bot", "triggerBot", CombatFrame).Position = UDim2.new(0, 0, 0, 70)
createToggleButton("Auto Attack", "autoAttack", CombatFrame).Position = UDim2.new(0, 0, 0, 105)
createToggleButton("Auto PvP", "autoPvP", CombatFrame).Position = UDim2.new(0, 0, 0, 140)

-- Catégorie Auto Farm
local FarmFrame = Instance.new("Frame")
FarmFrame.Size = UDim2.new(1, 0, 0, 120)
FarmFrame.BackgroundTransparency = 0.8
FarmFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
FarmFrame.Parent = ScrollingFrame

local FarmTitle = Instance.new("TextLabel")
FarmTitle.Size = UDim2.new(1, 0, 0, 30)
FarmTitle.Text = "🌾 AUTO FARM"
FarmTitle.TextScaled = true
FarmTitle.TextColor3 = Color3.fromRGB(0, 200, 0)
FarmTitle.BackgroundTransparency = 1
FarmTitle.Font = Enum.Font.GothamBold
FarmTitle.Parent = FarmFrame

createToggleButton("Auto Level", "autoLevel", FarmFrame).Position = UDim2.new(0, 0, 0, 35)
createToggleButton("Auto Nearest", "autoNearest", FarmFrame).Position = UDim2.new(0, 0, 0, 70)
createToggleButton("Auto Ectoplasm", "autoEctoplasm", FarmFrame).Position = UDim2.new(0, 0, 0, 105)

-- Catégorie Bosses
local BossFrame = Instance.new("Frame")
BossFrame.Size = UDim2.new(1, 0, 0, 120)
BossFrame.BackgroundTransparency = 0.8
BossFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BossFrame.Parent = ScrollingFrame

local BossTitle = Instance.new("TextLabel")
BossTitle.Size = UDim2.new(1, 0, 0, 30)
BossTitle.Text = "👹 BOSSES"
BossTitle.TextScaled = true
BossTitle.TextColor3 = Color3.fromRGB(255, 200, 0)
BossTitle.BackgroundTransparency = 1
BossTitle.Font = Enum.Font.GothamBold
BossTitle.Parent = BossFrame

createToggleButton("Auto Sea Beast", "autoSeaBeast", BossFrame).Position = UDim2.new(0, 0, 0, 35)
createToggleButton("Auto Leviathan", "autoLeviathan", BossFrame).Position = UDim2.new(0, 0, 0, 70)
createToggleButton("Auto Pirate Raid", "autoPirateRaid", BossFrame).Position = UDim2.new(0, 0, 0, 105)

-- Catégorie Déplacement
local MoveFrame = Instance.new("Frame")
MoveFrame.Size = UDim2.new(1, 0, 0, 90)
MoveFrame.BackgroundTransparency = 0.8
MoveFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MoveFrame.Parent = ScrollingFrame

local MoveTitle = Instance.new("TextLabel")
MoveTitle.Size = UDim2.new(1, 0, 0, 30)
MoveTitle.Text = "⛵ DÉPLACEMENT"
MoveTitle.TextScaled = true
MoveTitle.TextColor3 = Color3.fromRGB(0, 100, 255)
MoveTitle.BackgroundTransparency = 1
MoveTitle.Font = Enum.Font.GothamBold
MoveTitle.Parent = MoveFrame

createToggleButton("Auto Boat", "autoBoat", MoveFrame).Position = UDim2.new(0, 0, 0, 35)
createToggleButton("Boat Speed", "boatSpeed", MoveFrame).Position = UDim2.new(0, 0, 0, 70)

-- Catégorie ESP
local ESPFrame = Instance.new("Frame")
ESPFrame.Size = UDim2.new(1, 0, 0, 90)
ESPFrame.BackgroundTransparency = 0.8
ESPFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ESPFrame.Parent = ScrollingFrame

local ESPTitle = Instance.new("TextLabel")
ESPTitle.Size = UDim2.new(1, 0, 0, 30)
ESPTitle.Text = "👁️ ESP"
ESPTitle.TextScaled = true
ESPTitle.TextColor3 = Color3.fromRGB(255, 0, 255)
ESPTitle.BackgroundTransparency = 1
ESPTitle.Font = Enum.Font.GothamBold
ESPTitle.Parent = ESPFrame

createToggleButton("ESP Players", "espPlayers", ESPFrame).Position = UDim2.new(0, 0, 0, 35)
createToggleButton("ESP Boss", "espBoss", ESPFrame).Position = UDim2.new(0, 0, 0, 70)

-- Catégorie Autres
local OtherFrame = Instance.new("Frame")
OtherFrame.Size = UDim2.new(1, 0, 0, 120)
OtherFrame.BackgroundTransparency = 0.8
OtherFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
OtherFrame.Parent = ScrollingFrame

local OtherTitle = Instance.new("TextLabel")
OtherTitle.Size = UDim2.new(1, 0, 0, 30)
OtherTitle.Text = "✨ AUTRES"
OtherTitle.TextScaled = true
OtherTitle.TextColor3 = Color3.fromRGB(255, 255, 0)
OtherTitle.BackgroundTransparency = 1
OtherTitle.Font = Enum.Font.GothamBold
OtherTitle.Parent = OtherFrame

createToggleButton("Infinite Jump", "infiniteJump", OtherFrame).Position = UDim2.new(0, 0, 0, 35)
createToggleButton("Flight", "flight", OtherFrame).Position = UDim2.new(0, 0, 0, 70)
createToggleButton("No Clip", "noClip", OtherFrame).Position = UDim2.new(0, 0, 0, 105)

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

        local direction = (targetRoot.Position - rootPart.Position).Unit
        rootPart.CFrame = CFrame.new(targetRoot.Position + (direction * -5)) * CFrame.Angles(0, math.pi, 0)

        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(0.1)
        game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end

-- ===== FONCTIONS PRINCIPALES (Delta) =====
-- Kill Aura
toggles.killAura:Connect(function(newValue)
    if newValue then
        spawn(function()
            while toggles.killAura.Value do
                pcall(function()
                    local nearestPlayer = getNearestPlayer()
                    if nearestPlayer and nearestPlayer.Character then
                        attackTarget(nearestPlayer.Character)
                    end
                end)
                task.wait(0.2)
            end
        end)
    end
end)

-- Trigger Bot
toggles.triggerBot:Connect(function(newValue)
    if newValue then
        game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and toggles.triggerBot.Value then
                pcall(function()
                    local nearestPlayer = getNearestPlayer()
                    if nearestPlayer and nearestPlayer.Character then
                        attackTarget(nearestPlayer.Character)
                    end
                end)
            end
        end)
    end
end)

-- Auto Attack
toggles.autoAttack:Connect(function(newValue)
    if newValue then
        spawn(function()
            while toggles.autoAttack.Value do
                pcall(function()
                    local character = waitForCharacter()
                    if character and workspace:FindFirstChild("Enemies") then
                        for _, mob in pairs(workspace.Enemies:GetChildren()) do
                            if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                                attackTarget(mob)
                                break
                            end
                        end
                    end
                end)
                task.wait(0.3)
            end
        end)
    end
end)

-- Infinite Jump
toggles.infiniteJump:Connect(function(newValue)
    if newValue then
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if toggles.infiniteJump.Value then
                local character = waitForCharacter()
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
    end
end)

-- Flight
toggles.flight:Connect(function(newValue)
    if newValue then
        local character = waitForCharacter()
        if character and character:FindFirstChild("Humanoid") then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
            bodyVelocity.Parent = character.HumanoidRootPart

            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bodyGyro.CFrame = character.HumanoidRootPart.CFrame
            bodyGyro.Parent = character.HumanoidRootPart

            spawn(function()
                while toggles.flight.Value and character and character:FindFirstChild("HumanoidRootPart") do
                    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    task.wait()
                end
                bodyVelocity:Destroy()
                bodyGyro:Destroy()
            end)
        end
    else
        local character = player.Character
        if character then
            for _, v in pairs(character:GetChildren()) do
                if v:IsA("BodyVelocity") or v:IsA("BodyGyro") then
                    v:Destroy()
                end
            end
        end
    end
end)

-- No Clip
toggles.noClip:Connect(function(newValue)
    if newValue then
        spawn(function()
            while toggles.noClip.Value do
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
                task.wait(0.1)
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
end)

-- Auto Boat
toggles.autoBoat:Connect(function(newValue)
    if newValue then
        spawn(function()
            while toggles.autoBoat.Value do
                pcall(function()
                    local character = waitForCharacter()
                    if character and character:FindFirstChild("Humanoid") then
                        if character.Humanoid.SeatPart and character.Humanoid.SeatPart.Parent then
                            local boat = character.Humanoid.SeatPart.Parent
                            if boat:FindFirstChild("VehicleSeat") then
                                boat.VehicleSeat.Steer = 0
                                boat.VehicleSeat.Throttle = 1
                            end
                        end
                    end
                end)
                task.wait(0.1)
            end
        end)
    end
end)

-- Boat Speed
toggles.boatSpeed:Connect(function(newValue)
    if newValue then
        spawn(function()
            while toggles.boatSpeed.Value do
                pcall(function()
                    local character = waitForCharacter()
                    if character and character:FindFirstChild("Humanoid") then
                        if character.Humanoid.SeatPart and character.Humanoid.SeatPart.Parent then
                            local boat = character.Humanoid.SeatPart.Parent
                            if boat:FindFirstChild("VehicleSeat") then
                                boat.VehicleSeat.MaxSpeed = 200
                                boat.VehicleSeat.Torque = 50000
                            end
                        end
                    end
                end)
                task.wait(0.1)
            end
        end)
    end
end)
