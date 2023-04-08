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
Section:NewButton("aimbot", "aimbot", function()
    function aimbot()
        local target = find_target()
        if target ~= nil then
            local pos = get_bone_position(target, "head")
            aim_at(pos)
        end
    end
    
    function find_target()
        local players = get_players()
        local closest = nil
        local closest_distance = 9999
        for i, player in ipairs(players) do
            if player.is_alive and not player.is_teammate and not player.is_invisible then
                local distance = get_distance(player.position, get_local_player().position)
                if distance < closest_distance then
                    closest_distance = distance
                    closest = player
                end
            end
        end
        return closest
    end
    
    function get_bone_position(player, bone)
        local bone_id = get_bone_id(player, bone)
        if bone_id ~= nil then
            return get_bone_position_world(player, bone_id)
        end
        return nil
    end
    
    function aim_at(pos)
        local angles = get_angles_to_pos(pos)
        set_view_angles(angles)
    end
    
end)

local Tab = Window:NewTab("fov")
local Section = Tab:NewSection("Aimfovbot")
Section:NewButton("ButtonText", "ButtonInfo", function()
    -- Change the FOV to 90 degrees
game:GetService("Players").LocalPlayer.Character.Head.FieldOfView = 90
end)
