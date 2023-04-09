local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Project Kill", "Synapse")
 
local Tab = Window:NewTab("ESP")
local Section = Tab:NewSection("ESP")
Section:NewButton("ESP", "see people", function()
    local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
 
local function createESP(player)
    local Esp = Drawing.new("Square")
    Esp.Color = Color3.fromRGB(255, 255, 255)
    Esp.Thickness = 1
    Esp.Transparency = 1
    Esp.Filled = false
    Esp.Visible = true
 
    game:GetService("RunService").RenderStepped:Connect(function()
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
            local pos, vis = workspace.CurrentCamera:WorldToViewportPoint(character.HumanoidRootPart.Position)
            if vis then
                Esp.Size = Vector2.new(1000 / pos.Z, 2000 / pos.Z)
                Esp.Position = Vector2.new(pos.X - Esp.Size.X / 2, pos.Y - Esp.Size.Y / 2)
                Esp.Transparency = 0.5
                Esp.Filled = true
            else
                Esp.Transparency = 1
                Esp.Filled = false
            end
        else
            Esp.Transparency = 1
            Esp.Filled = false
        end
    end)
end
 
for _, player in pairs(Players:GetPlayers()) do
    createESP(player)
end
 
Players.PlayerAdded:Connect(function(player)
    createESP(player)
end)
end)
 
 
local Tab = Window:NewTab("TP")
local Section = Tab:NewSection("TP")
Section:NewButton("TP", "Teleports to players", function()
    -- Define variables
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local isAiming = false
 
-- Define functions
function aimAt(target)
    local targetPosition = target.Character.Head.Position
    local targetCFrame = CFrame.new(targetPosition)
    LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
end
 
-- Define keybind
UIS.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Q then
        isAiming = not isAiming
    end
end)
 
-- Main loop
RunService.RenderStepped:Connect(function()
    if isAiming then
        -- Get closest enemy player
        local closestDistance = math.huge
        local closestPlayer = nil
        for _, player in pairs(Players:GetPlayers()) do
            if player.TeamColor ~= LocalPlayer.TeamColor and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = player
                end
            end
        end
 
        -- Aim at closest player
        if closestPlayer then
            aimAt(closestPlayer)
        end
    end
end)
 
end)
 
local Tab = Window:NewTab("Aimbot")
local Section = Tab:NewSection("Aimbot")
Section:NewButton("ButtonText", "ButtonInfo", function()
    local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
 
local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    for _, player in ipairs(Players:GetChildren()) do
        if player.Character and player.Character:FindFirstChild("Head") and player ~= LocalPlayer and player.Team ~= LocalPlayer.Team and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local distance = (player.Character.Head.Position - LocalPlayer.Character.Head.Position).magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = player
            end
        end
    end
    return closestPlayer
end
 
local function aimAt(player)
    local Camera = workspace.CurrentCamera
    local playerHead = player.Character.Head
    Camera.CFrame = CFrame.new(Camera.CFrame.p, playerHead.Position)
end
 
game:GetService("RunService").Stepped:connect(function()
    local closestPlayer = getClosestPlayer()
    if closestPlayer then
        aimAt(closestPlayer)
    end
end)
 
end)
