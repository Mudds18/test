--// NEXUS V6.5
--// COMPLETE LOCAL SCRIPT
--// Home / ESP / Combat / Speed / Slots / Settings
--// Themes / ESP Colors / Profile / Discord / 3-Second UI Lock
--// Mobile + PC

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--==================================================
-- CONFIG
--==================================================

local CONFIG = {
	Size = 0.82,
	MinSize = 0.60,
	MaxSize = 1.10,

	Theme = "Cyberpunk",
	Accent = Color3.fromRGB(0,255,220),

	AnimationSpeed = 1,
	Transparency = 0.25,

	SpeedEnabled = false,
	Speed = 16,

	JumpEnabled = false,
	JumpPower = 50,

	GravityEnabled = false,
	Gravity = 196.2,

	SprintEnabled = false,
	SprintSpeed = 24,

	FlyEnabled = false,
	FlySpeed = 45,

	SwimEnabled = false,
	NoclipEnabled = false,

	HighJumpEnabled = false,
	HighJumpPower = 100,

	BunnyHopEnabled = false,

	CrosshairEnabled = false,
	CrosshairSize = 26,

	ESPEnabled = false,
	ESPNames = true,
	ESPDistance = true,
	ESPBoxes = true,
	ESPMaxDistance = 500,

	ESPFillColor = Color3.fromRGB(0,255,220),
	ESPOutlineColor = Color3.fromRGB(255,255,255),

	TargetLockEnabled = false,
	TargetLockDistance = 500,
	TargetLockPart = "HumanoidRootPart",

	HitboxEnabled = false,
	HitboxSize = 5,

	FOVEnabled = false,
	FOV = 80,

	Rainbow = false,
	RainbowSpeed = 1.35,
}

local DefaultGravity = workspace.Gravity
local DefaultFOV = workspace.CurrentCamera.FieldOfView

--==================================================
-- THEMES
--==================================================

local Themes = {
	Cyberpunk = {
		Accent = Color3.fromRGB(0,255,220),
		Background = Color3.fromRGB(10,14,18),
		Card = Color3.fromRGB(17,26,30),
		Top = Color3.fromRGB(18,24,29),
		Sidebar = Color3.fromRGB(13,19,23),
		Logo = "☠"
	},

	Vampire = {
		Accent = Color3.fromRGB(255,50,90),
		Background = Color3.fromRGB(18,8,12),
		Card = Color3.fromRGB(31,14,20),
		Top = Color3.fromRGB(30,12,18),
		Sidebar = Color3.fromRGB(21,9,14),
		Logo = "🩸"
	},

	Robotic = {
		Accent = Color3.fromRGB(80,170,255),
		Background = Color3.fromRGB(9,13,20),
		Card = Color3.fromRGB(18,25,35),
		Top = Color3.fromRGB(15,23,33),
		Sidebar = Color3.fromRGB(11,18,27),
		Logo = "🤖"
	},

	Toxic = {
		Accent = Color3.fromRGB(120,255,50),
		Background = Color3.fromRGB(9,18,10),
		Card = Color3.fromRGB(16,30,18),
		Top = Color3.fromRGB(13,25,15),
		Sidebar = Color3.fromRGB(10,21,12),
		Logo = "☢"
	},

	Fire = {
		Accent = Color3.fromRGB(255,130,35),
		Background = Color3.fromRGB(20,12,7),
		Card = Color3.fromRGB(32,20,12),
		Top = Color3.fromRGB(29,17,9),
		Sidebar = Color3.fromRGB(22,13,7),
		Logo = "🔥"
	},

	Ocean = {
		Accent = Color3.fromRGB(30,180,255),
		Background = Color3.fromRGB(6,15,24),
		Card = Color3.fromRGB(12,28,42),
		Top = Color3.fromRGB(9,22,35),
		Sidebar = Color3.fromRGB(7,19,31),
		Logo = "🌊"
	},

	Ghost = {
		Accent = Color3.fromRGB(210,210,255),
		Background = Color3.fromRGB(12,12,18),
		Card = Color3.fromRGB(25,25,34),
		Top = Color3.fromRGB(20,20,29),
		Sidebar = Color3.fromRGB(16,16,24),
		Logo = "👻"
	},

	Gold = {
		Accent = Color3.fromRGB(255,205,60),
		Background = Color3.fromRGB(18,15,7),
		Card = Color3.fromRGB(31,26,12),
		Top = Color3.fromRGB(27,23,10),
		Sidebar = Color3.fromRGB(20,17,8),
		Logo = "👑"
	}
}

--==================================================
-- GUI
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "NexusV65"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = PlayerGui

local UIScale = Instance.new("UIScale")
UIScale.Scale = CONFIG.Size
UIScale.Parent = Gui

--==================================================
-- UTILITIES
--==================================================

local function corner(obj,radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0,radius)
	c.Parent = obj
	return c
end

local function stroke(obj,color,thickness,transparency)
	local s = Instance.new("UIStroke")
	s.Color = color
	s.Thickness = thickness or 1
	s.Transparency = transparency or 0
	s.Parent = obj
	return s
end

local function lighten(color,amount)
	return color:Lerp(Color3.new(1,1,1),amount)
end

local function tween(obj,time,props,style,direction)
	if not obj or not obj.Parent then return end

	local info = TweenInfo.new(
		time / math.max(CONFIG.AnimationSpeed,.05),
		style or Enum.EasingStyle.Quint,
		direction or Enum.EasingDirection.Out
	)

	local t = TweenService:Create(obj,info,props)
	t:Play()
	return t
end

--==================================================
-- MAIN
--==================================================

local Main = Instance.new("Frame")
Main.Name = "NexusMain"
Main.Size = UDim2.fromOffset(560,380)
Main.Position = UDim2.fromScale(.5,.5)
Main.AnchorPoint = Vector2.new(.5,.5)
Main.BackgroundColor3 = Themes.Cyberpunk.Background
Main.BackgroundTransparency = CONFIG.Transparency
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = Gui
corner(Main,16)

local MainStroke = stroke(Main,CONFIG.Accent,2,.08)

--==================================================
-- TOP BAR
--==================================================

local Top = Instance.new("Frame")
Top.Size = UDim2.new(1,0,0,48)
Top.BackgroundColor3 = Themes.Cyberpunk.Top
Top.BorderSizePixel = 0
Top.Parent = Main
corner(Top,14)

local TopCover = Instance.new("Frame")
TopCover.Size = UDim2.new(1,0,0,15)
TopCover.Position = UDim2.new(0,0,1,-15)
TopCover.BackgroundColor3 = Themes.Cyberpunk.Top
TopCover.BorderSizePixel = 0
TopCover.Parent = Top

local TopLine = Instance.new("Frame")
TopLine.Size = UDim2.new(1,-18,0,1)
TopLine.Position = UDim2.fromOffset(9,47)
TopLine.BackgroundColor3 = CONFIG.Accent
TopLine.BorderSizePixel = 0
TopLine.Parent = Top

