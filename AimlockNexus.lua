--// VAMPIRE AIMLOCK V3
--// CLIENT-SIDE LOCAL SCRIPT
--// Place in StarterPlayer > StarterPlayerScripts
--//
--// Modes:
--// Players / NPCs / Both
--// Teammate Check
--// Wall Check
--// Smoothness
--// Target Part
--// Max Distance
--// Camera Break
--// Persistent UI
--// Minimize
--// Draggable UI
--// Lockable Floating Button
--// 🩸 Blood + 🦇 Bat animations

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local NPCFolder = workspace:FindFirstChild("AimTargets")

if not NPCFolder then
    NPCFolder = Instance.new("Folder")
    NPCFolder.Name = "AimTargets"
    NPCFolder.Parent = workspace
end

--==================================================
-- CONFIG
--==================================================

local Config = {
    Enabled = false,

    TargetMode = "Players",
    -- Players / NPCs / Both

    TargetPart = "Head",
    -- Head / HumanoidRootPart

    Smoothness = 0.18,

    MaxDistance = 500,

    WallCheck = true,

    TeamCheck = true,

    BreakOnMove = true,

    BreakSensitivity = 8
}

--==================================================
-- COLORS
--==================================================

local COLORS = {
    Black = Color3.fromRGB(7, 4, 9),
    Panel = Color3.fromRGB(15, 9, 19),
    Card = Color3.fromRGB(26, 14, 31),
    CardHover = Color3.fromRGB(43, 19, 45),

    Blood = Color3.fromRGB(160, 18, 43),
    BrightBlood = Color3.fromRGB(235, 35, 65),
    DarkBlood = Color3.fromRGB(70, 7, 20),

    Text = Color3.fromRGB(245, 235, 242),
    Muted = Color3.fromRGB(145, 120, 145),

    Locked = Color3.fromRGB(125, 12, 30)
}

--==================================================
-- HELPERS
--==================================================

local function Tween(object, time, properties, style)
    local info = TweenInfo.new(
        time or 0.2,
        style or Enum.EasingStyle.Quint,
        Enum.EasingDirection.Out
    )

    return TweenService:Create(object, info, properties)
end

local function Corner(object, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = object
end

local function Stroke(object, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color
    s.Thickness = thickness or 1
    s.Transparency = .12
    s.Parent = object
    return s
end

--==================================================
-- GUI
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "VampireAimlock"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.DisplayOrder = 500
Gui.Parent = PlayerGui

--==================================================
-- PANEL
--==================================================

local Panel = Instance.new("Frame")
Panel.Name = "Main"
Panel.Size = UDim2.fromOffset(250, 390)
Panel.Position = UDim2.new(1, -270, .5, -195)
Panel.BackgroundColor3 = COLORS.Panel
Panel.BorderSizePixel = 0
Panel.ClipsDescendants = true
Panel.Parent = Gui

Corner(Panel, 14)
Stroke(Panel, COLORS.Blood, 1.5)

--==================================================
-- HEADER
--==================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 75)
Header.BackgroundTransparency = 1
Header.Parent = Panel

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -65, 0, 28)
Title.Position = UDim2.fromOffset(14, 7)
Title.BackgroundTransparency = 1
Title.Text = "🩸 V A M P I R E"
Title.TextColor3 = COLORS.Text
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -30, 0, 18)
Subtitle.Position = UDim2.fromOffset(15, 38)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "🦇 NIGHT HUNTER  •  AIM SYSTEM"
Subtitle.TextColor3 = COLORS.Muted
Subtitle.TextSize = 8
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

local Bat = Instance.new("TextLabel")
Bat.Size = UDim2.fromOffset(35, 30)
Bat.Position = UDim2.new(1, -47, 0, 9)
Bat.BackgroundTransparency = 1
Bat.Text = "🦇"
Bat.TextSize = 21
Bat.Parent = Header

local BloodLine = Instance.new("Frame")
BloodLine.Size = UDim2.new(1, -28, 0, 2)
BloodLine.Position = UDim2.new(0, 14, 1, -2)
BloodLine.BackgroundColor3 = COLORS.Blood
BloodLine.BorderSizePixel = 0
BloodLine.Parent = Header

