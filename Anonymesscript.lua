-- ANONYMES SCRIPTS HUB v4.2 | Blox Fruits | Boutons ON/OFF Fix | Thème Bleu/Noir
local VERSION = "4.2"
local LOGO_URL = "rbxassetid://88742532715379"

-- ===== COULEURS =====
local COLORS = {
    PRIMARY = Color3.fromRGB(0, 100, 255),
    SECONDARY = Color3.fromRGB(0, 150, 255),
    BACKGROUND = Color3.fromRGB(10, 10, 30),
    BACKGROUND_LIGHT = Color3.fromRGB(20, 20, 50),
    TEXT = Color3.fromRGB(255, 255, 255),
    TEXT_MUTED = Color3.fromRGB(180, 180, 200),
    SUCCESS = Color3.fromRGB(0, 200, 100),
    DANGER = Color3.fromRGB(255, 50, 50),
    WARNING = Color3.fromRGB(255, 200, 0),
    BOUTON_ON = Color3.fromRGB(0, 200, 100),
    BOUTON_OFF = Color3.fromRGB(50, 50, 50)
}

-- ===== INTERFACE =====
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnonymesHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Logo
local LogoButton = Instance.new("ImageButton")
LogoButton.Size = UDim2.new(0, 80, 0, 80)
LogoButton.Position = UDim2.new(0.88, 0, 0.08, 0)
LogoButton.BackgroundColor3 = COLORS.BACKGROUND_LIGHT
LogoButton.Image = LOGO_URL
LogoButton.Parent = screenGui
local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = LogoButton
local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = COLORS.PRIMARY
LogoStroke.Thickness = 3
LogoStroke.Parent = LogoButton

-- Fenêtre principale
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 400)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
MainFrame.BackgroundColor3 = COLORS.BACKGROUND
MainFrame.Visible = false
MainFrame.Parent = screenGui
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = COLORS.PRIMARY
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Titre
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "ANONYMES SCRIPTS HUB v" .. VERSION
Title.TextScaled = true
Title.TextColor3 = COLORS.TEXT
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- Bouton Fermer
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 35, 0, 35)
Close.Position = UDim2.new(1, -40, 0, 5)
Close.Text = "X"
Close.TextScaled = true
Close.BackgroundColor3 = COLORS.DANGER
Close.TextColor3 = COLORS.TEXT
Close.Parent = MainFrame
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = Close

-- ScrollingFrame
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, -20, 1, -80)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 50)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 5
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

-- ===== TOGGLES (Version simplifiée sans Delta) =====
local toggles = {
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
    -- ESP
    espPlayers = false,
    espBoss = false,
    espFruits = false,
    espChests = false,
    -- Déplacement
    autoBoat = false,
    boatSpeed = false,
    teleportToBoat = false,
    -- Autres
    infiniteJump = false,
    flight = false,
    noClip = false,
    walkOnWater = false,
    serverHop = false,
    antiKick = false,
    fpsBoost = false
}

-- ===== FONCTION POUR CRÉER DES CATÉGORIES =====
local function createCategory(name, emoji, color)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 30)
    frame.BackgroundTransparency = 0.9
    frame.BackgroundColor3 = COLORS.BACKGROUND_LIGHT
    frame.Parent = ScrollingFrame
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 1, 0)
    title.Text = emoji .. " " .. name
    title.TextScaled = true
    title.TextColor3 = color or COLORS.PRIMARY
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextYAlignment = Enum.TextYAlignment.Center
    title.Parent = frame
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 10)
    padding.Parent = title
    return frame
end

