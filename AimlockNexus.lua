--// NEXUS VAMPIRIC SYSTEM V3
--// Admin-only system for your own Roblox experience
--// iPhone / Mobile + PC
--// Scrollable UI
--// Aimlock ON/OFF
--// Players / NPCs / Both
--// Team Check
--// Wall Check
--// Smoothness
--// Target Part
--// Max Distance
--// Draggable
--// Minimize
--// Floating Button
--// Heavy Blood Drips
--// Bat Animations
--// iPhone-sized UI

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local Camera = workspace.CurrentCamera
local CurrentTarget = nil

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

	TargetPart = "Head",

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
	Black = Color3.fromRGB(6, 3, 8),
	Panel = Color3.fromRGB(15, 8, 19),
	Card = Color3.fromRGB(27, 13, 32),
	CardHover = Color3.fromRGB(47, 18, 43),

	Blood = Color3.fromRGB(145, 12, 35),
	BrightBlood = Color3.fromRGB(235, 28, 62),
	DarkBlood = Color3.fromRGB(65, 5, 18),

	Text = Color3.fromRGB(245, 235, 242),
	Muted = Color3.fromRGB(150, 125, 150),

	Enabled = Color3.fromRGB(58, 13, 29),
	Locked = Color3.fromRGB(110, 8, 25)
}

--==================================================
-- HELPERS
--==================================================

local function Tween(Object, Time, Properties, Style)
	local Info = TweenInfo.new(
		Time or 0.2,
		Style or Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	)

	return TweenService:Create(Object, Info, Properties)
end

local function Corner(Object, Radius)
	local C = Instance.new("UICorner")
	C.CornerRadius = UDim.new(0, Radius)
	C.Parent = Object
end

local function Stroke(Object, Color, Thickness)
	local S = Instance.new("UIStroke")
	S.Color = Color
	S.Thickness = Thickness or 1
	S.Transparency = 0.08
	S.Parent = Object
	return S
end

--==================================================
-- GUI
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "NexusVampiricSystem"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.DisplayOrder = 500
Gui.Parent = PlayerGui

--==================================================
-- MAIN PANEL
--==================================================

local Panel = Instance.new("Frame")
Panel.Name = "Main"
Panel.Size = UDim2.fromOffset(300, 430)

-- iPhone-friendly starting position
Panel.Position = UDim2.new(
	0.5,
	-150,
	0.5,
	-215
)

Panel.BackgroundColor3 = COLORS.Panel
Panel.BorderSizePixel = 0
Panel.ClipsDescendants = true
Panel.Parent = Gui

Corner(Panel, 16)

local PanelStroke = Stroke(
	Panel,
	COLORS.Blood,
	2.2
)

--==================================================
-- IPHONE SCALE
--==================================================

local UIScale = Instance.new("UIScale")
UIScale.Name = "MobileScale"

-- 0.90 keeps the 300x430 design comfortable
-- on an iPhone 14 instead of becoming huge
UIScale.Scale = 0.90
UIScale.Parent = Panel

--==================================================
-- HEADER
--==================================================

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 70)
Header.BackgroundTransparency = 1
Header.Parent = Panel

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -75, 0, 27)
Title.Position = UDim2.fromOffset(15, 8)
Title.BackgroundTransparency = 1
Title.Text = "🩸 NEXUS VAMPIRIC"
Title.TextColor3 = COLORS.Text
Title.TextSize = 17
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -30, 0, 18)
Subtitle.Position = UDim2.fromOffset(16, 36)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "🦇 ADMIN AIM SYSTEM"
Subtitle.TextColor3 = COLORS.Muted
Subtitle.TextSize = 8
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.fromOffset(30, 30)
Minimize.Position = UDim2.new(1, -43, 0, 10)
Minimize.BackgroundColor3 = COLORS.Card
Minimize.BorderSizePixel = 0
Minimize.Text = "−"
Minimize.TextColor3 = COLORS.Text
Minimize.TextSize = 18
Minimize.Font = Enum.Font.GothamBold
Minimize.AutoButtonColor = false
Minimize.Parent = Header

Corner(Minimize, 8)
Stroke(Minimize, COLORS.Blood, 1.4)

