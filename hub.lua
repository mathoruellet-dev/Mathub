-- Delta Executor - Menu Actions Compact (Rejoin Fixé - Anti Erreur 773)

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

if playerGui:FindFirstChild("DeltaActions") then
playerGui.DeltaActions:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeltaActions"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

-- Frame Ultra Compacte
local MainFrame = Instance.new("Frame")
MainFrame.Name = "Main"
MainFrame.Size = UDim2.new(0, 145, 0, 95)
MainFrame.Position = UDim2.new(1, -160, 0, 10)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(130, 50, 255)
Stroke.Thickness = 2
Stroke.Parent = MainFrame

-- Titre
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -12, 0, 22)
Title.Position = UDim2.new(0, 8, 0, 4)
Title.BackgroundTransparency = 1
Title.Text = "Actions"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- Bouton Rejoin
local RejoinBtn = Instance.new("TextButton")
RejoinBtn.Size = UDim2.new(0.92, 0, 0, 28)
RejoinBtn.Position = UDim2.new(0.04, 0, 0, 30)
RejoinBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 65)
RejoinBtn.Text = " Rejoin"
RejoinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RejoinBtn.TextScaled = true
RejoinBtn.TextXAlignment = Enum.TextXAlignment.Left
RejoinBtn.Font = Enum.Font.GothamSemibold
RejoinBtn.Parent = MainFrame

local Corner1 = Instance.new("UICorner")
Corner1.CornerRadius = UDim.new(0, 7)
Corner1.Parent = RejoinBtn

-- Bouton Kick Self
local KickBtn = Instance.new("TextButton")
KickBtn.Size = UDim2.new(0.92, 0, 0, 28)
KickBtn.Position = UDim2.new(0.04, 0, 0, 62)
KickBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 65)
KickBtn.Text = " Kick Self"
KickBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
KickBtn.TextScaled = true
KickBtn.TextXAlignment = Enum.TextXAlignment.Left
KickBtn.Font = Enum.Font.GothamSemibold
KickBtn.Parent = MainFrame

local Corner2 = Instance.new("UICorner")
Corner2.CornerRadius = UDim.new(0, 7)
Corner2.Parent = KickBtn

-- ==================== REJOIN AMÉLIORÉ (Anti 773) ====================
RejoinBtn.MouseButton1Click:Connect(function()
RejoinBtn.Text = "Rejoin..."

-- Méthode la plus fiable contre l'erreur 773
task.wait(0.3) -- Petit délai pour contourner la restriction

pcall(function()
TeleportService:Teleport(game.PlaceId) -- Version simple (la plus stable)
end)
end)

-- Kick Self
KickBtn.MouseButton1Click:Connect(function()
game:Shutdown()
end)

-- Draggable
local dragging = false
local dragStart, startPos

local function startDrag(input)
dragging = true
dragStart = input.Position
startPos = MainFrame.Position
end

local function updateDrag(input)
if dragging then
local delta = input.Position - dragStart
MainFrame.Position = UDim2.new(
startPos.X.Scale,
startPos.X.Offset + delta.X,
startPos.Y.Scale,
startPos.Y.Offset + delta.Y
)
end
end

Title.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
startDrag(input)
end
end)

UserInputService.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
updateDrag(input)
end
end)

UserInputService.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = false
end
end)

-- Toggle INSERT
UserInputService.InputBegan:Connect(function(input, gp)
if gp then return end
if input.KeyCode == Enum.KeyCode.Insert then
ScreenGui.Enabled = not ScreenGui.Enabled
end
end)

print("✅ Menu chargé - Rejoin corrigé (Anti 773)")