-- Bat animation
task.spawn(function()
    while Gui.Parent do

        Tween(Bat, 1.1, {
            Position = UDim2.new(1, -58, 0, 15),
            Rotation = -12
        }, Enum.EasingStyle.Sine):Play()

        task.wait(1.1)

        Tween(Bat, 1.1, {
            Position = UDim2.new(1, -38, 0, 8),
            Rotation = 12
        }, Enum.EasingStyle.Sine):Play()

        task.wait(1.1)
    end
end)

--==================================================
-- MINIMIZE
--==================================================

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.fromOffset(30, 30)
Minimize.Position = UDim2.new(1, -42, 0, 10)
Minimize.BackgroundColor3 = COLORS.Card
Minimize.BorderSizePixel = 0
Minimize.Text = "−"
Minimize.TextColor3 = COLORS.Text
Minimize.TextSize = 17
Minimize.Font = Enum.Font.GothamBold
Minimize.AutoButtonColor = false
Minimize.Parent = Header

Corner(Minimize, 8)
Stroke(Minimize, COLORS.Blood, 1)

local Minimized = false

Minimize.MouseButton1Click:Connect(function()

    Minimized = not Minimized

    if Minimized then

        Minimize.Text = "+"

        Tween(Panel, .3, {
            Size = UDim2.fromOffset(250, 75)
        }):Play()

    else

        Minimize.Text = "−"

        Tween(Panel, .35, {
            Size = UDim2.fromOffset(250, 390)
        }, Enum.EasingStyle.Back):Play()

    end

end)

--==================================================
-- DRAGGING
--==================================================

local Dragging = false
local DragStart
local StartPosition

Header.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        Dragging = true
        DragStart = input.Position
        StartPosition = Panel.Position

    end

end)

Header.InputEnded:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        Dragging = false

    end

end)

UIS.InputChanged:Connect(function(input)

    if not Dragging then
        return
    end

    if input.UserInputType ~= Enum.UserInputType.MouseMovement
        and input.UserInputType ~= Enum.UserInputType.Touch then
        return
    end

    local Delta = input.Position - DragStart

    Panel.Position = UDim2.new(
        StartPosition.X.Scale,
        StartPosition.X.Offset + Delta.X,

        StartPosition.Y.Scale,
        StartPosition.Y.Offset + Delta.Y
    )

end)

--==================================================
-- CARD CREATOR
--==================================================

local function CreateCard(y, text)

    local Button = Instance.new("TextButton")

    Button.Size = UDim2.new(1, -28, 0, 43)
    Button.Position = UDim2.fromOffset(14, y)

    Button.BackgroundColor3 = COLORS.Card
    Button.BorderSizePixel = 0

    Button.Text = text
    Button.TextColor3 = COLORS.Text
    Button.TextSize = 11
    Button.Font = Enum.Font.GothamMedium
    Button.TextXAlignment = Enum.TextXAlignment.Left

    Button.AutoButtonColor = false
    Button.Parent = Panel

    Corner(Button, 9)
    Stroke(Button, Color3.fromRGB(70, 30, 60), 1)

    local Padding = Instance.new("UIPadding")
    Padding.PaddingLeft = UDim.new(0, 13)
    Padding.Parent = Button

    Button.MouseEnter:Connect(function()
        Tween(Button, .14, {
            BackgroundColor3 = COLORS.CardHover
        }):Play()
    end)

    Button.MouseLeave:Connect(function()
        Tween(Button, .14, {
            BackgroundColor3 = COLORS.Card
        }):Play()
    end)

    return Button
end

--==================================================
-- AIM TOGGLE
--==================================================

local AimButton = CreateCard(83, "🎯   AIMLOCK")

local AimStatus = Instance.new("TextLabel")
AimStatus.Size = UDim2.fromOffset(45, 20)
AimStatus.Position = UDim2.new(1, -58, .5, -10)
AimStatus.BackgroundTransparency = 1
AimStatus.Text = "OFF"
AimStatus.TextColor3 = COLORS.Muted
AimStatus.TextSize = 10
AimStatus.Font = Enum.Font.GothamBold
AimStatus.Parent = AimButton

local function UpdateAim()

    if Config.Enabled then

        AimStatus.Text = "ON"
        AimStatus.TextColor3 = COLORS.BrightBlood

        Tween(AimButton, .18, {
            BackgroundColor3 = Color3.fromRGB(52, 16, 30)
        }):Play()

    else

        AimStatus.Text = "OFF"
        AimStatus.TextColor3 = COLORS.Muted

        Tween(AimButton, .18, {
            BackgroundColor3 = COLORS.Card
        }):Play()

    end