local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.fromOffset(40,40)
Logo.Position = UDim2.fromOffset(7,4)
Logo.BackgroundTransparency = 1
Logo.Text = "☠"
Logo.TextSize = 21
Logo.Font = Enum.Font.GothamBlack
Logo.TextColor3 = CONFIG.Accent
Logo.Parent = Top

local Title = Instance.new("TextLabel")
Title.Size = UDim2.fromOffset(210,25)
Title.Position = UDim2.fromOffset(45,5)
Title.BackgroundTransparency = 1
Title.Text = "NEXUS // V6.5"
Title.TextSize = 15
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Color3.fromRGB(240,255,255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Top

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.fromOffset(250,18)
Subtitle.Position = UDim2.fromOffset(45,25)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "MASTER CONTROL SYSTEM"
Subtitle.TextSize = 8
Subtitle.Font = Enum.Font.Code
Subtitle.TextColor3 = Color3.fromRGB(125,150,155)
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Top

--==================================================
-- MINIMIZE
--==================================================

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.fromOffset(34,34)
Minimize.Position = UDim2.new(1,-42,0,7)
Minimize.BackgroundColor3 = Color3.fromRGB(27,35,40)
Minimize.Text = "☠"
Minimize.TextSize = 16
Minimize.TextColor3 = CONFIG.Accent
Minimize.Font = Enum.Font.GothamBlack
Minimize.AutoButtonColor = false
Minimize.Parent = Top
corner(Minimize,8)

local MinStroke = stroke(Minimize,CONFIG.Accent,1,.2)

--==================================================
-- SIDEBAR
--==================================================

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0,58,1,-48)
Sidebar.Position = UDim2.fromOffset(0,48)
Sidebar.BackgroundColor3 = Themes.Cyberpunk.Sidebar
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

local SidebarLine = Instance.new("Frame")
SidebarLine.Size = UDim2.new(0,1,1,0)
SidebarLine.Position = UDim2.new(1,-1,0,0)
SidebarLine.BackgroundColor3 = CONFIG.Accent
SidebarLine.BorderSizePixel = 0
SidebarLine.Parent = Sidebar

local Tabs = {}

local function createTab(icon,name,y)
	local b = Instance.new("TextButton")
	b.Name = name
	b.Size = UDim2.fromOffset(44,42)
	b.Position = UDim2.fromOffset(7,y)
	b.BackgroundColor3 = CONFIG.Accent
	b.BackgroundTransparency = 1
	b.Text = icon
	b.TextSize = 17
	b.Font = Enum.Font.GothamBlack
	b.TextColor3 = Color3.fromRGB(115,140,145)
	b.AutoButtonColor = false
	b.Parent = Sidebar
	corner(b,9)
	Tabs[name] = b
	return b
end

createTab("🏠","Home",8)
createTab("👁️","ESP",57)
createTab("🎯","Combat",106)
createTab("⚡","Speed",155)
createTab("📦","Slots",204)
createTab("⚙️","Settings",253)

--==================================================
-- CONTENT
--==================================================

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1,-58,1,-48)
Content.Position = UDim2.fromOffset(58,48)
Content.BackgroundTransparency = 1
Content.ClipsDescendants = true
Content.Parent = Main

local Pages = {}

local function createPage(name)
	local p = Instance.new("ScrollingFrame")
	p.Name = name
	p.Size = UDim2.fromScale(1,1)
	p.BackgroundTransparency = 1
	p.BorderSizePixel = 0
	p.ScrollBarThickness = 4
	p.ScrollBarImageColor3 = CONFIG.Accent
	p.CanvasSize = UDim2.new()
	p.AutomaticCanvasSize = Enum.AutomaticSize.Y
	p.ScrollingDirection = Enum.ScrollingDirection.Y
	p.Visible = false
	p.Parent = Content

	local pad = Instance.new("UIPadding")
	pad.PaddingBottom = UDim.new(0,18)
	pad.Parent = p

	Pages[name] = p
	return p
end

local HomePage = createPage("Home")
local ESPPage = createPage("ESP")
local CombatPage = createPage("Combat")
local SpeedPage = createPage("Speed")
local SlotsPage = createPage("Slots")
local SettingsPage = createPage("Settings")

HomePage.Visible = true

local CurrentPage = "Home"

local function switchPage(name)
	if name == CurrentPage then return end

	local old = Pages[CurrentPage]
	local new = Pages[name]

	if not new then return end

	new.Visible = true
	new.Position = UDim2.fromOffset(20,0)

	tween(new,.2,{Position=UDim2.fromOffset(0,0)})

	if old then
		tween(old,.16,{Position=UDim2.fromOffset(-15,0)})

		task.delay(.18,function()
			if old and old.Parent then
				old.Visible = false
				old.Position = UDim2.fromOffset(0,0)
			end
		end)
	end

	CurrentPage = name
end

local function refreshTabs(active)
	for name,b in pairs(Tabs) do
		if name == active then
			tween(b,.15,{
				BackgroundTransparency=0,
				BackgroundColor3=CONFIG.Accent,
				TextColor3=Color3.fromRGB(5,15,18)
			})
		else
			tween(b,.15,{
				BackgroundTransparency=1,
				TextColor3=lighten(CONFIG.Accent,.55)
			})
		end
	end
end

for name,button in pairs(Tabs) do
	button.MouseButton1Click:Connect(function()
		switchPage(name)
		refreshTabs(name)
	end)
end

refreshTabs("Home")

--==================================================
-- OBJECT TABLES
--==================================================

local CardObjects = {}
local ToggleObjects = {}
local SliderObjects = {}
local ESPObjects = {}
local SlotFrames = {}

--==================================================
-- CARD
--==================================================

local function card(parent,title,description,y,height)
	local b = Instance.new("Frame")
	b.Size = UDim2.new(1,-22,0,height or 62)
	b.Position = UDim2.fromOffset(11,y)
	b.BackgroundColor3 = Themes.Cyberpunk.Card
	b.BorderSizePixel = 0
	b.Parent = parent
	corner(b,10)

	local s = stroke(b,Color3.fromRGB(35,55,60),1)

	table.insert(CardObjects,{Frame=b,Stroke=s})

	local t = Instance.new("TextLabel")
	t.Size = UDim2.new(1,-20,0,22)
	t.Position = UDim2.fromOffset(10,7)
	t.BackgroundTransparency = 1
	t.Text = title
	t.TextColor3 = Color3.fromRGB(235,250,250)
	t.TextSize = 12
	t.Font = Enum.Font.GothamBold
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.Parent = b

	local d = Instance.new("TextLabel")
	d.Size = UDim2.new(1,-20,0,25)
	d.Position = UDim2.fromOffset(10,29)
	d.BackgroundTransparency = 1
	d.Text = description
	d.TextColor3 = Color3.fromRGB(125,150,155)
	d.TextSize = 9
	d.Font = Enum.Font.Code
	d.TextXAlignment = Enum.TextXAlignment.Left
	d.Parent = b

	return b
end

--==================================================
-- HOME
--==================================================