-- ===== FONCTION POUR CRÉER DES BOUTONS ON/OFF (FIXÉ) =====
local function createToggleButton(name, toggleKey, parent)
    local button = Instance.new("TextButton")
    button.Name = toggleKey .. "Button"
    button.Size = UDim2.new(1, -20, 0, 30)
    button.Text = name .. ": OFF"
    button.TextScaled = true
    button.TextColor3 = COLORS.TEXT
    button.BackgroundColor3 = COLORS.BOUTON_OFF
    button.Font = Enum.Font.Gotham
    button.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = button
    local stroke = Instance.new("UIStroke")
    stroke.Color = COLORS.PRIMARY
    stroke.Parent = button
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 10)
    padding.Parent = button

    -- Mise à jour visuelle immédiate
    local function updateButton()
        button.Text = name .. ": " .. (toggles[toggleKey] and "ON" or "OFF")
        button.BackgroundColor3 = toggles[toggleKey] and COLORS.BOUTON_ON or COLORS.BOUTON_OFF
    end

    button.MouseButton1Click:Connect(function()
        toggles[toggleKey] = not toggles[toggleKey]
        updateButton()
    end)

    -- Initialisation
    updateButton()
    return button
end

-- ===== CRÉATION DES CATÉGORIES ET BOUTONS =====
createCategory("COMBAT", "🗡️", COLORS.DANGER)
local CombatContainer = Instance.new("Frame")
CombatContainer.Size = UDim2.new(1, 0, 0, 0)
CombatContainer.BackgroundTransparency = 1
CombatContainer.Parent = ScrollingFrame
createToggleButton("Kill Aura", "killAura", CombatContainer)
createToggleButton("Trigger Bot", "triggerBot", CombatContainer)
createToggleButton("Auto Attack", "autoAttack", CombatContainer)
createToggleButton("Auto PvP", "autoPvP", CombatContainer)

createCategory("AUTO FARM", "🌾", COLORS.SUCCESS)
local FarmContainer = Instance.new("Frame")
FarmContainer.Size = UDim2.new(1, 0, 0, 0)
FarmContainer.BackgroundTransparency = 1
FarmContainer.Parent = ScrollingFrame
createToggleButton("Auto Level", "autoLevel", FarmContainer)
createToggleButton("Auto Nearest", "autoNearest", FarmContainer)
createToggleButton("Auto Ectoplasm", "autoEctoplasm", FarmContainer)
createToggleButton("Auto Candy", "autoCandy", FarmContainer)

createCategory("BOSSES", "👹", COLORS.WARNING)
local BossContainer = Instance.new("Frame")
BossContainer.Size = UDim2.new(1, 0, 0, 0)
BossContainer.BackgroundTransparency = 1
BossContainer.Parent = ScrollingFrame
createToggleButton("Auto Sea Beast", "autoSeaBeast", BossContainer)
createToggleButton("Auto Leviathan", "autoLeviathan", BossContainer)
createToggleButton("Auto Pirate Raid", "autoPirateRaid", BossContainer)
createToggleButton("Auto Terrorshark", "autoTerrorshark", BossContainer)

createCategory("ESP", "👁️", Color3.fromRGB(200, 0, 255))
local ESPContainer = Instance.new("Frame")
ESPContainer.Size = UDim2.new(1, 0, 0, 0)
ESPContainer.BackgroundTransparency = 1
ESPContainer.Parent = ScrollingFrame
createToggleButton("ESP Players", "espPlayers", ESPContainer)
createToggleButton("ESP Boss", "espBoss", ESPContainer)
createToggleButton("ESP Fruits", "espFruits", ESPContainer)
createToggleButton("ESP Chests", "espChests", ESPContainer)

createCategory("DÉPLACEMENT", "⛵", Color3.fromRGB(0, 200, 255))
local MoveContainer = Instance.new("Frame")
MoveContainer.Size = UDim2.new(1, 0, 0, 0)
MoveContainer.BackgroundTransparency = 1
MoveContainer.Parent = ScrollingFrame
createToggleButton("Auto Boat", "autoBoat", MoveContainer)
createToggleButton("Boat Speed", "boatSpeed", MoveContainer)
createToggleButton("Teleport to Boat", "teleportToBoat", MoveContainer)

createCategory("AUTRES", "✨", Color3.fromRGB(255, 200, 0))
local OtherContainer = Instance.new("Frame")
OtherContainer.Size = UDim2.new(1, 0, 0, 0)
OtherContainer.BackgroundTransparency = 1
OtherContainer.Parent = ScrollingFrame
createToggleButton("Infinite Jump", "infiniteJump", OtherContainer)
createToggleButton("Flight", "flight", OtherContainer)
createToggleButton("No Clip", "noClip", OtherContainer)
createToggleButton("Walk On Water", "walkOnWater", OtherContainer)
createToggleButton("Server Hop", "serverHop", OtherContainer)
createToggleButton("Anti Kick", "antiKick", OtherContainer)
createToggleButton("FPS Boost", "fpsBoost", OtherContainer)

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