end

AimButton.MouseButton1Click:Connect(function()

    Config.Enabled = not Config.Enabled

    CurrentTarget = nil

    UpdateAim()

end)

--==================================================
-- TARGET MODE
--==================================================

local ModeButton = CreateCard(136, "👥   TARGETS  •  PLAYERS")

local function UpdateModeText()

    ModeButton.Text =
        "👥   TARGETS  •  " ..
        string.upper(Config.TargetMode)

end

ModeButton.MouseButton1Click:Connect(function()

    if Config.TargetMode == "Players" then

        Config.TargetMode = "NPCs"

    elseif Config.TargetMode == "NPCs" then

        Config.TargetMode = "Both"

    else

        Config.TargetMode = "Players"

    end

    CurrentTarget = nil

    UpdateModeText()

end)

--==================================================
-- TARGET PART
--==================================================

local PartButton = CreateCard(189, "🩸   PART  •  HEAD")

PartButton.MouseButton1Click:Connect(function()

    if Config.TargetPart == "Head" then

        Config.TargetPart = "HumanoidRootPart"

        PartButton.Text = "🩸   PART  •  ROOT"

    else

        Config.TargetPart = "Head"

        PartButton.Text = "🩸   PART  •  HEAD"

    end

    CurrentTarget = nil

end)

--==================================================
-- TEAM CHECK
--==================================================

local TeamButton = CreateCard(242, "♟   TEAM CHECK")

local TeamStatus = Instance.new("TextLabel")
TeamStatus.Size = UDim2.fromOffset(45, 20)
TeamStatus.Position = UDim2.new(1, -58, .5, -10)
TeamStatus.BackgroundTransparency = 1
TeamStatus.Text = "ON"
TeamStatus.TextColor3 = COLORS.BrightBlood
TeamStatus.TextSize = 10
TeamStatus.Font = Enum.Font.GothamBold
TeamStatus.Parent = TeamButton

TeamButton.MouseButton1Click:Connect(function()

    Config.TeamCheck = not Config.TeamCheck

    TeamStatus.Text = Config.TeamCheck and "ON" or "OFF"

    TeamStatus.TextColor3 =
        Config.TeamCheck
        and COLORS.BrightBlood
        or COLORS.Muted

    CurrentTarget = nil

end)

--==================================================
-- WALL CHECK
--==================================================

local WallButton = CreateCard(295, "🧱   WALL CHECK")

local WallStatus = Instance.new("TextLabel")
WallStatus.Size = UDim2.fromOffset(45, 20)
WallStatus.Position = UDim2.new(1, -58, .5, -10)
WallStatus.BackgroundTransparency = 1
WallStatus.Text = "ON"
WallStatus.TextColor3 = COLORS.BrightBlood
WallStatus.TextSize = 10
WallStatus.Font = Enum.Font.GothamBold
WallStatus.Parent = WallButton

WallButton.MouseButton1Click:Connect(function()

    Config.WallCheck = not Config.WallCheck

    WallStatus.Text =
        Config.WallCheck and "ON" or "OFF"

    WallStatus.TextColor3 =
        Config.WallCheck
        and COLORS.BrightBlood
        or COLORS.Muted

    CurrentTarget = nil

end)

--==================================================
-- SMOOTHNESS
--==================================================

local SmoothCard = CreateCard(348, "🌀   SMOOTHNESS")

local SmoothBox = Instance.new("TextBox")
SmoothBox.Size = UDim2.fromOffset(60, 27)
SmoothBox.Position = UDim2.new(1, -72, .5, -13)
SmoothBox.BackgroundColor3 = COLORS.Black
SmoothBox.BorderSizePixel = 0
SmoothBox.Text = "0.18"
SmoothBox.TextColor3 = COLORS.Text
SmoothBox.TextSize = 10
SmoothBox.Font = Enum.Font.GothamMedium
SmoothBox.ClearTextOnFocus = false
SmoothBox.Parent = SmoothCard

Corner(SmoothBox, 7)
Stroke(SmoothBox, COLORS.Blood, 1)

SmoothBox.FocusLost:Connect(function()

    local Number = tonumber(SmoothBox.Text)

    if Number then

        Config.Smoothness =
            math.clamp(Number, .01, 1)

        SmoothBox.Text =
            string.format("%.2f", Config.Smoothness)

    else

        SmoothBox.Text =
            string.format("%.2f", Config.Smoothness)

    end

end)