local ProfileCard = Instance.new("Frame")
ProfileCard.Size = UDim2.new(1,-22,0,90)
ProfileCard.Position = UDim2.fromOffset(11,10)
ProfileCard.BackgroundColor3 = Themes.Cyberpunk.Card
ProfileCard.BorderSizePixel = 0
ProfileCard.Parent = HomePage
corner(ProfileCard,10)
stroke(ProfileCard,Color3.fromRGB(35,55,60),1)

local ProfileImage = Instance.new("ImageLabel")
ProfileImage.Size = UDim2.fromOffset(64,64)
ProfileImage.Position = UDim2.fromOffset(12,13)
ProfileImage.BackgroundColor3 = Color3.fromRGB(25,35,40)
ProfileImage.Image = "rbxthumb://type=AvatarHeadShot&id="..Player.UserId.."&w=150&h=150"
ProfileImage.Parent = ProfileCard
corner(ProfileImage,32)

local MadeBy = Instance.new("TextLabel")
MadeBy.Size = UDim2.new(1,-95,0,25)
MadeBy.Position = UDim2.fromOffset(88,18)
MadeBy.BackgroundTransparency = 1
MadeBy.Text = "MADE BY NEXUS"
MadeBy.TextColor3 = CONFIG.Accent
MadeBy.TextSize = 14
MadeBy.Font = Enum.Font.GothamBlack
MadeBy.TextXAlignment = Enum.TextXAlignment.Left
MadeBy.Parent = ProfileCard

local MadeBySub = Instance.new("TextLabel")
MadeBySub.Size = UDim2.new(1,-95,0,25)
MadeBySub.Position = UDim2.fromOffset(88,43)
MadeBySub.BackgroundTransparency = 1
MadeBySub.Text = "@"..Player.Name.."  //  MASTER CONTROL"
MadeBySub.TextColor3 = Color3.fromRGB(125,150,155)
MadeBySub.TextSize = 9
MadeBySub.Font = Enum.Font.Code
MadeBySub.TextXAlignment = Enum.TextXAlignment.Left
MadeBySub.Parent = ProfileCard

local DiscordButton = Instance.new("TextButton")
DiscordButton.Size = UDim2.new(1,-22,0,48)
DiscordButton.Position = UDim2.fromOffset(11,110)
DiscordButton.BackgroundColor3 = Themes.Cyberpunk.Card
DiscordButton.BorderSizePixel = 0
DiscordButton.Text = "💬  COPY DISCORD LINK"
DiscordButton.TextColor3 = CONFIG.Accent
DiscordButton.TextSize = 11
DiscordButton.Font = Enum.Font.GothamBlack
DiscordButton.AutoButtonColor = false
DiscordButton.Parent = HomePage
corner(DiscordButton,9)
stroke(DiscordButton,Color3.fromRGB(35,55,60),1)

-- PUT YOUR DISCORD INVITE HERE
local DiscordLink = "PUT_YOUR_DISCORD_LINK_HERE"

DiscordButton.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(DiscordLink)
		DiscordButton.Text = "✓  DISCORD LINK COPIED"
	else
		DiscordButton.Text = DiscordLink
	end

	task.delay(1.5,function()
		if DiscordButton.Parent then
			DiscordButton.Text = "💬  COPY DISCORD LINK"
		end
	end)
end)

card(HomePage,"// NEXUS V6.5","Master control interface initialized.",170,70)
card(HomePage,"// PLAYER",Player.DisplayName.."  @"..Player.Name,250,65)
card(HomePage,"// STATUS","All modules waiting for activation.",325,65)

--==================================================
-- TOGGLE
--==================================================

local function createToggle(parent,title,description,y,default,callback)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1,-22,0,62)
	b.Position = UDim2.fromOffset(11,y)
	b.BackgroundColor3 = Themes.Cyberpunk.Card
	b.BorderSizePixel = 0
	b.Text = ""
	b.AutoButtonColor = false
	b.Parent = parent
	corner(b,10)
	stroke(b,Color3.fromRGB(35,55,60),1)

	local t = Instance.new("TextLabel")
	t.Size = UDim2.new(1,-80,0,22)
	t.Position = UDim2.fromOffset(11,7)
	t.BackgroundTransparency = 1
	t.Text = title
	t.TextColor3 = Color3.fromRGB(235,250,250)
	t.TextSize = 11
	t.Font = Enum.Font.GothamBold
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.Parent = b

	local d = Instance.new("TextLabel")
	d.Size = UDim2.new(1,-80,0,24)
	d.Position = UDim2.fromOffset(11,29)
	d.BackgroundTransparency = 1
	d.Text = description
	d.TextColor3 = Color3.fromRGB(125,150,155)
	d.TextSize = 8
	d.Font = Enum.Font.Code
	d.TextXAlignment = Enum.TextXAlignment.Left
	d.Parent = b

	local state = Instance.new("TextLabel")
	state.Size = UDim2.fromOffset(50,24)
	state.Position = UDim2.new(1,-61,.5,-12)
	state.BackgroundColor3 = Color3.fromRGB(30,42,46)
	state.Text = "OFF"
	state.TextColor3 = Color3.fromRGB(145,165,170)
	state.TextSize = 9
	state.Font = Enum.Font.GothamBlack
	state.Parent = b
	corner(state,7)

	local enabled = default == true

	local function update()
		if enabled then
			state.Text = "ON"
			state.BackgroundColor3 = CONFIG.Accent
			state.TextColor3 = Color3.fromRGB(5,15,18)
		else
			state.Text = "OFF"
			state.BackgroundColor3 = Color3.fromRGB(30,42,46)
			state.TextColor3 = Color3.fromRGB(145,165,170)
		end
	end

	b.MouseButton1Click:Connect(function()
		enabled = not enabled
		update()
		if callback then callback(enabled) end
	end)

	table.insert(ToggleObjects,{Button=b,State=state})
	update()

	return b
end

--==================================================
-- SLIDER
--==================================================

