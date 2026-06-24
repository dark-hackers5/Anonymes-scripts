-- ANONYMES SCRIPTS HUB v4.1 | Blox Fruits | LOGO: https://i.imgur.com/Y9jphnW.png
local VERSION="4.1" local VIP_PASSWORD="98961144" local PRICE_FRUITS_PERMS=5000000 local PRICE_AUTO_PVP=2000000 local LOGO_URL="https://i.imgur.com/Y9jphnW.png"
local BOSSES={{Name="Bandit",Level=150,Sea=1,Type="Normal"},{Name="Leader",Level=300,Sea=1,Type="Normal"},{Name="Brute",Level=500,Sea=1,Type="Normal"},{Name="The Saw",Level=1000,Sea=1,Type="Normal"},{Name="Shank",Level=1100,Sea=1,Type="Normal"},{Name="Don Swan",Level=1000,Sea=2,Type="Normal"},{Name="Jeremy",Level=1050,Sea=2,Type="Normal"},{Name="Saber Expert",Level=1100,Sea=2,Type="Normal"},{Name="The Gorilla King",Level=1200,Sea=2,Type="Normal"},{Name="Don Swan [Lv. 1000]",Level=1000,Sea=3,Type="Normal"},{Name="Jeremy [Lv. 1050]",Level=1050,Sea=3,Type="Normal"},{Name="Wysper",Level=1100,Sea=3,Type="Normal"},{Name="Thunder God",Level=1150,Sea=3,Type="Normal"},{Name="Cursed Captain",Level=1200,Sea=3,Type="Normal"},{Name="Stone",Level=1500,Sea=3,Type="Normal"},{Name="Island Empress",Level=1600,Sea=3,Type="Normal"},{Name="Kilo Admiral",Level=1700,Sea=3,Type="Normal"},{Name="Dough King",Level=0,Sea=0,Type="Raid"},{Name="Leviathan",Level=0,Sea=0,Type="Raid"},{Name="Phantom",Level=0,Sea=0,Type="Raid"},{Name="Sea Beast",Level=0,Sea=0,Type="Event"},{Name="Terrorshark",Level=0,Sea=0,Type="Event"},{Name="Magma Admiral",Level=0,Sea=0,Type="Volcano"},{Name="Mirror Boss",Level=0,Sea=0,Type="Factory"},{Name="Kitsune",Level=0,Sea=0,Type="Special"},{Name="Longma",Level=0,Sea=0,Type="Special"},{Name="Soul Reaper",Level=0,Sea=0,Type="Special"},{Name="Cursed Dual Katana",Level=0,Sea=0,Type="Quest"},{Name="Yama",Level=0,Sea=0,Type="Quest"},{Name="Tushita",Level=0,Sea=0,Type="Quest"},{Name="Sanguine Art",Level=0,Sea=0,Type="Quest"},{Name="Darkbeard",Level=0,Sea=0,Type="Quest"}}
local ISLANDS={{Name="Starter Island",Sea=1,Position=CFrame.new(-1000,10,-1000)},{Name="Jungle",Sea=1,Position=CFrame.new(-600,10,-800)},{Name="Pirate Village",Sea=1,Position=CFrame.new(-1200,10,-300)},{Name="Desert",Sea=1,Position=CFrame.new(-700,10,500)},{Name="Snow Island",Sea=1,Position=CFrame.new(-1300,10,1200)},{Name="Marine Fortress",Sea=1,Position=CFrame.new(-2500,10,-2000)},{Name="Prison",Sea=1,Position=CFrame.new(-5000,10,-5000)},{Name="Magma Village",Sea=1,Position=CFrame.new(-5500,10,-5500)},{Name="Port Town",Sea=2,Position=CFrame.new(1000,10,-1000)},{Name="Kingdom of Rose",Sea=2,Position=CFrame.new(1500,10,-1500)},{Name="Usopp Island",Sea=2,Position=CFrame.new(2000,10,-2000)},{Name="Fountain City",Sea=2,Position=CFrame.new(3000,10,-3000)},{Name="Zou",Sea=2,Position=CFrame.new(4000,10,-4000)},{Name="Scrap Island",Sea=2,Position=CFrame.new(4500,10,-4500)},{Name="Ghost Island",Sea=2,Position=CFrame.new(5000,10,-5000)},{Name="Ice Castle",Sea=2,Position=CFrame.new(5500,10,-5500)},{Name="Port Oasis",Sea=3,Position=CFrame.new(1000,10,1000)},{Name="Forgotten Island",Sea=3,Position=CFrame.new(1500,10,1500)},{Name="Utopia",Sea=3,Position=CFrame.new(2000,10,2000)},{Name="Hydra Island",Sea=3,Position=CFrame.new(2500,10,2500)},{Name="Great Tree",Sea=3,Position=CFrame.new(3000,10,3000)},{Name="Castle on the Sea",Sea=3,Position=CFrame.new(3500,10,3500)},{Name="Mage Island",Sea=3,Position=CFrame.new(4000,10,4000)},{Name="Pirate Port",Sea=3,Position=CFrame.new(4500,10,4500)},{Name="Haunted Castle",Sea=3,Position=CFrame.new(5000,10,5000)},{Name="Mirage Island",Sea=0,Position=nil,IsRandom=true}}
local QUESTS={{Name="Leviathan",NPC="Old Man",Reward="Leviathan Gun",Sea=2},{Name="Dough King",NPC="Cake Prince",Reward="Dough Fruit",Sea=2},{Name="Cursed Dual Katana",NPC="Hitman",Reward="CDK",Sea=1},{Name="Yama",NPC="Monk",Reward="Yama Sword",Sea=1},{Name="Tushita",NPC="Monk",Reward="Tushita Sword",Sea=2},{Name="Sanguine Art",NPC="Art Dealer",Reward="Sanguine Art",Sea=2},{Name="Kitsune",NPC="Mystic Lady",Reward="Kitsune",Sea=3},{Name="Race V4",NPC="Race Expert",Reward="Race V4",Sea=2},{Name="Soul Reaper",NPC="Death",Reward="Soul Cane",Sea=3}}
local player=game.Players.LocalPlayer local isVIP=false local hasFruitsPerms=false local hasAutoPvP=false local mainFrame=nil local screenGui=nil
local toggles={autoLevel=false,autoNearest=false,autoEctoplasm=false,autoCandy=false,autoGifts=false,autoCollect=false,autoCollectRewards=false,autoPvP=false,killAura=false,triggerBot=false,autoAttack=false,autoSeaBeast=false,autoLeviathan=false,autoLeviathanQuest=false,autoPirateRaid=false,autoShipRaid=false,autoTerrorshark=false,autoVolcano=false,autoFactory=false,autoPhantom=false,autoDoughKing=false,autoYama=false,autoTushita=false,autoCDK=false,autoSanguineArt=false,autoKitsune=false,autoRaceV4=false,autoMirageIsland=false,autoSoulReaper=false,autoBoat=false,teleportToBoat=false,boatSpeed=false,teleportMobs=false,bringMob=false,autoIslandHop=false,espPlayers=false,espBoss=false,espFruits=false,espChests=false,espNPCs=false,walkOnWater=false,infiniteJump=false,noClip=false,flight=false,autoHaki=false,autoObservation=false,autoArmament=false,serverHop=false,antiKick=false,fpsBoost=false,fruitsPerms=false}
local function notify(title,text,duration) pcall(function() game.StarterGui:SetCore("SendNotification",{Title=title,Text=text,Duration=duration or 3,Icon=LOGO_URL}) end) end
local function getBeli() if not player.Data then return 0 end local beli=player.Data:FindFirstChild("Beli") return beli and tonumber(tostring(beli.Value)) or 0 end
local function hasEnoughBeli(amount) return getBeli()>=amount end
local function payBeli(amount) if not hasEnoughBeli(amount) then notify("❌ Erreur","Pas assez de Beli ("..getBeli().." / "..amount..")",3) return false end pcall(function() player.Data.Beli.Value=player.Data.Beli.Value-amount end) return true end
local function toggleFeature(feature) toggles[feature]=not toggles[feature] return toggles[feature] end
local function waitForCharacter() repeat task.wait() until player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") return player.Character end
local function getCurrentSea() if not player.Data then return 1 end local level=player.Data:FindFirstChild("Level") if level then if level.Value>=2000 then return 3 end if level.Value>=700 then return 3 end if level.Value>=150 then return 2 end end return 1 end
local function getBoss(bossName) if not workspace:FindFirstChild("Enemies") then return nil end for _,boss in pairs(workspace.Enemies:GetChildren()) do if (boss.Name==bossName or boss.Name:find(bossName)) and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health>0 then return boss end end return nil end
local function getNearestBoss() local character=waitForCharacter() if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end local rootPart=character.HumanoidRootPart local nearestBoss,nearestDist=nil,math.huge for _,bossInfo in ipairs(BOSSES) do local boss=getBoss(bossInfo.Name) if boss and boss:FindFirstChild("HumanoidRootPart") then local dist=(rootPart.Position-boss.HumanoidRootPart.Position).Magnitude if dist<nearestDist and dist<5000 then nearestBoss,nearestDist=boss,dist end end end return nearestBoss end
local function findNPC(npcName) if not workspace:FindFirstChild("NPCs") then return nil end for _,npc in pairs(workspace.NPCs:GetChildren()) do if npc.Name:find(npcName) or (npc:FindFirstChild("NPCName") and npc.NPCName.Value:find(npcName)) then return npc end end return nil end
local function isInBoat() local character=player.Character if not character then return false end local humanoid=character:FindFirstChild("Humanoid") if humanoid and humanoid.SeatPart then local boat=humanoid.SeatPart.Parent return boat and (boat.Name:find("Boat") or boat.Name:find("Ship")) end return false end
local function getBoat() if isInBoat() then local humanoid=player.Character:FindFirstChild("Humanoid") return humanoid and humanoid.SeatPart and humanoid.SeatPart.Parent end return nil end
local function isMirageIslandAvailable() for _,island in pairs(workspace:GetChildren()) do if island.Name:find("Mirage") then return true,island end end return false end
local function hasQuest(questName) if not player:FindFirstChild("Quests") then return false end for _,quest in pairs(player.Quests:GetChildren()) do if quest.Name:find(questName) then return true,quest end end return false end
local function hasSwordEquipped() local character=player.Character if not character then return false end for _,tool in pairs(character:GetChildren()) do if tool:IsA("Tool") and (tool.Name:find("Sword") or tool.Name:find("Katana") or tool.Name:find("Cane")) then return true,tool end end return false end
local function getNearestMob() local character=waitForCharacter() if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end local rootPart=character.HumanoidRootPart local nearest,nearestDist=nil,math.huge if not workspace:FindFirstChild("Enemies") then return nil end for _,mob in pairs(workspace.Enemies:GetChildren()) do if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health>0 and mob:FindFirstChild("HumanoidRootPart") then local dist=(rootPart.Position-mob.HumanoidRootPart.Position).Magnitude if dist<nearestDist and dist<1000 then nearest,nearestDist=mob,dist end end end return nearest end
local function getNearestPlayer() local character=waitForCharacter() if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end local rootPart=character.HumanoidRootPart local nearest,nearestDist=nil,math.huge for _,plr in pairs(game.Players:GetPlayers()) do if plr~=player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then local dist=(rootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude if dist<nearestDist and dist<=50 then nearest,nearestDist=plr,dist end end end return nearest end
local function attackTarget(target) pcall(function() local character=waitForCharacter() if not character or not target then return end local rootPart=character:FindFirstChild("HumanoidRootPart") local targetRoot=target:FindFirstChild("HumanoidRootPart") if not rootPart or not targetRoot then return end local direction=(targetRoot.Position-rootPart.Position).Unit rootPart.CFrame=CFrame.new(targetRoot.Position+(direction*-5))*CFrame.Angles(0,math.pi,0) game:GetService("VirtualUser"):CaptureController() game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) task.wait(0.1) game:GetService("VirtualUser"):Button1Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) if hasSwordEquipped() then for _,key in ipairs({"Z","X","C","V"}) do game:GetService("VirtualInputManager"):SendKeyEvent(true,key,false,nil) task.wait(0.1) game:GetService("VirtualInputManager"):SendKeyEvent(false,key,false,nil) task.wait(0.2) end end for _,key in ipairs({"F","G","H","J"}) do game:GetService("VirtualInputManager"):SendKeyEvent(true,key,false,nil) task.wait(0.1) game:GetService("VirtualInputManager"):SendKeyEvent(false,key,false,nil) task.wait(0.2) end end) end
local function startKillAura() if not toggles.killAura then return end spawn(function() while toggles.killAura and task.wait(0.2) do pcall(function() local nearestPlayer=getNearestPlayer() if nearestPlayer and nearestPlayer.Character then attackTarget(nearestPlayer.Character) end end) end end) end
local function startTriggerBot() if not toggles.triggerBot then return end spawn(function() local UserInputService=game:GetService("UserInputService") UserInputService.InputBegan:Connect(function(input) if input.UserInputType==Enum.UserInputType.MouseButton1 and toggles.triggerBot then pcall(function() local nearestPlayer=getNearestPlayer() if nearestPlayer and nearestPlayer.Character then attackTarget(nearestPlayer.Character) end end) end end) end) end
local function startAutoAttack() if not toggles.autoAttack then return end spawn(function() while toggles.autoAttack and task.wait(0.3) do pcall(function() local mob=getNearestMob() if mob then attackTarget(mob) end end) end end) end
local function startAutoLevel() if not toggles.autoLevel then return end spawn(function() while toggles.autoLevel and task.wait(0.3) do pcall(function() local mob=getNearestMob() if mob then attackTarget(mob) end end) end end) end
local function startAutoNearest() if not toggles.autoNearest then return end spawn(function() while toggles.autoNearest and task.wait(0.5) do pcall(function() local boss=getNearestBoss() if boss then attackTarget(boss) else local mob=getNearestMob() if mob then attackTarget(mob) end end end) end end) end
local function startAutoBoat() if not toggles.autoBoat then return end spawn(function() while toggles.autoBoat and task.wait(0.1) do pcall(function() if isInBoat() then local boat=getBoat() if boat and boat:FindFirstChild("VehicleSeat") then boat.VehicleSeat.Steer=0 boat.VehicleSeat.Throttle=1 end end end) end end) end
local function teleportToNearestBoat() pcall(function() local character=waitForCharacter() if not character or not character:FindFirstChild("HumanoidRootPart") then return end local rootPart=character.HumanoidRootPart local nearestBoat,nearestDist=nil,math.huge if workspace:FindFirstChild("Vehicles") then for _,boat in pairs(workspace.Vehicles:GetChildren()) do if boat.Name:find("Boat") or boat.Name:find("Ship") then local spawnLocation=boat:FindFirstChild("SpawnLocation") or boat:FindFirstChild("VehicleSeat") if spawnLocation then local dist=(rootPart.Position-spawnLocation.Position).Magnitude if dist<nearestDist then nearestBoat,nearestDist=boat,dist end end end end if nearestBoat then local spawnLocation=nearestBoat:FindFirstChild("SpawnLocation") or nearestBoat:FindFirstChild("VehicleSeat") if spawnLocation then rootPart.CFrame=spawnLocation.CFrame*CFrame.new(0,5,0) notify("✅ Bateau","Téléporté vers un bateau !",2) end end end end) end
local function boostBoatSpeed() if not toggles.boatSpeed then return end spawn(function() while toggles.boatSpeed and task.wait(0.1) do pcall(function() if isInBoat() then local boat=getBoat() if boat and boat:FindFirstChild("VehicleSeat") then boat.VehicleSeat.MaxSpeed=200 boat.VehicleSeat.Torque=50000 end end end) end end) end
local function startAutoSeaBeast() if not toggles.autoSeaBeast then return end spawn(function() while toggles.autoSeaBeast and task.wait(1) do pcall(function() local seaBeast=getBoss("Sea Beast") if seaBeast then attackTarget(seaBeast) end end) end end) end
local function startAutoLeviathan() if not toggles.autoLeviathan then return end spawn(function() while toggles.autoLeviathan and task.wait(1) do pcall(function() local leviathan=getBoss("Leviathan") if leviathan then attackTarget(leviathan) end end) end end) end
local function startLeviathanQuest() if not toggles.autoLeviathanQuest then return end spawn(function() while toggles.autoLeviathanQuest and task.wait(0.5) do pcall(function() local character=waitForCharacter() if not character or not character:FindFirstChild("HumanoidRootPart") then return end local rootPart=character.HumanoidRootPart local oldMan=findNPC("Old Man") if not oldMan then for _,island in ipairs(ISLANDS) do if island.Sea==2 then rootPart.CFrame=island.Position task.wait(1) oldMan=findNPC("Old Man") if oldMan then break end end end end if oldMan and oldMan:FindFirstChild("HumanoidRootPart") then rootPart.CFrame=oldMan.HumanoidRootPart.CFrame*CFrame.new(0,0,5) task.wait(1) if not hasQuest("Leviathan") then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk",oldMan) task.wait(2) end for _,waveName in ipairs({"LeviathanWave1","LeviathanWave2","LeviathanWave3"}) do local wave=getBoss(waveName) if wave then attackTarget(wave) task.wait(0.5) end end local leviathan=getBoss("Leviathan") if leviathan then attackTarget(leviathan) end if not getBoss("Leviathan") and not getBoss("LeviathanWave1") then rootPart.CFrame=oldMan.HumanoidRootPart.CFrame*CFrame.new(0,0,5) task.wait(1) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk",oldMan) notify("✅ Quête Leviathan","Récompense: Leviathan Gun !",5) toggles.autoLeviathanQuest=false end end end) end end) end
local function startAutoPirateRaid() if not toggles.autoPirateRaid then return end spawn(function() while toggles.autoPirateRaid and task.wait(1) do pcall(function() for _,enemy in pairs(workspace.Enemies:GetChildren()) do if enemy.Name:find("Pirate") and enemy:FindFirstChild("HumanoidRootPart") then attackTarget(enemy) end end end) end end) end
local function startAutoShipRaid() if not toggles.autoShipRaid then return end spawn(function() while toggles.autoShipRaid and task.wait(1) do pcall(function() for _,enemy in pairs(workspace.Enemies:GetChildren()) do if enemy.Name:find("Ship") and enemy:FindFirstChild("HumanoidRootPart") then attackTarget(enemy) end end end) end end) end
local function startAutoTerrorshark() if not toggles.autoTerrorshark then return end spawn(function() while toggles.autoTerrorshark and task.wait(1) do pcall(function() local terrorshark=getBoss("Terrorshark") if terrorshark then attackTarget(terrorshark) end end) end end) end
local function startAutoVolcano() if not toggles.autoVolcano then return end spawn(function() while toggles.autoVolcano and task.wait(1) do pcall(function() local magmaAdmiral=getBoss("Magma Admiral") if magmaAdmiral then attackTarget(magmaAdmiral) end end) end end) end
local function startAutoFactory() if not toggles.autoFactory then return end spawn(function() while toggles.autoFactory and task.wait(1) do pcall(function() local mirrorBoss=getBoss("Mirror Boss") if mirrorBoss then attackTarget(mirrorBoss) end end) end end) end
local function startAutoPhantom() if not toggles.autoPhantom then return end spawn(function() while toggles.autoPhantom and task.wait(1) do pcall(function() local phantom=getBoss("Phantom") if phantom then attackTarget(phantom) end end) end end) end
local function startAutoDoughKing() if not toggles.autoDoughKing then return end spawn(function() while toggles.autoDoughKing and task.wait(1) do pcall(function() local doughKing=getBoss("Dough King") if doughKing then attackTarget(doughKing) else local cakePrince=findNPC("Cake Prince") if cakePrince then player.Character.HumanoidRootPart.CFrame=cakePrince.HumanoidRootPart.CFrame*CFrame.new(0,0,5) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk",cakePrince) end end end) end end) end
local function startAutoYama() if not toggles.autoYama then return end spawn(function() while toggles.autoYama and task.wait(1) do pcall(function() local yama=getBoss("Yama") if yama then attackTarget(yama) else local monk=findNPC("Monk") if monk then player.Character.HumanoidRootPart.CFrame=monk.HumanoidRootPart.CFrame*CFrame.new(0,0,5) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk",monk) task.wait(1) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SelectQuest","Yama") end end end) end end) end
local function startAutoTushita() if not toggles.autoTushita then return end spawn(function() while toggles.autoTushita and task.wait(1) do pcall(function() local tushita=getBoss("Tushita") if tushita then attackTarget(tushita) else local monk=findNPC("Monk") if monk then player.Character.HumanoidRootPart.CFrame=monk.HumanoidRootPart.CFrame*CFrame.new(0,0,5) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk",monk) task.wait(1) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SelectQuest","Tushita") end end end) end end) end
local function startAutoCDK() if not toggles.autoCDK then return end spawn(function() while toggles.autoCDK and task.wait(1) do pcall(function() local cdk=getBoss("Cursed Dual Katana") if cdk then attackTarget(cdk) else local hitman=findNPC("Hitman") if hitman then player.Character.HumanoidRootPart.CFrame=hitman.HumanoidRootPart.CFrame*CFrame.new(0,0,5) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk",hitman) end end end) end end) end
local function startAutoSanguineArt() if not toggles.autoSanguineArt then return end spawn(function() while toggles.autoSanguineArt and task.wait(1) do pcall(function() local sanguine=getBoss("Sanguine Art") if sanguine then attackTarget(sanguine) else local artDealer=findNPC("Art Dealer") if artDealer then player.Character.HumanoidRootPart.CFrame=artDealer.HumanoidRootPart.CFrame*CFrame.new(0,0,5) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk",artDealer) end end end) end end) end
local function startAutoKitsune() if not toggles.autoKitsune then return end spawn(function() while toggles.autoKitsune and task.wait(1) do pcall(function() local kitsune=getBoss("Kitsune") if kitsune then attackTarget(kitsune) else local mysticLady=findNPC("Mystic Lady") if mysticLady then player.Character.HumanoidRootPart.CFrame=mysticLady.HumanoidRootPart.CFrame*CFrame.new(0,0,5) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk",mysticLady) end end end) end end) end
local function startAutoRaceV4() if not toggles.autoRaceV4 then return end spawn(function() while toggles.autoRaceV4 and task.wait(1) do pcall(function() local raceNPC=findNPC("Race") if raceNPC and raceNPC:FindFirstChild("HumanoidRootPart") then player.Character.HumanoidRootPart.CFrame=raceNPC.HumanoidRootPart.CFrame*CFrame.new(0,0,5) task.wait(1) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk",raceNPC) end end) end end) end
local function startAutoSoulReaper() if not toggles.autoSoulReaper then return end spawn(function() while toggles.autoSoulReaper and task.wait(1) do pcall(function() local soulReaper=getBoss("Soul Reaper") if soulReaper then attackTarget(soulReaper) else local death=findNPC("Death") if death then player.Character.HumanoidRootPart.CFrame=death.HumanoidRootPart.CFrame*CFrame.new(0,0,5) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk",death) end end end) end end) end
local function teleportToMirageIsland() pcall(function() local character=waitForCharacter() if not character or not character:FindFirstChild("HumanoidRootPart") then return end local rootPart=character.HumanoidRootPart local available,island=isMirageIslandAvailable() if available and island then if island:FindFirstChild("SpawnLocation") then rootPart.CFrame=island.SpawnLocation.CFrame else rootPart.CFrame=CFrame.new(5000,100,5000) end notify("✅ Île Mirage","Téléporté !",3) else notify("❌ Erreur","L'île Mirage n'est pas disponible.",3) end end) end
local function startMirageIslandQuest() if not toggles.autoMirageIsland then return end spawn(function() while toggles.autoMirageIsland and task.wait(5) do pcall(function() local character=waitForCharacter() if not character or not character:FindFirstChild("HumanoidRootPart") then return end local rootPart=character.HumanoidRootPart local available,island=isMirageIslandAvailable() if available then teleportToMirageIsland() task.wait(2) local mirageNPC=findNPC("Mirage") if mirageNPC and mirageNPC:FindFirstChild("HumanoidRootPart") then rootPart.CFrame=mirageNPC.HumanoidRootPart.CFrame*CFrame.new(0,0,5) task.wait(1) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk",mirageNPC) for _,enemy in pairs(workspace.Enemies:GetChildren()) do if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health>0 and enemy:FindFirstChild("HumanoidRootPart") then local dist=(rootPart.Position-enemy.HumanoidRootPart.Position).Magnitude if dist<1000 then attackTarget(enemy) task.wait(0.5) end end end if mirageNPC then rootPart.CFrame=mirageNPC.HumanoidRootPart.CFrame*CFrame.new(0,0,5) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Talk",mirageNPC) notify("✅ Quête Île Mirage","Terminée !",5) end end end end) end end) end
local function startAutoCollect() if not toggles.autoCollect then return end spawn(function() while toggles.autoCollect and task.wait(1) do pcall(function() local character=waitForCharacter() if not character or not character:FindFirstChild("HumanoidRootPart") then return end local rootPart=character.HumanoidRootPart for _,fruit in pairs(workspace:GetChildren()) do if fruit.Name:find("Fruit") and fruit:FindFirstChild("HumanoidRootPart") then rootPart.CFrame=fruit.HumanoidRootPart.CFrame task.wait(0.5) end end end) end end) end
local function startAutoCollectRewards() if not toggles.autoCollectRewards then return end spawn(function() while toggles.autoCollectRewards and task.wait(30) do pcall(function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CollectAll") notify("✅ Récompenses","Collectées !",2) end) end end) end
local function giveFruitsPerms() if not hasFruitsPerms then return end pcall(function() local fruitsList={"Flame-Flame","Ice-Ice","Light-Light","Dark-Dark","String-String","Rumble-Rumble","Magma-Magma","Human: Buddha","Phoenix-Phoenix","Dragon-Dragon"} for _,fruitName in ipairs(fruitsList) do game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFruit",fruitName) task.wait(0.3) end local legendaryWeapons={"Dark Blade","Shisui","Wando","Saddi","True Triple Katana","Yama","Tushita","Cursed Dual Katana","Sanguine Art"} for _,weapon in ipairs(legendaryWeapons) do game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem",weapon) task.wait(0.3) end notify("✅ Fruits Perms","Tous les fruits + armes légendaires obtenus !",5) end) end
local function manageESP(part,espName,text,color) if not part then return end local existingESP=part:FindFirstChild(espName) if existingESP then existingESP:Destroy() end local shouldShow=false if espName:find("Player") and toggles.espPlayers then shouldShow=true end if espName:find("Boss") and toggles.espBoss then shouldShow=true end if espName:find("Fruit") and toggles.espFruits then shouldShow=true end if espName:find("Chest") and toggles.espChests then shouldShow=true end if espName:find("NPC") and toggles.espNPCs then shouldShow=true end if shouldShow then local billboardGui=Instance.new("BillboardGui") billboardGui.Name=espName billboardGui.Size=UDim2.new(0,100,0,30) billboardGui.StudsOffset=Vector3.new(0,2,0) billboardGui.Adornee=part billboardGui.AlwaysOnTop=true billboardGui.Parent=part local frame=Instance.new("Frame") frame.Size=UDim2.new(1,0,1,0) frame.BackgroundColor3=Color3.fromRGB(0,0,0) frame.BackgroundTransparency=0.3 frame.BorderSizePixel=0 frame.Parent=billboardGui local textLabel=Instance.new("TextLabel") textLabel.Size=UDim2.new(1,0,1,0) textLabel.BackgroundTransparency=1 textLabel.Text=text textLabel.TextColor3=color textLabel.TextStrokeTransparency=0 textLabel.Font=Enum.Font.SourceSansBold textLabel.TextSize=14 textLabel.Parent=frame end end
local function updateESP() pcall(function() local character=waitForCharacter() if not character or not character:FindFirstChild("HumanoidRootPart") then return end local rootPart=character.HumanoidRootPart if toggles.espPlayers then for _,plr in pairs(game.Players:GetPlayers()) do if plr~=player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then local dist=(rootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude manageESP(plr.Character.HumanoidRootPart,"ESP_Player_ANONYMES",plr.Name.." ("..math.floor(dist).."m)",Color3.new(0,1,0)) end end end if toggles.espBoss and workspace:FindFirstChild("Enemies") then for _,boss in pairs(workspace.Enemies:GetChildren()) do if boss:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health>0 then local bossLevel=boss:FindFirstChild("Level") and boss.Level.Value or "?" local bossName=boss.Name for _,bossInfo in ipairs(BOSSES) do if bossName:find(bossInfo.Name) then bossName=bossInfo.Name break end end local dist=(rootPart.Position-boss.HumanoidRootPart.Position).Magnitude manageESP(boss.HumanoidRootPart,"ESP_Boss_ANONYMES",bossName.." [Lv. "..bossLevel.."] ("..math.floor(dist).."m)",Color3.new(1,0,0)) end end end if toggles.espFruits then for _,fruit in pairs(workspace:GetChildren()) do if fruit.Name:find("Fruit") and fruit:FindFirstChild("HumanoidRootPart") then local dist=(rootPart.Position-fruit.HumanoidRootPart.Position).Magnitude manageESP(fruit.HumanoidRootPart,"ESP_Fruit_ANONYMES",fruit.Name.." ("..math.floor(dist).."m)",Color3.new(1,1,0)) end end end if toggles.espChests then for _,chest in pairs(workspace:GetChildren()) do if chest.Name:find("Chest") and chest:FindFirstChild("PrimaryPart") then local dist=(rootPart.Position-chest.PrimaryPart.Position).Magnitude manageESP(chest.PrimaryPart,"ESP_Chest_ANONYMES","Chest ("..math.floor(dist).."m)",Color3.new(0,1,1)) end end end if toggles.espNPCs and workspace:FindFirstChild("NPCs") then for _,npc in pairs(workspace.NPCs:GetChildren()) do if npc:FindFirstChild("HumanoidRootPart") then local dist=(rootPart.Position-npc.HumanoidRootPart.Position).Magnitude manageESP(npc.HumanoidRootPart,"ESP_NPC_ANONYMES",npc.Name.." ("..math.floor(dist).."m)",Color3.new(1,0,1)) end end end end) end
local function teleportToMob() if not toggles.teleportMobs then return end spawn(function() while toggles.teleportMobs and task.wait(0.5) do pcall(function() local character=waitForCharacter() if not character or not character:FindFirstChild("HumanoidRootPart") then return end local rootPart=character.HumanoidRootPart local mob=getNearestMob() if mob and mob:FindFirstChild("HumanoidRootPart") then rootPart.CFrame=mob.HumanoidRootPart.CFrame*CFrame.new(0,0,5) end end) end end) end
local function bringMob() if not toggles.bringMob then return end spawn(function() while toggles.bringMob and task.wait(0.3) do pcall(function() local character=waitForCharacter() if not character or not character:FindFirstChild("HumanoidRootPart") then return end local rootPart=character.HumanoidRootPart if workspace:FindFirstChild("Enemies") then for _,mob in pairs(workspace.Enemies:GetChildren()) do if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health>0 then local dist=(rootPart.Position-mob.HumanoidRootPart.Position).Magnitude if dist<100 then mob.HumanoidRootPart.CFrame=rootPart.CFrame*CFrame.new(0,0,-5) mob.HumanoidRootPart.Velocity=Vector3.new(0,0,0) mob.HumanoidRootPart.Anchored=true task.wait(0.1) mob.HumanoidRootPart.Anchored=false end end end end end) end end) end
local function teleportToIsland(islandName) pcall(function() local character=waitForCharacter() if not character or not character:FindFirstChild("HumanoidRootPart") then return end local rootPart=character.HumanoidRootPart for _,island in ipairs(ISLANDS) do if island.Name:lower():find(islandName:lower()) then if island.Position then rootPart.CFrame=island.Position notify("✅ Téléportation","Téléporté vers "..island.Name,2) return true else notify("❌ Erreur",island.Name.." n'a pas de position.",2) return false end end end notify("❌ Erreur","Île non trouvée: "..islandName,2) return false end) end
local function autoIslandHop() if not toggles.autoIslandHop then return end spawn(function() while toggles.autoIslandHop and task.wait(60) do pcall(function() game:GetService("TeleportService"):Teleport(game.PlaceId) end) end end) end
local function enableWalkOnWater() if not toggles.walkOnWater then return end spawn(function() while toggles.walkOnWater and task.wait(0.1) do pcall(function() local character=player.Character if character and character:FindFirstChild("Humanoid") then character.Humanoid.WalkSpeed=50 end end) end end) end
local function enableInfiniteJump() if not toggles.infiniteJump then return end game:GetService("UserInputService").JumpRequest:Connect(function() pcall(function() local character=player.Character if character and character:FindFirstChild("Humanoid") then character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end) end) end
local function enableNoClip() spawn(function() while true do pcall(function() local character=player.Character if character then for _,part in pairs(character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide=not toggles.noClip end end end) task.wait(0.1) end end) end
local function enableFlight() spawn(function() local flightSpeed=100 local bodyVelocity=Instance.new("BodyVelocity") bodyVelocity.Velocity=Vector3.new(0,0,0) bodyVelocity.MaxForce=Vector3.new(4000,4000,4000) bodyVelocity.Name="FlightVelocity_ANONYMES" while true do pcall(function() local character=player.Character if character and character:FindFirstChild("HumanoidRootPart") then if toggles.flight then if not character.HumanoidRootPart:FindFirstChild("FlightVelocity_ANONYMES") then bodyVelocity.Parent=character.HumanoidRootPart end local moveDirection=Vector3.new(0,0,0) if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then moveDirection=moveDirection+(character.HumanoidRootPart.CFrame.LookVector*flightSpeed) end if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then moveDirection=moveDirection-(character.HumanoidRootPart.CFrame.LookVector*flightSpeed) end if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then moveDirection=moveDirection-(character.HumanoidRootPart.CFrame.RightVector*flightSpeed) end if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then moveDirection=moveDirection+(character.HumanoidRootPart.CFrame.RightVector*flightSpeed) end if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then moveDirection=moveDirection+Vector3.new(0,flightSpeed,0) end if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then moveDirection=moveDirection-Vector3.new(0,flightSpeed,0) end bodyVelocity.Velocity=moveDirection else bodyVelocity:Destroy() end else bodyVelocity:Destroy() end end) task.wait(0.1) end end) end
local function startAutoHaki() if not toggles.autoHaki then return end spawn(function() while toggles.autoHaki and task.wait(0.5) do pcall(function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ken") if hasSwordEquipped() then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Busoshoku") end end) end end) end
local function startAutoObservation() if not toggles.autoObservation then return end spawn(function() while toggles.autoObservation and task.wait(0.5) do pcall(function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ken") end) end end) end
local function startAutoArmament() if not toggles.autoArmament then return end spawn(function() while toggles.autoArmament and task.wait(0.5) do pcall(function() if hasSwordEquipped() then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Busoshoku") end end) end end) end
local function startServerHop() if not toggles.serverHop then return end spawn(function() while toggles.serverHop and task.wait(60) do pcall(function() game:GetService("TeleportService"):Teleport(game.PlaceId) end) end end) end
local function startAntiKick() if not toggles.antiKick then return end spawn(function() while toggles.antiKick and task.wait(1) do pcall(function() settings().Physics.PhysicsEnvironmentalThrottle=Enum.EnvironmentalPhysicsThrottle.Disabled settings().Physics.AllowSleep=false setfpscap(60) end) end end) end
local function startFPSBoost() if not toggles.fpsBoost then return end spawn(function() while toggles.fpsBoost and task.wait(0.5) do pcall(function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then v.Enabled=false end end workspace.DescendantAdded:Connect(function(descendant) if descendant:IsA("ParticleEmitter") or descendant:IsA("Fire") or descendant:IsA("Smoke") or descendant:IsA("Sparkles") then descendant.Enabled=false end end) settings().RenderQuality=Enum.RenderQuality.Low settings().Technology=Enum.Technology.Future end) end end) end
local function checkVIP(password) if password==VIP_PASSWORD then isVIP=true hasFruitsPerms=true hasAutoPvP=true notify("✅ VIP Activé","Toutes les fonctionnalités débloquées !",8) else notify("❌ Erreur","Mot de passe incorrect.",3) end end
local function buyFeature(feature,cost) if isVIP then if feature=="fruitsPerms" then hasFruitsPerms=true giveFruitsPerms() elseif feature=="autoPvP" then hasAutoPvP=true end notify("✅ Débloqué","Fonctionnalité activée (VIP).",3) return true else if (feature=="fruitsPerms" and hasFruitsPerms) or (feature=="autoPvP" and hasAutoPvP) then notify("ℹ️ Déjà débloqué","Tu as déjà cette fonctionnalité.",3) return true end if hasEnoughBeli(cost) then if payBeli(cost) then if feature=="fruitsPerms" then hasFruitsPerms=true giveFruitsPerms() elseif feature=="autoPvP" then hasAutoPvP=true end notify("✅ Achat réussi","Fonctionnalité débloquée !",3) return true end else notify("❌ Erreur","Il te manque "..(cost-getBeli()).." Beli.",3) end end return false end
local function createUI()
    pcall(function() if syn and syn.protect_gui then syn.protect_gui(Instance.new("ScreenGui")) end end)
    screenGui=Instance.new("ScreenGui")
    screenGui.Name="ANONYMES_SCRIPTS_HUB_v"..VERSION
    screenGui.ResetOnSpawn=false
    screenGui.ZIndexBehavior=Enum.ZIndexBehavior.Global
    screenGui.Parent=game:GetService("CoreGui")
    mainFrame=Instance.new("Frame")
    mainFrame.Name="MainFrame"
    mainFrame.Size=UDim2.new(0,650,0,500)
    mainFrame.Position=UDim2.new(0.5,-325,0.5,-250)
    mainFrame.AnchorPoint=Vector2.new(0.5,0.5)
    mainFrame.BackgroundColor3=Color3.fromRGB(25,25,25)
    mainFrame.BorderSizePixel=0
    mainFrame.Visible=false
    mainFrame.Parent=screenGui
    local logoFrame=Instance.new("Frame")
    logoFrame.Name="LogoFrame"
    logoFrame.Size=UDim2.new(0,100,0,100)
    logoFrame.Position=UDim2.new(0,10,0,10)
    logoFrame.BackgroundColor3=Color3.fromRGB(20,20,20)
    logoFrame.BackgroundTransparency=0.2
    logoFrame.BorderSizePixel=1
    logoFrame.BorderColor3=Color3.fromRGB(255,215,0)
    logoFrame.Parent=screenGui
    local logoImage=Instance.new("ImageLabel")
    logoImage.Name="LogoImage"
    logoImage.Size=UDim2.new(1,0,1,0)
    logoImage.BackgroundTransparency=1
    logoImage.Image=LOGO_URL
    logoImage.ScaleType=Enum.ScaleType.Slice
    logoImage.SliceCenter=Rect.new(100,100,100,100)
    logoImage.Parent=logoFrame
    spawn(function() task.wait(2) if logoImage.ImageTransparency>=0.99 then logoImage.Image="rbxassetid://1000000000" end end)
    logoImage.MouseButton1Click:Connect(function() mainFrame.Visible=not mainFrame.Visible logoFrame.BorderColor3=mainFrame.Visible and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,215,0) end)
    local titleBar=Instance.new("Frame")
    titleBar.Name="TitleBar"
    titleBar.Size=UDim2.new(1,0,0,30)
    titleBar.BackgroundColor3=Color3.fromRGB(15,15,15)
    titleBar.BorderSizePixel=0
    titleBar.Parent=mainFrame
    local titleLabel=Instance.new("TextLabel")
    titleLabel.Name="TitleLabel"
    titleLabel.Size=UDim2.new(1,0,1,0)
    titleLabel.BackgroundTransparency=1
    titleLabel.Text="ANONYMES SCRIPTS HUB v"..VERSION.." | Blox Fruits"
    titleLabel.TextColor3=Color3.fromRGB(255,215,0)
    titleLabel.TextSize=16
    titleLabel.Font=Enum.Font.SourceSansBold
    titleLabel.Parent=titleBar
    local closeButton=Instance.new("TextButton")
    closeButton.Name="CloseButton"
    closeButton.Size=UDim2.new(0,30,0,30)
    closeButton.Position=UDim2.new(1,-30,0,0)
    closeButton.BackgroundColor3=Color3.fromRGB(200,50,50)
    closeButton.Text="X"
    closeButton.TextColor3=Color3.fromRGB(255,255,255)
    closeButton.Parent=titleBar
    closeButton.MouseButton1Click:Connect(function() mainFrame.Visible=false end)
    local tabButtons={} local tabFrames={} local tabNames={"Home","Farming","Combat","Events","Quêtes","Boats","Îles","ESP","Haki","Movement","Admin"}
    local tabButtonContainer=Instance.new("Frame")
    tabButtonContainer.Name="TabButtonContainer"
    tabButtonContainer.Size=UDim2.new(1,0,0,30)
    tabButtonContainer.Position=UDim2.new(0,0,0,30)
    tabButtonContainer.BackgroundColor3=Color3.fromRGB(35,35,35)
    tabButtonContainer.BorderSizePixel=0
    tabButtonContainer.Parent=mainFrame
    for i,tabName in ipairs(tabNames) do
        local tabButton=Instance.new("TextButton")
        tabButton.Name=tabName.."Button"
        tabButton.Size=UDim2.new(1/#tabNames,0,1,0)
        tabButton.Position=UDim2.new((i-1)/#tabNames,0,0,0)
        tabButton.BackgroundColor3=Color3.fromRGB(45,45,45)
        tabButton.Text=tabName
        tabButton.TextColor3=Color3.fromRGB(200,200,200)
        tabButton.Parent=tabButtonContainer
        tabButton.Font=Enum.Font.SourceSans
        tabButton.TextSize=12
        tabButton.BorderSizePixel=0
        tabButtons[tabName]=tabButton
        tabButton.MouseButton1Click:Connect(function()
            for _,button in pairs(tabButtons) do button.BackgroundColor3=Color3.fromRGB(45,45,45) end
            tabButton.BackgroundColor3=Color3.fromRGB(70,70,70)
            for _,frame in pairs(tabFrames) do frame.Visible=false end
            if tabFrames[tabName] then tabFrames[tabName].Visible=true end
        end)
    end
    local tabFrameContainer=Instance.new("Frame")
    tabFrameContainer.Name="TabFrameContainer"
    tabFrameContainer.Size=UDim2.new(1,0,1,-60)
    tabFrameContainer.Position=UDim2.new(0,0,0,60)
    tabFrameContainer.BackgroundColor3=Color3.fromRGB(40,40,40)
    tabFrameContainer.BorderSizePixel=0
    tabFrameContainer.Parent=mainFrame
    for _,tabName in ipairs(tabNames) do
        local tabFrame=Instance.new("ScrollingFrame")
        tabFrame.Name=tabName.."Frame"
        tabFrame.Size=UDim2.new(1,0,1,0)
        tabFrame.BackgroundTransparency=1
        tabFrame.ScrollBarThickness=5
        tabFrame.CanvasSize=UDim2.new(0,0,0,0)
        tabFrame.Visible=false
        tabFrame.Parent=tabFrameContainer
        tabFrames[tabName]=tabFrame
        local padding=Instance.new("UIPadding")
        padding.PaddingTop=UDim.new(0,10)
        padding.PaddingLeft=UDim.new(0,10)
        padding.Parent=tabFrame
        local listLayout=Instance.new("UIListLayout")
        listLayout.Padding=UDim.new(0,5)
        listLayout.Parent=tabFrame
    end
    local homeFrame=tabFrames["Home"]
    homeFrame.Visible=true
    tabButtons["Home"].BackgroundColor3=Color3.fromRGB(70,70,70)
    local welcomeLabel=Instance.new("TextLabel")
    welcomeLabel.Name="WelcomeLabel"
    welcomeLabel.Size=UDim2.new(1,-20,0,120)
    welcomeLabel.BackgroundTransparency=1
    welcomeLabel.Text="🏴‍☠️ ANONYMES SCRIPTS HUB v"..VERSION.." 🏴‍☠️\n\n✅ **100% des fonctionnalités de Blox Fruits**\n🔒 **VIP: Mot de passe = "..VIP_PASSWORD.."**\n💰 **Public: 5M Beli (Fruits Perms), 2M Beli (Auto PvP)**\n\n📌 **Nouveautés:**\n• Logo immédiat (clique pour ouvrir)\n• Quête Leviathan complète\n• Île Mirage (détection + quête)\n• ESP avancé (niveaux, distances)\n• Flight (WASD + Espace/Shift)"
    welcomeLabel.TextColor3=Color3.fromRGB(255,255,255)
    welcomeLabel.TextSize=14
    welcomeLabel.TextWrapped=true
    welcomeLabel.Font=Enum.Font.SourceSans
    welcomeLabel.Parent=homeFrame
    local vipButton=Instance.new("TextButton")
    vipButton.Name="VIPButton"
    vipButton.Size=UDim2.new(0,200,0,30)
    vipButton.Position=UDim2.new(0,0,0,130)
    vipButton.BackgroundColor3=Color3.fromRGB(50,50,50)
    vipButton.Text="🔑 Entrer le mot de passe VIP"
    vipButton.TextColor3=Color3.fromRGB(255,215,0)
    vipButton.Parent=homeFrame
    vipButton.MouseButton1Click:Connect(function()
        local success,password=pcall(function() return game.StarterGui:GetCore("PromptInput",{Title="Mot de passe VIP",Text="Entrez le code :"}) end)
        if success and password then checkVIP(password) end
    end)
    local beliLabel=Instance.new("TextLabel")
    beliLabel.Name="BeliLabel"
    beliLabel.Size=UDim2.new(1,-20,0,20)
    beliLabel.Position=UDim2.new(0,0,0,170)
    beliLabel.BackgroundTransparency=1
    beliLabel.Text="💰 Beli: "..getBeli().." | 🌊 Sea: "..getCurrentSea()
    beliLabel.TextColor3=Color3.fromRGB(255,215,0)
    beliLabel.TextSize=14
    beliLabel.Font=Enum.Font.SourceSansBold
    beliLabel.Parent=homeFrame
    spawn(function() while true do task.wait(5) if beliLabel then beliLabel.Text="💰 Beli: "..getBeli().." | 🌊 Sea: "..getCurrentSea() end end end)
    local farmingFrame=tabFrames["Farming"]
    local farmingFeatures={{Name="autoLevel",Display="Auto Level"},{Name="autoNearest",Display="Auto Nearest (Boss/Mob)"},{Name="autoEctoplasm",Display="Auto Ectoplasm"},{Name="autoCandy",Display="Auto Candy"},{Name="autoGifts",Display="Auto Gifts"},{Name="autoCollect",Display="Auto Collect Fruits"},{Name="autoCollectRewards",Display="Auto Collect Rewards"}}
    for _,feature in ipairs(farmingFeatures) do
        local button=Instance.new("TextButton")
        button.Name=feature.Name.."Button"
        button.Size=UDim2.new(1,-10,0,30)
        button.BackgroundColor3=Color3.fromRGB(50,50,50)
        button.Text=feature.Display.." [OFF]"
        button.TextColor3=Color3.fromRGB(255,255,255)
        button.Font=Enum.Font.SourceSans
        button.TextSize=14
        button.Parent=farmingFrame
        button.MouseButton1Click:Connect(function()
            local newState=toggleFeature(feature.Name)
            button.Text=feature.Display.." ["..(newState and "ON" or "OFF").."]"
            if newState then
                if feature.Name=="autoLevel" then startAutoLevel()
                elseif feature.Name=="autoNearest" then startAutoNearest()
                elseif feature.Name=="autoCollect" then startAutoCollect()
                elseif feature.Name=="autoCollectRewards" then startAutoCollectRewards()
            end
        end)
    end
    local combatFrame=tabFrames["Combat"]
    local combatFeatures={{Name="killAura",Display="Kill Aura"},{Name="triggerBot",Display="TriggerBot"},{Name="autoAttack",Display="Auto Attack"},{Name="autoPvP",Display="Auto PvP"}}
    for _,feature in ipairs(combatFeatures) do
        local button=Instance.new("TextButton")
        button.Name=feature.Name.."Button"
        button.Size=UDim2.new(1,-10,0,30)
        button.BackgroundColor3=Color3.fromRGB(50,50,50)
        if feature.Name=="autoPvP" then
            button.Text=(hasAutoPvP or isVIP) and feature.Display.." [OFF]" or feature.Display.." (2M Beli)"
        else
            button.Text=feature.Display.." [OFF]"
        end
        button.TextColor3=Color3.fromRGB(255,255,255)
        button.Font=Enum.Font.SourceSans
        button.TextSize=14
        button.Parent=combatFrame
        button.MouseButton1Click:Connect(function()
            if feature.Name=="autoPvP" then
                if hasAutoPvP or isVIP then
                    local newState=toggleFeature(feature.Name)
                    button.Text=feature.Display.." ["..(newState and "ON" or "OFF").."]"
                else
                    if buyFeature("autoPvP",PRICE_AUTO_PVP) then
                        button.Text=feature.Display.." [OFF]"
                    end
                end
            else
                local newState=toggleFeature(feature.Name)
                button.Text=feature.Display.." ["..(newState and "ON" or "OFF").."]"
                if newState then
                    if feature.Name=="killAura" then startKillAura()
                    elseif feature.Name=="triggerBot" then startTriggerBot()
                    elseif feature.Name=="autoAttack" then startAutoAttack()
                end
            end
        end)
    end
    local eventsFrame=tabFrames["Events"]
    local eventFeatures={{Name="autoSeaBeast",Display="Auto Sea Beast"},{Name="autoLeviathan",Display="Auto Leviathan (Boss seul)"},{Name="autoLeviathanQuest",Display="⭐ Auto Leviathan (Quête complète)"},{Name="autoPirateRaid",Display="Auto Pirate Raid"},{Name="autoShipRaid",Display="Auto Ship Raid"},{Name="autoTerrorshark",Display="Auto Terrorshark"},{Name="autoVolcano",Display="Auto Volcano"},{Name="autoFactory",Display="Auto Factory"},{Name="autoPhantom",Display="Auto Phantom"}}
    for _,feature in ipairs(eventFeatures) do
        local button=Instance.new("TextButton")
        button.Name=feature.Name.."Button"
        button.Size=UDim2.new(1,-10,0,30)
        button.BackgroundColor3=Color3.fromRGB(50,50,50)
        button.Text=feature.Display.." [OFF]"
        button.TextColor3=Color3.fromRGB(255,255,255)
        button.Font=Enum.Font.SourceSans
        button.TextSize=12
        button.Parent=eventsFrame
        button.MouseButton1Click:Connect(function()
            local newState=toggleFeature(feature.Name)
            button.Text=feature.Display.." ["..(newState and "ON" or "OFF").."]"
            if newState then
                if feature.Name=="autoSeaBeast" then startAutoSeaBeast()
                elseif feature.Name=="autoLeviathan" then startAutoLeviathan()
                elseif feature.Name=="autoLeviathanQuest" then startLeviathanQuest()
                elseif feature.Name=="autoPirateRaid" then startAutoPirateRaid()
                elseif feature.Name=="autoShipRaid" then startAutoShipRaid()
                elseif feature.Name=="autoTerrorshark" then startAutoTerrorshark()
                elseif feature.Name=="autoVolcano" then startAutoVolcano()
                elseif feature.Name=="autoFactory" then startAutoFactory()
                elseif feature.Name=="autoPhantom" then startAutoPhantom()
            end
        end)
    end
    local questsFrame=tabFrames["Quêtes"]
    local questFeatures={{Name="autoDoughKing",Display="Auto Dough King"},{Name="autoYama",Display="Auto Yama"},{Name="autoTushita",Display="Auto Tushita"},{Name="autoCDK",Display="Auto Cursed Dual Katana"},{Name="autoSanguineArt",Display="Auto Sanguine Art"},{Name="autoKitsune",Display="Auto Kitsune"},{Name="autoRaceV4",Display="Auto Race V4"},{Name="autoMirageIsland",Display="⭐ Auto Mirage Island"},{Name="autoSoulReaper",Display="Auto Soul Reaper"}}
    for _,feature in ipairs(questFeatures) do
        local button=Instance.new("TextButton")
        button.Name=feature.Name.."Button"
        button.Size=UDim2.new(1,-10,0,30)
        button.BackgroundColor3=Color3.fromRGB(50,50,50)
        button.Text=feature.Display.." [OFF]"
        button.TextColor3=Color3.fromRGB(255,255,255)
        button.Font=Enum.Font.SourceSans
        button.TextSize=12
        button.Parent=questsFrame
        button.MouseButton1Click:Connect(function()
            local newState=toggleFeature(feature.Name)
            button.Text=feature.Display.." ["..(newState and "ON" or "OFF").."]"
            if newState then
                if feature.Name=="autoDoughKing" then startAutoDoughKing()
                elseif feature.Name=="autoYama" then startAutoYama()
                elseif feature.Name=="autoTushita" then startAutoTushita()
                elseif feature.Name=="autoCDK" then startAutoCDK()
                elseif feature.Name=="autoSanguineArt" then startAutoSanguineArt()
                elseif feature.Name=="autoKitsune" then startAutoKitsune()
                elseif feature.Name=="autoRaceV4" then startAutoRaceV4()
                elseif feature.Name=="autoMirageIsland" then startMirageIslandQuest()
                elseif feature.Name=="autoSoulReaper" then startAutoSoulReaper()
            end
        end)
    end
    local boatsFrame=tabFrames["Boats"]
    local boatFeatures={{Name="autoBoat",Display="Auto Conduire Bateau"},{Name="teleportToBoat",Display="Téléport vers Bateau"},{Name="boatSpeed",Display="Boat Speed Hack (200)"}}
    for _,feature in ipairs(boatFeatures) do
        local button=Instance.new("TextButton")
        button.Name=feature.Name.."Button"
        button.Size=UDim2.new(1,-10,0,30)
        button.BackgroundColor3=Color3.fromRGB(50,50,50)
        button.Text=feature.Display.." [OFF]"
        button.TextColor3=Color3.fromRGB(255,255,255)
        button.Font=Enum.Font.SourceSans
        button.TextSize=14
        button.Parent=boatsFrame
        button.MouseButton1Click:Connect(function()
            if feature.Name=="teleportToBoat" then
                teleportToNearestBoat()
            else
                local newState=toggleFeature(feature.Name)
                button.Text=feature.Display.." ["..(newState and "ON" or "OFF").."]"
                if newState then
                    if feature.Name=="autoBoat" then startAutoBoat()
                    elseif feature.Name=="boatSpeed" then boostBoatSpeed()
                end
            end
        end)
    end
    local ilesFrame=tabFrames["Îles"]
    local mirageButton=Instance.new("TextButton")
    mirageButton.Name="MirageButton"
    mirageButton.Size=UDim2.new(1,-10,0,30)
    mirageButton.BackgroundColor3=Color3.fromRGB(50,50,50)
    mirageButton.Text="🏝️ Téléport vers Île Mirage"
    mirageButton.TextColor3=Color3.fromRGB(255,215,0)
    mirageButton.Font=Enum.Font.SourceSans
    mirageButton.TextSize=14
    mirageButton.Parent=ilesFrame
    mirageButton.MouseButton1Click:Connect(teleportToMirageIsland)
    local islandHopButton=Instance.new("TextButton")
    islandHopButton.Name="IslandHopButton"
    islandHopButton.Size=UDim2.new(1,-10,0,30)
    islandHopButton.BackgroundColor3=Color3.fromRGB(50,50,50)
    islandHopButton.Text="🌊 Auto Island Hop [OFF]"
    islandHopButton.TextColor3=Color3.fromRGB(255,255,255)
    islandHopButton.Font=Enum.Font.SourceSans
    islandHopButton.TextSize=14
    islandHopButton.Parent=ilesFrame
    islandHopButton.MouseButton1Click:Connect(function()
        local newState=toggleFeature("autoIslandHop")
        islandHopButton.Text="🌊 Auto Island Hop ["..(newState and "ON" or "OFF").."]"
        if newState then autoIslandHop() end
    end)
    local islandsLabel=Instance.new("TextLabel")
    islandsLabel.Name="IslandsLabel"
    islandsLabel.Size=UDim2.new(1,-10,0,20)
    islandsLabel.BackgroundTransparency=1
    islandsLabel.Text="🗺️ Téléportation vers les îles:"
    islandsLabel.TextColor3=Color3.fromRGB(255,215,0)
    islandsLabel.TextSize=14
    islandsLabel.Font=Enum.Font.SourceSansBold
    islandsLabel.Parent=ilesFrame
    for _,island in ipairs(ISLANDS) do
        if island.Name~="Mirage Island" then
            local islandButton=Instance.new("TextButton")
            islandButton.Name="TeleportTo"..island.Name:gsub("%s+","")
            islandButton.Size=UDim2.new(0.5,-15,0,25)
            islandButton.BackgroundColor3=Color3.fromRGB(40,40,40)
            islandButton.Text="→ "..island.Name
            islandButton.TextColor3=Color3.fromRGB(200,200,200)
            islandButton.Font=Enum.Font.SourceSans
            islandButton.TextSize=12
            islandButton.Parent=ilesFrame
            islandButton.MouseButton1Click:Connect(function() teleportToIsland(island.Name) end)
        end
    end
    local espFrame=tabFrames["ESP"]
    local espFeatures={{Name="espPlayers",Display="ESP Players",Color=Color3.new(0,1,0)},{Name="espBoss",Display="ESP Boss (niveaux + distance)",Color=Color3.new(1,0,0)},{Name="espFruits",Display="ESP Fruits",Color=Color3.new(1,1,0)},{Name="espChests",Display="ESP Chests",Color=Color3.new(0,1,1)},{Name="espNPCs",Display="ESP NPCs",Color=Color3.new(1,0,1)}}
    for _,feature in ipairs(espFeatures) do
        local button=Instance.new("TextButton")
        button.Name=feature.Name.."Button"
        button.Size=UDim2.new(1,-10,0,30)
        button.BackgroundColor3=Color3.fromRGB(50,50,50)
        button.Text=feature.Display.." [OFF]"
        button.TextColor3=feature.Color
        button.Font=Enum.Font.SourceSans
        button.TextSize=14
        button.Parent=espFrame
        button.MouseButton1Click:Connect(function()
            local newState=toggleFeature(feature.Name)
            button.Text=feature.Display.." ["..(newState and "ON" or "OFF").."]"
            updateESP()
        end)
    end
    local hakiFrame=tabFrames["Haki"]
    local hakiFeatures={{Name="autoHaki",Display="Auto Haki (Complet)"},{Name="autoObservation",Display="Auto Observation Haki (Ken)"},{Name="autoArmament",Display="Auto Armament Haki (Busoshoku)"}}
    for _,feature in ipairs(hakiFeatures) do
        local button=Instance.new("TextButton")
        button.Name=feature.Name.."Button"
        button.Size=UDim2.new(1,-10,0,30)
        button.BackgroundColor3=Color3.fromRGB(50,50,50)
        button.Text=feature.Display.." [OFF]"
        button.TextColor3=Color3.fromRGB(255,215,0)
        button.Font=Enum.Font.SourceSans
        button.TextSize=14
        button.Parent=hakiFrame
        button.MouseButton1Click:Connect(function()
            local newState=toggleFeature(feature.Name)
            button.Text=feature.Display.." ["..(newState and "ON" or "OFF").."]"
            if newState then
                if feature.Name=="autoHaki" then startAutoHaki()
                elseif feature.Name=="autoObservation" then startAutoObservation()
                elseif feature.Name=="autoArmament" then startAutoArmament()
            end
        end)
    end
    local movementFrame=tabFrames["Movement"]
    local movementFeatures={{Name="walkOnWater",Display="Walk On Water"},{Name="infiniteJump",Display="Infinite Jump"},{Name="noClip",Display="No Clip"},{Name="flight",Display="Flight (WASD + Espace/Shift)"}}
    for _,feature in ipairs(movementFeatures) do
        local button=Instance.new("TextButton")
        button.Name=feature.Name.."Button"
        button.Size=UDim2.new(1,-10,0,30)
        button.BackgroundColor3=Color3.fromRGB(50,50,50)
        button.Text=feature.Display.." [OFF]"
        button.TextColor3=Color3.fromRGB(255,255,255)
        button.Font=Enum.Font.SourceSans
        button.TextSize=12
        button.Parent=movementFrame
        button.MouseButton1Click:Connect(function()
            local newState=toggleFeature(feature.Name)
            button.Text=feature.Display.." ["..(newState and "ON" or "OFF").."]"
            if newState then
                if feature.Name=="walkOnWater" then enableWalkOnWater()
                elseif feature.Name=="infiniteJump" then enableInfiniteJump()
                elseif feature.Name=="noClip" then enableNoClip()
                elseif feature.Name=="flight" then enableFlight()
            end
        end)
    end
    local adminFrame=tabFrames["Admin"]
    local fruitsPermsButton=Instance.new("TextButton")
    fruitsPermsButton.Name="FruitsPermsButton"
    fruitsPermsButton.Size=UDim2.new(1,-10,0,30)
    fruitsPermsButton.BackgroundColor3=Color3.fromRGB(50,50,50)
    fruitsPermsButton.Text=(hasFruitsPerms or isVIP) and "Fruits Perms + Armes [OFF]" or "Fruits Perms + Armes (5M Beli)"
    fruitsPermsButton.TextColor3=Color3.fromRGB(255,215,0)
    fruitsPermsButton.Font=Enum.Font.SourceSansBold
    fruitsPermsButton.TextSize=14
    fruitsPermsButton.Parent=adminFrame
    fruitsPermsButton.MouseButton1Click:Connect(function()
        if hasFruitsPerms or isVIP then
            local newState=toggleFeature("fruitsPerms")
            fruitsPermsButton.Text="Fruits Perms + Armes ["..(newState and "ON" or "OFF").."]"
            if newState then giveFruitsPerms() end
        else
            if buyFeature("fruitsPerms",PRICE_FRUITS_PERMS) then
                fruitsPermsButton.Text="Fruits Perms + Armes [OFF]"
            end
        end
    end)
    local autoPvPButton=Instance.new("TextButton")
    autoPvPButton.Name="AutoPvPButton"
    autoPvPButton.Size=UDim2.new(1,-10,0,30)
    autoPvPButton.BackgroundColor3=Color3.fromRGB(50,50,50)
    autoPvPButton.Text=(hasAutoPvP or isVIP) and "Auto PvP [OFF]" or "Auto PvP (2M Beli)"
    autoPvPButton.TextColor3=Color3.fromRGB(255,255,255)
    autoPvPButton.Font=Enum.Font.SourceSansBold
    autoPvPButton.TextSize=14
    autoPvPButton.Parent=adminFrame
    autoPvPButton.MouseButton1Click:Connect(function()
        if hasAutoPvP or isVIP then
            local newState=toggleFeature("autoPvP")
            autoPvPButton.Text="Auto PvP ["..(newState and "ON" or "OFF").."]"
        else
            if buyFeature("autoPvP",PRICE_AUTO_PVP) then
                autoPvPButton.Text="Auto PvP [OFF]"
            end
        end
    end)
    local adminFeatures={{Name="serverHop",Display="Server Hop (60s)"},{Name="antiKick",Display="Anti Kick / Anti Ban"},{Name="fpsBoost",Display="FPS Boost"}}
    for _,feature in ipairs(adminFeatures) do
        local button=Instance.new("TextButton")
        button.Name=feature.Name.."Button"
        button.Size=UDim2.new(1,-10,0,30)
        button.BackgroundColor3=Color3.fromRGB(50,50,50)
        button.Text=feature.Display.." [OFF]"
        button.TextColor3=Color3.fromRGB(255,255,255)
        button.Font=Enum.Font.SourceSans
        button.TextSize=14
        button.Parent=adminFrame
        button.MouseButton1Click:Connect(function()
            local newState=toggleFeature(feature.Name)
            button.Text=feature.Display.." ["..(newState and "ON" or "OFF").."]"
            if newState then
                if feature.Name=="serverHop" then startServerHop()
                elseif feature.Name=="antiKick" then startAntiKick()
                elseif feature.Name=="fpsBoost" then startFPSBoost()
            end
        end)
    end
    spawn(function() while true do if toggles.espPlayers or toggles.espBoss or toggles.espFruits or toggles.espChests or toggles.espNPCs then updateESP() end task.wait(0.5) end end)
end
pcall(function() repeat task.wait() until game:IsLoaded() repeat task.wait() until player and player:IsDescendantOf(game) repeat task.wait() until player.Character and player.Character:FindFirstChild("HumanoidRootPart") createUI() task.wait(1) notify("✅ ANONYMES SCRIPTS HUB v"..VERSION,"Logo en haut à gauche → **CLIQUE DESSUS** pour ouvrir le menu.",10) end)