--==================================================
-- FLOATING BUTTON
--==================================================

local Float = Instance.new("TextButton")
Float.Size = UDim2.fromOffset(44, 44)
Float.Position = UDim2.new(0, 18, .5, -22)
Float.BackgroundColor3 = COLORS.Panel
Float.BorderSizePixel = 0
Float.Text = "🦇"
Float.TextSize = 19
Float.AutoButtonColor = false
Float.Parent = Gui

Corner(Float, 12)

local FloatStroke = Stroke(Float, COLORS.Blood, 1.5)

local PanelVisible = true

local function SetVisible(state)

    PanelVisible = state

    if state then

        Panel.Visible = true
        Panel.BackgroundTransparency = 1

        Tween(Panel, .25, {
            BackgroundTransparency = 0
        }):Play()

    else

        Tween(Panel, .2, {
            BackgroundTransparency = 1
        }):Play()

        task.delay(.2, function()

            if not PanelVisible then
                Panel.Visible = false
            end

        end)

    end

end

--==================================================
-- FLOATING BUTTON LOCK
--==================================================

local Locked = false
local Holding = false
local HoldStart = 0
local FloatDragging = false

local FloatDragStart
local FloatStartPosition

local function UpdateLock()

    if Locked then

        Float.Text = "🔒"

        Tween(Float, .2, {
            BackgroundColor3 = COLORS.Locked
        }):Play()

        Tween(FloatStroke, .2, {
            Color = COLORS.BrightBlood,
            Thickness = 2.5
        }):Play()

    else

        Float.Text = "🦇"

        Tween(Float, .2, {
            BackgroundColor3 = COLORS.Panel
        }):Play()

        Tween(FloatStroke, .2, {
            Color = COLORS.Blood,
            Thickness = 1.5
        }):Play()

    end

end

Float.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        Holding = true
        FloatDragging = false
        HoldStart = os.clock()

        FloatDragStart = input.Position
        FloatStartPosition = Float.Position

        task.spawn(function()

            while Holding do

                if os.clock() - HoldStart >= 2 then

                    Holding = false

                    if not FloatDragging then

                        Locked = not Locked

                        UpdateLock()

                    end

                    break
                end

                task.wait(.04)

            end

        end)

    end

end)

Float.InputEnded:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        Holding = false

        if not FloatDragging
            and os.clock() - HoldStart < 2 then

            SetVisible(not PanelVisible)

        end

    end

end)

UIS.InputChanged:Connect(function(input)

    if not Holding or Locked then
        return
    end

    if input.UserInputType ~= Enum.UserInputType.MouseMovement
        and input.UserInputType ~= Enum.UserInputType.Touch then
        return
    end

    local Delta = input.Position - FloatDragStart

    if Delta.Magnitude > 7 then

        FloatDragging = true

        Float.Position = UDim2.new(
            FloatStartPosition.X.Scale,
            FloatStartPosition.X.Offset + Delta.X,

            FloatStartPosition.Y.Scale,
            FloatStartPosition.Y.Offset + Delta.Y
        )

    end

end)

--==================================================
-- CAMERA
--==================================================

local Camera = workspace.CurrentCamera
local CurrentTarget = nil
local LastLookVector = nil

local function GetPart(Character)

    return Character:FindFirstChild(Config.TargetPart)
        or Character:FindFirstChild("HumanoidRootPart")

end

local function IsAlive(Character)

    if not Character then
        return false
    end

    local Humanoid =
        Character:FindFirstChildOfClass("Humanoid")

    return Humanoid
        and Humanoid.Health > 0

end

local function IsTeammate(Player)

    if not Config.TeamCheck then
        return false
    end

    if Player.Team ~= nil
        and LocalPlayer.Team ~= nil then

        return Player.Team == LocalPlayer.Team

    end

    return false

end

local function WallVisible(Character, Part)

    if not Config.WallCheck then
        return true
    end

    local Origin = Camera.CFrame.Position
    local Direction = Part.Position - Origin

    local Params = RaycastParams.new()

    Params.FilterType =
        Enum.RaycastFilterType.Exclude

    Params.FilterDescendantsInstances = {
        LocalPlayer.Character,
        Character
    }

    local Result =
        workspace:Raycast(
            Origin,
            Direction,
            Params
        )

    return Result == nil