local function createSlider(parent,title,min,max,value,y,callback)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1,-22,0,60)
	frame.Position = UDim2.fromOffset(11,y)
	frame.BackgroundColor3 = Themes.Cyberpunk.Card
	frame.BorderSizePixel = 0
	frame.Parent = parent
	corner(frame,10)

	local frameStroke = stroke(frame,Color3.fromRGB(35,55,60),1)

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1,-80,0,20)
	label.Position = UDim2.fromOffset(10,7)
	label.BackgroundTransparency = 1
	label.Text = title
	label.TextColor3 = Color3.fromRGB(235,250,250)
	label.TextSize = 10
	label.Font = Enum.Font.GothamBold
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = frame

	local valueLabel = Instance.new("TextLabel")
	valueLabel.Size = UDim2.fromOffset(60,20)
	valueLabel.Position = UDim2.new(1,-70,0,7)
	valueLabel.BackgroundTransparency = 1
	valueLabel.TextColor3 = CONFIG.Accent
	valueLabel.TextSize = 9
	valueLabel.Font = Enum.Font.Code
	valueLabel.TextXAlignment = Enum.TextXAlignment.Right
	valueLabel.Parent = frame

	local bar = Instance.new("Frame")
	bar.Size = UDim2.new(1,-20,0,6)
	bar.Position = UDim2.fromOffset(10,39)
	bar.BackgroundColor3 = Color3.fromRGB(35,45,48)
	bar.BorderSizePixel = 0
	bar.Parent = frame
	corner(bar,4)

	local alpha = math.clamp((value-min)/(max-min),0,1)

	local fill = Instance.new("Frame")
	fill.Size = UDim2.new(alpha,0,1,0)
	fill.BackgroundColor3 = CONFIG.Accent
	fill.BorderSizePixel = 0
	fill.Parent = bar
	corner(fill,4)

	local knob = Instance.new("Frame")
	knob.Size = UDim2.fromOffset(12,12)
	knob.AnchorPoint = Vector2.new(.5,.5)
	knob.Position = UDim2.new(alpha,0,.5,0)
	knob.BackgroundColor3 = lighten(CONFIG.Accent,.2)
	knob.BorderSizePixel = 0
	knob.Parent = bar
	corner(knob,6)

	local dragging = false

	local function setValue(v)
		v = math.clamp(v,min,max)
		local a = (v-min)/(max-min)

		valueLabel.Text = string.format("%.1f",v)
		fill.Size = UDim2.new(a,0,1,0)
		knob.Position = UDim2.new(a,0,.5,0)

		if callback then callback(v) end
	end

	local function update(input)
		local width = bar.AbsoluteSize.X
		if width <= 0 then return end

		local a = math.clamp(
			(input.Position.X-bar.AbsolutePosition.X)/width,
			0,1
		)

		setValue(min+(max-min)*a)
	end

	bar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			update(input)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and (
			input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch
		) then
			update(input)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)

	setValue(value)

	table.insert(SliderObjects,{
		Frame=frame,
		Stroke=frameStroke,
		Fill=fill,
		Knob=knob,
		Value=valueLabel
	})

	return frame
end

--==================================================
-- ESP
--==================================================

local ESPColorPresets = {
	Color3.fromRGB(0,255,220),
	Color3.fromRGB(255,60,80),
	Color3.fromRGB(80,170,255),
	Color3.fromRGB(120,255,50),
	Color3.fromRGB(255,205,60),
	Color3.fromRGB(210,210,255),
	Color3.fromRGB(255,255,255),
	Color3.fromRGB(180,80,255)
}

local function sameColor(a,b)
	return math.abs(a.R-b.R)<.01
		and math.abs(a.G-b.G)<.01
		and math.abs(a.B-b.B)<.01
end

local function createColorButton(parent,title,initialColor,y,callback)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1,-22,0,48)
	b.Position = UDim2.fromOffset(11,y)
	b.BackgroundColor3 = initialColor
	b.BorderSizePixel = 0
	b.Text = title
	b.TextColor3 = Color3.new(1,1,1)
	b.TextSize = 10
	b.Font = Enum.Font.GothamBlack
	b.AutoButtonColor = false
	b.Parent = parent
	corner(b,9)
	stroke(b,Color3.new(1,1,1),1,.35)

	local currentIndex = 1

	for i,color in ipairs(ESPColorPresets) do
		if sameColor(color,initialColor) then
			currentIndex = i
			break
		end
	end

	b.MouseButton1Click:Connect(function()
		currentIndex = currentIndex % #ESPColorPresets + 1

		local newColor = ESPColorPresets[currentIndex]
		b.BackgroundColor3 = newColor

		if callback then callback(newColor) end
	end)

	return b
end

local function destroyESPObject(obj)
	if not obj then return end

	for _,v in pairs(obj) do
		if typeof(v) == "Instance" then
			pcall(function()
				v:Destroy()
			end)
		end
	end
end

local function clearESP()
	for _,obj in pairs(ESPObjects) do
		destroyESPObject(obj)
	end
	table.clear(ESPObjects)
end

local function createESP(player)
	if player == Player then return end
	if not CONFIG.ESPEnabled then return end

	if ESPObjects[player] then
		destroyESPObject(ESPObjects[player])
		ESPObjects[player] = nil
	end

	local character = player.Character
	if not character then return end

	local root = character:FindFirstChild("HumanoidRootPart")
	if not root then return end

	local highlight = Instance.new("Highlight")
	highlight.Name = "NexusESP"
	highlight.Adornee = character
	highlight.FillColor = CONFIG.ESPFillColor
	highlight.OutlineColor = CONFIG.ESPOutlineColor
	highlight.FillTransparency = .75
	highlight.OutlineTransparency = .05
	highlight.Enabled = CONFIG.ESPBoxes
	highlight.Parent = character

	local gui = Instance.new("BillboardGui")
	gui.Name = "NexusESPInfo"
	gui.Size = UDim2.fromOffset(180,45)
	gui.StudsOffset = Vector3.new(0,3,0)
	gui.AlwaysOnTop = true
	gui.Adornee = root
	gui.Parent = root

	local label = Instance.new("TextLabel")
	label.Size = UDim2.fromScale(1,1)
	label.BackgroundTransparency = 1
	label.TextColor3 = CONFIG.ESPOutlineColor
	label.TextStrokeTransparency = .3
	label.Font = Enum.Font.GothamBold
	label.TextSize = 11
	label.Text = player.DisplayName
	label.Visible = CONFIG.ESPNames
	label.Parent = gui

	ESPObjects[player] = {
		Highlight=highlight,
		Billboard=gui,
		Label=label
	}
end

local function refreshESP()
	clearESP()

	if not CONFIG.ESPEnabled then return end

	for _,player in ipairs(Players:GetPlayers()) do
		createESP(player)
	end
end

createToggle(ESPPage,"// ESP","Highlights players in your own experience.",10,false,function(v)
	CONFIG.ESPEnabled = v
	refreshESP()
end)

createToggle(ESPPage,"// NAMES","Show player names above characters.",80,true,function(v)
	CONFIG.ESPNames = v
	for _,obj in pairs(ESPObjects) do
		if obj.Label then obj.Label.Visible = v end
	end
end)

createToggle(ESPPage,"// BOXES","Enable player highlight boxes.",150,true,function(v)
	CONFIG.ESPBoxes = v
	for _,obj in pairs(ESPObjects) do
		if obj.Highlight then obj.Highlight.Enabled = v end
	end
end)

createToggle(ESPPage,"// DISTANCE","Show player distance beside their name.",220,true,function(v)
	CONFIG.ESPDistance = v
end)

createSlider(ESPPage,"// MAX DISTANCE",50,1000,CONFIG.ESPMaxDistance,290,function(v)
	CONFIG.ESPMaxDistance = math.round(v)
end)

createColorButton(ESPPage,"🎨 ESP FILL COLOR",CONFIG.ESPFillColor,360,function(color)
	CONFIG.ESPFillColor = color

	for _,obj in pairs(ESPObjects) do
		if obj.Highlight then
			obj.Highlight.FillColor = color
		end
	end
end)

