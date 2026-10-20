local lp = game.Players.LocalPlayer
getgenv().ScriptEnabled = true
getgenv().HasWhirlwindDrop = false

-- Whirlwind Drop Scanner, Conditional Hider & Anti-Void Protection Loop
spawn(function()
    while task.wait(0.2) do
        if not getgenv().ScriptEnabled then continue end
        local found = false
        local char = lp.Character
        local backpack = lp.Backpack
        local playerGui = lp:FindFirstChild("PlayerGui")
        
        -- Anti-Void Protection Check (Y < -10)
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            if hrp.Position.Y < -10 then
                hrp.CFrame = CFrame.new(148, 441, 27)
            end
        end
        
        local function checkAndHide(container)
            if not container then return end
            for _, v in pairs(container:GetDescendants()) do
                local nameMatch = v.Name:lower():find("whirlwind drop")
                local textMatch = (v:IsA("TextLabel") or v:IsA("TextButton")) and v.Text:lower():find("whirlwind drop")
                
                if nameMatch or textMatch then
                    found = true
                    pcall(function()
                        if v:IsA("BasePart") then
                            v.Transparency = 1
                            v.LocalTransparencyModifier = 1
                        elseif v:IsA("GuiObject") then
                            -- If it's a UI element for Whirlwind Drop, hide its specific slot parent
                            local parent = v.Parent
                            while parent and parent ~= playerGui do
                                if parent.Name:lower():find("slot") or parent.Name == "3" then
                                    parent.Visible = false
                                    break
                                end
                                parent = parent.Parent
                            end
                            v.Visible = false
                        elseif v:IsA("Model") then
                            for _, part in pairs(v:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part.Transparency = 1
                                    part.LocalTransparencyModifier = 1
                                end
                            end
                        end
                    end)
                end
            end
        end
        
        checkAndHide(char)
        checkAndHide(backpack)
        if playerGui then
            checkAndHide(playerGui)
        end
        
        getgenv().HasWhirlwindDrop = found
    end
end)

function info(txt, dly)
if not getgenv().ScriptEnabled then return end
if dly == nil then dly = 2 end
spawn(function() 
local ScreenGui2 = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Credits = Instance.new("TextLabel")
pcall(function() game.CoreGui.Revit:Destroy() end)
task.wait(.1)
ScreenGui2.Parent = game.CoreGui
ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui2.IgnoreGuiInset = true
ScreenGui2.ResetOnSpawn = false
ScreenGui2.Name = 'Revit'
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui2
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)

spawn(function()
Credits.Parent = ScreenGui2
Credits.Font = Enum.Font.Arcade
Credits.TextColor3 = Color3.new(1,1,1)
Credits.Position = UDim2.new(0,0,0,0)
Credits.TextSize = 35
Credits.Size = UDim2.new(1,0,.1,0)
Credits.Text = ''
Credits.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Credits.BorderColor3 = Color3.fromRGB(255, 0, 0)
end)

function tw(var, s)
local a = ""
local s_l = #s
for i = 1, s_l do
if not getgenv().ScriptEnabled then break end
local c = string.sub(s, i, i)
a = a .. c
var.Text = a
if c == "." then
task.wait(.6)
elseif c == ";" then
task.wait(.3)
elseif c == "," then
task.wait(.3)
elseif c == "!" then
task.wait(.3)
end
task.wait(.03)
end
end

tw(Credits, txt)
task.wait(dly)
ScreenGui2:Destroy()
end)
end

_G.Gay = true

function MainEnv()
local lp = game.Players.LocalPlayer
local char = lp.Character
if not char or not char:FindFirstChild("HumanoidRootPart") or not char:FindFirstChild("Humanoid") then return end
local hrp = char.HumanoidRootPart
local bp = lp.Backpack 