local Bat = Instance.new("TextLabel")
Bat.Size = UDim2.fromOffset(35, 30)
Bat.Position = UDim2.new(1, -82, 0, 8)
Bat.BackgroundTransparency = 1
Bat.Text = "🦇"
Bat.TextSize = 19
Bat.Parent = Header

local BloodLine = Instance.new("Frame")
BloodLine.Size = UDim2.new(1, -28, 0, 2)
BloodLine.Position = UDim2.new(0, 14, 1, -2)
BloodLine.BackgroundColor3 = COLORS.Blood
BloodLine.BorderSizePixel = 0
BloodLine.Parent = Header

--==================================================
-- BAT HEADER ANIMATION
--==================================================

task.spawn(function()
	while Gui.Parent do

		Tween(Bat, 1, {
			Position = UDim2.new(1, -88, 0, 13),
			Rotation = -10
		}, Enum.EasingStyle.Sine):Play()

		task.wait(1)

		Tween(Bat, 1, {
			Position = UDim2.new(1, -76, 0, 7),
			Rotation = 10
		}, Enum.EasingStyle.Sine):Play()

		task.wait(1)
	end
end)

--==================================================
-- SCROLLING AREA
--==================================================

local Scroll = Instance.new("ScrollingFrame")
Scroll.Name = "SettingsScroll"
Scroll.Size = UDim2.new(1, -12, 1, -78)
Scroll.Position = UDim2.fromOffset(6, 74)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 4
Scroll.ScrollBarImageColor3 = COLORS.BrightBlood
Scroll.ScrollBarImageTransparency = 0.15
Scroll.CanvasSize = UDim2.fromOffset(0, 0)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.ScrollingDirection = Enum.ScrollingDirection.Y
Scroll.Active = true
Scroll.Parent = Panel

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -10, 0, 0)
Content.AutomaticSize = Enum.AutomaticSize.Y
Content.BackgroundTransparency = 1
Content.Parent = Scroll

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 9)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Content

local Padding = Instance.new("UIPadding")
Padding.PaddingLeft = UDim.new(0, 6)
Padding.PaddingRight = UDim.new(0, 6)
Padding.PaddingTop = UDim.new(0, 5)
Padding.PaddingBottom = UDim.new(0, 12)
Padding.Parent = Content

--==================================================
-- CARD CREATOR
--==================================================

local function CreateCard(Text)
	local Button = Instance.new("TextButton")

	Button.Size = UDim2.new(1, 0, 0, 48)
	Button.BackgroundColor3 = COLORS.Card
	Button.BorderSizePixel = 0
	Button.Text = Text
	Button.TextColor3 = COLORS.Text
	Button.TextSize = 11
	Button.Font = Enum.Font.GothamMedium
	Button.TextXAlignment = Enum.TextXAlignment.Left
	Button.AutoButtonColor = false
	Button.LayoutOrder = 1
	Button.Parent = Content

	Corner(Button, 10)
	Stroke(Button, Color3.fromRGB(78, 29, 64), 1.3)

	local Pad = Instance.new("UIPadding")
	Pad.PaddingLeft = UDim.new(0, 14)
	Pad.Parent = Button

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
-- AIMLOCK
--==================================================

local AimButton = CreateCard("🎯   AIMLOCK")

local AimStatus = Instance.new("TextLabel")
AimStatus.Size = UDim2.fromOffset(50, 22)
AimStatus.Position = UDim2.new(1, -62, .5, -11)
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
			BackgroundColor3 = COLORS.Enabled
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

local ModeButton = CreateCard("👥   TARGETS  •  PLAYERS")

ModeButton.MouseButton1Click:Connect(function()

	if Config.TargetMode == "Players" then
		Config.TargetMode = "NPCs"

	elseif Config.TargetMode == "NPCs" then
		Config.TargetMode = "Both"

	else
		Config.TargetMode = "Players"
	end

	CurrentTarget = nil

	ModeButton.Text =
		"👥   TARGETS  •  "
		.. string.upper(Config.TargetMode)
end)

--==================================================
-- TARGET PART
--==================================================

local PartButton = CreateCard("🩸   PART  •  HEAD")

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

local TeamButton = CreateCard("♟   TEAM CHECK")