createColorButton(ESPPage,"🎨 ESP OUTLINE COLOR",CONFIG.ESPOutlineColor,415,function(color)
	CONFIG.ESPOutlineColor = color

	for _,obj in pairs(ESPObjects) do
		if obj.Highlight then
			obj.Highlight.OutlineColor = color
		end

		if obj.Label then
			obj.Label.TextColor3 = color
		end
	end
end)

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		task.wait(1)

		if CONFIG.ESPEnabled then
			createESP(player)
		end
	end)
end)

Players.PlayerRemoving:Connect(function(player)
	if ESPObjects[player] then
		destroyESPObject(ESPObjects[player])
	end

	ESPObjects[player] = nil
end)

--==================================================
-- COMBAT
--==================================================

card(
	CombatPage,
	"// TARGET LOCK",
	"Target-lock controls for your own experience.",
	10,
	65
)

createToggle(CombatPage,"// TARGET LOCK","Lock the camera toward the nearest valid target.",85,false,function(v)
	CONFIG.TargetLockEnabled = v
end)

createSlider(CombatPage,"// TARGET DISTANCE",25,1000,CONFIG.TargetLockDistance,155,function(v)
	CONFIG.TargetLockDistance = math.round(v)
end)

card(
	CombatPage,
	"// TARGET PART",
	"Current target part: "..CONFIG.TargetLockPart,
	225,
	60
)

createToggle(CombatPage,"// HITBOX EDITOR","Enable the local hitbox editor for your own game.",290,false,function(v)
	CONFIG.HitboxEnabled = v
end)

createSlider(CombatPage,"// HITBOX SIZE",1,20,CONFIG.HitboxSize,360,function(v)
	CONFIG.HitboxSize = math.round(v)
end)

createSlider(CombatPage,"// LOCAL FOV",50,120,CONFIG.FOV,430,function(v)
	CONFIG.FOV = math.round(v)
end)

createToggle(CombatPage,"// FOV CONTROL","Apply the configured camera field of view.",500,false,function(v)
	CONFIG.FOVEnabled = v
end)

local function getNearestTarget()
	local character = Player.Character
	local myRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not myRoot then return nil end

	local nearest
	local nearestDistance = CONFIG.TargetLockDistance

	for _,player in ipairs(Players:GetPlayers()) do
		if player ~= Player and player.Character then
			local root = player.Character:FindFirstChild(CONFIG.TargetLockPart)
			local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

			if root and humanoid and humanoid.Health > 0 then
				local distance = (root.Position-myRoot.Position).Magnitude

				if distance < nearestDistance then
					nearestDistance = distance
					nearest = player
				end
			end
		end
	end

	return nearest
end

--==================================================
-- SPEED
--==================================================

createSlider(SpeedPage,"// WALK SPEED",8,100,CONFIG.Speed,10,function(v)
	CONFIG.Speed = math.round(v)
end)

createToggle(SpeedPage,"// SPEED","Apply configured WalkSpeed.",78,false,function(v)
	CONFIG.SpeedEnabled = v
end)

createSlider(SpeedPage,"// SPRINT",16,100,CONFIG.SprintSpeed,148,function(v)
	CONFIG.SprintSpeed = math.round(v)
end)

createToggle(SpeedPage,"// SPRINT","Apply sprint movement.",216,false,function(v)
	CONFIG.SprintEnabled = v
end)

createSlider(SpeedPage,"// JUMP POWER",20,150,CONFIG.JumpPower,286,function(v)
	CONFIG.JumpPower = math.round(v)
end)

createToggle(SpeedPage,"// JUMP POWER","Apply configured jump power.",354,false,function(v)
	CONFIG.JumpEnabled = v
end)

createToggle(SpeedPage,"// HIGH JUMP","Extra jump power for your character.",424,false,function(v)
	CONFIG.HighJumpEnabled = v
end)

createToggle(SpeedPage,"// FLY","Local flight controller.",494,false,function(v)
	CONFIG.FlyEnabled = v
end)

createSlider(SpeedPage,"// FLY SPEED",10,150,CONFIG.FlySpeed,564,function(v)
	CONFIG.FlySpeed = math.round(v)
end)

createToggle(SpeedPage,"// SWIM MODE","Local underwater-style movement.",634,false,function(v)
	CONFIG.SwimEnabled = v
end)

createToggle(SpeedPage,"// BUNNY HOP","Automatically maintains jumping.",704,false,function(v)
	CONFIG.BunnyHopEnabled = v
end)

createToggle(SpeedPage,"// GHOST MODE","Disable local character collisions.",774,false,function(v)
	CONFIG.NoclipEnabled = v
end)

--==================================================
-- SLOTS
--==================================================

local SlotTitle = Instance.new("TextLabel")
SlotTitle.Size = UDim2.new(1,-22,0,30)
SlotTitle.Position = UDim2.fromOffset(11,10)
SlotTitle.BackgroundTransparency = 1
SlotTitle.Text = "// 15 COMMAND SLOTS"
SlotTitle.TextColor3 = Color3.fromRGB(240,255,255)
SlotTitle.TextSize = 16
SlotTitle.Font = Enum.Font.GothamBlack
SlotTitle.TextXAlignment = Enum.TextXAlignment.Left
SlotTitle.Parent = SlotsPage

local Search = Instance.new("TextBox")
Search.Size = UDim2.new(1,-22,0,38)
Search.Position = UDim2.fromOffset(11,45)
Search.BackgroundColor3 = Themes.Cyberpunk.Card
Search.BorderSizePixel = 0
Search.PlaceholderText = "🔎 Search commands..."
Search.PlaceholderColor3 = Color3.fromRGB(100,120,125)
Search.Text = ""
Search.TextColor3 = Color3.fromRGB(235,250,250)
Search.TextSize = 10
Search.Font = Enum.Font.Code
Search.ClearTextOnFocus = false
Search.Parent = SlotsPage
corner(Search,9)

local function commandNotify(text)
	local old = SlotTitle.Text
	SlotTitle.Text = "✓ "..text

	task.delay(1.3,function()
		if SlotTitle.Parent then
			SlotTitle.Text = old
		end
	end)
end