function randomstring()
    local e = {}
    for i = 1, math.random(140, 180) do
        table.insert(e, #e+1, utf8.char(math.random(1111, 1112)))
    end
    return table.concat(e)
end

getgenv().connections = getgenv().connections or {}
local function DestroySignals()
    for i, v in pairs(getgenv().connections) do
        if typeof(v) == "RBXScriptConnection" then
            v:Disconnect()
        end
    end
    getgenv().connections = {}
end
DestroySignals()

local function AddSignal(connection, name)
local str = randomstring()
if getgenv().connections then
getgenv().connections[name..str or #getgenv().connections + 1] = connection
return connection
end
end

-- Watchdog loop to clean up if needed
spawn(function()
while task.wait(0.5) do
if not getgenv().ScriptEnabled then
    DestroySignals()
    pcall(function()
        game:GetService("RunService"):UnbindFromRenderStep("UpdateSubject")
    end)
    pcall(function()
        workspace.CurrentCamera.CameraSubject = char:FindFirstChildOfClass("Humanoid")
        workspace.CurrentCamera.CameraType = 'Custom'
    end)
    break
end
end
end)

getgenv().gay = true 
task.wait(.4)
getgenv().gay = false

spawn(function()
getgenv().ATCH = false 
getgenv().EN = nil
spawn(function()
for i = 1, 99999999999999 do 
if not getgenv().ScriptEnabled or getgenv().gay == true then break end

local dist = math.huge
for _, part in pairs(workspace.Live:GetChildren()) do
if part:IsA("Model") and part:FindFirstChild("HumanoidRootPart") and part ~= char then
local otherRoot = part.HumanoidRootPart
local distance = (otherRoot.Position - hrp.Position).Magnitude
if distance < dist then dist = distance getgenv().EN = otherRoot end end end
if getgenv().EN then
local h = Instance.new('Highlight')
h.FillTransparency = 1
h.OutlineColor = Color3.new(1,1,1)
h.Parent = getgenv().EN.Parent 
task.wait(.02) 
h:Destroy() 
end
end 
end)

if getgenv().ATCH == true then 
getgenv().ATCH = false 
getgenv().val = char.Head
workspace.CurrentCamera.CameraSubject = char
workspace.CurrentCamera.CameraType = 'Custom'
return 
end 

task.wait(.3)
if not getgenv().ScriptEnabled then return end
getgenv().ATCH = true 

local e = Instance.new('Part')
_G.P = e 
local p = Instance.new("Part", char)
p.Size = Vector3.new(.5,.5,.5)
p.CanCollide = false
p.CanTouch = false
p.Anchored = true
p.Transparency = 1

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local rootPart = hrp
local camera = workspace.CurrentCamera
local humanoid = char.Humanoid

local WEIGHT = 15
local function updateSubject()
if not getgenv().ScriptEnabled then return end
if UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
local lookXZ = Vector3.new(camera.CFrame.LookVector.X, 0, camera.CFrame.LookVector.Z)
rootPart.CFrame = CFrame.lookAt(rootPart.Position, rootPart.Position + lookXZ)
end
camera.CameraSubject = p
if (camera.CFrame.Position - p.Position).Magnitude < 1 or 
(camera.CFrame.Position - getgenv().val.Position).Magnitude < 1 then
camera.CameraSubject = humanoid
p.Position = getgenv().val.Position
else
camera.CameraSubject = p
game.TweenService:Create(p, TweenInfo.new(2/WEIGHT), {Position = e.Position}):Play()
end
end

AddSignal(RunService:BindToRenderStep("UpdateSubject", Enum.RenderPriority.First.Value, updateSubject), "Camera Head")
getgenv().val = e

AddSignal(game:GetService("RunService").Heartbeat:Connect(function(step)
if not getgenv().ScriptEnabled or not getgenv().EN or not getgenv().EN.Parent then return end
local old = hrp.CFrame
local old2 = char.Head.CFrame

hrp.CFrame = CFrame.new(
	getgenv().EN.CFrame.X,
	441-9,
	getgenv().EN.CFrame.Z
) * CFrame.Angles(math.rad(90), 0, 0)
e.CFrame = old2

game:GetService("RunService").RenderStepped:Wait()
hrp.CFrame = old
if _G.JMP == true then 
hrp.CFrame = CFrame.lookAt(hrp.Position, Vector3.new(getgenv().EN.Position.X, getgenv().EN.Position.Y, getgenv().EN.Position.Z))
else 
hrp.CFrame = CFrame.lookAt(hrp.Position, Vector3.new(getgenv().EN.Position.X, hrp.Position.Y, getgenv().EN.Position.Z))
end
end), 'Auto Aim RS')

repeat task.wait() until not getgenv().ScriptEnabled or getgenv().ATCH == false or char.Humanoid.Health == 0
e:Destroy()
pcall(function() p:Destroy() end)
getgenv().gay = false 

pcall(function()
    RunService:UnbindFromRenderStep("UpdateSubject")
end)

workspace.CurrentCamera.CameraSubject = humanoid
workspace.CurrentCamera.CameraType = 'Custom'
end)

AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if not getgenv().ScriptEnabled then return end
if v.Animation and v.Animation.Name:lower():find("whirlwind drop") then
    if getgenv().ScriptEnabled then
        getgenv().ScriptEnabled = false
        task.delay(3, function()
            getgenv().ScriptEnabled = true
            MainEnv()
        end)
    end
end

if v.Animation.AnimationId == "rbxassetid://13370310513" 
or v.Animation.AnimationId == "rbxassetid://13390230973" 
or v.Animation.AnimationId == "rbxassetid://13378751717" 
or v.Animation.AnimationId == "rbxassetid://13378708199" 
then v:Stop()
if _G.Jumping == true then 
_G.JMP = true 
task.wait(.3)
_G.JMP = false
end
end end), 'M1')

AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if not getgenv().ScriptEnabled then return end
if v.Animation.AnimationId == "rbxassetid://13380255751" then 
v:Stop()
local lolbv = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
pp.MaxForce = Vector3.new(0, 0, 0)
end end)

task.delay(1.5, function()
lolbv:Disconnect() end)

if _G.Jumping == true then 
_G.JMP = true 
local bv = Instance.new('BodyVelocity')
bv.Parent = hrp
bv.MaxForce = Vector3.new(0, 9e9, 0)
bv.Velocity = Vector3.new(0, -1, 0)

task.delay(1, function()
_G.JMP = false  
bv:Destroy()
end)
end
end end), 'Front Dash')

AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if not getgenv().ScriptEnabled then return end
if v.Animation.AnimationId == "rbxassetid://13376962659" 
or v.Animation.AnimationId == 'rbxassetid://13362587853' then 
v:Stop()

local lolbv = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
pp.MaxForce = Vector3.new(0, 0, 0)
end end)

task.delay(2.5, function()
lolbv:Disconnect() end)
end end), 'Move3')

pcall(function()
local parts = char:WaitForChild("#NinjaKATANA", 5)
end)

AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if not getgenv().ScriptEnabled then return end
if v.Animation.AnimationId == "rbxassetid://13556985475" then 
v:Stop()
end end), 'Move4')

AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if not getgenv().ScriptEnabled then return end
if v.Animation.AnimationId == "rbxassetid://13294790250" then 
v:Stop()
end end), 'Move2')

AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if not getgenv().ScriptEnabled then return end
if v.Animation.AnimationId == "rbxassetid://14516273501" then
local IdPlaying = true
v.Stopped:Wait() 
IdPlaying = false 
end end), "Idle")
end 

MainEnv()

pcall(function()
getgenv().pepe:Disconnect()
end)
getgenv().pepe = lp.CharacterAdded:Connect(function(c)
if not getgenv().ScriptEnabled then return end
repeat task.wait() until c:FindFirstChild('HumanoidRootPart') and c:FindFirstChild('Humanoid')
task.wait(.2)
MainEnv()
end)