local TeamStatus = Instance.new("TextLabel")
TeamStatus.Size = UDim2.fromOffset(45, 20)
TeamStatus.Position = UDim2.new(1, -57, .5, -10)
TeamStatus.BackgroundTransparency = 1
TeamStatus.Text = "ON"
TeamStatus.TextColor3 = COLORS.BrightBlood
TeamStatus.TextSize = 10
TeamStatus.Font = Enum.Font.GothamBold
TeamStatus.Parent = TeamButton

TeamButton.MouseButton1Click:Connect(function()

	Config.TeamCheck = not Config.TeamCheck

	TeamStatus.Text =
		Config.TeamCheck and "ON" or "OFF"

	TeamStatus.TextColor3 =
		Config.TeamCheck
		and COLORS.BrightBlood
		or COLORS.Muted

	CurrentTarget = nil
end)

--==================================================
-- WALL CHECK
--==================================================

local WallButton = CreateCard("🧱   WALL CHECK")

local WallStatus = Instance.new("TextLabel")
WallStatus.Size = UDim2.fromOffset(45, 20)
WallStatus.Position = UDim2.new(1, -57, .5, -10)
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

local SmoothCard = CreateCard("🌀   SMOOTHNESS")

local SmoothBox = Instance.new("TextBox")
SmoothBox.Size = UDim2.fromOffset(65, 28)
SmoothBox.Position = UDim2.new(1, -78, .5, -14)
SmoothBox.BackgroundColor3 = COLORS.Black
SmoothBox.BorderSizePixel = 0
SmoothBox.Text = "0.18"
SmoothBox.TextColor3 = COLORS.Text
SmoothBox.TextSize = 10
SmoothBox.Font = Enum.Font.GothamMedium
SmoothBox.ClearTextOnFocus = false
SmoothBox.Parent = SmoothCard

Corner(SmoothBox, 7)
Stroke(SmoothBox, COLORS.Blood, 1.2)

SmoothBox.FocusLost:Connect(function()

	local Number = tonumber(SmoothBox.Text)

	if Number then

		Config.Smoothness =
			math.clamp(Number, .01, 1)

	end

	SmoothBox.Text =
		string.format("%.2f", Config.Smoothness)
end)

--==================================================
-- MAX DISTANCE
--==================================================

local DistanceCard = CreateCard("📏   MAX DISTANCE")

local DistanceBox = Instance.new("TextBox")
DistanceBox.Size = UDim2.fromOffset(65, 28)
DistanceBox.Position = UDim2.new(1, -78, .5, -14)
DistanceBox.BackgroundColor3 = COLORS.Black
DistanceBox.BorderSizePixel = 0
DistanceBox.Text = "500"
DistanceBox.TextColor3 = COLORS.Text
DistanceBox.TextSize = 10
DistanceBox.Font = Enum.Font.GothamMedium
DistanceBox.ClearTextOnFocus = false
DistanceBox.Parent = DistanceCard

Corner(DistanceBox, 7)
Stroke(DistanceBox, COLORS.Blood, 1.2)

DistanceBox.FocusLost:Connect(function()

	local Number = tonumber(DistanceBox.Text)

	if Number then
		Config.MaxDistance =
			math.clamp(Number, 25, 5000)
	end

	DistanceBox.Text =
		tostring(Config.MaxDistance)
end)

--==================================================
-- BREAK ON CAMERA MOVE
--==================================================

local BreakButton = CreateCard("🎥   BREAK ON MOVE")

local BreakStatus = Instance.new("TextLabel")
BreakStatus.Size = UDim2.fromOffset(45, 20)
BreakStatus.Position = UDim2.new(1, -57, .5, -10)
BreakStatus.BackgroundTransparency = 1
BreakStatus.Text = "ON"
BreakStatus.TextColor3 = COLORS.BrightBlood
BreakStatus.TextSize = 10
BreakStatus.Font = Enum.Font.GothamBold
BreakStatus.Parent = BreakButton

BreakButton.MouseButton1Click:Connect(function()

	Config.BreakOnMove = not Config.BreakOnMove

	BreakStatus.Text =
		Config.BreakOnMove and "ON" or "OFF"

	BreakStatus.TextColor3 =
		Config.BreakOnMove
		and COLORS.BrightBlood
		or COLORS.Muted
end)

--==================================================
-- BREAK SENSITIVITY
--==================================================

local SensitivityCard = CreateCard("⚡   BREAK SENSITIVITY")