end

local function ValidPlayer(Player)

    if Player == LocalPlayer then
        return false
    end

    if IsTeammate(Player) then
        return false
    end

    local Character = Player.Character

    if not IsAlive(Character) then
        return false
    end

    local Part = GetPart(Character)

    if not Part then
        return false
    end

    local MyCharacter = LocalPlayer.Character

    local Root =
        MyCharacter
        and MyCharacter:FindFirstChild("HumanoidRootPart")

    if not Root then
        return false
    end

    if (Root.Position - Part.Position).Magnitude
        > Config.MaxDistance then

        return false

    end

    if not WallVisible(Character, Part) then
        return false
    end

    return true

end

local function ValidNPC(NPC)

    if not NPC:IsA("Model") then
        return false
    end

    if not IsAlive(NPC) then
        return false
    end

    local Part = GetPart(NPC)

    if not Part then
        return false
    end

    local MyCharacter = LocalPlayer.Character

    local Root =
        MyCharacter
        and MyCharacter:FindFirstChild("HumanoidRootPart")

    if not Root then
        return false
    end

    if (Root.Position - Part.Position).Magnitude
        > Config.MaxDistance then

        return false

    end

    if not WallVisible(NPC, Part) then
        return false
    end

    return true

end

--==================================================
-- FIND TARGET
--==================================================

local function FindTarget()

    Camera = workspace.CurrentCamera

    local Center = Vector2.new(
        Camera.ViewportSize.X / 2,
        Camera.ViewportSize.Y / 2
    )

    local Best = nil
    local BestDistance = math.huge

    -- PLAYERS
    if Config.TargetMode == "Players"
        or Config.TargetMode == "Both" then

        for _, Player in ipairs(Players:GetPlayers()) do

            if ValidPlayer(Player) then

                local Character = Player.Character
                local Part = GetPart(Character)

                local Screen, Visible =
                    Camera:WorldToViewportPoint(
                        Part.Position
                    )

                if Visible then

                    local Distance =
                        (
                            Vector2.new(
                                Screen.X,
                                Screen.Y
                            ) - Center
                        ).Magnitude

                    if Distance < BestDistance then

                        BestDistance = Distance
                        Best = {
                            Type = "Player",
                            Object = Player,
                            Character = Character,
                            Part = Part
                        }

                    end

                end

            end

        end

    end

    -- NPCS
    if Config.TargetMode == "NPCs"
        or Config.TargetMode == "Both" then

        for _, NPC in ipairs(NPCFolder:GetChildren()) do

            if ValidNPC(NPC) then

                local Part = GetPart(NPC)

                local Screen, Visible =
                    Camera:WorldToViewportPoint(
                        Part.Position
                    )

                if Visible then

                    local Distance =
                        (
                            Vector2.new(
                                Screen.X,
                                Screen.Y
                            ) - Center
                        ).Magnitude

                    if Distance < BestDistance then

                        BestDistance = Distance

                        Best = {
                            Type = "NPC",
                            Object = NPC,
                            Character = NPC,
                            Part = Part
                        }

                    end

                end

            end

        end

    end

    return Best

end

--==================================================
-- AIMLOCK LOOP
--==================================================

RunService:BindToRenderStep(
    "VampireAimlock",
    Enum.RenderPriority.Camera.Value + 1,
    function()

        Camera = workspace.CurrentCamera

        if not Config.Enabled then

            CurrentTarget = nil
            LastLookVector = nil

            return

        end

        -- Find target
        if not CurrentTarget then
            CurrentTarget = FindTarget()
        end

        if not CurrentTarget then
            return
        end

        local Character =
            CurrentTarget.Character

        local Object =
            CurrentTarget.Object

        local Valid

        if CurrentTarget.Type == "Player" then
            Valid = ValidPlayer(Object)
        else
            Valid = ValidNPC(Object)
        end

        if not Valid then

            CurrentTarget = FindTarget()

            if not CurrentTarget then
                return
            end

            Character =
                CurrentTarget.Character

        end

        local Part = GetPart(Character)

        if not Part then

            CurrentTarget = nil
            return

        end

        -- Detect aggressive manual camera movement
        if Config.BreakOnMove and LastLookVector then

            local Dot =
                math.clamp(
                    LastLookVector:Dot(
                        Camera.CFrame.LookVector
                    ),
                    -1,
                    1
                )

            local Angle =
                math.deg(
                    math.acos(Dot)
                )

            if Angle >= Config.BreakSensitivity then

                CurrentTarget = nil
                LastLookVector = nil

                return

            end

        end

        local Desired =
            CFrame.lookAt(
                Camera.CFrame.Position,
                Part.Position
            )

        -- 0.01 = very smooth
        -- 1 = very fast
        local Alpha =
            math.clamp(
                Config.Smoothness,
                .01,
                1
            )

        Camera.CFrame =
            Camera.CFrame:Lerp(
                Desired,
                Alpha
            )

        LastLookVector =
            Camera.CFrame.LookVector

    end
)

