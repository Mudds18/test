-- ==============================================
-- NEXUS:RT ULTIMATE | QUANTUM ONYX EDITION
-- FULL UI REMAKE · SMOOTH EVERYTHING
-- ORIGINAL LOGIC 100% UNCHANGED
-- ==============================================

-- ==============================================
-- SAFETY INIT
-- ==============================================
pcall(function() if getgenv().NEXUS_MAIN_UI then getgenv().NEXUS_MAIN_UI:Destroy() end end)
pcall(function() if getgenv().NEXUS_KEY_UI then getgenv().NEXUS_KEY_UI:Destroy() end end)
getgenv().NEXUS_MAIN_UI = nil
getgenv().NEXUS_KEY_UI = nil
getgenv().NEXUS_SHUTDOWN = false

-- ==============================================
-- SERVICES
-- ==============================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 15) or LocalPlayer.PlayerGui
local Camera = workspace.CurrentCamera

-- ==============================================
-- 🎨 QUANTUM ONYX STYLE THEME
-- ==============================================
local THEME = {
    BG = Color3.fromHex("#121217"),
    PANEL = Color3.fromHex("#1A1A22"),
    CARD = Color3.fromHex("#21212B"),
    ACCENT = Color3.fromHex("#A855F7"),
    ACCENT_DARK = Color3.fromHex("#7C3AED"),
    GLOW = Color3.fromHex("#C084FC"),
    TEXT = Color3.fromHex("#E4E4E7"),
    TEXT_MUTED = Color3.fromHex("#71717A"),
    BORDER = Color3.fromHex("#27272A"),
    SUCCESS = Color3.fromHex("#10B981"),
    ERROR = Color3.fromHex("#EF4444")
}

-- ==============================================
-- 🎞️ SMOOTH ANIMATION PRESETS
-- ==============================================
local ANIM = {
    INSTANT = TweenInfo.new(0),
    FAST = TweenInfo.new(0.12, Enum.EasingStyle.Quad),
    NORMAL = TweenInfo.new(0.22, Enum.EasingStyle.Cubic),
    SMOOTH = TweenInfo.new(0.35, Enum.EasingStyle.Cubic),
    POP = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    BOUNCE = TweenInfo.new(0.1, Enum.EasingStyle.Quad),
    PULSE = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
}

-- Universal Safe Tween
local function Tween(Object, Info, Props, OnComplete)
    if not Object or not Object.Parent then return end
    local T = TweenService:Create(Object, Info, Props)
    T:Play()
    if OnComplete then T.Completed:Connect(function() if Object and Object.Parent then OnComplete() end end) end
    return T
end

-- Safe UIStroke
local function AddStroke(Parent, Props)
    local S = Instance.new("UIStroke")
    for K,V in pairs(Props or {}) do S[K] = V end
    pcall(function() S.Parent = Parent end)
    return S
end

-- ==============================================
-- ORIGINAL CONFIG (UNCHANGED)
-- ==============================================
local CORRECT_KEY = "nexus"
local ACCESS_DURATION = 86400
local SAVE_FILE = "nx_auth_"..LocalPlayer.UserId..".dat"
local GENVAR_KEY = "_NX_AUTH_"..LocalPlayer.UserId

local RUN_LOCAL_SCRIPT = function()
    pcall(function()
        local OriginalUI = getgenv().NEXUS_MAIN_UI
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mudds18/test/refs/heads/main/NexusLocal.lua", true))()
        task.wait(0.6)
        if OriginalUI and OriginalUI.Parent then getgenv().NEXUS_MAIN_UI = OriginalUI end
    end)
end

local RUN_REMOTE_SCRIPT = function()
    pcall(function()
        local OriginalUI = getgenv().NEXUS_MAIN_UI
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mudds18/test/refs/heads/main/Nexus-terminal.lua", true))()
        task.wait(0.6)
        if OriginalUI and OriginalUI.Parent then getgenv().NEXUS_MAIN_UI = OriginalUI end
    end)
end