-- ===== FONCTIONS PRINCIPALES (Sans Delta) =====
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
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and toggles.triggerBot then
        pcall(function()
            local nearestPlayer = getNearestPlayer()
            if nearestPlayer and nearestPlayer.Character then
                attackTarget(nearestPlayer.Character)
            end
        end)
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

-- Auto Level
spawn(function()
    while true do
        if toggles.autoLevel then
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

-- Auto Nearest
spawn(function()
    while true do
        if toggles.autoNearest then
            pcall(function()
                local mob = getNearestMob()
                if mob then
                    attackTarget(mob)
                end
            end)
        end
        task.wait(0.5)
    end
end)

-- Auto Ectoplasm
spawn(function()
    while true do
        if toggles.autoEctoplasm then
            pcall(function()
                if workspace:FindFirstChild("Ectoplasm") then
                    for _, ecto in pairs(workspace.Ectoplasm:GetChildren()) do
                        if ecto:FindFirstChild("HumanoidRootPart") then
                            local character = waitForCharacter()
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                character.HumanoidRootPart.CFrame = ecto.HumanoidRootPart.CFrame
                            end
                        end
                    end
                end
            end)
        end
        task.wait(1)
    end
end)

-- Auto Candy
spawn(function()
    while true do
        if toggles.autoCandy then
            pcall(function()
                if workspace:FindFirstChild("Candy") then
                    for _, candy in pairs(workspace.Candy:GetChildren()) do
                        if candy:FindFirstChild("HumanoidRootPart") then
                            local character = waitForCharacter()
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                character.HumanoidRootPart.CFrame = candy.HumanoidRootPart.CFrame
                            end
                        end
                    end
                end
            end)
        end
        task.wait(0.5)
    end
end)

-- Auto Sea Beast
spawn(function()
    while true do
        if toggles.autoSeaBeast then
            pcall(function()
                if workspace:FindFirstChild("Enemies") then
                    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                        if enemy.Name:find("Sea Beast") and enemy:FindFirstChild("HumanoidRootPart") then
                            attackTarget(enemy)
                        end
                    end
                end
            end)
        end
        task.wait(1)
    end
end)

-- Auto Leviathan
spawn(function()
    while true do
        if toggles.autoLeviathan then
            pcall(function()
                if workspace:FindFirstChild("Enemies") then
                    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                        if enemy.Name:find("Leviathan") and enemy:FindFirstChild("HumanoidRootPart") then
                            attackTarget(enemy)
                        end
                    end
                end
            end)
        end
        task.wait(1)
    end
end)

-- Auto Pirate Raid
spawn(function()
    while true do
        if toggles.autoPirateRaid then
            pcall(function()
                if workspace:FindFirstChild("Enemies") then
                    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                        if enemy.Name:find("Pirate") and enemy:FindFirstChild("HumanoidRootPart") then
                            attackTarget(enemy)
                        end
                    end
                end
            end)
        end
        task.wait(0.5)
    end
end)

-- Auto Terrorshark
spawn(function()
    while true do
        if toggles.autoTerrorshark then
            pcall(function()
                if workspace:FindFirstChild("Enemies") then
                    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                        if enemy.Name:find("Terrorshark") and enemy:FindFirstChild("HumanoidRootPart") then
                            attackTarget(enemy)
                        end
                    end
                end
            end)
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

-- ESP Boss
spawn(function()
    while true do
        if toggles.espBoss then
            pcall(function()
                if workspace:FindFirstChild("Enemies") then
                    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                        if enemy:FindFirstChild("HumanoidRootPart") then
                            local esp = enemy:FindFirstChild("ESP_Boss")
                            if not esp then
                                esp = Instance.new("BillboardGui")
                                esp.Name = "ESP_Boss"
                                esp.Size = UDim2.new(0, 200, 0, 50)
                                esp.StudsOffset = Vector3.new(0, 2, 0)
                                esp.Adornee = enemy.HumanoidRootPart
                                esp.Parent = enemy.HumanoidRootPart
                                local text = Instance.new("TextLabel")
                                text.Size = UDim2.new(1, 0, 1, 0)
                                text.Text = enemy.Name
                                text.TextScaled = true
                                text.TextColor3 = COLORS.DANGER
                                text.BackgroundTransparency = 1
                                text.Font = Enum.Font.GothamBold
                                text.Parent = esp
                            end
                        end
                    end
                end
            end)
        else
            if workspace:FindFirstChild("Enemies") then
                for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                    local esp = enemy:FindFirstChild("ESP_Boss")
                    if esp then esp:Destroy() end
                end
            end
        end
        task.wait(0.5)
    end
end)

-- Infinite Jump
game:GetService("UserInputService").JumpRequest:Connect(function()
    if toggles.infiniteJump then
        local character = waitForCharacter()
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- Flight
spawn(function()
    while true do
        if toggles.flight then
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

-- Walk On Water
spawn(function()
    while true do
        if toggles.walkOnWater then
            pcall(function()
                local character = waitForCharacter()
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local raycastParams = RaycastParams.new()
                    raycastParams.FilterDescendantsInstances = {character}
                    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                    local raycastResult = workspace:Raycast(character.HumanoidRootPart.Position, Vector3.new(0, -5, 0), raycastParams)
                    if not raycastResult then
                        character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame + Vector3.new(0, 0.1, 0)
                    end
                end
            end)
        end
        task.wait(0.1)
    end
end)

-- Auto Boat
spawn(function()
    while true do
        if toggles.autoBoat then
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
        end
        task.wait(0.1)
    end
end)

-- Boat Speed
spawn(function()
    while true do
        if toggles.boatSpeed then
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
        end
        task.wait(0.1)
    end
end)

-- Teleport to Boat
spawn(function()
    while true do
        if toggles.teleportToBoat then
            pcall(function()
                local character = waitForCharacter()
                if character and character:FindFirstChild("HumanoidRootPart") then
                    if workspace:FindFirstChild("Vehicles") then
                        for _, boat in pairs(workspace.Vehicles:GetChildren()) do
                            if boat.Name:find("Boat") or boat.Name:find("Ship") then
                                local spawnLocation = boat:FindFirstChild("SpawnLocation") or boat:FindFirstChild("VehicleSeat")
                                if spawnLocation then
                                    character.HumanoidRootPart.CFrame = spawnLocation.CFrame * CFrame.new(0, 5, 0)
                                    notify("✅ Bateau", "Téléporté vers un bateau !", 2)
                                    toggles.teleportToBoat = false
                                    for _, btn in pairs(OtherContainer:GetChildren()) do
                                        if btn.Name == "teleportToBoatButton" then
                                            btn.Text = "Teleport to Boat: OFF"
                                            btn.BackgroundColor3 = COLORS.BOUTON_OFF
                                        end
                                    end
                                    break
                                end
                            end
                        end
                    end
                end
            end)
            toggles.teleportToBoat = false
        end
        task.wait(1)
    end
end)

-- Server Hop
spawn(function()
    while true do
        if toggles.serverHop then
            pcall(function()
                local HttpService = game:GetService("HttpService")
                local TeleportService = game:GetService("TeleportService")
                local placeId = game.PlaceId
                local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"))
                if servers and servers.data and #servers.data > 0 then
                    local server = servers.data[math.random(1, #servers.data)]
                    if server and server.id then
                        TeleportService:TeleportToPlaceInstance(placeId, server.id)
                    end
                end
            end)
            task.wait(60)
        else
            task.wait(1)
        end
    end
end)

-- Anti Kick
spawn(function()
    while true do
        if toggles.antiKick then
            pcall(function()
                local character = waitForCharacter()
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid.Health = math.huge
                end
            end)
        end
        task.wait(0.1)
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
                game:GetService("Lighting").GraphicsMode = Enum.GraphicsMode.Standard
            end)
        end
        task.wait(5)
    end
end)