--==================================================
-- KEYBINDS
--==================================================

UIS.InputBegan:Connect(function(input, processed)

    if processed then
        return
    end

    if input.KeyCode == Enum.KeyCode.Q then

        Config.Enabled = not Config.Enabled
        CurrentTarget = nil

        UpdateAim()

    elseif input.KeyCode == Enum.KeyCode.RightShift then

        SetVisible(not PanelVisible)

    end

end)

--==================================================
-- RESPAWN
--==================================================

LocalPlayer.CharacterAdded:Connect(function()

    task.wait(.25)

    Camera = workspace.CurrentCamera

    CurrentTarget = nil
    LastLookVector = nil

    if Gui.Parent ~= PlayerGui then
        Gui.Parent = PlayerGui
    end

    Panel.Visible = PanelVisible

end)

--==================================================
-- INITIALIZE
--==================================================

UpdateAim()
UpdateModeText()
UpdateLock()

print("🩸🦇 VAMPIRE AIMLOCK V3 LOADED")

--==================================================
-- 🩸🦇 VAMPIRE DECORATION PATCH
-- Add BELOW your existing V3 script
-- Does NOT change targeting logic
--==================================================

local DraculaFX = Instance.new("Folder")
DraculaFX.Name = "DraculaFX"
DraculaFX.Parent = Gui

--==================================================
-- 🩸 BLOOD DRIPS ON PANEL
--==================================================

local function MakeBloodDrip(x, maxLength)

	local drip = Instance.new("Frame")
	drip.Name = "BloodDrip"
	drip.AnchorPoint = Vector2.new(.5, 0)
	drip.Position = UDim2.new(0, x, 0, 0)
	drip.Size = UDim2.fromOffset(3, math.random(5, 14))
	drip.BackgroundColor3 = COLORS.BrightBlood
	drip.BorderSizePixel = 0
	drip.ZIndex = 20
	drip.Parent = Panel

	Corner(drip, 4)

	local drop = Instance.new("Frame")
	drop.Size = UDim2.fromOffset(6, 8)
	drop.Position = UDim2.new(.5, -3, 1, -2)
	drop.BackgroundColor3 = COLORS.BrightBlood
	drop.BorderSizePixel = 0
	drop.ZIndex = 20
	drop.Parent = drip

	Corner(drop, 8)

	task.spawn(function()

		while drip.Parent do

			local length = math.random(6, maxLength)

			Tween(
				drip,
				math.random(15, 30) / 10,
				{
					Size = UDim2.fromOffset(3, length)
				},
				Enum.EasingStyle.Sine
			):Play()

			task.wait(math.random(20, 40) / 10)

			Tween(
				drip,
				.4,
				{
					Size = UDim2.fromOffset(3, 5)
				},
				Enum.EasingStyle.Sine
			):Play()

			task.wait(math.random(5, 15) / 10)

		end

	end)

end

MakeBloodDrip(22, 30)
MakeBloodDrip(52, 20)
MakeBloodDrip(92, 35)
MakeBloodDrip(137, 22)
MakeBloodDrip(181, 30)
MakeBloodDrip(218, 18)

--==================================================
-- 🩸 RANDOM BLOOD PARTICLES
--==================================================

local function SpawnBloodParticle()

	if not Gui.Parent then
		return
	end

	local particle = Instance.new("TextLabel")

	particle.Size = UDim2.fromOffset(14, 14)
	particle.BackgroundTransparency = 1
	particle.Text = "🩸"
	particle.TextSize = math.random(7, 12)
	particle.TextTransparency = .1
	particle.ZIndex = 10

	particle.Position = UDim2.new(
		math.random(5, 95) / 100,
		0,
		0,
		-15
	)

	particle.Parent = DraculaFX

	local duration = math.random(35, 60) / 10

	Tween(
		particle,
		duration,
		{
			Position = UDim2.new(
				particle.Position.X.Scale,
				math.random(-20, 20),
				1,
				25
			),
			Rotation = math.random(-40, 40),
			TextTransparency = 1
		},
		Enum.EasingStyle.Linear
	):Play()

	task.delay(duration + .1, function()

		if particle then
			particle:Destroy()
		end

	end)