local Commands = {
	{Name="Fly",Icon="🪽",Action=function()
		CONFIG.FlyEnabled=not CONFIG.FlyEnabled
		commandNotify("FLY "..(CONFIG.FlyEnabled and "ON" or "OFF"))
	end},

	{Name="Swim",Icon="🌊",Action=function()
		CONFIG.SwimEnabled=not CONFIG.SwimEnabled
		commandNotify("SWIM "..(CONFIG.SwimEnabled and "ON" or "OFF"))
	end},

	{Name="High Jump",Icon="🦘",Action=function()
		CONFIG.HighJumpEnabled=not CONFIG.HighJumpEnabled
		commandNotify("HIGH JUMP "..(CONFIG.HighJumpEnabled and "ON" or "OFF"))
	end},

	{Name="Bunny Hop",Icon="🐇",Action=function()
		CONFIG.BunnyHopEnabled=not CONFIG.BunnyHopEnabled
		commandNotify("BUNNY HOP "..(CONFIG.BunnyHopEnabled and "ON" or "OFF"))
	end},

	{Name="ESP",Icon="👁️",Action=function()
		CONFIG.ESPEnabled=not CONFIG.ESPEnabled
		refreshESP()
		commandNotify("ESP "..(CONFIG.ESPEnabled and "ON" or "OFF"))
	end},

	{Name="Rainbow",Icon="🌈",Action=function()
		CONFIG.Rainbow=not CONFIG.Rainbow
		commandNotify("RAINBOW "..(CONFIG.Rainbow and "ON" or "OFF"))
	end},

	{Name="Speed Boost",Icon="⚡",Action=function()
		CONFIG.SpeedEnabled=true
		CONFIG.Speed=32
		commandNotify("SPEED BOOST ENABLED")
	end},

	{Name="Normal Speed",Icon="🚶",Action=function()
		CONFIG.SpeedEnabled=false
		CONFIG.SprintEnabled=false
		commandNotify("NORMAL SPEED")
	end},

	{Name="Gravity",Icon="🌍",Action=function()
		CONFIG.GravityEnabled=not CONFIG.GravityEnabled
		commandNotify("GRAVITY "..(CONFIG.GravityEnabled and "ON" or "OFF"))
	end},

	{Name="No Gravity",Icon="🪐",Action=function()
		CONFIG.GravityEnabled=true
		CONFIG.Gravity=0
		commandNotify("LOW GRAVITY")
	end},

	{Name="Crosshair",Icon="➕",Action=function()
		CONFIG.CrosshairEnabled=not CONFIG.CrosshairEnabled
		commandNotify("CROSSHAIR "..(CONFIG.CrosshairEnabled and "ON" or "OFF"))
	end},

	{Name="FOV Boost",Icon="🎥",Action=function()
		CONFIG.FOVEnabled=true
		CONFIG.FOV=100
		commandNotify("FOV BOOST")
	end},

	{Name="Target Lock",Icon="🎯",Action=function()
		CONFIG.TargetLockEnabled=not CONFIG.TargetLockEnabled
		commandNotify("TARGET LOCK "..(CONFIG.TargetLockEnabled and "ON" or "OFF"))
	end},

	{Name="Hitbox Editor",Icon="📦",Action=function()
		CONFIG.HitboxEnabled=not CONFIG.HitboxEnabled
		commandNotify("HITBOX EDITOR "..(CONFIG.HitboxEnabled and "ON" or "OFF"))
	end},

	{Name="Reset All",Icon="☠️",Action=function()
		CONFIG.SpeedEnabled=false
		CONFIG.SprintEnabled=false
		CONFIG.FlyEnabled=false
		CONFIG.SwimEnabled=false
		CONFIG.HighJumpEnabled=false
		CONFIG.BunnyHopEnabled=false
		CONFIG.NoclipEnabled=false
		CONFIG.GravityEnabled=false
		CONFIG.ESPEnabled=false
		CONFIG.CrosshairEnabled=false
		CONFIG.FOVEnabled=false
		CONFIG.Rainbow=false
		CONFIG.TargetLockEnabled=false
		CONFIG.HitboxEnabled=false
		refreshESP()
		commandNotify("ALL SYSTEMS RESET")
	end}
}

for i,command in ipairs(Commands) do
	local slot = Instance.new("TextButton")

	slot.Name = "Slot"..i
	slot.Size = UDim2.new(1,-22,0,48)
	slot.Position = UDim2.fromOffset(11,92+((i-1)*56))
	slot.BackgroundColor3 = Themes.Cyberpunk.Card
	slot.BorderSizePixel = 0
	slot.Text = command.Icon.."   "..command.Name
	slot.TextColor3 = Color3.fromRGB(235,250,250)
	slot.TextSize = 10
	slot.Font = Enum.Font.GothamBold
	slot.TextXAlignment = Enum.TextXAlignment.Left
	slot.AutoButtonColor = false
	slot.Parent = SlotsPage

	corner(slot,9)

	local pad = Instance.new("UIPadding")
	pad.PaddingLeft = UDim.new(0,15)
	pad.Parent = slot

	local slotStroke = stroke(slot,Color3.fromRGB(35,55,60),1)

	table.insert(SlotFrames,{
		Button=slot,
		Command=command,
		Stroke=slotStroke
	})

	slot.MouseButton1Click:Connect(command.Action)
end

Search:GetPropertyChangedSignal("Text"):Connect(function()
	local query = string.lower(Search.Text)
	local visibleIndex = 0

	for _,obj in ipairs(SlotFrames) do
		local name = string.lower(obj.Command.Name)
		local matches = query == "" or string.find(name,query,1,true) ~= nil

		obj.Button.Visible = matches

		if matches then
			obj.Button.Position = UDim2.fromOffset(
				11,
				92+(visibleIndex*56)
			)

			visibleIndex += 1
		end
	end
end)

--==================================================
-- SETTINGS
--==================================================

local SettingsTitle = Instance.new("TextLabel")
SettingsTitle.Size = UDim2.new(1,-22,0,30)
SettingsTitle.Position = UDim2.fromOffset(11,10)
SettingsTitle.BackgroundTransparency = 1
SettingsTitle.Text = "// SETTINGS"
SettingsTitle.TextColor3 = Color3.fromRGB(240,255,255)
SettingsTitle.TextSize = 16
SettingsTitle.Font = Enum.Font.GothamBlack
SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left
SettingsTitle.Parent = SettingsPage

createSlider(SettingsPage,"// UI SIZE",CONFIG.MinSize,CONFIG.MaxSize,CONFIG.Size,50,function(v)
	CONFIG.Size=v
	UIScale.Scale=v
end)

createSlider(SettingsPage,"// ANIMATION SPEED",.5,2,CONFIG.AnimationSpeed,118,function(v)
	CONFIG.AnimationSpeed=v
end)

createSlider(SettingsPage,"// TRANSPARENCY",0,.7,CONFIG.Transparency,186,function(v)
	CONFIG.Transparency=v
	Main.BackgroundTransparency=v
end)

local ThemeButton = Instance.new("TextButton")
ThemeButton.Size = UDim2.new(1,-22,0,45)
ThemeButton.Position = UDim2.fromOffset(11,254)
ThemeButton.BackgroundColor3 = Themes.Cyberpunk.Card
ThemeButton.Text = "🎨 THEME • CYBERPUNK"
ThemeButton.TextColor3 = CONFIG.Accent
ThemeButton.TextSize = 10
ThemeButton.Font = Enum.Font.GothamBlack
ThemeButton.AutoButtonColor = false
ThemeButton.Parent = SettingsPage
corner(ThemeButton,9)

local ThemeNames = {
	"Cyberpunk",
	"Vampire",
	"Robotic",
	"Toxic",
	"Fire",
	"Ocean",
	"Ghost",
	"Gold"
}

local ThemeIndex = 1

--==================================================
-- CROSSHAIR
--==================================================