local SensitivityBox = Instance.new("TextBox")
SensitivityBox.Size = UDim2.fromOffset(65, 28)
SensitivityBox.Position = UDim2.new(1, -78, .5, -14)
SensitivityBox.BackgroundColor3 = COLORS.Black
SensitivityBox.BorderSizePixel = 0
SensitivityBox.Text = "8"
SensitivityBox.TextColor3 = COLORS.Text
SensitivityBox.TextSize = 10
SensitivityBox.Font = Enum.Font.GothamMedium
SensitivityBox.ClearTextOnFocus = false
SensitivityBox.Parent = SensitivityCard

Corner(SensitivityBox, 7)
Stroke(SensitivityBox, COLORS.Blood, 1.2)

SensitivityBox.FocusLost:Connect(function()

	local Number = tonumber(SensitivityBox.Text)

	if Number then
		Config.BreakSensitivity =
			math.clamp(Number, 1, 90)
	end

	SensitivityBox.Text =
		tostring(Config.BreakSensitivity)
end)

--==================================================
-- MINIMIZE
--==================================================

local Minimized = false

Minimize.MouseButton1Click:Connect(function()

	Minimized = not Minimized

	if Minimized then

		Minimize.Text = "+"

		Scroll.Visible = false

		Tween(Panel, .3, {
			Size = UDim2.fromOffset(300, 70)
		}):Play()

	else

		Minimize.Text = "−"

		Tween(Panel, .35, {
			Size = UDim2.fromOffset(300, 430)
		}, Enum.EasingStyle.Back):Play()

		task.delay(.1, function()
			if not Minimized then
				Scroll.Visible = true
			end
		end)

	end
end)

--==================================================
-- DRAGGING
--==================================================

local Dragging = false
local DragStart
local StartPosition

Header.InputBegan:Connect(function(Input)

	if Input.UserInputType == Enum.UserInputType.MouseButton1
		or Input.UserInputType == Enum.UserInputType.Touch then

		Dragging = true
		DragStart = Input.Position
		StartPosition = Panel.Position
	end
end)

Header.InputEnded:Connect(function(Input)

	if Input.UserInputType == Enum.UserInputType.MouseButton1
		or Input.UserInputType == Enum.UserInputType.Touch then

		Dragging = false
	end
end)

UIS.InputChanged:Connect(function(Input)

	if not Dragging then
		return
	end

	if Input.UserInputType ~= Enum.UserInputType.MouseMovement
		and Input.UserInputType ~= Enum.UserInputType.Touch then
		return
	end

	local Delta = Input.Position - DragStart

	Panel.Position = UDim2.new(
		StartPosition.X.Scale,
		StartPosition.X.Offset + Delta.X,
		StartPosition.Y.Scale,
		StartPosition.Y.Offset + Delta.Y
	)
end)

--==================================================
-- FLOATING BUTTON
--==================================================

local Float = Instance.new("TextButton")
Float.Name = "FloatingButton"
Float.Size = UDim2.fromOffset(48, 48)
Float.Position = UDim2.new(0, 18, .5, -24)
Float.BackgroundColor3 = COLORS.Panel
Float.BorderSizePixel = 0
Float.Text = "🦇"
Float.TextSize = 20
Float.AutoButtonColor = false
Float.Parent = Gui

Corner(Float, 13)

local FloatStroke = Stroke(
	Float,
	COLORS.Blood,
	2
)

--==================================================
-- FLOATING BUTTON VISIBILITY
--==================================================

local PanelVisible = true

local DraculaAnimating = false

local function SetVisible(State)

	if DraculaAnimating then
		return
	end

	PanelVisible = State

	if State then

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
			Thickness = 3
		}):Play()

	else

		Float.Text = "🦇"

		Tween(Float, .2, {
			BackgroundColor3 = COLORS.Panel
		}):Play()

		Tween(FloatStroke, .2, {
			Color = COLORS.Blood,
			Thickness = 2
		}):Play()
	end
end