end

task.spawn(function()

	while Gui.Parent do

		SpawnBloodParticle()

		task.wait(math.random(3, 6))

	end

end)

--==================================================
-- 🦇 FLYING BATS
--==================================================

local function SpawnTinyBat()

	if not Gui.Parent then
		return
	end

	local bat = Instance.new("TextLabel")

	bat.Size = UDim2.fromOffset(
		math.random(20, 28),
		math.random(17, 23)
	)

	bat.BackgroundTransparency = 1
	bat.Text = "🦇"
	bat.TextSize = math.random(12, 18)
	bat.ZIndex = 8

	local viewport = workspace.CurrentCamera.ViewportSize

	local leftToRight = math.random(1, 2) == 1

	local startY = math.random(
		70,
		math.max(100, viewport.Y - 70)
	)

	local finishY = math.clamp(
		startY + math.random(-120, 120),
		60,
		math.max(100, viewport.Y - 60)
	)

	if leftToRight then

		bat.Position = UDim2.fromOffset(
			-40,
			startY
		)

	else

		bat.Position = UDim2.fromOffset(
			viewport.X + 40,
			startY
		)

	end

	bat.Parent = DraculaFX

	local finishX

	if leftToRight then
		finishX = viewport.X + 50
	else
		finishX = -50
	end

	local duration = math.random(45, 75) / 10

	Tween(
		bat,
		duration,
		{
			Position = UDim2.fromOffset(
				finishX,
				finishY
			),
			Rotation = math.random(-20, 20)
		},
		Enum.EasingStyle.Sine
	):Play()

	task.delay(duration + .1, function()

		if bat then
			bat:Destroy()
		end

	end)

end

task.spawn(function()

	while Gui.Parent do

		SpawnTinyBat()

		task.wait(math.random(2, 5))

	end

end)

--==================================================
-- 🩸 CRIMSON AIMLOCK PULSE
--==================================================

local VampireGlow = Instance.new("UIStroke")

VampireGlow.Name = "VampireGlow"
VampireGlow.Color = COLORS.BrightBlood
VampireGlow.Thickness = 1
VampireGlow.Transparency = 1
VampireGlow.Parent = Panel

task.spawn(function()

	while Gui.Parent do

		if Config.Enabled then

			Tween(
				VampireGlow,
				.8,
				{
					Transparency = .25,
					Thickness = 2
				},
				Enum.EasingStyle.Sine
			):Play()

			task.wait(.8)

			Tween(
				VampireGlow,
				.8,
				{
					Transparency = .75,
					Thickness = 1
				},
				Enum.EasingStyle.Sine
			):Play()

			task.wait(.8)

		else

			VampireGlow.Transparency = 1

			task.wait(.25)

		end

	end

end)

--==================================================
-- 🦇 DRACULA BAT MORPH
--==================================================

local DraculaAnimating = false

local function CreateMorphBat(position)

	local bat = Instance.new("TextLabel")

	bat.Name = "DraculaBat"
	bat.Size = UDim2.fromOffset(45, 35)
	bat.AnchorPoint = Vector2.new(.5, .5)

	bat.Position = UDim2.fromOffset(
		position.X,
		position.Y
	)

	bat.BackgroundTransparency = 1
	bat.Text = "🦇"
	bat.TextSize = 28
	bat.ZIndex = 1000
	bat.Parent = Gui

	return bat

end

--==================================================
-- 🩸 MORPH PARTICLES
--==================================================