local Crosshair = Instance.new("TextLabel")
Crosshair.Size = UDim2.fromOffset(40,40)
Crosshair.Position = UDim2.fromScale(.5,.5)
Crosshair.AnchorPoint = Vector2.new(.5,.5)
Crosshair.BackgroundTransparency = 1
Crosshair.Text = "+"
Crosshair.TextSize = CONFIG.CrosshairSize
Crosshair.Font = Enum.Font.GothamBlack
Crosshair.TextColor3 = CONFIG.Accent
Crosshair.Visible = false
Crosshair.Parent = Gui

--==================================================
-- FLOATING BUTTON
--==================================================

local Floating = Instance.new("TextButton")
Floating.Size = UDim2.fromOffset(52,52)
Floating.Position = UDim2.fromScale(.08,.5)
Floating.AnchorPoint = Vector2.new(.5,.5)
Floating.BackgroundColor3 = Themes.Cyberpunk.Background
Floating.Text = "☠"
Floating.TextSize = 21
Floating.TextColor3 = CONFIG.Accent
Floating.Font = Enum.Font.GothamBlack
Floating.Visible = false
Floating.AutoButtonColor = false
Floating.Parent = Gui
corner(Floating,26)

local FloatingStroke = stroke(Floating,CONFIG.Accent,2)

--==================================================
-- DRAGGING
--==================================================

local function makeDraggable(handle,target)
	local dragging = false
	local start
	local startPos

	handle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then

			dragging = true
			start = input.Position
			startPos = target.Position
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if not dragging then return end

		if input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch then

			local delta = input.Position-start

			target.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset+delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset+delta.Y
			)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
end

makeDraggable(Top,Main)
makeDraggable(Floating,Floating)

--==================================================
-- THEME
--==================================================

local FloatingLocked = false

local function applyTheme(name)
	local theme = Themes[name]
	if not theme then return end

	CONFIG.Theme=name
	CONFIG.Accent=theme.Accent

	ThemeButton.Text="🎨 THEME • "..string.upper(name)

	Logo.Text=theme.Logo
	Minimize.Text=theme.Logo
	Floating.Text=theme.Logo

	Main.BackgroundColor3=theme.Background
	Top.BackgroundColor3=theme.Top
	TopCover.BackgroundColor3=theme.Top
	Sidebar.BackgroundColor3=theme.Sidebar

	MainStroke.Color=theme.Accent
	MinStroke.Color=theme.Accent
	TopLine.BackgroundColor3=theme.Accent
	SidebarLine.BackgroundColor3=theme.Accent

	Logo.TextColor3=theme.Accent
	Minimize.TextColor3=theme.Accent
	Crosshair.TextColor3=theme.Accent
	ThemeButton.TextColor3=lighten(theme.Accent,.18)

	ProfileCard.BackgroundColor3=theme.Card
	MadeBy.TextColor3=theme.Accent
	DiscordButton.BackgroundColor3=theme.Card
	DiscordButton.TextColor3=theme.Accent
	Search.BackgroundColor3=theme.Card

	for _,obj in ipairs(CardObjects) do
		if obj.Frame and obj.Frame.Parent then
			obj.Frame.BackgroundColor3=theme.Card
		end
	end

	for _,obj in ipairs(SliderObjects) do
		if obj.Frame then
			obj.Frame.BackgroundColor3=theme.Card
		end

		if obj.Fill then
			obj.Fill.BackgroundColor3=theme.Accent
		end

		if obj.Knob then
			obj.Knob.BackgroundColor3=lighten(theme.Accent,.2)
		end

		if obj.Value then
			obj.Value.TextColor3=lighten(theme.Accent,.18)
		end
	end

	for _,obj in ipairs(ToggleObjects) do
		if obj.Button then
			obj.Button.BackgroundColor3=theme.Card
		end

		if obj.State and obj.State.Text=="ON" then
			obj.State.BackgroundColor3=theme.Accent
		end
	end

	for _,obj in ipairs(SlotFrames) do
		obj.Button.BackgroundColor3=theme.Card
	end

	if not FloatingLocked then
		Floating.BackgroundColor3=theme.Background
		Floating.TextColor3=theme.Accent
		FloatingStroke.Color=theme.Accent
	end

	refreshTabs(CurrentPage)
end

ThemeButton.MouseButton1Click:Connect(function()
	ThemeIndex=ThemeIndex%#ThemeNames+1
	applyTheme(ThemeNames[ThemeIndex])
end)

--==================================================
-- 3 SECOND FLOATING BUTTON LOCK
--==================================================

local HoldingFloating = false
local HoldStarted = 0
local HoldDuration = 3

local function updateFloatingLock()
	if FloatingLocked then
		Floating.BackgroundColor3=Color3.fromRGB(45,10,15)
		Floating.TextColor3=Color3.fromRGB(255,40,55)
		FloatingStroke.Color=Color3.fromRGB(255,40,55)
	else
		local theme=Themes[CONFIG.Theme]
		Floating.BackgroundColor3=theme.Background
		Floating.TextColor3=CONFIG.Accent
		FloatingStroke.Color=CONFIG.Accent
	end
end

local function beginFloatingHold()
	if HoldingFloating then return end

	HoldingFloating=true
	HoldStarted=os.clock()

	task.spawn(function()
		while HoldingFloating do
			if os.clock()-HoldStarted >= HoldDuration then
				HoldingFloating=false
				FloatingLocked=not FloatingLocked
				updateFloatingLock()

				if FloatingLocked then
					Floating.Text="🔒"
				else
					Floating.Text=Themes[CONFIG.Theme].Logo
				end

				break
			end

			task.wait(.05)
		end
	end)
end

local function endFloatingHold()
	HoldingFloating=false
end

Floating.InputBegan:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseButton1
		or input.UserInputType==Enum.UserInputType.Touch then

		beginFloatingHold()
	end
end)

Floating.InputEnded:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseButton1
		or input.UserInputType==Enum.UserInputType.Touch then

		endFloatingHold()
	end
end)

--==================================================
-- RAINBOW
--==================================================

local hue=0

--==================================================
-- MINIMIZE / OPEN
--==================================================

local minimized=false

Minimize.MouseButton1Click:Connect(function()
	if FloatingLocked or minimized then return end

	minimized=true

	tween(
		Main,
		.3,
		{
			Size=UDim2.fromOffset(55,55),
			BackgroundTransparency=1
		},
		Enum.EasingStyle.Back,
		Enum.EasingDirection.In
	)

	task.wait(.22)

	Main.Visible=false
	Main.BackgroundTransparency=CONFIG.Transparency

	Floating.Visible=true
	Floating.Size=UDim2.fromOffset(0,0)

	tween(
		Floating,
		.3,
		{Size=UDim2.fromOffset(52,52)},
		Enum.EasingStyle.Back
	)
end)