-- GAME LIST (UNCHANGED)
local GAME_LIST = {
    {Name = "Blox Fruits",             Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua"))() ]]},
    {Name = "Bedwars",                 Load = [[ loadstring(game:HttpGet("https://files.vapevoidware.xyz/VapeVoidware/VW-Add/main/loader.lua", true))() ]]},
    {Name = "Pet Simulator 99",        Load = [[ loadstring(game:HttpGet('https://zaphub.xyz/Exec'))() ]]},
    {Name = "Doors",                   Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/gamingscripter/darkrai-x/main/games/doors"))() ]]},
    {Name = "Murder Mystery 2",        Load = [[ loadstring(game:HttpGet("https://globalexp.xyz/",true))() ]]},
    {Name = "Arsenal",                 Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/Pushok3/Arsenal-Script/refs/heads/main/ArsenalScript.lua",true))() ]]},
    {Name = "Rivals",                  Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/ByNami/RIVALS/main/RIVALS.lua",true))() ]]},
    {Name = "Jujutsu Kaisen",          Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript",true))() ]]},
    {Name = "Sols RNG",                Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/hyuki36/Sols-Rng/refs/heads/main/solsrng.txt",true))() ]]},
    {Name = "Grow Garden",             Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/defnotry/devry-hub/refs/heads/main/loader.lua",true))() ]]},
    {Name = "Blade Ball",              Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/joshhhie/rise/refs/heads/main/loader.lua",true))() ]]},
    {Name = "Bloxflip",                Load = [[ loadstring(game:HttpGet("PASTE BLOXFLIP LINK HERE",true))() ]]},
    {Name = "Anime Defenders",         Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/JonnyCheeser/rbw4/main/JonnyCheeseHub",true))() ]]},
    {Name = "Anime Last Stand",        Load = [[ loadstring(game:HttpGet("https://byorlofficial.live/Loader",true))() ]]},
    {Name = "Demonfall",               Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/Med99020/xor-hub/refs/heads/main/main.lua",true))() ]]},
    {Name = "Project Slayers",         Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/rugveddanej/LunaHub/master/loader",true))() ]]},
    {Name = "Deepwoken",               Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/bROuh2/Ghost-util/refs/heads/main/ghost.lua",true))() ]]},
    {Name = "Type Soul",               Load = [[ loadstring(game:HttpGet("https://pastefy.app/mDKOcI2O/raw",true))() ]]},
    {Name = "Untitled Boxing Game",    Load = [[ loadstring(game:HttpGet("https://pastebin.com/raw/RNhiXimN",true))() ]]},
    {Name = "Strongest Battlegrounds", Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/CombatGUI/refs/heads/main/TSBCombatGUI",true))() ]]},
    {Name = "Brookhaven RP",           Load = [[ loadstring(game:HttpGet("https://pastebin.com/raw/jXSbAJ0w",true))() ]]},
    {Name = "Adopt Me",                Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/piro8706/Scriptfarmer/refs/heads/main/Daldiya.lua",true))() ]]},
    {Name = "Piggy",                   Load = [[ loadstring(game:HttpGet("https://rawscripts.net/raw/Piggy-open-source-15390",true))() ]]},
    {Name = "Natural Disaster",        Load = [[ loadstring(game:HttpGet("PASTE NDS LINK HERE",true))() ]]},
    {Name = "Tower Defense Sim",       Load = [[ loadstring(game:HttpGet("PASTE TDS LINK HERE",true))() ]]},
    {Name = "All Star TD",             Load = [[ loadstring(game:HttpGet("PASTE ASTD LINK HERE",true))() ]]},
    {Name = "King Legacy",             Load = [[ loadstring(game:HttpGet("https://pastefy.app/hdssLGmt/raw",true))() ]]},
    {Name = "Grand Piece Online",      Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/dilleron964/Grand-Piece-Online/main/Grand-Piece-Online.lua",true))() ]]},
    {Name = "Fisch",                   Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/library",true))() ]]},
    {Name = "Lumber Tycoon 2",         Load = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/Bliqe/Upload/refs/heads/main/Games/LT2/5745347462.lua",true))() ]]}
}

-- ==============================================
-- AUTH SYSTEM (UNCHANGED)
-- ==============================================
local HAS_FILE_API = pcall(function() return isfile and readfile and writefile and delfile end)

local function SaveAuth(Timestamp)
    pcall(function()
        getgenv()[GENVAR_KEY] = Timestamp
        PlayerGui:SetAttribute(GENVAR_KEY, Timestamp)
        if HAS_FILE_API then writefile(SAVE_FILE, tostring(Timestamp)) end
    end)
end

local function LoadAuth()
    return pcall(function()
        if getgenv()[GENVAR_KEY] then return tonumber(getgenv()[GENVAR_KEY]) end
        if PlayerGui:GetAttribute(GENVAR_KEY) then return tonumber(PlayerGui:GetAttribute(GENVAR_KEY)) end
        if HAS_FILE_API and isfile(SAVE_FILE) then return tonumber(readfile(SAVE_FILE)) end
        return nil
    end) and (getgenv()[GENVAR_KEY] or PlayerGui:GetAttribute(GENVAR_KEY) or (HAS_FILE_API and isfile(SAVE_FILE) and readfile(SAVE_FILE)) or nil)
end

local function ClearAuth()
    pcall(function()
        getgenv()[GENVAR_KEY] = nil
        PlayerGui:SetAttribute(GENVAR_KEY, nil)
        if HAS_FILE_API and isfile(SAVE_FILE) then delfile(SAVE_FILE) end
    end)
end

local function CheckAuth()
    local StartTime = LoadAuth()
    if not StartTime then return false, 0 end
    local TimeLeft = (StartTime + ACCESS_DURATION) - os.time()
    if TimeLeft > 0 then return true, TimeLeft end
    ClearAuth()
    return false, 0
end

-- ==============================================
-- NOTIFICATION SYSTEM
-- ==============================================
local function Notify(Message, Color)
    Color = Color or THEME.SUCCESS
    pcall(function()
        local Container = getgenv().NEXUS_NOTIF or Instance.new("Frame")
        if not getgenv().NEXUS_NOTIF then
            Container.Name = "NexusNotifContainer"
            Container.BackgroundTransparency = 1
            Container.Size = UDim2.new(0, 260, 1, -40)
            Container.Position = UDim2.new(1, -20, 0, 20)
            Container.AnchorPoint = Vector2.new(1, 0)
            Container.Parent = PlayerGui
            local Layout = Instance.new("UIListLayout")
            Layout.Padding = UDim.new(0, 8)
            Layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
            Layout.VerticalAlignment = Enum.VerticalAlignment.Top
            Layout.Parent = Container
            getgenv().NEXUS_NOTIF = Container
        end

        local Notif = Instance.new("Frame")
        Notif.Size = UDim2.new(1, 0, 0, 44)
        Notif.Position = UDim2.new(1.3, 0, 0, 0)
        Notif.BackgroundColor3 = THEME.PANEL
        Notif.BackgroundTransparency = 0.2
        Notif.Parent = Container
        Instance.new("UICorner", Notif).CornerRadius = UDim.new(0, 10)
        AddStroke(Notif, {Thickness = 1.5, Color = Color, Transparency = 0.3})

        local Text = Instance.new("TextLabel")
        Text.Size = UDim2.new(1, -24, 1, 0)
        Text.Position = UDim2.new(0, 12, 0, 0)
        Text.BackgroundTransparency = 1
        Text.Text = Message
        Text.Font = Enum.Font.GothamBold
        Text.TextSize = 12
        Text.TextColor3 = THEME.TEXT
        Text.Parent = Notif

        Notif.Parent = Container
        Tween(Notif, ANIM.POP, {Position = UDim2.new(0, 0, 0, 0)})

        task.delay(3.5, function()
            Tween(Notif, ANIM.NORMAL, {Position = UDim2.new(1.3, 0, 0, 0), Transparency = 1}, function()
                pcall(function() Notif:Destroy() end)
            end)
        end)
    end)
end

-- ==============================================
-- GLOBAL STATE
-- ==============================================
getgenv().NX = {
    Open = false,
    TimeEnd = nil,
    Theme = "DEFAULT",
    Combat = {ESP = false, Aimbot = false, Speed = 0}
}
local NX = getgenv().NX

-- ==============================================
-- COMBAT FEATURES (UNCHANGED)
-- ==============================================
local function ToggleESP(State)
    NX.Combat.ESP = State
    pcall(function() if NX.ESPCon then NX.ESPCon:Disconnect() end end)
    pcall(function()
        for _, D in pairs(workspace:GetDescendants()) do
            if D:IsA("BillboardGui") and D.Name == "NexusESP" then D:Destroy() end
        end
    end)
    if not State then return end

    NX.ESPCon = RunService.RenderStepped:Connect(function()
        if getgenv().NEXUS_SHUTDOWN then return end
        pcall(function()
            for _, P in pairs(Players:GetPlayers()) do
                if P == LocalPlayer or not P.Character then continue end
                local Char = P.Character
                local Root = Char:FindFirstChild("HumanoidRootPart")
                local Hum = Char:FindFirstChildOfClass("Humanoid")
                if not Root or not Hum or Hum.Health <= 0 then continue end

                local ESP = Root:FindFirstChild("NexusESP") or Instance.new("BillboardGui")
                ESP.Name = "NexusESP"
                ESP.AlwaysOnTop = true
                ESP.MaxDistance = 1200
                ESP.Size = UDim2.new(3,0,5,0)
                ESP.Parent = Root

                local Box = ESP:FindFirstChild("Frame") or Instance.new("Frame")
                Box.Size = UDim2.new(1,0,1,0)
                Box.BackgroundTransparency = 0.9
                Box.BackgroundColor3 = THEME.ACCENT
                Box.Parent = ESP
                AddStroke(Box, {Thickness = 1.5, Color = THEME.GLOW})

                local NameLab = ESP:FindFirstChild("Name") or Instance.new("TextLabel")
                NameLab.Size = UDim2.new(1,0,0,14)
                NameLab.Position = UDim2.new(0,0,0,-18)
                NameLab.BackgroundTransparency = 1
                NameLab.Text = P.Name
                NameLab.Font = Enum.Font.GothamBold
                NameLab.TextSize = 11
                NameLab.TextColor3 = THEME.TEXT
                NameLab.Parent = ESP

                local HPLab = ESP:FindFirstChild("HP") or Instance.new("TextLabel")
                HPLab.Size = UDim2.new(1,0,0,12)
                HPLab.Position = UDim2.new(0,0,0,2)
                HPLab.BackgroundTransparency = 1
                HPLab.Font = Enum.Font.Gotham
                HPLab.TextSize = 9
                HPLab.Parent = ESP
                HPLab.Text = math.floor(Hum.Health).."/"..math.floor(Hum.MaxHealth)
                HPLab.TextColor3 = Hum.Health > Hum.MaxHealth*0.3 and THEME.SUCCESS or THEME.ERROR
            end
        end)
    end)
end

local function ToggleAimbot(State)
    NX.Combat.Aimbot = State
    pcall(function() if NX.AimCon then NX.AimCon:Disconnect() end end)
    if not State then return end

    NX.AimCon = RunService.RenderStepped:Connect(function()
        if getgenv().NEXUS_SHUTDOWN or not UserInputService:IsMouseButtonPressed(Enum.MouseButton.Right) then return end
        pcall(function()
            local Closest, Dist = nil, 300
            local MousePos = UserInputService:GetMouseLocation()
            for _, P in pairs(Players:GetPlayers()) do
                if P == LocalPlayer or not P.Character then continue end
                local Char = P.Character
                local Head = Char:FindFirstChild("Head") or Char:FindFirstChild("HumanoidRootPart")
                local Hum = Char:FindFirstChildOfClass("Humanoid")
                if not Head or not Hum or Hum.Health <= 0 then continue end

                local Pos, OnScreen = Camera:WorldToViewportPoint(Head.Position + Vector3.new(0,0.6,0))
                if not OnScreen or Pos.Z < 0 then continue end
                local D = (Vector2.new(Pos.X, Pos.Y) - MousePos).Magnitude
                if D < Dist then Dist = D Closest = Head end
            end
            if Closest then
                Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, Closest.Position + Vector3.new(0,0.6,0)), 0.18)
            end
        end)
    end)
end

local function SetSpeed(Value)
    NX.Combat.Speed = tonumber(Value) or 0
    pcall(function() if NX.SpeedCon then NX.SpeedCon:Disconnect() end end)
    if NX.Combat.Speed <= 0 then return end

    NX.SpeedCon = RunService.RenderStepped:Connect(function()
        if getgenv().NEXUS_SHUTDOWN or not LocalPlayer.Character then return end
        pcall(function()
            local Hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if Hum then Hum.WalkSpeed = NX.Combat.Speed end
        end)
    end)
end

-- ==============================================
-- 🎨 QUANTUM STYLE BUTTON BUILDER
-- ==============================================
local function MakeButton(Parent, Text, Color, Pos, Size, Callback)
    local Button = Instance.new("TextButton")
    Button.Size = Size or UDim2.new(0.9, 0, 0, 42)
    Button.Position = Pos
    Button.BackgroundColor3 = THEME.CARD
    Button.BackgroundTransparency = 0.15
    Button.Text = Text
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 12
    Button.TextColor3 = Color or THEME.TEXT
    Button.AutoButtonColor = false
    Button.ClipsDescendants = true
    Button.Parent = Parent

    Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 8)
    local Stroke = AddStroke(Button, {Thickness = 1.2, Color = THEME.BORDER, Transparency = 0.4})

    local DefaultSize = Button.Size
    local DefaultPos = Button.Position

    -- HOVER ANIMATION
    Button.MouseEnter:Connect(function()
        Tween(Button, ANIM.FAST, {BackgroundTransparency = 0, Position = DefaultPos + UDim2.new(0, 0, 0, -2)})
        Tween(Stroke, ANIM.FAST, {Color = THEME.ACCENT, Transparency = 0})
    end)
    Button.MouseLeave:Connect(function()
        Tween(Button, ANIM.FAST, {BackgroundTransparency = 0.15, Position = DefaultPos})
        Tween(Stroke, ANIM.FAST, {Color = THEME.BORDER, Transparency = 0.4})
    end)

    -- CLICK BOUNCE
    if Callback then
        Button.MouseButton1Click:Connect(function()
            Tween(Button, ANIM.BOUNCE, {
                Size = UDim2.new(
                    DefaultSize.X.Scale*0.96, DefaultSize.X.Offset*0.96,
                    DefaultSize.Y.Scale*0.96, DefaultSize.Y.Offset*0.96
                )
            }, function()
                Tween(Button, ANIM.POP, {Size = DefaultSize})
            end)
            pcall(Callback)
        end)
    end

    return Button, Stroke
end

-- ==============================================
-- 📱 FULL MAIN UI BUILDER
-- ==============================================
local function BuildMainUI()
    pcall(function() if getgenv().NEXUS_MAIN_UI then getgenv().NEXUS_MAIN_UI:Destroy() end end)

    local Screen = Instance.new("ScreenGui")
    Screen.Name = "NexusMainUI"
    Screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Screen.DisplayOrder = 100
    Screen.ResetOnSpawn = false
    Screen.Parent = PlayerGui
    getgenv().NEXUS_MAIN_UI = Screen

    -- TOGGLE BUTTON
    local Toggle = Instance.new("TextButton")
    Toggle.Size = UDim2.new(0, 52, 0, 52)
    Toggle.Position = UDim2.new(0.92, 0, 0.07, 0)
    Toggle.BackgroundColor3 = THEME.PANEL
    Toggle.Text = ""
    Toggle.AutoButtonColor = false
    Toggle.Active = true
    Toggle.Draggable = true
    Toggle.Parent = Screen
    Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 12)
    AddStroke(Toggle, {Thickness = 1.8, Color = THEME.ACCENT})
    local ToggleIcon = Instance.new("ImageLabel")
    ToggleIcon.Size = UDim2.new(0, 28, 0, 28)
    ToggleIcon.Position = UDim2.new(0.5, -14, 0.5, -14)
    ToggleIcon.BackgroundTransparency = 1
    ToggleIcon.Image = "rbxassetid://15496694259"
    ToggleIcon.ImageColor3 = THEME.ACCENT
    ToggleIcon.Parent = Toggle

    -- MAIN WINDOW
    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 440, 0, 420)
    Main.Position = UDim2.new(0.5, -220, 0.5, -210)
    Main.BackgroundColor3 = THEME.BG
    Main.Active = true
    Main.Draggable = true
    Main.ClipsDescendants = true
    Main.Visible = false
    Main.Parent = Screen
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 16)
    AddStroke(Main, {Thickness = 2, Color = THEME.ACCENT, Transparency = 0.3})

    -- HEADER
    local Header = Instance.new("Frame")
    Header.Size = UDim2.new(1, -24, 0, 56)
    Header.Position = UDim2.new(0, 12, 0, 8)
    Header.BackgroundTransparency = 1
    Header.Parent = Main

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(0.6, 0, 0, 32)
    Title.Position = UDim2.new(0,0,0,0)
    Title.BackgroundTransparency = 1
    Title.Text = "NEXUS:RT"
    Title.Font = Enum.Font.FredokaOne
    Title.TextSize = 26
    Title.TextColor3 = THEME.ACCENT
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Header

    local SubTitle = Instance.new("TextLabel")
    SubTitle.Size = UDim2.new(0.6,0,0,14)
    SubTitle.Position = UDim2.new(0,0,0,30)
    SubTitle.BackgroundTransparency = 1
    SubTitle.Text = "ULTIMATE EDITION"
    SubTitle.Font = Enum.Font.GothamBold
    SubTitle.TextSize = 10
    SubTitle.TextColor3 = THEME.TEXT_MUTED
    SubTitle.TextXAlignment = Enum.TextXAlignment.Left
    SubTitle.Parent = Header

    local TimeLab = Instance.new("TextLabel")
    TimeLab.Size = UDim2.new(0.38,0,1,0)
    TimeLab.Position = UDim2.new(0.62,0,0,0)
    TimeLab.BackgroundTransparency = 1
    TimeLab.TextColor3 = THEME.ACCENT
    TimeLab.Font = Enum.Font.GothamBold
    TimeLab.TextSize = 11
    TimeLab.TextXAlignment = Enum.TextXAlignment.Right
    TimeLab.TextYAlignment = Enum.TextYAlignment.Center
    TimeLab.Parent = Header

    local Divider = Instance.new("Frame")
    Divider.Size = UDim2.new(1, -24, 0, 1)
    Divider.Position = UDim2.new(0,12,0,72)
    Divider.BackgroundColor3 = THEME.BORDER
    Divider.Parent = Main

    -- TABS
    local TabList = {"INFO", "MAIN", "GAMES", "COMBAT", "SETTINGS"}
    local TabButtons = {}
    local Pages = {}
    local TabW = 1/#TabList
    for I, Name in pairs(TabList) do
        local Tab = Instance.new("TextButton")
        Tab.Size = UDim2.new(TabW - 0.02, 0, 0, 28)
        Tab.Position = UDim2.new(0.01 + ((I-1)*TabW), 0, 0, 82)
        Tab.BackgroundTransparency = 1
        Tab.Text = " "..Name.." "
        Tab.Font = Enum.Font.GothamBold
        Tab.TextSize = 10
        Tab.TextColor3 = I == 1 and THEME.ACCENT or THEME.TEXT_MUTED
        Tab.AutoButtonColor = false
        Tab.Parent = Main
        Instance.new("UICorner", Tab).CornerRadius = UDim.new(0, 6)

        local Indicator = Instance.new("Frame")
        Indicator.Size = UDim2.new(0.6, 0, 0, 2)
        Indicator.Position = UDim2.new(0.2, 0, 1, 2)
        Indicator.BackgroundColor3 = THEME.ACCENT
        Indicator.BackgroundTransparency = I == 1 and 0 or 1
        Indicator.Parent = Tab

        TabButtons[Name] = {Btn = Tab, Line = Indicator}

        local Page = Instance.new("ScrollingFrame")
        Page.Size = UDim2.new(1, -24, 1, 0)
        Page.Position = UDim2.new(0,12,0,116)
        Page.BackgroundTransparency = 1
        Page.BackgroundColor3 = THEME.BG
        Page.ScrollBarThickness = 4
        pcall(function() Page.ScrollBarColor3 = THEME.ACCENT end)
pcall(function() Page.ScrollBarTransparency = 0.4 end)
        Page.CanvasSize = UDim2.new(0,0,0,0)
        Page.Visible = I == 1
        Page.Parent = Main

        -- SMOOTH SCROLL EFFECT
        Page.MouseEnter:Connect(function() Tween(Page, ANIM.NORMAL, {ScrollBarTransparency = 0}) end)
        Page.MouseLeave:Connect(function() Tween(Page, ANIM.NORMAL, {ScrollBarTransparency = 0.4}) end)

        Pages[Name] = Page
    end

    -- ============== INFO TAB ==============
    do
        local P = Pages.INFO
        local Avatar = Instance.new("ImageLabel")
        Avatar.Size = UDim2.new(0, 72, 0, 72)
        Avatar.Position = UDim2.new(0.5, -36, 0, 10)
        Avatar.BackgroundTransparency = 1
        Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1,0)
        AddStroke(Avatar, {Thickness = 2, Color = THEME.ACCENT})
        pcall(function()
            local Img = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            Avatar.Image = Img
        end)
        Avatar.Parent = P

        local UserLab = Instance.new("TextLabel")
        UserLab.Size = UDim2.new(1,0,0,20)
        UserLab.Position = UDim2.new(0,0,0,94)
        UserLab.BackgroundTransparency = 1
        UserLab.Text = "@"..LocalPlayer.Name
        UserLab.Font = Enum.Font.FredokaOne
        UserLab.TextSize = 20
        UserLab.TextColor3 = THEME.TEXT
        UserLab.TextXAlignment = Enum.TextXAlignment.Center
        UserLab.Parent = P

        local Credit1 = Instance.new("TextLabel")
        Credit1.Size = UDim2.new(1,0,0,13)
        Credit1.Position = UDim2.new(0,0,0,140)
        Credit1.BackgroundTransparency = 1
        Credit1.Text = "DEVELOPED BY: NEXUS"
        Credit1.Font = Enum.Font.Gotham
        Credit1.TextSize = 11
        Credit1.TextColor3 = THEME.TEXT_MUTED
        Credit1.TextXAlignment = Enum.TextXAlignment.Center
        Credit1.Parent = P

        local Credit2 = Instance.new("TextLabel")
        Credit2.Size = UDim2.new(1,0,0,13)
        Credit2.Position = UDim2.new(0,0,0,160)
        Credit2.BackgroundTransparency = 1
        Credit2.Text = "BUILT WITH: DOLA ASSIST"
        Credit2.Font = Enum.Font.Gotham
        Credit2.TextSize = 11
        Credit2.TextColor3 = THEME.TEXT_MUTED
        Credit2.TextXAlignment = Enum.TextXAlignment.Center
        Credit2.Parent = P

        P.CanvasSize = UDim2.new(0,0,0,200)
    end

    -- ============== MAIN TAB ==============
    do
        local P = Pages.MAIN
        MakeButton(P, "[ RUN LOCAL SCRIPT ]", THEME.SUCCESS, UDim2.new(0.05,0,0,25), nil, RUN_LOCAL_SCRIPT)
        MakeButton(P, "[ RUN REMOTE SCRIPT ]", THEME.ACCENT, UDim2.new(0.05,0,0,85), nil, RUN_REMOTE_SCRIPT)
    end

    -- ============== GAMES TAB ==============
    do
        local P = Pages.GAMES
        local Search = Instance.new("TextBox")
        Search.Size = UDim2.new(0.92,0,0,38)
        Search.Position = UDim2.new(0.04,0,0,10)
        Search.BackgroundColor3 = THEME.CARD
        Search.BackgroundTransparency = 0.15
        Search.Text = "🔍 Search Games..."
        Search.PlaceholderText = "Type name here..."
        Search.Font = Enum.Font.Gotham
        Search.TextSize = 12
        Search.TextColor3 = THEME.TEXT
        Search.TextXAlignment = Enum.TextXAlignment.Center
        Search.ClearTextOnFocus = true
        Search.Parent = P
        Instance.new("UICorner", Search).CornerRadius = UDim.new(0, 8)
        AddStroke(Search, {Thickness = 1.2, Color = THEME.ACCENT})

        local Container = Instance.new("Frame")
        Container.Size = UDim2.new(1,0,0,2000)
        Container.BackgroundTransparency = 1
        Container.Position = UDim2.new(0,0,0,58)
        Container.Parent = P
        local GameBtns = {}

        local function RenderGames(Query)
            Query = string.lower(Query or "")
            for _, B in pairs(GameBtns) do pcall(function() B:Destroy() end) end
            table.clear(GameBtns)
            local Y = 10
            for _, G in pairs(GAME_LIST) do
                if Query == "" or string.find(string.lower(G.Name), Query, 1, true) then
                    local B = MakeButton(Container, "🎮 "..G.Name, THEME.TEXT, UDim2.new(0.04,0,0,Y))
                    B.MouseButton1Click:Connect(function()
                        pcall(function()
                            local Keep = getgenv().NEXUS_MAIN_UI
                            loadstring(G.Load)()
                            task.wait(0.5)
                            if Keep and Keep.Parent then getgenv().NEXUS_MAIN_UI = Keep end
                        end)
                        Notify("🎮 Running: "..G.Name, THEME.ACCENT)
                    end)
                    table.insert(GameBtns, B)
                    Y += 44
                end
            end
            P.CanvasSize = UDim2.new(0,0,0,Y + 30)
        end

        Search.Changed:Connect(function(P) if P == "Text" then RenderGames(Search.Text == "🔍 Search Games..." and "" or Search.Text) end end)
        RenderGames("")
    end

    -- ============== COMBAT TAB ==============
    do
        local P = Pages.COMBAT
        local ESPBtn = MakeButton(P, "[ ESP: OFF ]", THEME.ERROR, UDim2.new(0.05,0,0,15))
        ESPBtn.MouseButton1Click:Connect(function()
            NX.Combat.ESP = not NX.Combat.ESP
            ToggleESP(NX.Combat.ESP)
            ESPBtn.Text = NX.Combat.ESP and "[ ESP: ON ]" or "[ ESP: OFF ]"
            ESPBtn.TextColor3 = NX.Combat.ESP and THEME.SUCCESS or THEME.ERROR
            Notify("ESP: "..(NX.Combat.ESP and "ENABLED ✅" or "DISABLED ❌"), NX.Combat.ESP and THEME.SUCCESS or THEME.ERROR)
        end)

        local AimBtn = MakeButton(P, "[ AIMBOT: OFF (RMB) ]", THEME.TEXT_MUTED, UDim2.new(0.05,0,0,75))
        AimBtn.MouseButton1Click:Connect(function()
            NX.Combat.Aimbot = not NX.Combat.Aimbot
            ToggleAimbot(NX.Combat.Aimbot)
            AimBtn.Text = NX.Combat.Aimbot and "[ AIMBOT: ON (RMB) ]" or "[ AIMBOT: OFF (RMB) ]"
            AimBtn.TextColor3 = NX.Combat.Aimbot and THEME.SUCCESS or THEME.TEXT_MUTED
            Notify("Aimbot: "..(NX.Combat.Aimbot and "ENABLED ✅" or "DISABLED ❌"), NX.Combat.Aimbot and THEME.SUCCESS or THEME.ERROR)
        end)

        local SpeedLab = Instance.new("TextLabel")
        SpeedLab.Size = UDim2.new(1,-20,0,14)
        SpeedLab.Position = UDim2.new(0,10,0,135)
        SpeedLab.BackgroundTransparency = 1
        SpeedLab.Text = "WALK SPEED (0 = DISABLED)"
        SpeedLab.Font = Enum.Font.GothamBold
        SpeedLab.TextSize = 11
        SpeedLab.TextColor3 = THEME.TEXT_MUTED
        SpeedLab.TextXAlignment = Enum.TextXAlignment.Left
        SpeedLab.Parent = P

        local SpeedBox = Instance.new("TextBox")
        SpeedBox.Size = UDim2.new(0.45,0,0,36)
        SpeedBox.Position = UDim2.new(0.05,0,0,158)
        SpeedBox.BackgroundColor3 = THEME.CARD
        SpeedBox.BackgroundTransparency = 0.15
        SpeedBox.Text = "16"
        SpeedBox.Font = Enum.Font.Gotham
        SpeedBox.TextSize = 12
        SpeedBox.TextColor3 = THEME.ACCENT
        SpeedBox.TextXAlignment = Enum.TextXAlignment.Center
        SpeedBox.Parent = P
        Instance.new("UICorner", SpeedBox).CornerRadius = UDim.new(0, 8)
        AddStroke(SpeedBox, {Thickness = 1.2, Color = THEME.ACCENT})

        MakeButton(P, "[ SET SPEED ]", THEME.ACCENT, UDim2.new(0.55,0,0,158), UDim2.new(0.38,0,0,36), function()
            local V = tonumber(SpeedBox.Text)
            if not V or V < 0 then Notify("❌ Invalid Number", THEME.ERROR) return end
            SetSpeed(V)
            Notify("✅ Speed Set To: "..V, THEME.SUCCESS)
        end)
    end

    -- ============== SETTINGS TAB ==============
    do
        local P = Pages.SETTINGS
        MakeButton(P, "[ REFRESH UI ]", THEME.TEXT_MUTED, UDim2.new(0.05,0,0,20), nil, function()
            Notify("🔄 Refreshing...", THEME.TEXT_MUTED)
            BuildMainUI()
        end)

        MakeButton(P, "[ LOGOUT & CLOSE ]", THEME.ERROR, UDim2.new(0.05,0,0,80), nil, function()
            Notify("⏳ Shutting Down...", THEME.ERROR)
            task.wait(0.5)
            getgenv().NEXUS_SHUTDOWN = true
            ClearAuth()
            pcall(function() if getgenv().NEXUS_MAIN_UI then getgenv().NEXUS_MAIN_UI:Destroy() end end)
            pcall(function() if getgenv().NEXUS_KEY_UI then getgenv().NEXUS_KEY_UI:Destroy() end end)
            getgenv().NEXUS_MAIN_UI = nil
            getgenv().NEXUS_KEY_UI = nil
        end)
    end

    -- ============== SMOOTH TAB SWITCH ==============
    local function SwitchTab(Name)
        for N, D in pairs(TabButtons) do
            Tween(D.Btn, ANIM.NORMAL, {TextColor3 = THEME.TEXT_MUTED})
            Tween(D.Line, ANIM.NORMAL, {Transparency = 1})
        end

        for N, P in pairs(Pages) do
            if P.Visible then
                Tween(P, ANIM.NORMAL, {Transparency = 1, Position = UDim2.new(0,12,0,126)}, function() P.Visible = false end)
            end
        end

        local Active = TabButtons[Name]
        Tween(Active.Btn, ANIM.NORMAL, {TextColor3 = THEME.ACCENT})
        Tween(Active.Line, ANIM.NORMAL, {Transparency = 0})

        local NewP = Pages[Name]
        NewP.Position = UDim2.new(0,12,0,106)
        NewP.Transparency = 1
        NewP.Visible = true
        Tween(NewP, ANIM.NORMAL, {Transparency = 0, Position = UDim2.new(0,12,0,116)})

        Notify("📁 Switched to: "..Name, THEME.ACCENT)
    end

    for N, D in pairs(TabButtons) do
        D.Btn.MouseButton1Click:Connect(function() SwitchTab(N) end)
    end

    -- TOGGLE LOGIC
    local IsOpen = false
    Toggle.MouseButton1Click:Connect(function()
        IsOpen = not IsOpen
        if IsOpen then
            Main.Visible = true
            Main.Transparency = 1
            Main.Position = UDim2.new(0.5, -220, 0.5, -230)
            Tween(Main, ANIM.POP, {Transparency = 0, Position = UDim2.new(0.5, -220, 0.5, -210)})
        else
            Tween(Main, ANIM.NORMAL, {Transparency = 1, Position = UDim2.new(0.5, -220, 0.5, -190)}, function()
                Main.Visible = false
            end)
        end
    end)

    -- TIMER
    task.spawn(function()
        while Main and Main.Parent and not getgenv().NEXUS_SHUTDOWN do
            local Ok, Left = CheckAuth()
            if not Ok then
                Notify("⏰ Access Expired! Restart & Enter Key", THEME.ERROR)
                getgenv().NEXUS_SHUTDOWN = true
                ClearAuth()
                pcall(function() Main:Destroy() end)
                break
            end
            local H = math.floor(Left/3600) local M = math.floor((Left%3600)/60) local S = Left%60
            TimeLab.Text = string.format("%02d:%02d:%02d", H,M,S)
            task.wait(1)
        end
    end)

    -- STARTUP ANIM
    Main.Visible = true
    Main.Transparency = 1
    Main.Position = UDim2.new(0.5, -220, 0.5, -230)
    Tween(Main, ANIM.POP, {Transparency = 0, Position = UDim2.new(0.5, -220, 0.5, -210)})
end

-- ==============================================
-- KEY SYSTEM UI
-- ==============================================
local function BuildKeyUI()
    pcall(function() if getgenv().NEXUS_KEY_UI then getgenv().NEXUS_KEY_UI:Destroy() end end)

    local Screen = Instance.new("ScreenGui")
    Screen.Name = "NexusKeyUI"
    Screen.DisplayOrder = 99999
    Screen.ResetOnSpawn = false
    Screen.Parent = PlayerGui
    getgenv().NEXUS_KEY_UI = Screen

    -- LOADING SCREEN 2 SEC
    local Load = Instance.new("Frame")
    Load.Size = UDim2.new(1,0,1,0)
    Load.BackgroundColor3 = THEME.BG
    Load.Parent = Screen
    local LoadText = Instance.new("TextLabel")
    LoadText.Size = UDim2.new(1,0,0,30)
    LoadText.Position = UDim2.new(0,0,0.5,-15)
    LoadText.BackgroundTransparency = 1
    LoadText.Text = "NEXUS:RT · LOADING..."
    LoadText.Font = Enum.Font.FredokaOne
    LoadText.TextSize = 22
    LoadText.TextColor3 = THEME.ACCENT
    LoadText.Parent = Load
    local BarBg = Instance.new("Frame")
    BarBg.Size = UDim2.new(0,240,0,6)
    BarBg.Position = UDim2.new(0.5,-120,0.5,15)
    BarBg.BackgroundColor3 = THEME.BORDER
    BarBg.Parent = Load
    Instance.new("UICorner", BarBg).CornerRadius = UDim.new(1,0)
    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(0,0,1,0)
    Bar.BackgroundColor3 = THEME.ACCENT
    Bar.Parent = BarBg
    Instance.new("UICorner", Bar).CornerRadius = UDim.new(1,0)

    Tween(Bar, TweenInfo.new(2, Enum.EasingStyle.Linear), {Size = UDim2.new(1,0,1,0)}, function()
        Tween(Load, ANIM.NORMAL, {Transparency = 1}, function() Load:Destroy() end)

        -- KEY FORM
        local KeyWin = Instance.new("Frame")
        KeyWin.Size = UDim2.new(0, 360, 0, 280)
        KeyWin.Position = UDim2.new(0.5, -180, 0.5, -140)
        KeyWin.BackgroundColor3 = THEME.BG
        KeyWin.ClipsDescendants = true
        KeyWin.Parent = Screen
        Instance.new("UICorner", KeyWin).CornerRadius = UDim.new(0, 16)
        AddStroke(KeyWin, {Thickness = 2, Color = THEME.ACCENT})
        KeyWin.Transparency = 1
        KeyWin.Position = UDim2.new(0.5, -180, 0.5, -120)
        Tween(KeyWin, ANIM.POP, {Transparency = 0, Position = UDim2.new(0.5, -180, 0.5, -140)})

        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1,0,0,36)
        Title.Position = UDim2.new(0,0,0,20)
        Title.BackgroundTransparency = 1
        Title.Text = "ENTER ACCESS KEY"
        Title.Font = Enum.Font.FredokaOne
        Title.TextSize = 26
        Title.TextColor3 = THEME.ACCENT
        Title.Parent = KeyWin

        local Input = Instance.new("TextBox")
        Input.Size = UDim2.new(0.8,0,0,44)
        Input.Position = UDim2.new(0.1,0,0,75)
        Input.BackgroundColor3 = THEME.CARD
        Input.Font = Enum.Font.Gotham
        Input.TextSize = 13
        Input.TextColor3 = THEME.TEXT
        Input.Text = ""
        Input.PlaceholderText = "Type your key here..."
        Input.Parent = KeyWin
        Instance.new("UICorner", Input).CornerRadius = UDim.new(0, 8)
        AddStroke(Input, {Thickness = 1.2, Color = THEME.ACCENT})

        MakeButton(KeyWin, "📋 COPY EASY KEY", THEME.TEXT, UDim2.new(0.1,0,0,135), nil, function()
            if setclipboard then
                setclipboard("https://lootdest.org/s?ZY16brPV")
                Notify("✅ Copied!", THEME.SUCCESS)
            else
                Notify("❌ Not Supported", THEME.ERROR)
            end
        end)

        MakeButton(KeyWin, "🔓 UNLOCK SYSTEM", THEME.ACCENT, UDim2.new(0.1,0,0,195), nil, function()
            if Input.Text == CORRECT_KEY then
                SaveAuth(os.time())
                Notify("✅ Access Granted! 24 Hours", THEME.SUCCESS)
                Tween(KeyWin, ANIM.NORMAL, {Transparency = 1, Position = UDim2.new(0.5, -180, 0.5, -160)}, function()
                    Screen:Destroy()
                    BuildMainUI()
                end)
            else
                Notify("❌ Wrong Key!", THEME.ERROR)
                Input.Text = ""
            end
        end)
    end)
end

-- ==============================================
-- STARTUP
-- ==============================================
task.spawn(function()
    local Valid = CheckAuth()
    if Valid then
        Notify("✅ Welcome Back! Access Active", THEME.SUCCESS)
        BuildMainUI()
    else
        BuildKeyUI()
    end
end)