Float.InputBegan:Connect(function(Input)

	if Input.UserInputType == Enum.UserInputType.MouseButton1
		or Input.UserInputType == Enum.UserInputType.Touch then

		Holding = true
		FloatDragging = false
		HoldStart = os.clock()

		FloatDragStart = Input.Position
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

Float.InputEnded:Connect(function(Input)

	if Input.UserInputType == Enum.UserInputType.MouseButton1
		or Input.UserInputType == Enum.UserInputType.Touch then

		Holding = false

		if not FloatDragging
			and os.clock() - HoldStart < 2 then

			SetVisible(not PanelVisible)
		end
	end
end)

UIS.InputChanged:Connect(function(Input)

	if not Holding or Locked then
		return
	end

	if Input.UserInputType ~= Enum.UserInputType.MouseMovement
		and Input.UserInputType ~= Enum.UserInputType.Touch then
		return
	end

	local Delta = Input.Position - FloatDragStart

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
-- AIM SYSTEM
--==================================================

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

				if Visible and Screen.Z > 0 then

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

				if Visible and Screen.Z > 0 then

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
-- AIM LOOP
--==================================================

RunService:BindToRenderStep(
	"NexusVampiricAim",
	Enum.RenderPriority.Camera.Value + 1,
	function()

		Camera = workspace.CurrentCamera

		if not Config.Enabled then

			CurrentTarget = nil
			LastLookVector = nil

			return
		end

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

		-- Break if player manually moves camera hard

		if Config.BreakOnMove
			and LastLookVector then

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

UIS.InputBegan:Connect(function(Input, Processed)

	if Processed then
		return
	end

	if Input.KeyCode == Enum.KeyCode.Q then

		Config.Enabled = not Config.Enabled
		CurrentTarget = nil

		UpdateAim()

	elseif Input.KeyCode == Enum.KeyCode.RightShift then

		SetVisible(not PanelVisible)
	end
end)

--==================================================
-- BLOOD FX
--==================================================

local DraculaFX = Instance.new("Folder")
DraculaFX.Name = "DraculaFX"
DraculaFX.Parent = Gui

--==================================================
-- HEAVY BLOOD DRIPS
--==================================================

local function MakeBloodDrip(X, MaxLength)

	local Drip = Instance.new("Frame")

	Drip.Name = "HeavyBloodDrip"

	Drip.AnchorPoint =
		Vector2.new(.5, 0)

	Drip.Position =
		UDim2.fromOffset(X, 0)

	Drip.Size =
		UDim2.fromOffset(
			math.random(4, 6),
			math.random(8, 18)
		)

	Drip.BackgroundColor3 =
		COLORS.BrightBlood

	Drip.BorderSizePixel = 0
	Drip.ZIndex = 50
	Drip.Parent = Panel

	Corner(Drip, 6)

	local Drop = Instance.new("Frame")

	Drop.Size =
		UDim2.fromOffset(
			math.random(8, 11),
			math.random(9, 14)
		)

	Drop.Position =
		UDim2.new(.5, -4, 1, -2)

	Drop.BackgroundColor3 =
		COLORS.BrightBlood

	Drop.BorderSizePixel = 0
	Drop.ZIndex = 50
	Drop.Parent = Drip

	Corner(Drop, 8)

	task.spawn(function()

		while Drip.Parent do

			local Length =
				math.random(
					12,
					MaxLength
				)

			Tween(
				Drip,
				math.random(15, 25) / 10,
				{
					Size =
						UDim2.fromOffset(
							math.random(4, 6),
							Length
						)
				},
				Enum.EasingStyle.Sine
			):Play()

			task.wait(
				math.random(15, 30) / 10
			)

			Tween(
				Drip,
				.5,
				{
					Size =
						UDim2.fromOffset(
							math.random(4, 6),
							7
						)
				},
				Enum.EasingStyle.Sine
			):Play()

			task.wait(
				math.random(4, 12) / 10
			)
		end
	end)
end

for _, X in ipairs({
	10, 25, 43, 61, 78, 96,
	114, 132, 149, 167, 185,
	203, 221, 239, 258, 280
}) do

	MakeBloodDrip(
		X,
		math.random(28, 55)
	)
end

--==================================================
-- RANDOM BLOOD PARTICLES
--==================================================

local function SpawnBloodParticle()

	local Particle = Instance.new("TextLabel")

	Particle.Size =
		UDim2.fromOffset(14, 14)

	Particle.BackgroundTransparency = 1
	Particle.Text = "🩸"
	Particle.TextSize =
		math.random(8, 13)

	Particle.TextTransparency = .15
	Particle.ZIndex = 5

	Particle.Position =
		UDim2.new(
			math.random(5, 95) / 100,
			0,
			0,
			-15
		)

	Particle.Parent = DraculaFX

	local Duration =
		math.random(35, 60) / 10

	Tween(
		Particle,
		Duration,
		{
			Position =
				UDim2.new(
					Particle.Position.X.Scale,
					math.random(-20, 20),
					1,
					25
				),

			Rotation =
				math.random(-45, 45),

			TextTransparency = 1
		},
		Enum.EasingStyle.Linear
	):Play()

	task.delay(
		Duration + .1,
		function()

			if Particle then
				Particle:Destroy()
			end
		end
	)
end

task.spawn(function()

	while Gui.Parent do

		SpawnBloodParticle()

		task.wait(
			math.random(2, 4)
		)
	end
end)

--==================================================
-- FLYING BATS
--==================================================

local function SpawnBat()

	local BatParticle = Instance.new("TextLabel")

	BatParticle.Size =
		UDim2.fromOffset(
			math.random(20, 28),
			math.random(18, 24)
		)

	BatParticle.BackgroundTransparency = 1
	BatParticle.Text = "🦇"
	BatParticle.TextSize =
		math.random(13, 19)

	BatParticle.ZIndex = 5

	local Viewport =
		workspace.CurrentCamera.ViewportSize

	local LeftToRight =
		math.random(1, 2) == 1

	local StartY =
		math.random(
			70,
			math.max(
				100,
				Viewport.Y - 70
			)
		)

	if LeftToRight then

		BatParticle.Position =
			UDim2.fromOffset(
				-40,
				StartY
			)

	else

		BatParticle.Position =
			UDim2.fromOffset(
				Viewport.X + 40,
				StartY
			)
	end

	BatParticle.Parent = DraculaFX

	local FinishX =
		LeftToRight
		and Viewport.X + 50
		or -50

	local FinishY =
		math.clamp(
			StartY +
				math.random(-120, 120),
			60,
			math.max(
				100,
				Viewport.Y - 60
			)
		)

	local Duration =
		math.random(45, 75) / 10

	Tween(
		BatParticle,
		Duration,
		{
			Position =
				UDim2.fromOffset(
					FinishX,
					FinishY
				),

			Rotation =
				math.random(-20, 20)
		},
		Enum.EasingStyle.Sine
	):Play()

	task.delay(
		Duration + .1,
		function()

			if BatParticle then
				BatParticle:Destroy()
			end
		end
	)
end

task.spawn(function()

	while Gui.Parent do

		SpawnBat()

		task.wait(
			math.random(3, 6)
		)
	end
end)

--==================================================
-- AIMLOCK GLOW
--==================================================

local VampireGlow = Instance.new("UIStroke")

VampireGlow.Name = "VampireGlow"
VampireGlow.Color = COLORS.BrightBlood
VampireGlow.Thickness = 2
VampireGlow.Transparency = 1
VampireGlow.Parent = Panel

task.spawn(function()

	while Gui.Parent do

		if Config.Enabled then

			Tween(
				VampireGlow,
				.7,
				{
					Transparency = .25,
					Thickness = 3
				},
				Enum.EasingStyle.Sine
			):Play()

			task.wait(.7)

			Tween(
				VampireGlow,
				.7,
				{
					Transparency = .75,
					Thickness = 2
				},
				Enum.EasingStyle.Sine
			):Play()

			task.wait(.7)

		else

			VampireGlow.Transparency = 1

			task.wait(.25)
		end
	end
end)

--==================================================
-- FLOATING BUTTON ANIMATION
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

--==================================================
-- HOVER
--==================================================

Float.MouseEnter:Connect(function()

	if not Locked then

		Tween(Float, .2, {
			Size = UDim2.fromOffset(52, 52),
			BackgroundColor3 = COLORS.CardHover
		}):Play()
	end
end)

Float.MouseLeave:Connect(function()

	if not Locked then

		Tween(Float, .2, {
			Size = UDim2.fromOffset(48, 48),
			BackgroundColor3 = COLORS.Panel
		}):Play()
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
UpdateLock()

print("🩸🦇 NEXUS VAMPIRIC SYSTEM V3 LOADED")