Floating.MouseButton1Click:Connect(function()
	if FloatingLocked then return end

	Floating.Visible=false
	Main.Visible=true

	Main.Size=UDim2.fromOffset(55,55)

	tween(
		Main,
		.45,
		{
			Size=UDim2.fromOffset(560,380),
			BackgroundTransparency=CONFIG.Transparency
		},
		Enum.EasingStyle.Back
	)

	minimized=false
end)

--==================================================
-- FLY
--==================================================

local FlyConnection

local function stopFly()
	if FlyConnection then
		FlyConnection:Disconnect()
		FlyConnection=nil
	end

	local character=Player.Character
	local root=character and character:FindFirstChild("HumanoidRootPart")

	if root then
		root.AssemblyLinearVelocity=Vector3.new(
			0,
			root.AssemblyLinearVelocity.Y,
			0
		)
	end
end

local function startFly()
	if FlyConnection then return end

	FlyConnection=RunService.RenderStepped:Connect(function()
		if not CONFIG.FlyEnabled then return end

		local character=Player.Character
		local root=character and character:FindFirstChild("HumanoidRootPart")
		local camera=workspace.CurrentCamera

		if not root or not camera then return end

		local direction=Vector3.zero

		if UserInputService:IsKeyDown(Enum.KeyCode.W) then
			direction+=camera.CFrame.LookVector
		end

		if UserInputService:IsKeyDown(Enum.KeyCode.S) then
			direction-=camera.CFrame.LookVector
		end

		if UserInputService:IsKeyDown(Enum.KeyCode.A) then
			direction-=camera.CFrame.RightVector
		end

		if UserInputService:IsKeyDown(Enum.KeyCode.D) then
			direction+=camera.CFrame.RightVector
		end

		if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
			direction+=Vector3.yAxis
		end

		if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
			direction-=Vector3.yAxis
		end

		if direction.Magnitude>0 then
			root.AssemblyLinearVelocity=direction.Unit*CONFIG.FlySpeed
		else
			root.AssemblyLinearVelocity=Vector3.zero
		end
	end)
end

--==================================================
-- MAIN LOOP
--==================================================

RunService.RenderStepped:Connect(function(dt)

	-- RAINBOW
	if CONFIG.Rainbow then
		hue=(hue+dt*CONFIG.RainbowSpeed)%1

		local c=Color3.fromHSV(hue,.9,1)

		MainStroke.Color=c
		Logo.TextColor3=c
		Minimize.TextColor3=c
		MinStroke.Color=c
		TopLine.BackgroundColor3=c
		SidebarLine.BackgroundColor3=c
		Crosshair.TextColor3=c

		if not FloatingLocked then
			FloatingStroke.Color=c
			Floating.TextColor3=c
		end

		for _,obj in ipairs(SliderObjects) do
			if obj.Fill then obj.Fill.BackgroundColor3=c end
			if obj.Knob then obj.Knob.BackgroundColor3=c end
			if obj.Value then obj.Value.TextColor3=c end
		end
	else
		local theme=Themes[CONFIG.Theme]

		MainStroke.Color=theme.Accent
		TopLine.BackgroundColor3=theme.Accent
		SidebarLine.BackgroundColor3=theme.Accent

		if not FloatingLocked then
			FloatingStroke.Color=theme.Accent
			Floating.TextColor3=theme.Accent
		end
	end

	-- CHARACTER
	local character=Player.Character
	local humanoid=character and character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		if CONFIG.SprintEnabled then
			humanoid.WalkSpeed=CONFIG.SprintSpeed
		elseif CONFIG.SpeedEnabled then
			humanoid.WalkSpeed=CONFIG.Speed
		else
			humanoid.WalkSpeed=16
		end

		if CONFIG.JumpEnabled then
			humanoid.UseJumpPower=true
			humanoid.JumpPower=CONFIG.JumpPower
		elseif CONFIG.HighJumpEnabled then
			humanoid.UseJumpPower=true
			humanoid.JumpPower=CONFIG.HighJumpPower
		else
			humanoid.UseJumpPower=true
			humanoid.JumpPower=50
		end

		if CONFIG.BunnyHopEnabled then
			humanoid.Jump=true
		end
	end

	-- FLY
	if CONFIG.FlyEnabled then
		if not FlyConnection then
			startFly()
		end
	else
		if FlyConnection then
			stopFly()
		end
	end

	-- NOCLIP
	if character then
		for _,part in ipairs(character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide=not CONFIG.NoclipEnabled
			end
		end
	end

	-- GRAVITY
	if CONFIG.GravityEnabled then
		workspace.Gravity=CONFIG.Gravity
	else
		workspace.Gravity=DefaultGravity
	end

	-- FOV
	local camera=workspace.CurrentCamera

	if camera then
		if CONFIG.FOVEnabled then
			camera.FieldOfView=CONFIG.FOV
		else
			camera.FieldOfView=DefaultFOV
		end
	end

	-- CROSSHAIR
	Crosshair.Visible=CONFIG.CrosshairEnabled
	Crosshair.TextSize=CONFIG.CrosshairSize

	-- TARGET LOCK
	if CONFIG.TargetLockEnabled and camera then
		local target=getNearestTarget()

		if target and target.Character then
			local targetPart=target.Character:FindFirstChild(CONFIG.TargetLockPart)

			if targetPart then
				camera.CFrame=CFrame.lookAt(
					camera.CFrame.Position,
					targetPart.Position
				)
			end
		end
	end

	-- ESP DISTANCE
	if CONFIG.ESPEnabled then
		local myCharacter=Player.Character
		local myRoot=myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")

		if myRoot then
			for player,obj in pairs(ESPObjects) do
				local character2=player.Character
				local root=character2 and character2:FindFirstChild("HumanoidRootPart")

				if root and obj.Label and obj.Billboard then
					local distance=(root.Position-myRoot.Position).Magnitude

					if distance<=CONFIG.ESPMaxDistance then
						obj.Billboard.Enabled=true

						if CONFIG.ESPDistance then
							obj.Label.Text=
								player.DisplayName..
								"  ["..
								math.round(distance)..
								"m]"
						else
							obj.Label.Text=player.DisplayName
						end
					else
						obj.Billboard.Enabled=false
					end
				end
			end
		end
	end

	-- LOCAL HITBOX EDITOR
	if CONFIG.HitboxEnabled then
		for _,player in ipairs(Players:GetPlayers()) do
			if player~=Player and player.Character then
				local root=player.Character:FindFirstChild("HumanoidRootPart")

				if root then
					root.Size=Vector3.new(
						CONFIG.HitboxSize,
						CONFIG.HitboxSize,
						CONFIG.HitboxSize
					)
				end
			end
		end
	end
end)

--==================================================
-- RESPAWN
--==================================================

Player.CharacterAdded:Connect(function()
	task.wait(.5)

	if CONFIG.FlyEnabled then
		startFly()
	end

	if CONFIG.ESPEnabled then
		refreshESP()
	end
end)

--==================================================
-- INITIALIZE
--==================================================

applyTheme("Cyberpunk")

Main.BackgroundTransparency=CONFIG.Transparency

print("☠ NEXUS V6.5 COMPLETE UI LOADED")