local function MorphBlood(position)

	for i = 1, 6 do

		local drop = Instance.new("TextLabel")

		drop.Size = UDim2.fromOffset(14, 14)
		drop.AnchorPoint = Vector2.new(.5, .5)

		drop.Position = UDim2.fromOffset(
			position.X,
			position.Y
		)

		drop.BackgroundTransparency = 1
		drop.Text = "🩸"
		drop.TextSize = math.random(7, 12)
		drop.ZIndex = 999
		drop.Parent = Gui

		local angle =
			math.rad((360 / 6) * i)

		local distance =
			math.random(20, 45)

		Tween(
			drop,
			.45,
			{
				Position = UDim2.fromOffset(
					position.X
						+ math.cos(angle) * distance,

					position.Y
						+ math.sin(angle) * distance
				),
				TextTransparency = 1
			},
			Enum.EasingStyle.Quad
		):Play()

		task.delay(.5, function()

			if drop then
				drop:Destroy()
			end

		end)

	end

end

--==================================================
-- 🦇 ORIGINAL VISIBILITY HANDLER
--==================================================

local OriginalSetVisible = SetVisible

SetVisible = function(state)

	if DraculaAnimating then
		return
	end

	DraculaAnimating = true

	-- OPEN
	if state then

		local floatPos = Float.AbsolutePosition

		local bat = CreateMorphBat(Vector2.new(
			floatPos.X + Float.AbsoluteSize.X / 2,
			floatPos.Y + Float.AbsoluteSize.Y / 2
		))

		PanelVisible = true

		Panel.Visible = true
		Panel.BackgroundTransparency = 1

		local originalSize = Panel.Size

		Panel.Size = UDim2.fromOffset(
			70,
			70
		)

		MorphBlood(bat.AbsolutePosition)

		Tween(
			bat,
			.55,
			{
				Position = UDim2.fromOffset(
					Panel.AbsolutePosition.X
						+ 125,

					Panel.AbsolutePosition.Y
						+ 195
				),
				TextSize = 34,
				Rotation = -360
			},
			Enum.EasingStyle.Quint
		):Play()

		task.wait(.25)

		Tween(
			Panel,
			.45,
			{
				Size = originalSize,
				BackgroundTransparency = 0
			},
			Enum.EasingStyle.Back
		):Play()

		task.wait(.45)

		MorphBlood(Vector2.new(
			Panel.AbsolutePosition.X
				+ Panel.AbsoluteSize.X / 2,

			Panel.AbsolutePosition.Y
				+ Panel.AbsoluteSize.Y / 2
		))

		bat:Destroy()

	-- CLOSE
	else

		local center = Vector2.new(
			Panel.AbsolutePosition.X
				+ Panel.AbsoluteSize.X / 2,

			Panel.AbsolutePosition.Y
				+ Panel.AbsoluteSize.Y / 2
		)

		local bat = CreateMorphBat(center)

		MorphBlood(center)

		Tween(
			Panel,
			.35,
			{
				Size = UDim2.fromOffset(70, 70),
				BackgroundTransparency = 1
			},
			Enum.EasingStyle.Back
		):Play()

		task.wait(.3)

		Panel.Visible = false
		PanelVisible = false

		local floatPos = Float.AbsolutePosition

		Tween(
			bat,
			.55,
			{
				Position = UDim2.fromOffset(
					floatPos.X
						+ Float.AbsoluteSize.X / 2,

					floatPos.Y
						+ Float.AbsoluteSize.Y / 2
				),
				TextSize = 20,
				Rotation = 360
			},
			Enum.EasingStyle.Quint
		):Play()

		task.wait(.55)

		bat:Destroy()

	end

	DraculaAnimating = false

end

--==================================================
-- 🩸 FLOATING BUTTON HOVER EFFECT
--==================================================

Float.MouseEnter:Connect(function()

	if not Locked then

		Tween(
			Float,
			.2,
			{
				Size = UDim2.fromOffset(48, 48),
				BackgroundColor3 =
					COLORS.CardHover
			}
		):Play()

	end

end)

Float.MouseLeave:Connect(function()

	if not Locked then

		Tween(
			Float,
			.2,
			{
				Size = UDim2.fromOffset(44, 44),
				BackgroundColor3 =
					COLORS.Panel
			}
		):Play()

	end

end)

--==================================================
-- 🦇 FLOATING BAT WING ANIMATION
--==================================================

task.spawn(function()

	while Gui.Parent do

		Tween(
			Float,
			.7,
			{
				Rotation = -8
			},
			Enum.EasingStyle.Sine
		):Play()

		task.wait(.7)

		Tween(
			Float,
			.7,
			{
				Rotation = 8
			},
			Enum.EasingStyle.Sine
		):Play()

		task.wait(.7)

	end

end)

print("🩸🦇 DRACULA DECORATIONS LOADED")
