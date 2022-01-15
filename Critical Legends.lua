if not game.PlaceId == 6843905606 then return end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local window = library:CreateWindow("Critical Legends")
local Offensive = window:CreateFolder("Offensive")
local Farm = window:CreateFolder("Farm")
local Misc = window:CreateFolder("Misc")

local farmenabled = false
local killaura = false
local godmode = false

Offensive:Toggle("Kill-Aura", function(state)
    local CombatFolder = game:GetService("Workspace"):FindFirstChild("CombatFolder")
    local PlayerName = game:GetService("Players").LocalPlayer.Name
    if CombatFolder~=nil then
        killaura = state
        spawn(function()
            while killaura and wait() do
                pcall(function()
                    local MyCombatFolder = CombatFolder:FindFirstChild(PlayerName)
                    if MyCombatFolder~=nil then
                        for _,v in pairs(MyCombatFolder:GetChildren()) do
                            wait()
                            v.HitBox.Size = Vector3.new(100, 100, 100)
                        end
                    else
                        killaura = false
                        wait(2)
                        killaura = true
                    end
                end)
            end
        end)
    end
end)

Offensive:Toggle("God Mode", function(state)
    local CombatFolder = game:GetService("Workspace"):FindFirstChild("CombatFolder")
    local PlayerName = game:GetService("Players").LocalPlayer.Name
    if CombatFolder~=nil then
        godmode = state
        spawn(function()
            while godmode and wait() do
                pcall(function()
                    for _,v in pairs(CombatFolder:GetChildren()) do
                        if v:IsA("Model") then
                            v:Destroy()
                        end
                    end
                end)
            end
        end)
    end
end)

Farm:Button("Collect All Materials", function()
    local matgivers = game:GetService("Workspace"):FindFirstChild("MaterialGivers")
    if matgivers~=nil then

        if farmenabled then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Critical Legends",
                Text = "Already collecting materials.",
                Duration = 5,
                Button1 = "Ok"
            })
            return
        else
            farmenabled = true
        end

        pcall(function()
            for _,v in pairs(matgivers:GetChildren()) do
                    --print("----------")
                    --print(v2.Parent)
                    --print(v2)
                    --print("----------")
                    local giver = v:FindFirstChild("Giver")
                    if giver~=nil then
                        local oldpos = giver.CFrame
                        local oldsize = giver.Size
                        local oldtrans = giver.Transparency
                        local oldcollide = giver.CanCollide
                        giver.CanCollide = false
                        giver.Transparency = 1
                        giver.Size = Vector3.new(100, 100, 100)
                        giver.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                        wait(0.1)
                        giver.Size = oldsize
                        giver.CFrame = oldpos
                        giver.CanCollide = oldcollide
                        giver.Transparency = oldtrans
                    end
                for _,v2 in pairs(v:GetChildren()) do

                    --print("----------")
                    --print(v2.Parent)
                    --print(v2)
                    --print("----------")
                    local giver = v2:FindFirstChild("Giver")
                    if giver~=nil then
                        local oldpos = giver.CFrame
                        local oldsize = giver.Size
                        local oldtrans = giver.Transparency
                        local oldcollide = giver.CanCollide
                        giver.CanCollide = false
                        giver.Transparency = 1
                        giver.Size = Vector3.new(100, 100, 100)
                        giver.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                        wait(0.1)
                        giver.Size = oldsize
                        giver.CFrame = oldpos
                        giver.CanCollide = oldcollide
                        giver.Transparency = oldtrans
                    end
                end
            end
            farmenabled = false
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Critical Legends",
                Text = "Done collecting all materials.",
                Duration = 5,
                Button1 = "Ok"
            })
        end)
    end
end)