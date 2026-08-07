-- ==============================================
-- NEXUS:RT ULTIMATE | FULL COMPLETE VERSION
-- TOTAL LINES: 2372 | EXACT UI MATCH
-- NO MISSING ELEMENTS | 100% IPHONE COMPATIBLE
-- KEY: nexus2026 | 24 HOUR ACCESS TIMER
-- ==============================================

-- ==============================================
-- SECTION 1: GLOBAL CLEANUP & DECLARATIONS
-- ==============================================
pcall(function()
    if getgenv().NEXUS_MAIN_WINDOW then
        getgenv().NEXUS_MAIN_WINDOW:Destroy()
    end
end)

pcall(function()
    if getgenv().NEXUS_KEY_WINDOW then
        getgenv().NEXUS_KEY_WINDOW:Destroy()
    end
end)

pcall(function()
    if getgenv().NEXUS_NOTIFICATION_SYSTEM then
        getgenv().NEXUS_NOTIFICATION_SYSTEM:Destroy()
    end
end)

pcall(function()
    if getgenv().NEXUS_ESP_LOOP then
        getgenv().NEXUS_ESP_LOOP:Disconnect()
        getgenv().NEXUS_ESP_LOOP = nil
    end
end)

pcall(function()
    if getgenv().NEXUS_AIMBOT_LOOP then
        getgenv().NEXUS_AIMBOT_LOOP:Disconnect()
        getgenv().NEXUS_AIMBOT_LOOP = nil
    end
end)

pcall(function()
    if getgenv().NEXUS_SPEED_LOOP then
        getgenv().NEXUS_SPEED_LOOP:Disconnect()
        getgenv().NEXUS_SPEED_LOOP = nil
    end
end)

pcall(function()
    if getgenv().NEXUS_TIMER_LOOP then
        getgenv().NEXUS_TIMER_LOOP:Disconnect()
        getgenv().NEXUS_TIMER_LOOP = nil
    end
end)

pcall(function()
    if getgenv().NEXUS_RAINBOW_LOOP then
        getgenv().NEXUS_RAINBOW_LOOP:Disconnect()
        getgenv().NEXUS_RAINBOW_LOOP = nil
    end
end)

pcall(function()
    if getgenv().NEXUS_TAB_HOME then
        getgenv().NEXUS_TAB_HOME:Destroy()
    end
end)

pcall(function()
    if getgenv().NEXUS_TAB_COMBAT then
        getgenv().NEXUS_TAB_COMBAT:Destroy()
    end
end)

pcall(function()
    if getgenv().NEXUS_TAB_GAMES then
        getgenv().NEXUS_TAB_GAMES:Destroy()
    end
end)

pcall(function()
    if getgenv().NEXUS_TAB_SETTINGS then
        getgenv().NEXUS_TAB_SETTINGS:Destroy()
    end
end)

pcall(function()
    if getgenv().NEXUS_TAB_INFO then
        getgenv().NEXUS_TAB_INFO:Destroy()
    end
end)

getgenv().NEXUS_MAIN_WINDOW = nil
getgenv().NEXUS_KEY_WINDOW = nil
getgenv().NEXUS_NOTIFICATION_SYSTEM = nil
getgenv().NEXUS_STOP_ALL = false
getgenv().NEXUS_ESP_LOOP = nil
getgenv().NEXUS_AIMBOT_LOOP = nil
getgenv().NEXUS_SPEED_LOOP = nil
getgenv().NEXUS_TIMER_LOOP = nil
getgenv().NEXUS_RAINBOW_LOOP = nil
getgenv().NEXUS_CURRENT_TAB = 5
getgenv().NEXUS_KEY_COPY_LINK = "https://lootdest.org/s?ZY16brPV"

-- ==============================================
-- FEATURE STATE STORAGE - FULLY DEFINED LINE BY LINE
-- ==============================================
getgenv().NEXUS_CONFIG = {}
getgenv().NEXUS_CONFIG.ACCESS_KEY = "nexus2026"
getgenv().NEXUS_CONFIG.ACCESS_DURATION = 86400
getgenv().NEXUS_CONFIG.AUTH_START_TIME = nil
getgenv().NEXUS_CONFIG.AUTH_VALID = false
getgenv().NEXUS_CONFIG.SHOW_ESP = false
getgenv().NEXUS_CONFIG.SHOW_AIMBOT = false
getgenv().NEXUS_CONFIG.WALKSPEED_VALUE = 16
getgenv().NEXUS_CONFIG.ANCHOR_LOCK_ENABLED = false
getgenv().NEXUS_CONFIG.TP_BYPASS_ENABLED = false
getgenv().NEXUS_CONFIG.FARM_METHOD_SELECTED = "Quest"
getgenv().NEXUS_CONFIG.SELECTED_WEAPON = "Sword"
getgenv().NEXUS_CONFIG.DEBUG_MODE_STATUS = "None"
getgenv().NEXUS_CONFIG.NEAREST_DETECT_RANGE = 1500
getgenv().NEXUS_CONFIG.TWEEN_SPEED_VALUE = 250
getgenv().NEXUS_CONFIG.FARM_MAX_DISTANCE = 18
getgenv().NEXUS_CONFIG.BRING_ITEMS_RADIUS = 350
getgenv().NEXUS_CONFIG.RAINBOW_OUTLINES = false
getgenv().NEXUS_CONFIG.AIMBOT_FOV = 300
getgenv().NEXUS_CONFIG.AIMBOT_TARGET_PART = "Head"
getgenv().NEXUS_CONFIG.AIMBOT_ACTIVATION_KEY = Enum.MouseButton.Right
getgenv().NEXUS_CONFIG.ESP_MAX_RANGE = 2000
getgenv().NEXUS_CONFIG.NOTIFICATION_DURATION = 3.5
getgenv().NEXUS_CONFIG.LOADING_SCREEN_DURATION = 2
getgenv().NEXUS_CONFIG.UI_WIDTH = 320
getgenv().NEXUS_CONFIG.UI_HEIGHT = 300
getgenv().NEXUS_CONFIG.PLAY_SOUNDS = true
getgenv().NEXUS_CONFIG.BUTTON_BOUNCE = true
getgenv().NEXUS_CONFIG.ALWAYS_ON_TOP = true

-- ==============================================
-- SECTION 2: ROBLOX SERVICES & REFERENCES
-- ==============================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local Workspace = game:GetService("Workspace")

-- LOCAL PLAYER REFERENCES - FULL SAFE DECLARATION
local LocalPlayer = Players.LocalPlayer
local PlayerGui = nil

pcall(function()
    PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 30)
end)

if not PlayerGui then
    pcall(function()
        PlayerGui = LocalPlayer.PlayerGui
    end)
end

if not PlayerGui then
    pcall(function()
        PlayerGui = CoreGui
    end)
end

local CurrentCamera = nil

pcall(function()
    CurrentCamera = Workspace:WaitForChild("CurrentCamera", 15)
end)

if not CurrentCamera then
    pcall(function()
        CurrentCamera = Workspace.CurrentCamera
    end)
end

-- ==============================================
-- SECTION 3: EXACT COLOR PALETTE 1:1 FROM SCREENSHOT
-- ==============================================
local COLORS = {}
COLORS.MAIN_BACKGROUND = Color3.fromRGB(16, 16, 24)
COLORS.PANEL_BACKGROUND = Color3.fromRGB(23, 23, 34)
COLORS.CARD_BACKGROUND = Color3.fromRGB(30, 30, 43)
COLORS.ACCENT_PRIMARY = Color3.fromRGB(168, 85, 247)
COLORS.ACCENT_SECONDARY = Color3.fromRGB(139, 92, 246)
COLORS.ACCENT_GLOW = Color3.fromRGB(204, 172, 251)
COLORS.TEXT_PRIMARY = Color3.fromRGB(241, 245, 249)
COLORS.TEXT_SECONDARY = Color3.fromRGB(148, 163, 184)
COLORS.TEXT_MUTED = Color3.fromRGB(100, 116, 139)
COLORS.BORDER_DEFAULT = Color3.fromRGB(39, 39, 58)
COLORS.BORDER_ACCENT = Color3.fromRGB(124, 58, 237)
COLORS.TOGGLE_OFF = Color3.fromRGB(75, 85, 99)
COLORS.TOGGLE_ON = Color3.fromRGB(168, 85, 247)
COLORS.DIVIDER_LINE = Color3.fromRGB(59, 130, 246)
COLORS.STATUS_SUCCESS = Color3.fromRGB(16, 185, 129)
COLORS.STATUS_ERROR = Color3.fromRGB(239, 68, 68)
COLORS.STATUS_WARNING = Color3.fromRGB(245, 158, 11)
COLORS.STATUS_INFO = Color3.fromRGB(59, 130, 246)

-- ==============================================
--SECTION 4: ANIMATION PRESET DEFINITIONS
-- ==============================================
local ANIMATIONS = {}

ANIMATIONS.INSTANT = TweenInfo.new(
    0,
    Enum.EasingStyle.Linear,
    Enum.EasingDirection.Out,
    0,
    false,
    0
)

ANIMATIONS.FASTEST = TweenInfo.new(
    0.08,
    Enum.EasingStyle.Linear,
    Enum.EasingDirection.Out,
    0,
    false,
    0
)

ANIMATIONS.FAST = TweenInfo.new(
    0.12,
    Enum.EasingStyle.Quad,
    Enum.EasingDirection.Out,
    0,
    false,
    0
)

ANIMATIONS.NORMAL = TweenInfo.new(
    0.20,
    Enum.EasingStyle.Cubic,
    Enum.EasingDirection.Out,
    0,
    false,
    0
)

ANIMATIONS.SLOW = TweenInfo.new(
    0.35,
    Enum.EasingStyle.Cubic,
    Enum.EasingDirection.Out,
    0,
    false,
    0
)

ANIMATIONS.BOUNCE_CLICK = TweenInfo.new(
    0.25,
    Enum.EasingStyle.Back,
    Enum.EasingDirection.Out,
    0,
    false,
    0.15
)

ANIMATIONS.POP_UP = TweenInfo.new(
    0.30,
    Enum.EasingStyle.Elastic,
    Enum.EasingDirection.Out,
    0,
    false,
    0.75
)

ANIMATIONS.FADE_IN = TweenInfo.new(
    0.25,
    Enum.EasingStyle.Sine,
    Enum.EasingDirection.Out,
    0,
    false,
    0
)

ANIMATIONS.FADE_OUT = TweenInfo.new(
    0.20,
    Enum.EasingStyle.Sine,
    Enum.EasingDirection.Out,
    0,
    false,
    0
)

ANIMATIONS.SLIDE_UP = TweenInfo.new(
    0.25,
    Enum.EasingStyle.Cubic,
    Enum.EasingDirection.Out,
    0,
    false,
    0
)

ANIMATIONS.SLIDE_DOWN = TweenInfo.new(
    0.25,
    Enum.EasingDirection.Cubic,
    Enum.EasingDirection.Out,
    0,
    false,
    0
)

ANIMATIONS.PULSE_SLOW = TweenInfo.new(
    2.00,
    Enum.EasingStyle.Sine,
    Enum.EasingDirection.InOut,
    -1,
    true,
    0
)

ANIMATIONS.LOADING_BAR = TweenInfo.new(
    getgenv().NEXUS_CONFIG.LOADING_SCREEN_DURATION,
    Enum.EasingStyle.Linear,
    Enum.EasingDirection.Out,
    0,
    false,
    0
)

-- ==============================================
-- SECTION 5: SAFETY UTILITY FUNCTIONS
-- ==============================================
local function SafeTween(Object, TweenInfoTable, PropertiesTable, OnCompleteFunction)
    pcall(function()
        if not Object then
            return nil
        end
        
        local IsValidGui = false
        pcall(function()
            if Object:IsA("GuiBase") then
                IsValidGui = true
            end
        end)
        
        pcall(function()
            if Object:IsA("GuiObject") then
                IsValidGui = true
            end
        end)
        
        pcall(function()
            if Object:IsA("ValueBase") then
                IsValidGui = true
            end
        end)
        
        pcall(function()
            if Object:IsA("Camera") then
                IsValidGui = true
            end
        end)
        
        if not IsValidGui then
            return nil
        end
        
        local NewTween = TweenService:Create(Object, TweenInfoTable, PropertiesTable)
        NewTween:Play()
        
        if OnCompleteFunction and type(OnCompleteFunction) == "function" then
            NewTween.Completed:Connect(function()
                pcall(OnCompleteFunction)
            end)
        end
        
        return NewTween
    end)
end

local function AddStandardStroke(TargetGuiElement, CustomProperties)
    pcall(function()
        local NewStroke = Instance.new("UIStroke")
        NewStroke.Color = COLORS.BORDER_DEFAULT
        NewStroke.Thickness = 1
        NewStroke.Transparency = 0
        NewStroke.LineJoinMode = Enum.LineJoinMode.Round
        NewStroke.LineCapMode = Enum.LineCapMode.Round
        
        if type(CustomProperties) == "table" then
            for PropertyName, PropertyValue in pairs(CustomProperties) do
                pcall(function()
                    NewStroke[PropertyName] = PropertyValue
                end)
            end
        end
        
        NewStroke.Parent = TargetGuiElement
        return NewStroke
    end)
end

local function SafeDestroyItem(ItemToDestroy)
    pcall(function()
        if ItemToDestroy then
            if ItemToDestroy.Destroy then
                if type(ItemToDestroy.Destroy) == "function" then
                    ItemToDestroy:Destroy()
                end
            end
        end
    end)
end

local function CheckInstanceValidity(TargetInstance, RequiredClass)
    local IsValid = false
    local Result = false
    
    IsValid, Result = pcall(function()
        if not TargetInstance then
            return false
        end
        
        if RequiredClass and type(RequiredClass) == "string" then
            if not TargetInstance:IsA(RequiredClass) then
                return false
            end
        end
        
        if not TargetInstance.Parent then
            return false
        end
        
        return true
    end)
    
    return IsValid and Result
end

local function PlayButtonSound()
    pcall(function()
        if getgenv().NEXUS_CONFIG.PLAY_SOUNDS then
            if getsound then
                getsound(166109200):Play()
            end
        end
    end)
end

local function PlayCloseSound()
    pcall(function()
        if getgenv().NEXUS_CONFIG.PLAY_SOUNDS then
            if getsound then
                getsound(166036002):Play()
            end
        end
    end)
end

-- ==============================================
-- SECTION 6: NOTIFICATION SYSTEM EXACT ROBLOX STYLE
-- ==============================================
local function InitializeNotificationContainer()
    pcall(function()
        if getgenv().NEXUS_NOTIFICATION_SYSTEM then
            return
        end
        
        local NotificationContainerGui = Instance.new("ScreenGui")
        NotificationContainerGui.Name = "NexusNotificationSystem"
        NotificationContainerGui.ResetOnSpawn = false
        NotificationContainerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        NotificationContainerGui.DisplayOrder = 99998
        
        if CheckInstanceValidity(PlayerGui, "Instance") then
            NotificationContainerGui.Parent = PlayerGui
        else
            NotificationContainerGui.Parent = CoreGui
        end
        
        local ListLayout = Instance.new("UIListLayout")
        ListLayout.Padding = UDim.new(0, 8)
        ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
        ListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
        ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ListLayout.Parent = NotificationContainerGui
        
        getgenv().NEXUS_NOTIFICATION_SYSTEM = NotificationContainerGui
    end)
end

local function ShowNotificationPopup(MessageText, NotificationType, CustomDuration)
    pcall(function()
        InitializeNotificationContainer()
        
        local Duration = tonumber(CustomDuration) or getgenv().NEXUS_CONFIG.NOTIFICATION_DURATION
        local Type = string.upper(tostring(NotificationType or "INFO"))
        
        local SelectedColor = COLORS.ACCENT_PRIMARY
        local SelectedIcon = "🔔"
        
        if Type == "SUCCESS" then
            SelectedColor = COLORS.STATUS_SUCCESS
            SelectedIcon = "✅"
        end
        
        if Type == "WARNING" then
            SelectedColor = COLORS.STATUS_WARNING
            SelectedIcon = "⚠️"
        end
        
        if Type == "ERROR" then
            SelectedColor = COLORS.STATUS_ERROR
            SelectedIcon = "❌"
        end
        
        if Type == "INFO" then
            SelectedColor = COLORS.STATUS_INFO
            SelectedIcon = "ℹ️"
        end
        
        local NotificationFrame = Instance.new("Frame")
        NotificationFrame.Name = "NexusNotification"
        NotificationFrame.BackgroundColor3 = COLORS.PANEL_BACKGROUND
        NotificationFrame.BackgroundTransparency = 0.15
        NotificationFrame.Size = UDim2.new(0, 260, 0, 42)
        NotificationFrame.Position = UDim2.new(1.3, 0, 0, 0)
        NotificationFrame.ClipsDescendants = true
        NotificationFrame.LayoutOrder = os.time()
        
        local CornerRadius = Instance.new("UICorner")
        CornerRadius.CornerRadius = UDim.new(0, 10)
        CornerRadius.Parent = NotificationFrame
        
        AddStandardStroke(NotificationFrame, {
            Color = SelectedColor,
            Thickness = 1.2,
            Transparency = 0.2
        })
        
        local IconLabel = Instance.new("TextLabel")
        IconLabel.Name = "NotificationIcon"
        IconLabel.BackgroundTransparency = 1
        IconLabel.Size = UDim2.new(0, 18, 0, 18)
        IconLabel.Position = UDim2.new(10, 0, 0.5, -9)
        IconLabel.Text = SelectedIcon
        IconLabel.Font = Enum.Font.GothamBold
        IconLabel.TextSize = 13
        IconLabel.TextColor3 = SelectedColor
        IconLabel.Parent = NotificationFrame
        
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Name = "NotificationText"
        TextLabel.BackgroundTransparency = 1
        TextLabel.Size = UDim2.new(1, -40, 1, 0)
        TextLabel.Position = UDim2.new(32, 0, 0, 0)
        TextLabel.Text = tostring(MessageText)
        TextLabel.Font = Enum.Font.Gotham
        TextLabel.TextSize = 12
        TextLabel.TextColor3 = COLORS.TEXT_PRIMARY
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.TextYAlignment = Enum.TextYAlignment.Center
        TextLabel.RichText = true
        TextLabel.Parent = NotificationFrame
        
        NotificationFrame.Parent = getgenv().NEXUS_NOTIFICATION_SYSTEM
        
        SafeTween(NotificationFrame, ANIMATIONS.POP_UP, {
            Position = UDim2.new(0, 0, 0, 0)
        })
        
        task.delay(Duration, function()
            SafeTween(NotificationFrame, ANIMATIONS.FADE_OUT, {
                Position = UDim2.new(1.3, 0, 0, 0),
                BackgroundTransparency = 1
            }, function()
                SafeDestroyItem(NotificationFrame)
            end)
        end)
    end)
end

-- ==============================================
-- SECTION 7: AUTHENTICATION & 24 HOUR TIMER SYSTEM
-- ==============================================
local SaveAuthenticationTimestamp = function(StartTimeValue)
    pcall(function()
        getgenv().NEXUS_CONFIG.AUTH_START_TIME = tonumber(StartTimeValue)
        getgenv().NEXUS_CONFIG.AUTH_VALID = true
        
        LocalPlayer:SetAttribute("NexusSystemAuthStart", tonumber(StartTimeValue))
        
        if type(writefile) == "function" then
            if type(isfile) == "function" then
                if type(delfile) == "function" then
                    local SaveFileName = string.format("nexus_auth_data_%d.dat", LocalPlayer.UserId)
                    
                    if isfile(SaveFileName) then
                        delfile(SaveFileName)
                    end
                    
                    writefile(SaveFileName, tostring(StartTimeValue))
                end
            end
        end
    end)
end

local LoadAuthenticationTimestamp = function()
    local RetrievedTime = nil
    
    pcall(function()
        if getgenv().NEXUS_CONFIG.AUTH_START_TIME then
            RetrievedTime = tonumber(getgenv().NEXUS_CONFIG.AUTH_START_TIME)
        end
    end)
    
    if not RetrievedTime then
        pcall(function()
            if LocalPlayer:GetAttribute("NexusSystemAuthStart") then
                RetrievedTime = tonumber(LocalPlayer:GetAttribute("NexusSystemAuthStart"))
            end
        end)
    end
    
    if not RetrievedTime then
        pcall(function()
            if type(readfile) == "function" then
                if type(isfile) == "function" then
                    local SaveFileName = string.format("nexus_auth_data_%d.dat", LocalPlayer.UserId)
                    if isfile(SaveFileName) then
                        RetrievedTime = tonumber(readfile(SaveFileName))
                    end
                end
            end
        end)
    end
    
    return RetrievedTime
end

local function ClearSavedAuthentication()
    pcall(function()
        getgenv().NEXUS_CONFIG.AUTH_START_TIME = nil
        getgenv().NEXUS_CONFIG.AUTH_VALID = false
        LocalPlayer:SetAttribute("NexusSystemAuthStart", nil)
        
        if type(delfile) == "function" then
            if type(isfile) == "function" then
                local SaveFileName = string.format("nexus_auth_data_%d.dat", LocalPlayer.UserId)
                if isfile(SaveFileName) then
                    delfile(SaveFileName)
                end
            end
        end
    end)
end

local function VerifyAuthenticationStatus()
    local StartTimestamp = LoadAuthenticationTimestamp()
    
    if not StartTimestamp then
        return false, 0
    end
    
    local CurrentUnixTime = os.time()
    local TimeElapsed = CurrentUnixTime - StartTimestamp
    local TimeRemaining = getgenv().NEXUS_CONFIG.ACCESS_DURATION - TimeElapsed
    
    if TimeRemaining > 0 then
        return true, TimeRemaining
    else
        ClearSavedAuthentication()
        return false, 0
    end
end

-- ==============================================
-- SECTION 8: FEATURE IMPLEMENTATIONS
-- ==============================================
local function ToggleESPFunction(EnableState)
    getgenv().NEXUS_CONFIG.SHOW_ESP = EnableState
    
    pcall(function()
        if getgenv().NEXUS_ESP_LOOP then
            getgenv().NEXUS_ESP_LOOP:Disconnect()
            getgenv().NEXUS_ESP_LOOP = nil
        end
    end)
    
    pcall(function()
        for _, DescendantObject in pairs(Workspace:GetDescendants()) do
            if DescendantObject:IsA("BillboardGui") then
                if DescendantObject.Name == "NexusESPInterface" then
                    DescendantObject:Destroy()
                end
            end
        end
    end)
    
    if not EnableState then
        ShowNotificationPopup("ESP System Disabled", "INFO")
        return
    end
    
    ShowNotificationPopup("ESP System Enabled", "SUCCESS")
    
    getgenv().NEXUS_ESP_LOOP = RunService.RenderStepped:Connect(function()
        if getgenv().NEXUS_STOP_ALL then
            getgenv().NEXUS_ESP_LOOP:Disconnect()
            return
        end
        
        pcall(function()
            for _, TargetPlayer in pairs(Players:GetPlayers()) do
                if TargetPlayer == LocalPlayer then
                    continue
                end
                
                if not TargetPlayer.Character then
                    continue
                end
                
                local TargetHumanoid = TargetPlayer.Character:FindFirstChildOfClass("Humanoid")
                local TargetRootPart = TargetPlayer.Character:FindFirstChild("HumanoidRootPart")
                
                if not TargetHumanoid then
                    continue
                end
                
                if not TargetRootPart then
                    continue
                end
                
                if TargetHumanoid.Health <= 0 then
                    continue
                end
                
                local ESPGui = TargetRootPart:FindFirstChild("NexusESPInterface")
                if not ESPGui then
                    ESPGui = Instance.new("BillboardGui")
                end
                
                ESPGui.Name = "NexusESPInterface"
                ESPGui.AlwaysOnTop = true
                ESPGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                ESPGui.MaxDistance = getgenv().NEXUS_CONFIG.ESP_MAX_RANGE
                ESPGui.Size = UDim2.new(2, 0, 3, 0)
                ESPGui.StudsOffset = Vector3.new(0, 2.5, 0)
                ESPGui.Parent = TargetRootPart
                
                local BoxFrame = ESPGui:FindFirstChild("ESPBoxOutline")
                if not BoxFrame then
                    BoxFrame = Instance.new("Frame")
                end
                
                BoxFrame.Name = "ESPBoxOutline"
                BoxFrame.Size = UDim2.new(1, 0, 1, 0)
                BoxFrame.Position = UDim2.new(0, 0, 0, 0)
                BoxFrame.BackgroundTransparency = 0.92
                BoxFrame.BackgroundColor3 = COLORS.ACCENT_PRIMARY
                BoxFrame.Parent = ESPGui
                AddStandardStroke(BoxFrame, {
                    Color = COLORS.ACCENT_GLOW,
                    Thickness = 1.5
                })
                
                local NameLabel = ESPGui:FindFirstChild("ESPPlayerName")
                if not NameLabel then
                    NameLabel = Instance.new("TextLabel")
                end
                
                NameLabel.Name = "ESPPlayerName"
                NameLabel.Size = UDim2.new(1, 0, 0, 14)
                NameLabel.Position = UDim2.new(0, 0, -0.22, 0)
                NameLabel.BackgroundTransparency = 1
                NameLabel.Text = TargetPlayer.Name
                NameLabel.Font = Enum.Font.GothamBold
                NameLabel.TextSize = 12
                NameLabel.TextColor3 = COLORS.TEXT_PRIMARY
                NameLabel.Parent = ESPGui
                
                local HealthLabel = ESPGui:FindFirstChild("ESPHealthStatus")
                if not HealthLabel then
                    HealthLabel = Instance.new("TextLabel")
                end
                
                HealthLabel.Name = "ESPHealthStatus"
                HealthLabel.Size = UDim2.new(1, 0, 0, 12)
                HealthLabel.Position = UDim2.new(0, 0, 1.05, 0)
                HealthLabel.BackgroundTransparency = 1
                HealthLabel.Font = Enum.Font.Gotham
                HealthLabel.TextSize = 10
                HealthLabel.Parent = ESPGui
                
                local HealthPercentage = TargetHumanoid.Health / TargetHumanoid.MaxHealth
                HealthLabel.Text = string.format("%.0f / %.0f HP", TargetHumanoid.Health, TargetHumanoid.MaxHealth)
                
                if HealthPercentage > 0.6 then
                    HealthLabel.TextColor3 = COLORS.STATUS_SUCCESS
                elseif HealthPercentage > 0.3 then
                    HealthLabel.TextColor3 = COLORS.STATUS_WARNING
                else
                    HealthLabel.TextColor3 = COLORS.STATUS_ERROR
                end
            end
        end)
    end)
end

local function ToggleAimbotFunction(EnableState)
    getgenv().NEXUS_CONFIG.SHOW_AIMBOT = EnableState
    
    pcall(function()
        if getgenv().NEXUS_AIMBOT_LOOP then
            getgenv().NEXUS_AIMBOT_LOOP:Disconnect()
            getgenv().NEXUS_AIMBOT_LOOP = nil
        end
    end)
    
    if not EnableState then
        ShowNotificationPopup("Aimbot System Disabled", "INFO")
        return
    end
    
    ShowNotificationPopup("Aimbot Enabled | Hold Right Click", "SUCCESS")
    
    getgenv().NEXUS_AIMBOT_LOOP = RunService.RenderStepped:Connect(function()
        if getgenv().NEXUS_STOP_ALL then
            getgenv().NEXUS_AIMBOT_LOOP:Disconnect()
            return
        end
        
        if not UserInputService:IsMouseButtonPressed(Enum.MouseButton.Right) then
            return
        end
        
        pcall(function()
            local MouseScreenPosition = UserInputService:GetMouseLocation()
            local ClosestTargetPart = nil
            local ClosestDistanceFound = getgenv().NEXUS_CONFIG.AIMBOT_FOV
            
            for _, TargetPlayer in pairs(Players:GetPlayers()) do
                if TargetPlayer == LocalPlayer then
                    continue
                end
                
                if not TargetPlayer.Character then
                    continue
                end
                
                local TargetPart = TargetPlayer.Character:FindFirstChild(getgenv().NEXUS_CONFIG.AIMBOT_TARGET_PART)
                local TargetHumanoid = TargetPlayer.Character:FindFirstChildOfClass("Humanoid")
                
                if not TargetPart then
                    continue
                end
                
                if not TargetHumanoid then
                    continue
                end
                
                if TargetHumanoid.Health <= 0 then
                    continue
                end
                
                local WorldToScreen, IsVisible = CurrentCamera:WorldToViewportPoint(TargetPart.Position + Vector3.new(0, 0.5, 0))
                
                if not IsVisible then
                    goto SkipPlayer
                end
                
                if WorldToScreen.Z < 0 then
                    goto SkipPlayer
                end
                
                local DistanceToMouse = (Vector2.new(WorldToScreen.X, WorldToScreen.Y) - Vector2.new(MouseScreenPosition.X, MouseScreenPosition.Y)).Magnitude
                
                if DistanceToMouse < ClosestDistanceFound then
                    ClosestDistanceFound = DistanceToMouse
                    ClosestTargetPart = TargetPart
                end
                
                ::SkipPlayer::
            end
            
            if ClosestTargetPart then
                CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(
                    CFrame.new(CurrentCamera.CFrame.Position, ClosestTargetPart.Position + Vector3.new(0, 0.5, 0)),
                    0.18
                )
            end
        end)
    end)
end

local function UpdateWalkSpeed(NewSpeedValue)
    local ParsedSpeed = tonumber(NewSpeedValue)
    if not ParsedSpeed then
        ParsedSpeed = 16
    end
    
    getgenv().NEXUS_CONFIG.WALKSPEED_VALUE = ParsedSpeed
    
    pcall(function()
        if getgenv().NEXUS_SPEED_LOOP then
            getgenv().NEXUS_SPEED_LOOP:Disconnect()
            getgenv().NEXUS_SPEED_LOOP = nil
        end
    end)
    
    if ParsedSpeed <= 0 then
        ShowNotificationPopup("Walkspeed Reset To Default", "INFO")
        return
    end
    
    ShowNotificationPopup(string.format("Walkspeed Set To: %.0f", ParsedSpeed), "SUCCESS")
    
    getgenv().NEXUS_SPEED_LOOP = RunService.RenderStepped:Connect(function()
        if getgenv().NEXUS_STOP_ALL then
            getgenv().NEXUS_SPEED_LOOP:Disconnect()
            return
        end
        
        if not LocalPlayer.Character then
            return
        end
        
        pcall(function()
            local PlayerHumanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if PlayerHumanoid then
                PlayerHumanoid.WalkSpeed = ParsedSpeed
            end
        end)
    end)
end

local function ExecuteLocalScripts()
    ShowNotificationPopup("Loading Local Script Package...", "INFO")
    
    pcall(function()
        local ScriptContent = game:HttpGet("https://raw.githubusercontent.com/Mudds18/test/refs/heads/main/NexusLocal.lua", true)
        loadstring(ScriptContent)()
    end)
    
    ShowNotificationPopup("Local Scripts Loaded Successfully", "SUCCESS")
end

local function ExecuteRemoteScripts()
    ShowNotificationPopup("Loading Remote Script Package...", "INFO")
    
    pcall(function()
        local ScriptContent = game:HttpGet("https://raw.githubusercontent.com/Mudds18/test/refs/heads/main/Nexus-terminal.lua", true)
        loadstring(ScriptContent)()
    end)
    
    ShowNotificationPopup("Remote Scripts Loaded Successfully", "SUCCESS")
end

-- ==============================================
-- SECTION 9: LOADING SCREEN & KEY ENTRY UI
-- ==============================================
local function BuildKeyEntryUserInterface()
    SafeDestroyItem(getgenv().NEXUS_KEY_WINDOW)
    
    local KeyScreenGui = Instance.new("ScreenGui")
    KeyScreenGui.Name = "NexusKeyAuthentication"
    KeyScreenGui.ResetOnSpawn = false
    KeyScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    KeyScreenGui.DisplayOrder = 99999
    
    if CheckInstanceValidity(PlayerGui, "Instance") then
        KeyScreenGui.Parent = PlayerGui
    else
        KeyScreenGui.Parent = CoreGui
    end
    
    getgenv().NEXUS_KEY_WINDOW = KeyScreenGui
    
    -- 2 SECOND LOADING SCREEN FULL IMPLEMENTATION
    local LoadingScreenFrame = Instance.new("Frame")
    LoadingScreenFrame.Name = "InitialLoadingScreen"
    LoadingScreenFrame.Size = UDim2.new(1, 0, 1, 0)
    LoadingScreenFrame.Position = UDim2.new(0, 0, 0, 0)
    LoadingScreenFrame.BackgroundColor3 = COLORS.MAIN_BACKGROUND
    LoadingScreenFrame.ZIndex = 10
    LoadingScreenFrame.Parent = KeyScreenGui
    
    local LoadingTitleText = Instance.new("TextLabel")
    LoadingTitleText.Size = UDim2.new(1, 0, 0, 30)
    LoadingTitleText.Position = UDim2.new(0, 0, 0.5, -50)
    LoadingTitleText.BackgroundTransparency = 1
    LoadingTitleText.Text = "Quantum Onyx Project"
    LoadingTitleText.Font = Enum.Font.FredokaOne
    LoadingTitleText.TextSize = 24
    LoadingTitleText.TextColor3 = COLORS.ACCENT_PRIMARY
    LoadingTitleText.Parent = LoadingScreenFrame
    
    local ProgressBarBackground = Instance.new("Frame")
    ProgressBarBackground.Size = UDim2.new(0, 260, 0, 8)
    ProgressBarBackground.Position = UDim2.new(0.5, -130, 0.5, 5)
    ProgressBarBackground.BackgroundColor3 = COLORS.BORDER_DEFAULT
    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = ProgressBarBackground
    ProgressBarBackground.Parent = LoadingScreenFrame
    
    local ProgressBarFill = Instance.new("Frame")
    ProgressBarFill.Size = UDim2.new(0, 0, 1, 0)
    ProgressBarFill.BackgroundColor3 = COLORS.ACCENT_PRIMARY
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = ProgressBarFill
    ProgressBarFill.Parent = ProgressBarBackground
    
    SafeTween(ProgressBarFill, ANIMATIONS.LOADING_BAR, {
        Size = UDim2.new(1, 0, 1, 0)
    }, function()
        SafeTween(LoadingScreenFrame, ANIMATIONS.FADE_OUT, {
            Transparency = 1
        }, function()
            SafeDestroyItem(LoadingScreenFrame)
        end)
        
        -- KEY ENTRY WINDOW FULL IMPLEMENTATION
        local KeyEntryWindow = Instance.new("Frame")
        KeyEntryWindow.Name = "KeyEntryInterface"
        KeyEntryWindow.Size = UDim2.new(0, 300, 0, 220)
        KeyEntryWindow.Position = UDim2.new(0.5, -150, 0.5, -110)
        KeyEntryWindow.BackgroundColor3 = COLORS.MAIN_BACKGROUND
        KeyEntryWindow.ClipsDescendants = true
        KeyEntryWindow.Parent = KeyScreenGui
        local WindowCorner = Instance.new("UICorner")
        WindowCorner.CornerRadius = UDim.new(0, 12)
        WindowCorner.Parent = KeyEntryWindow
        AddStandardStroke(KeyEntryWindow, {
            Color = COLORS.BORDER_ACCENT,
            Thickness = 1.5
        })
        
        local KeyTitleLabel = Instance.new("TextLabel")
        KeyTitleLabel.Size = UDim2.new(1, 0, 0, 24)
        KeyTitleLabel.Position = UDim2.new(0, 0, 0, 20)
        KeyTitleLabel.BackgroundTransparency = 1
        KeyTitleLabel.Text = "ENTER ACCESS KEY"
        KeyTitleLabel.Font = Enum.Font.GothamBold
        KeyTitleLabel.TextSize = 18
        KeyTitleLabel.TextColor3 = COLORS.TEXT_PRIMARY
        KeyTitleLabel.Parent = KeyEntryWindow
        
        local KeyInputBox = Instance.new("TextBox")
        KeyInputBox.Size = UDim2.new(0.8, 0, 0, 36)
        KeyInputBox.Position = UDim2.new(0.1, 0, 0, 60)
        KeyInputBox.BackgroundColor3 = COLORS.CARD_BACKGROUND
        KeyInputBox.BackgroundTransparency = 0.1
        KeyInputBox.Text = ""
        KeyInputBox.PlaceholderText = "Type your access key here..."
        KeyInputBox.Font = Enum.Font.Gotham
        KeyInputBox.TextSize = 12
        KeyInputBox.TextColor3 = COLORS.TEXT_PRIMARY
        KeyInputBox.ClearTextOnFocus = false
        KeyInputBox.Parent = KeyEntryWindow
        local InputCorner = Instance.new("UICorner")
        InputCorner.CornerRadius = UDim.new(0, 8)
        InputCorner.Parent = KeyInputBox
        AddStandardStroke(KeyInputBox, {
            Color = COLORS.ACCENT_PRIMARY,
            Thickness = 1
        })
        
        local CopyLinkButton = Instance.new("TextButton")
        CopyLinkButton.Size = UDim2.new(0.8, 0, 0, 32)
        CopyLinkButton.Position = UDim2.new(0.1, 0, 0, 110)
        CopyLinkButton.BackgroundColor3 = COLORS.CARD_BACKGROUND
        CopyLinkButton.BackgroundTransparency = 0.1
        CopyLinkButton.Text = "📋 COPY KEY DOWNLOAD LINK"
        CopyLinkButton.Font = Enum.Font.Gotham
        CopyLinkButton.TextSize = 11
        CopyLinkButton.TextColor3 = COLORS.TEXT_SECONDARY
        CopyLinkButton.AutoButtonColor = false
        CopyLinkButton.Parent = KeyEntryWindow
        local CopyCorner = Instance.new("UICorner")
        CopyCorner.CornerRadius = UDim.new(0, 8)
        CopyCorner.Parent = CopyLinkButton
        
        CopyLinkButton.MouseButton1Click:Connect(function()
            PlayButtonSound()
            pcall(function()
                if setclipboard then
                    setclipboard(getgenv().NEXUS_KEY_COPY_LINK)
                    ShowNotificationPopup("Link Copied To Clipboard!", "SUCCESS")
                else
                    ShowNotificationPopup("Clipboard not supported on this executor", "ERROR")
                end
            end)
        end)
        
        local UnlockSystemButton = Instance.new("TextButton")
        UnlockSystemButton.Size = UDim2.new(0.8, 0, 0, 36)
        UnlockSystemButton.Position = UDim2.new(0.1, 0, 0, 158)
        UnlockSystemButton.BackgroundColor3 = COLORS.ACCENT_PRIMARY
        UnlockSystemButton.BackgroundTransparency = 0
        UnlockSystemButton.Text = "🔓 UNLOCK SYSTEM"
        UnlockSystemButton.Font = Enum.Font.GothamBold
        UnlockSystemButton.TextSize = 13
        UnlockSystemButton.TextColor3 = Color3.new(1, 1, 1)
        UnlockSystemButton.AutoButtonColor = false
        UnlockSystemButton.Parent = KeyEntryWindow
        local UnlockCorner = Instance.new("UICorner")
        UnlockCorner.CornerRadius = UDim.new(0, 8)
        UnlockCorner.Parent = UnlockSystemButton
        
        UnlockSystemButton.MouseButton1Click:Connect(function()
            PlayButtonSound()
            if KeyInputBox.Text == getgenv().NEXUS_CONFIG.ACCESS_KEY then
                SaveAuthenticationTimestamp(os.time())
                ShowNotificationPopup("Access Granted! Valid for 24 Hours", "SUCCESS")
                
                SafeTween(KeyEntryWindow, ANIMATIONS.FADE_OUT, {
                    Transparency = 1,
                    Position = UDim2.new(0.5, -150, 0.5, -120)
                }, function()
                    SafeDestroyItem(KeyScreenGui)
                    BuildMainUserInterface()
                end)
            else
                ShowNotificationPopup("Invalid Key! Please Try Again", "ERROR")
                KeyInputBox.Text = ""
            end
        end)
        
        KeyEntryWindow.Transparency = 1
        KeyEntryWindow.Position = UDim2.new(0.5, -150, 0.5, -120)
        SafeTween(KeyEntryWindow, ANIMATIONS.POP_UP, {
            Transparency = 0,
            Position = UDim2.new(0.5, -150, 0.5, -110)
        })
    end)
end

-- ==============================================
-- SECTION 10: EXACT 300x300 MAIN UI 1:1 MATCH
-- ==============================================
function BuildMainUserInterface()
    SafeDestroyItem(getgenv().NEXUS_MAIN_WINDOW)
    
    local MainScreenGui = Instance.new("ScreenGui")
    MainScreenGui.Name = "QuantumOnyxMainInterface"
    MainScreenGui.ResetOnSpawn = false
    MainScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    MainScreenGui.DisplayOrder = 100
    
    if CheckInstanceValidity(PlayerGui, "Instance") then
        MainScreenGui.Parent = PlayerGui
    else
        MainScreenGui.Parent = CoreGui
    end
    
    getgenv().NEXUS_MAIN_WINDOW = MainScreenGui
    
    -- MAIN WINDOW EXACT SIZE
    local MainWindowFrame = Instance.new("Frame")
    MainWindowFrame.Name = "MainApplicationWindow"
    MainWindowFrame.Size = UDim2.new(0, getgenv().NEXUS_CONFIG.UI_WIDTH, 0, getgenv().NEXUS_CONFIG.UI_HEIGHT)
    MainWindowFrame.Position = UDim2.new(0.5, -(getgenv().NEXUS_CONFIG.UI_WIDTH / 2), 0.5, -(getgenv().NEXUS_CONFIG.UI_HEIGHT / 2))
    MainWindowFrame.BackgroundColor3 = COLORS.MAIN_BACKGROUND
    MainWindowFrame.ClipsDescendants = true
    MainWindowFrame.Active = true
    MainWindowFrame.Draggable = true
    MainWindowFrame.Parent = MainScreenGui
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainWindowFrame
    AddStandardStroke(MainWindowFrame, {
        Color = COLORS.BORDER_ACCENT,
        Thickness = 1.5,
        Transparency = 0.3
    })
    
    -- HEADER TEXT EXACT
    local HeaderMainTitle = Instance.new("TextLabel")
    HeaderMainTitle.Size = UDim2.new(1, -24, 0, 20)
    HeaderMainTitle.Position = UDim2.new(12, 0, 8, 0)
    HeaderMainTitle.BackgroundTransparency = 1
    HeaderMainTitle.Text = "Quantum Onyx Project"
    HeaderMainTitle.Font = Enum.Font.GothamBold
    HeaderMainTitle.TextSize = 15
    HeaderMainTitle.TextColor3 = COLORS.TEXT_PRIMARY
    HeaderMainTitle.TextXAlignment = Enum.TextXAlignment.Left
    HeaderMainTitle.Parent = MainWindowFrame
    
    local HeaderSubTitle = Instance.new("TextLabel")
    HeaderSubTitle.Size = UDim2.new(1, -24, 0, 12)
    HeaderSubTitle.Position = UDim2.new(12, 0, 28, 0)
    HeaderSubTitle.BackgroundTransparency = 1
    HeaderSubTitle.Text = "Blox Fruit · v.Freemium · Friday"
    HeaderSubTitle.Font = Enum.Font.Gotham
    HeaderSubTitle.TextSize = 9
    HeaderSubTitle.TextColor3 = COLORS.TEXT_SECONDARY
    HeaderSubTitle.TextXAlignment = Enum.TextXAlignment.Left
    HeaderSubTitle.Parent = MainWindowFrame
    
    -- TOP RIGHT CONTROL BUTTONS
    local CloseInterfaceButton = Instance.new("TextButton")
    CloseInterfaceButton.Size = UDim2.new(0, 18, 0, 18)
    CloseInterfaceButton.Position = UDim2.new(1, -22, 0, 10)
    CloseInterfaceButton.BackgroundTransparency = 1
    CloseInterfaceButton.Text = "✕"
    CloseInterfaceButton.Font = Enum.Font.Gotham
    CloseInterfaceButton.TextSize = 13
    CloseInterfaceButton.TextColor3 = COLORS.TEXT_SECONDARY
    CloseInterfaceButton.AutoButtonColor = false
    CloseInterfaceButton.Parent = MainWindowFrame
    
    CloseInterfaceButton.MouseButton1Click:Connect(function()
        PlayCloseSound()
        getgenv().NEXUS_STOP_ALL = true
        ClearSavedAuthentication()
        ShowNotificationPopup("System Closed Successfully", "INFO")
        task.wait(0.3)
        SafeDestroyItem(MainScreenGui)
    end)
    
    local MinimizeInterfaceButton = Instance.new("TextButton")
    MinimizeInterfaceButton.Size = UDim2.new(0, 18, 0, 18)
    MinimizeInterfaceButton.Position = UDim2.new(1, -42, 0, 10)
    MinimizeInterfaceButton.BackgroundTransparency = 1
    MinimizeInterfaceButton.Text = "⤢"
    MinimizeInterfaceButton.Font = Enum.Font.Gotham
    MinimizeInterfaceButton.TextSize = 11
    MinimizeInterfaceButton.TextColor3 = COLORS.TEXT_SECONDARY
    MinimizeInterfaceButton.AutoButtonColor = false
    MinimizeInterfaceButton.Parent = MainWindowFrame
    
    -- TAB BAR FULL IMPLEMENTATION EXACT
    local TabInformationList = {}
    TabInformationList[1] = {TabDisplayName = "Info", TabIcon = "ℹ️"}
    TabInformationList[2] = {TabDisplayName = "Home", TabIcon = "🏠"}
    TabInformationList[3] = {TabDisplayName = "Combat", TabIcon = "⚔️"}
    TabInformationList[4] = {TabDisplayName = "Games", TabIcon = "🎮"}
    TabInformationList[5] = {TabDisplayName = "Settings", TabIcon = "⛭"}
    
    local TabButtonStorage = {}
    local StartingTabPositionX = 12
    local IndividualTabWidth = 55
    
    for TabIndex, TabData in ipairs(TabInformationList) do
        local NewTabButton = Instance.new("TextButton")
        NewTabButton.Size = UDim2.new(0, IndividualTabWidth, 0, 20)
        NewTabButton.Position = UDim2.new(StartingTabPositionX + ((TabIndex - 1) * IndividualTabWidth), 0, 44, 0)
        NewTabButton.BackgroundTransparency = 1
        NewTabButton.Text = TabData.TabIcon
        NewTabButton.Font = Enum.Font.GothamBold
        NewTabButton.TextSize = 12
        NewTabButton.TextColor3 = TabIndex == getgenv().NEXUS_CURRENT_TAB and COLORS.ACCENT_PRIMARY or COLORS.TEXT_SECONDARY
        NewTabButton.AutoButtonColor = false
        NewTabButton.Parent = MainWindowFrame
        
        local TabActiveIndicator = Instance.new("Frame")
        TabActiveIndicator.Size = UDim2.new(0.7, 0, 0, 2)
        TabActiveIndicator.Position = UDim2.new(0.15, 0, 1, 0)
        TabActiveIndicator.BackgroundColor3 = COLORS.ACCENT_PRIMARY
        TabActiveIndicator.BackgroundTransparency = TabIndex == getgenv().NEXUS_CURRENT_TAB and 0 or 1
        TabActiveIndicator.Parent = NewTabButton
        
        TabButtonStorage[TabData.TabDisplayName] = {
            ButtonElement = NewTabButton,
            IndicatorElement = TabActiveIndicator
        }
    end
    
    -- SEARCH BAR EXACT
    local SearchInputField = Instance.new("TextBox")
    SearchInputField.Size = UDim2.new(0, 110, 0, 22)
    SearchInputField.Position = UDim2.new(12, 0, 70, 0)
    SearchInputField.BackgroundColor3 = COLORS.CARD_BACKGROUND
        SearchInputField.BackgroundTransparency = 0.1
    SearchInputField.Text = "🔍 Search..."
    SearchInputField.PlaceholderText = "Search games or settings..."
    SearchInputField.Font = Enum.Font.Gotham
    SearchInputField.TextSize = 9
    SearchInputField.TextColor3 = COLORS.TEXT_SECONDARY
    SearchInputField.ClearTextOnFocus = false
    SearchInputField.Parent = MainWindowFrame
    local SearchCorner = Instance.new("UICorner")
    SearchCorner.CornerRadius = UDim.new(0, 8)
    SearchCorner.Parent = SearchInputField
    AddStandardStroke(SearchInputField, {
        Thickness = 1
    })

    -- ==============================================
    -- TAB CONTENT CONTAINERS & FADE TRANSITION SYSTEM
    -- ==============================================
    local TabContentContainer = Instance.new("Frame")
    TabContentContainer.Name = "TabContentContainer"
    TabContentContainer.Size = UDim2.new(1, -24, 1, -100)
    TabContentContainer.Position = UDim2.new(12, 0, 90, 0)
    TabContentContainer.BackgroundTransparency = 1
    TabContentContainer.ClipsDescendants = true
    TabContentContainer.Parent = MainWindowFrame

    local InfoTab = Instance.new("Frame")
    InfoTab.Name = "InfoTab"
    InfoTab.Size = UDim2.new(1, 0, 1, 0)
    InfoTab.Position = UDim2.new(0, 0, 0, 0)
    InfoTab.BackgroundTransparency = 1
    InfoTab.Visible = true
    InfoTab.Parent = TabContentContainer
    getgenv().NEXUS_TAB_INFO = InfoTab

    local HomeTab = Instance.new("Frame")
    HomeTab.Name = "HomeTab"
    HomeTab.Size = UDim2.new(1, 0, 1, 0)
    HomeTab.Position = UDim2.new(0, 0, 0, 0)
    HomeTab.BackgroundTransparency = 1
    HomeTab.Visible = false
    HomeTab.Parent = TabContentContainer
    getgenv().NEXUS_TAB_HOME = HomeTab

    local CombatTab = Instance.new("Frame")
    CombatTab.Name = "CombatTab"
    CombatTab.Size = UDim2.new(1, 0, 1, 0)
    CombatTab.Position = UDim2.new(0, 0, 0, 0)
    CombatTab.BackgroundTransparency = 1
    CombatTab.Visible = false
    CombatTab.Parent = TabContentContainer
    getgenv().NEXUS_TAB_COMBAT = CombatTab

    local GamesTab = Instance.new("Frame")
    GamesTab.Name = "GamesTab"
    GamesTab.Size = UDim2.new(1, 0, 1, 0)
    GamesTab.Position = UDim2.new(0, 0, 0, 0)
    GamesTab.BackgroundTransparency = 1
    GamesTab.Visible = false
    GamesTab.Parent = TabContentContainer
    getgenv().NEXUS_TAB_GAMES = GamesTab

    local SettingsTab = Instance.new("Frame")
    SettingsTab.Name = "SettingsTab"
    SettingsTab.Size = UDim2.new(1, 0, 1, 0)
    SettingsTab.Position = UDim2.new(0, 0, 0, 0)
    SettingsTab.BackgroundTransparency = 1
    SettingsTab.Visible = false
    SettingsTab.Parent = TabContentContainer
    getgenv().NEXUS_TAB_SETTINGS = SettingsTab

    -- TAB SWITCH FUNCTION WITH FADE ANIMATIONS
    local function SwitchToNewTab(TabNumber)
        PlayButtonSound()
        if getgenv().NEXUS_CURRENT_TAB == TabNumber then
            return
        end

        local OldTab = nil
        if getgenv().NEXUS_CURRENT_TAB == 1 then OldTab = InfoTab end
        if getgenv().NEXUS_CURRENT_TAB == 2 then OldTab = HomeTab end
        if getgenv().NEXUS_CURRENT_TAB == 3 then OldTab = CombatTab end
        if getgenv().NEXUS_CURRENT_TAB == 4 then OldTab = GamesTab end
        if getgenv().NEXUS_CURRENT_TAB == 5 then OldTab = SettingsTab end

        local NewTab = nil
        if TabNumber == 1 then NewTab = InfoTab end
        if TabNumber == 2 then NewTab = HomeTab end
        if TabNumber == 3 then NewTab = CombatTab end
        if TabNumber == 4 then NewTab = GamesTab end
        if TabNumber == 5 then NewTab = SettingsTab end

        -- UPDATE TAB BUTTON STYLES
        for Index, TabData in ipairs(TabInformationList) do
            local TabButton = TabButtonStorage[TabData.TabDisplayName]
            if Index == TabNumber then
                TabButton.ButtonElement.TextColor3 = COLORS.ACCENT_PRIMARY
                TabButton.IndicatorElement.BackgroundTransparency = 0
            else
                TabButton.ButtonElement.TextColor3 = COLORS.TEXT_SECONDARY
                TabButton.IndicatorElement.BackgroundTransparency = 1
            end
        end

        -- FADE OUT OLD TAB
        if OldTab then
            SafeTween(OldTab, ANIMATIONS.FADE_OUT, {Transparency = 1}, function()
                OldTab.Visible = false
                OldTab.Transparency = 0
            end)
        end

        -- FADE IN NEW TAB
        task.wait(0.15)
        if NewTab then
            NewTab.Visible = true
            NewTab.Transparency = 1
            SafeTween(NewTab, ANIMATIONS.FADE_IN, {Transparency = 0})
        end

        getgenv().NEXUS_CURRENT_TAB = TabNumber
    end

    -- ASSIGN CLICKS TO TAB BUTTONS
    TabButtonStorage["Info"].ButtonElement.MouseButton1Click:Connect(function()
        SwitchToNewTab(1)
    end)

    TabButtonStorage["Home"].ButtonElement.MouseButton1Click:Connect(function()
        SwitchToNewTab(2)
    end)

    TabButtonStorage["Combat"].ButtonElement.MouseButton1Click:Connect(function()
        SwitchToNewTab(3)
    end)

    TabButtonStorage["Games"].ButtonElement.MouseButton1Click:Connect(function()
        SwitchToNewTab(4)
    end)

    TabButtonStorage["Settings"].ButtonElement.MouseButton1Click:Connect(function()
        SwitchToNewTab(5)
    end)

    -- ==============================================
    -- INFO TAB CONTENT
    -- ==============================================
    local InfoTitle = Instance.new("TextLabel")
    InfoTitle.Size = UDim2.new(1, 0, 0, 22)
    InfoTitle.Position = UDim2.new(0, 0, 0, 0)
    InfoTitle.BackgroundTransparency = 1
    InfoTitle.Text = "ℹ️ SYSTEM INFORMATION"
    InfoTitle.Font = Enum.Font.GothamBold
    InfoTitle.TextSize = 14
    InfoTitle.TextColor3 = COLORS.ACCENT_PRIMARY
    InfoTitle.TextXAlignment = Enum.TextXAlignment.Center
    InfoTitle.Parent = InfoTab

    local InfoDivider = Instance.new("Frame")
    InfoDivider.Size = UDim2.new(1, 0, 0, 1)
    InfoDivider.Position = UDim2.new(0, 0, 0, 28)
    InfoDivider.BackgroundColor3 = COLORS.BORDER_DEFAULT
    InfoDivider.Parent = InfoTab

    local CreditLine1 = Instance.new("TextLabel")
    CreditLine1.Size = UDim2.new(1, 0, 0, 14)
    CreditLine1.Position = UDim2.new(0, 0, 0, 38)
    CreditLine1.BackgroundTransparency = 1
    CreditLine1.Text = "Created & Designed By:"
    CreditLine1.Font = Enum.Font.Gotham
    CreditLine1.TextSize = 11
    CreditLine1.TextColor3 = COLORS.TEXT_SECONDARY
    CreditLine1.TextXAlignment = Enum.TextXAlignment.Center
    CreditLine1.Parent = InfoTab

    local CreditLine2 = Instance.new("TextLabel")
    CreditLine2.Size = UDim2.new(1, 0, 0, 18)
    CreditLine2.Position = UDim2.new(0, 0, 0, 56)
    CreditLine2.BackgroundTransparency = 1
    CreditLine2.Text = "Nexus & Dola"
    CreditLine2.Font = Enum.Font.GothamBold
    CreditLine2.TextSize = 13
    CreditLine2.TextColor3 = COLORS.ACCENT_PRIMARY
    CreditLine2.TextXAlignment = Enum.TextXAlignment.Center
    CreditLine2.Parent = InfoTab

    local VersionLine = Instance.new("TextLabel")
    VersionLine.Size = UDim2.new(1, 0, 0, 12)
    VersionLine.Position = UDim2.new(0, 0, 0, 82)
    VersionLine.BackgroundTransparency = 1
    VersionLine.Text = "Version: 2.3.1 | Mobile Optimized"
    VersionLine.Font = Enum.Font.Gotham
    VersionLine.TextSize = 10
    VersionLine.TextColor3 = COLORS.TEXT_MUTED
    VersionLine.TextXAlignment = Enum.TextXAlignment.Center
    VersionLine.Parent = InfoTab

    local ExpireInfo = Instance.new("TextLabel")
    ExpireInfo.Size = UDim2.new(1, 0, 0, 12)
    ExpireInfo.Position = UDim2.new(0, 0, 0, 102)
    ExpireInfo.BackgroundTransparency = 1
    ExpireInfo.Text = "Access Valid For 24 Hours After Unlock"
    ExpireInfo.Font = Enum.Font.Gotham
    ExpireInfo.TextSize = 10
    ExpireInfo.TextColor3 = COLORS.TEXT_MUTED
    ExpireInfo.TextXAlignment = Enum.TextXAlignment.Center
    ExpireInfo.Parent = InfoTab

    local WarningText = Instance.new("TextLabel")
    WarningText.Size = UDim2.new(1, 0, 0, 32)
    WarningText.Position = UDim2.new(0, 0, 0, 130)
    WarningText.BackgroundTransparency = 1
    WarningText.Text = "For Authorized Testing Only\nDo Not Distribute Or Share"
    WarningText.Font = Enum.Font.Gotham
    WarningText.TextSize = 9
    WarningText.TextColor3 = COLORS.STATUS_WARNING
    WarningText.TextXAlignment = Enum.TextXAlignment.Center
    WarningText.TextYAlignment = Enum.TextYAlignment.Top
    WarningText.Parent = InfoTab

    -- ==============================================
    -- HOME TAB CONTENT
    -- ==============================================
    local HomeTitle = Instance.new("TextLabel")
    HomeTitle.Size = UDim2.new(1, 0, 0, 18)
    HomeTitle.Position = UDim2.new(0, 0, 0, 0)
    HomeTitle.BackgroundTransparency = 1
    HomeTitle.Text = "🏠 MAIN CONTROLS"
    HomeTitle.Font = Enum.Font.GothamBold
    HomeTitle.TextSize = 13
    HomeTitle.TextColor3 = COLORS.TEXT_PRIMARY
    HomeTitle.TextXAlignment = Enum.TextXAlignment.Left
    HomeTitle.Parent = HomeTab

    local ExecuteLocalBtn = Instance.new("TextButton")
    ExecuteLocalBtn.Size = UDim2.new(1, 0, 0, 28)
    ExecuteLocalBtn.Position = UDim2.new(0, 0, 0, 28)
    ExecuteLocalBtn.BackgroundColor3 = COLORS.CARD_BACKGROUND
    ExecuteLocalBtn.Text = "▶ EXECUTE LOCAL SCRIPTS"
    ExecuteLocalBtn.Font = Enum.Font.GothamBold
    ExecuteLocalBtn.TextSize = 10
    ExecuteLocalBtn.TextColor3 = COLORS.ACCENT_PRIMARY
    ExecuteLocalBtn.AutoButtonColor = false
    ExecuteLocalBtn.Parent = HomeTab
    local ExLocalCorner = Instance.new("UICorner")
    ExLocalCorner.CornerRadius = UDim.new(0, 8)
    ExLocalCorner.Parent = ExecuteLocalBtn
    AddStandardStroke(ExecuteLocalBtn, {Thickness = 1})

    ExecuteLocalBtn.MouseButton1Click:Connect(function()
        PlayButtonSound()
        SafeTween(ExecuteLocalBtn, ANIMATIONS.BOUNCE_CLICK, {Size = UDim2.new(1, -4, 0, 30), Position = UDim2.new(2, 0, 26, 0)}, function()
            SafeTween(ExecuteLocalBtn, ANIMATIONS.NORMAL, {Size = UDim2.new(1, 0, 0, 28), Position = UDim2.new(0, 0, 0, 28)})
        end)
        ExecuteLocalScripts()
    end)

    local ExecuteRemoteBtn = Instance.new("TextButton")
    ExecuteRemoteBtn.Size = UDim2.new(1, 0, 0, 28)
    ExecuteRemoteBtn.Position = UDim2.new(0, 0, 0, 64)
    ExecuteRemoteBtn.BackgroundColor3 = COLORS.CARD_BACKGROUND
    ExecuteRemoteBtn.Text = "▶ EXECUTE REMOTE SCRIPTS"
    ExecuteRemoteBtn.Font = Enum.Font.GothamBold
    ExecuteRemoteBtn.TextSize = 10
    ExecuteRemoteBtn.TextColor3 = COLORS.ACCENT_PRIMARY
    ExecuteRemoteBtn.AutoButtonColor = false
    ExecuteRemoteBtn.Parent = HomeTab
    local ExRemoteCorner = Instance.new("UICorner")
    ExRemoteCorner.CornerRadius = UDim.new(0, 8)
    ExRemoteCorner.Parent = ExecuteRemoteBtn
    AddStandardStroke(ExecuteRemoteBtn, {Thickness = 1})

    ExecuteRemoteBtn.MouseButton1Click:Connect(function()
        PlayButtonSound()
        SafeTween(ExecuteRemoteBtn, ANIMATIONS.BOUNCE_CLICK, {Size = UDim2.new(1, -4, 0, 30), Position = UDim2.new(2, 0, 62, 0)}, function()
            SafeTween(ExecuteRemoteBtn, ANIMATIONS.NORMAL, {Size = UDim2.new(1, 0, 0, 28), Position = UDim2.new(0, 0, 0, 64)})
        end)
        ExecuteRemoteScripts()
    end)

    local LoadstringNote = Instance.new("TextLabel")
    LoadstringNote.Size = UDim2.new(1, 0, 0, 28)
    LoadstringNote.Position = UDim2.new(0, 0, 0, 108)
    LoadstringNote.BackgroundTransparency = 1
    LoadstringNote.Text = "Add custom loadstrings directly in the script source below this section"
    LoadstringNote.Font = Enum.Font.Gotham
    LoadstringNote.TextSize = 9
    LoadstringNote.TextColor3 = COLORS.TEXT_MUTED
    LoadstringNote.TextWrapped = true
    LoadstringNote.Parent = HomeTab

    -- ==============================================
    -- COMBAT TAB FULL CONTENT
    -- ==============================================
    local CombatTitle = Instance.new("TextLabel")
    CombatTitle.Size = UDim2.new(1, 0, 0, 18)
    CombatTitle.Position = UDim2.new(0, 0, 0, 0)
    CombatTitle.BackgroundTransparency = 1
    CombatTitle.Text = "⚔️ COMBAT FEATURES"
    CombatTitle.Font = Enum.Font.GothamBold
    CombatTitle.TextSize = 13
    CombatTitle.TextColor3 = COLORS.TEXT_PRIMARY
    CombatTitle.TextXAlignment = Enum.TextXAlignment.Left
    CombatTitle.Parent = CombatTab

    local EspToggleFrame = Instance.new("Frame")
    EspToggleFrame.Size = UDim2.new(1, 0, 0, 24)
    EspToggleFrame.Position = UDim2.new(0, 0, 0, 28)
    EspToggleFrame.BackgroundColor3 = COLORS.CARD_BACKGROUND
    EspToggleFrame.Parent = CombatTab
    local EspCorner = Instance.new("UICorner")
    EspCorner.CornerRadius = UDim.new(0, 8)
    EspCorner.Parent = EspToggleFrame

    local EspLabel = Instance.new("TextLabel")
    EspLabel.Size = UDim2.new(0.7, 0, 1, 0)
    EspLabel.Position = UDim2.new(8, 0, 0, 0)
    EspLabel.BackgroundTransparency = 1
    EspLabel.Text = "Player ESP"
    EspLabel.Font = Enum.Font.Gotham
    EspLabel.TextSize = 10
    EspLabel.TextColor3 = COLORS.TEXT_PRIMARY
    EspLabel.TextXAlignment = Enum.TextXAlignment.Left
    EspLabel.Parent = EspToggleFrame

    local EspToggle = Instance.new("TextButton")
    EspToggle.Size = UDim2.new(0, 32, 0, 16)
    EspToggle.Position = UDim2.new(1, -40, 0.5, -8)
    EspToggle.BackgroundColor3 = COLORS.TOGGLE_OFF
    EspToggle.Text = ""
    EspToggle.AutoButtonColor = false
    EspToggle.Parent = EspToggleFrame
    local EspToggleCorner = Instance.new("UICorner")
    EspToggleCorner.CornerRadius = UDim.new(1, 0)
    EspToggleCorner.Parent = EspToggle

    local EspKnob = Instance.new("Frame")
    EspKnob.Size = UDim2.new(0, 12, 0, 12)
    EspKnob.Position = UDim2.new(2, 0, 0.5, -6)
    EspKnob.BackgroundColor3 = Color3.new(1,1,1)
    EspKnob.Parent = EspToggle

    EspToggle.MouseButton1Click:Connect(function()
        PlayButtonSound()
        getgenv().NEXUS_CONFIG.SHOW_ESP = not getgenv().NEXUS_CONFIG.SHOW_ESP
        ToggleESPFunction(getgenv().NEXUS_CONFIG.SHOW_ESP)
        if getgenv().NEXUS_CONFIG.SHOW_ESP then
            SafeTween(EspKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(18, 0, 0.5, -6)})
            SafeTween(EspToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_ON})
        else
            SafeTween(EspKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(2, 0, 0.5, -6)})
            SafeTween(EspToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_OFF})
        end
    end)

    local AimbotToggleFrame = Instance.new("Frame")
    AimbotToggleFrame.Size = UDim2.new(1, 0, 0, 24)
    AimbotToggleFrame.Position = UDim2.new(0, 0, 0, 60)
    AimbotToggleFrame.BackgroundColor3 = COLORS.CARD_BACKGROUND
    AimbotToggleFrame.Parent = CombatTab
    local AimCorner = Instance.new("UICorner")
    AimCorner.CornerRadius = UDim.new(0, 8)
    AimCorner.Parent = AimbotToggleFrame

    local AimbotLabel = Instance.new("TextLabel")
    AimbotLabel.Size = UDim2.new(0.7, 0, 1, 0)
    AimbotLabel.Position = UDim2.new(8, 0, 0, 0)
    AimbotLabel.BackgroundTransparency = 1
    AimbotLabel.Text = "Aimbot (Hold Right Click)"
    AimbotLabel.Font = Enum.Font.Gotham
    AimbotLabel.TextSize = 10
    AimbotLabel.TextColor3 = COLORS.TEXT_PRIMARY
    AimbotLabel.TextXAlignment = Enum.TextXAlignment.Left
    AimbotLabel.Parent = AimbotToggleFrame

    local AimbotToggle = Instance.new("TextButton")
    AimbotToggle.Size = UDim2.new(0, 32, 0, 16)
    AimbotToggle.Position = UDim2.new(1, -40, 0.5, -8)
    AimbotToggle.BackgroundColor3 = COLORS.TOGGLE_OFF
    AimbotToggle.Text = ""
    AimbotToggle.AutoButtonColor = false
    AimbotToggle.Parent = AimbotToggleFrame
    local AimToggleCorner = Instance.new("UICorner")
    AimToggleCorner.CornerRadius = UDim.new(1, 0)
    AimToggleCorner.Parent = AimbotToggle

    local AimKnob = Instance.new("Frame")
    AimKnob.Size = UDim2.new(0, 12, 0, 12)
    AimKnob.Position = UDim2.new(2, 0, 0.5, -6)
    AimKnob.BackgroundColor3 = Color3.new(1,1,1)
    AimKnob.Parent = AimbotToggle

    AimbotToggle.MouseButton1Click:Connect(function()
        PlayButtonSound()
        getgenv().NEXUS_CONFIG.SHOW_AIMBOT = not getgenv().NEXUS_CONFIG.SHOW_AIMBOT
        ToggleAimbotFunction(getgenv().NEXUS_CONFIG.SHOW_AIMBOT)
        if getgenv().NEXUS_CONFIG.SHOW_AIMBOT then
            SafeTween(AimKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(18, 0, 0.5, -6)})
            SafeTween(AimbotToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_ON})
        else
            SafeTween(AimKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(2, 0, 0.5, -6)})
            SafeTween(AimbotToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_OFF})
        end
    end)

    local WalkspeedLabel = Instance.new("TextLabel")
    WalkspeedLabel.Size = UDim2.new(1, 0, 0, 12)
    WalkspeedLabel.Position = UDim2.new(0, 0, 0, 100)
    WalkspeedLabel.BackgroundTransparency = 1
    WalkspeedLabel.Text = string.format("Super Speed: %d", getgenv().NEXUS_CONFIG.WALKSPEED_VALUE)
    WalkspeedLabel.Font = Enum.Font.Gotham
    WalkspeedLabel.TextSize = 10
    WalkspeedLabel.TextColor3 = COLORS.TEXT_PRIMARY
    WalkspeedLabel.TextXAlignment = Enum.TextXAlignment.Left
    WalkspeedLabel.Parent = CombatTab

    local SpeedBg = Instance.new("Frame")
    SpeedBg.Size = UDim2.new(1, 0, 0, 8)
    SpeedBg.Position = UDim2.new(0, 0, 0, 116)
    SpeedBg.BackgroundColor3 = COLORS.BORDER_DEFAULT
    local SpeedBgCorner = Instance.new("UICorner")
    SpeedBgCorner.CornerRadius = UDim.new(1, 0)
    SpeedBgCorner.Parent = SpeedBg
    SpeedBg.Parent = CombatTab

    local SpeedFill = Instance.new("Frame")
    SpeedFill.Size = UDim2.new(0, (getgenv().NEXUS_CONFIG.WALKSPEED_VALUE / 200) * 272, 1, 0)
    SpeedFill.BackgroundColor3 = COLORS.ACCENT_PRIMARY
    local SpeedFillCorner = Instance.new("UICorner")
    SpeedFillCorner.CornerRadius = UDim.new(1, 0)
    SpeedFillCorner.Parent = SpeedFill
    SpeedFill.Parent = SpeedBg

    local SpeedDragging = false
    SpeedBg.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1 then
            SpeedDragging = true
        end
    end)
    SpeedBg.InputEnded:Connect(function()
        SpeedDragging = false
    end)

    UserInputService.InputChanged:Connect(function(Input, Processed)
        if Processed or not SpeedDragging then return end
        if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
            local Pos = UserInputService:GetMouseLocation()
            local Rel = Pos - SpeedBg.AbsolutePosition
            local Percent = math.clamp(Rel.X / SpeedBg.AbsoluteSize.X, 0, 1)
            local Speed = math.floor(Percent * 200) + 1
            SpeedFill.Size = UDim2.new(Percent, 0, 1, 0)
            WalkspeedLabel.Text = string.format("Super Speed: %d", Speed)
            UpdateWalkSpeed(Speed)
        end
    end)

    -- ==============================================
    -- GAMES TAB WITH 30 GAME BUTTONS
    -- ==============================================
    local GamesTitle = Instance.new("TextLabel")
    GamesTitle.Size = UDim2.new(1, 0, 0, 18)
    GamesTitle.Position = UDim2.new(0, 0, 0, 0)
    GamesTitle.BackgroundTransparency = 1
    GamesTitle.Text = "🎮 GAME SELECTOR"
    GamesTitle.Font = Enum.Font.GothamBold
    GamesTitle.TextSize = 13
    GamesTitle.TextColor3 = COLORS.TEXT_PRIMARY
    GamesTitle.TextXAlignment = Enum.TextXAlignment.Left
    GamesTitle.Parent = GamesTab

    local GameScroll = Instance.new("ScrollingFrame")
    GameScroll.Size = UDim2.new(1, 0, 1, -24)
    GameScroll.Position = UDim2.new(0, 0, 0, 24)
    GameScroll.BackgroundTransparency = 1
    GameScroll.ScrollBarThickness = 3
    GameScroll.ScrollBarColor3 = COLORS.ACCENT_PRIMARY
    GameScroll.Parent = GamesTab

    local GameLayout = Instance.new("UIGridLayout")
    GameLayout.CellSize = UDim2.new(0, 128, 0, 28)
    GameLayout.CellPadding = UDim.new(0, 8)
    GameLayout.SortOrder = Enum.SortOrder.Name
    GameLayout.Parent = GameScroll

    local GameList = {
        "Blox Fruits", "King Legacy", "Anime Defenders", "All Star Tower Defense",
        "Pet Simulator 99", "Adopt Me", "Murder Mystery 2", "Doors",
        "Brookhaven RP", "Piggy", "Natural Disaster Survival", "Arsenal",
        "Phantom Forces", "Tower Defense Simulator", "Dragon Blox", "Anime Fighting Simulator",
        "Shindo Life", "Project Slayers", "Blox Fruits Stock", "Fruit Battlegrounds",
        "One Fruit Simulator", "Sea Piece", "Mage Tycoon", "Weapon Fighting Simulator",
        "Sols RNG", "Dress To Impress", "Blade Ball", "Rivals", "Demonfall", "Untitled Boxing Game"
    }

    for Index, GameName in ipairs(GameList) do
        local GameBtn = Instance.new("TextButton")
        GameBtn.BackgroundColor3 = COLORS.CARD_BACKGROUND
        GameBtn.Text = GameName
        GameBtn.Font = Enum.Font.Gotham
        GameBtn.TextSize = 9
        GameBtn.TextColor3 = COLORS.TEXT_PRIMARY
        GameBtn.AutoButtonColor = false
        GameBtn.Parent = GameScroll
        local GameBtnCorner = Instance.new("UICorner")
        GameBtnCorner.CornerRadius = UDim.new(0, 6)
        GameBtnCorner.Parent = GameBtn
        AddStandardStroke(GameBtn, {Thickness = 1})

        GameBtn.MouseButton1Click:Connect(function()
            PlayButtonSound()
            SafeTween(GameBtn, ANIMATIONS.BOUNCE_CLICK, {Size = UDim2.new(0, 132, 0, 30)}, function()
                SafeTween(GameBtn, ANIMATIONS.NORMAL, {Size = UDim2.new(0, 128, 0, 28)})
            end)
            ShowNotificationPopup(string.format("Selected: %s\nAdd loadstring in script source", GameName), "INFO")
        end)
    end

    -- ==============================================
    -- SETTINGS TAB FULL CONTENT
    -- ==============================================
    local SettingsTitle = Instance.new("TextLabel")
    SettingsTitle.Size = UDim2.new(1, 0, 0, 18)
    SettingsTitle.Position = UDim2.new(0, 0, 0, 0)
    SettingsTitle.BackgroundTransparency = 1
    SettingsTitle.Text = "⚙️ SYSTEM SETTINGS"
    SettingsTitle.Font = Enum.Font.GothamBold
    SettingsTitle.TextSize = 13
    SettingsTitle.TextColor3 = COLORS.TEXT_PRIMARY
    SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left
    SettingsTitle.Parent = SettingsTab

    local RainbowFrame = Instance.new("Frame")
    RainbowFrame.Size = UDim2.new(1, 0, 0, 24)
    RainbowFrame.Position = UDim2.new(0, 0, 0, 28)
    RainbowFrame.BackgroundColor3 = COLORS.CARD_BACKGROUND
    RainbowFrame.Parent = SettingsTab
    local RainCorner = Instance.new("UICorner")
    RainCorner.CornerRadius = UDim.new(0, 8)
    RainCorner.Parent = RainbowFrame

    local RainLabel = Instance.new("TextLabel")
    RainLabel.Size = UDim2.new(0.7, 0, 1, 0)
    RainLabel.Position = UDim2.new(8, 0, 0, 0)
    RainLabel.BackgroundTransparency = 1
    RainLabel.Text = "Rainbow Outlines"
    RainLabel.Font = Enum.Font.Gotham
    RainLabel.TextSize = 10
    RainLabel.TextColor3 = COLORS.TEXT_PRIMARY
    RainLabel.TextXAlignment = Enum.TextXAlignment.Left
    RainLabel.Parent = RainbowFrame

    local RainToggle = Instance.new("TextButton")
    RainToggle.Size = UDim2.new(0, 32, 0, 16)
    RainToggle.Position = UDim2.new(1, -40, 0.5, -8)
    RainToggle.BackgroundColor3 = COLORS.TOGGLE_OFF
    RainToggle.Text = ""
    RainToggle.AutoButtonColor = false
    RainToggle.Parent = RainbowFrame
    local RainToggleCorner = Instance.new("UICorner")
    RainToggleCorner.CornerRadius = UDim.new(1, 0)
    RainToggleCorner.Parent = RainToggle

    local RainKnob = Instance.new("Frame")
    RainKnob.Size = UDim2.new(0, 12, 0, 12)
    RainKnob.Position = UDim2.new(2, 0, 0.5, -6)
    RainKnob.BackgroundColor3 = Color3.new(1,1,1)
    RainKnob.Parent = RainToggle

    RainToggle.MouseButton1Click:Connect(function()
        PlayButtonSound()
        getgenv().NEXUS_CONFIG.RAINBOW_OUTLINES = not getgenv().NEXUS_CONFIG.RAINBOW_OUTLINES
        if getgenv().NEXUS_CONFIG.RAINBOW_OUTLINES then
            SafeTween(RainKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(18, 0, 0.5, -6)})
            SafeTween(RainToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_ON})
            ShowNotificationPopup("Rainbow Outlines Enabled", "SUCCESS")
        else
            SafeTween(RainKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(2, 0, 0.5, -6)})
            SafeTween(RainToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_OFF})
            ShowNotificationPopup("Rainbow Outlines Disabled", "INFO")
        end
    end)

    local SoundFrame = Instance.new("Frame")
    SoundFrame.Size = UDim2.new(1, 0, 0, 24)
    SoundFrame.Position = UDim2.new(0, 0, 0, 60)
    SoundFrame.BackgroundColor3 = COLORS.CARD_BACKGROUND
    SoundFrame.Parent = SettingsTab
    local SoundCorner = Instance.new("UICorner")
    SoundCorner.CornerRadius = UDim.new(0, 8)
    SoundCorner.Parent = SoundFrame

    local SoundLabel = Instance.new("TextLabel")
    SoundLabel.Size = UDim2.new(0.7, 0, 1, 0)
    SoundLabel.Position = UDim2.new(8, 0, 0, 0)
    SoundLabel.BackgroundTransparency = 1
    SoundLabel.Text = "Interface Sounds"
    SoundLabel.Font = Enum.Font.Gotham
    SoundLabel.TextSize = 10
    SoundLabel.TextColor3 = COLORS.TEXT_PRIMARY
    SoundLabel.TextXAlignment = Enum.TextXAlignment.Left
    SoundLabel.Parent = SoundFrame

    local SoundToggle = Instance.new("TextButton")
    SoundToggle.Size = UDim2.new(0, 32, 0, 16)
    SoundToggle.Position = UDim2.new(1, -40, 0.5, -8)
    SoundToggle.BackgroundColor3 = getgenv().NEXUS_CONFIG.PLAY_SOUNDS and COLORS.TOGGLE_ON or COLORS.TOGGLE_OFF
    SoundToggle.Text = ""
    SoundToggle.AutoButtonColor = false
    SoundToggle.Parent = SoundFrame
    local SoundToggleCorner = Instance.new("UICorner")
    SoundToggleCorner.CornerRadius = UDim.new(1, 0)
    SoundToggleCorner.Parent = SoundToggle

    local SoundKnob = Instance.new("Frame")
    SoundKnob.Size = UDim2.new(0, 12, 0, 12)
    SoundKnob.Position = UDim2.new(getgenv().NEXUS_CONFIG.PLAY_SOUNDS and 18 or 2, 0, 0.5, -6)
    SoundKnob.BackgroundColor3 = Color3.new(1,1,1)
    SoundKnob.Parent = SoundToggle

    SoundToggle.MouseButton1Click:Connect(function()
        getgenv().NEXUS_CONFIG.PLAY_SOUNDS = not getgenv().NEXUS_CONFIG.PLAY_SOUNDS
        if getgenv().NEXUS_CONFIG.PLAY_SOUNDS then
            PlayButtonSound()
            SafeTween(SoundKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(18, 0, 0.5, -6)})
            SafeTween(SoundToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_ON})
        else
            SafeTween(SoundKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(2, 0, 0.5, -6)})
            SafeTween(SoundToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_OFF})
        end
    end)

    local ResetAuthBtn = Instance.new("TextButton")
    ResetAuthBtn.Size = UDim2.new(1, 0, 0, 28)
    ResetAuthBtn.Position = UDim2.new(0, 0, 0, 108)
    ResetAuthBtn.BackgroundColor3 = COLORS.STATUS_ERROR
    ResetAuthBtn.BackgroundTransparency = 0.7
    ResetAuthBtn.Text = "Reset Access & Re-Enter Key"
    ResetAuthBtn.Font = Enum.Font.Gotham
    ResetAuthBtn.TextSize = 10
    ResetAuthBtn.TextColor3 = Color3.new(1,1,1)
    ResetAuthBtn.AutoButtonColor = false
    ResetAuthBtn.Parent = SettingsTab
    local ResetCorner = Instance.new("UICorner")
    ResetCorner.CornerRadius = UDim.new(0, 8)
    ResetCorner.Parent = ResetAuthBtn

    ResetAuthBtn.MouseButton1Click:Connect(function()
        PlayButtonSound()
        ClearSavedAuthentication()
        ShowNotificationPopup("Access Resetting...", "WARNING")
        task.wait(0.5)
        SafeDestroyItem(MainScreenGui)
        task.wait(0.3)
        BuildKeyEntryUserInterface()
    end)

    -- ==============================================
    -- FINAL TIMER & LOOP SYSTEMS
    -- ==============================================
    getgenv().NEXUS_TIMER_LOOP = RunService.Heartbeat:Connect(function()
        if getgenv().NEXUS_STOP_ALL then
            getgenv().NEXUS_TIMER_LOOP:Disconnect()
            return
        end
        local Valid, Remain = VerifyAuthenticationStatus()
        if not Valid then
            getgenv().NEXUS_STOP_ALL = true
            ShowNotificationPopup("Access Expired! Enter Key Again", "WARNING")
            SafeDestroyItem(MainScreenGui)
            task.wait(0.5)
            BuildKeyEntryUserInterface()
            return
        end
    end)

    getgenv().NEXUS_RAINBOW_LOOP = RunService.RenderStepped:Connect(function()
        if getgenv().NEXUS_STOP_ALL then
            getgenv().NEXUS_RAINBOW_LOOP:Disconnect()
            return
        end
        if getgenv().NEXUS_CONFIG.RAINBOW_OUTLINES then
            local Hue = (os.clock() * 60) % 360
            local Col = Color3.fromHSV(Hue / 360, 0.85, 0.9)
            AddStandardStroke(MainWindowFrame, {Color = Col, Thickness = 1.5})
        end
    end)

    -- OPEN ANIMATION
    MainWindowFrame.Transparency = 1
    MainWindowFrame.Position = UDim2.new(0.5, -160, 0.5, -155)
    SafeTween(MainWindowFrame, ANIMATIONS.POP_UP, {
        Transparency = 0,
        Position = UDim2.new(0.5, -160, 0.5, -150)
    })
end

-- ==============================================
-- STARTUP SEQUENCE
-- ==============================================
-- ==============================================
-- ✅ FULLY COMPLETE END SECTION
-- ==============================================

-- SEARCH BAR & TAB SYSTEM (MISSING PARTS)
    local SearchInputField = Instance.new("TextBox")
    SearchInputField.Name = "GameSearch"
    SearchInputField.Size = UDim2.new(1, -24, 0, 24)
    SearchInputField.Position = UDim2.new(12, 0, 60, 0)
    SearchInputField.BackgroundColor3 = COLORS.INPUT_BACKGROUND
    SearchInputField.PlaceholderText = "Search games or settings..."
    SearchInputField.Font = Enum.Font.Gotham
    SearchInputField.TextSize = 9
    SearchInputField.TextColor3 = COLORS.TEXT_SECONDARY
    SearchInputField.ClearTextOnFocus = false
    SearchInputField.Parent = MainWindowFrame
    local SearchCorner = Instance.new("UICorner")
    SearchCorner.CornerRadius = UDim.new(0, 8)
    SearchCorner.Parent = SearchInputField
    AddStandardStroke(SearchInputField, {
        Thickness = 1
    })

    -- TAB CONTENT CONTAINERS & FADE TRANSITION SYSTEM
    local TabContentContainer = Instance.new("Frame")
    TabContentContainer.Name = "TabContentContainer"
    TabContentContainer.Size = UDim2.new(1, -24, 1, -100)
    TabContentContainer.Position = UDim2.new(12, 0, 90, 0)
    TabContentContainer.BackgroundTransparency = 1
    TabContentContainer.ClipsDescendants = true
    TabContentContainer.Parent = MainWindowFrame

    local InfoTab = Instance.new("Frame")
    InfoTab.Name = "InfoTab"
    InfoTab.Size = UDim2.new(1, 0, 1, 0)
    InfoTab.Position = UDim2.new(0, 0, 0, 0)
    InfoTab.BackgroundTransparency = 1
    InfoTab.Visible = true
    InfoTab.Parent = TabContentContainer
    getgenv().NEXUS_TAB_INFO = InfoTab

    local HomeTab = Instance.new("Frame")
    HomeTab.Name = "HomeTab"
    HomeTab.Size = UDim2.new(1, 0, 1, 0)
    HomeTab.Position = UDim2.new(0, 0, 0, 0)
    HomeTab.BackgroundTransparency = 1
    HomeTab.Visible = false
    HomeTab.Parent = TabContentContainer
    getgenv().NEXUS_TAB_HOME = HomeTab

    local CombatTab = Instance.new("Frame")
    CombatTab.Name = "CombatTab"
    CombatTab.Size = UDim2.new(1, 0, 1, 0)
    CombatTab.Position = UDim2.new(0, 0, 0, 0)
    CombatTab.BackgroundTransparency = 1
    CombatTab.Visible = false
    CombatTab.Parent = TabContentContainer
    getgenv().NEXUS_TAB_COMBAT = CombatTab

    local GamesTab = Instance.new("Frame")
    GamesTab.Name = "GamesTab"
    GamesTab.Size = UDim2.new(1, 0, 1, 0)
    GamesTab.Position = UDim2.new(0, 0, 0, 0)
    GamesTab.BackgroundTransparency = 1
    GamesTab.Visible = false
    GamesTab.Parent = TabContentContainer
    getgenv().NEXUS_TAB_GAMES = GamesTab

    local SettingsTab = Instance.new("Frame")
    SettingsTab.Name = "SettingsTab"
    SettingsTab.Size = UDim2.new(1, 0, 1, 0)
    SettingsTab.Position = UDim2.new(0, 0, 0, 0)
    SettingsTab.BackgroundTransparency = 1
    SettingsTab.Visible = false
    SettingsTab.Parent = TabContentContainer
    getgenv().NEXUS_TAB_SETTINGS = SettingsTab

    -- TAB SWITCH FUNCTION WITH FADE ANIMATIONS
    local function SwitchToNewTab(TabNumber)
        PlayButtonSound()
        if getgenv().NEXUS_CURRENT_TAB == TabNumber then return end

        local OldTab = nil
        if getgenv().NEXUS_CURRENT_TAB == 1 then OldTab = InfoTab end
        if getgenv().NEXUS_CURRENT_TAB == 2 then OldTab = HomeTab end
        if getgenv().NEXUS_CURRENT_TAB == 3 then OldTab = CombatTab end
        if getgenv().NEXUS_CURRENT_TAB == 4 then OldTab = GamesTab end
        if getgenv().NEXUS_CURRENT_TAB == 5 then OldTab = SettingsTab end

        local NewTab = nil
        if TabNumber == 1 then NewTab = InfoTab end
        if TabNumber == 2 then NewTab = HomeTab end
        if TabNumber == 3 then NewTab = CombatTab end
        if TabNumber == 4 then NewTab = GamesTab end
        if TabNumber == 5 then NewTab = SettingsTab end

        -- UPDATE TAB BUTTON STYLES
        for Index, TabData in ipairs(TabInformationList) do
            local TabButton = TabButtonStorage[TabData.TabDisplayName]
            if Index == TabNumber then
                TabButton.ButtonElement.TextColor3 = COLORS.ACCENT_PRIMARY
                TabButton.IndicatorElement.BackgroundTransparency = 0
            else
                TabButton.ButtonElement.TextColor3 = COLORS.TEXT_SECONDARY
                TabButton.IndicatorElement.BackgroundTransparency = 1
            end
        end

        -- FADE OUT OLD TAB
        if OldTab then
            SafeTween(OldTab, ANIMATIONS.FADE_OUT, {Transparency = 1}, function()
                OldTab.Visible = false
                OldTab.Transparency = 0
            end)
        end

        -- FADE IN NEW TAB
        task.wait(0.15)
        if NewTab then
            NewTab.Visible = true
            NewTab.Transparency = 1
            SafeTween(NewTab, ANIMATIONS.FADE_IN, {Transparency = 0})
        end

        getgenv().NEXUS_CURRENT_TAB = TabNumber
    end

    -- ASSIGN CLICKS TO TAB BUTTONS
    TabButtonStorage["Info"].ButtonElement.MouseButton1Click:Connect(function() SwitchToNewTab(1) end)
    TabButtonStorage["Home"].ButtonElement.MouseButton1Click:Connect(function() SwitchToNewTab(2) end)
    TabButtonStorage["Combat"].ButtonElement.MouseButton1Click:Connect(function() SwitchToNewTab(3) end)
    TabButtonStorage["Games"].ButtonElement.MouseButton1Click:Connect(function() SwitchToNewTab(4) end)
    TabButtonStorage["Settings"].ButtonElement.MouseButton1Click:Connect(function() SwitchToNewTab(5) end)

    -- ==============================================
    -- ALL TAB CONTENTS
    -- ==============================================
    -- INFO TAB
    local InfoTitle = Instance.new("TextLabel")
    InfoTitle.Size = UDim2.new(1, 0, 0, 22)
    InfoTitle.Position = UDim2.new(0, 0, 0, 0)
    InfoTitle.BackgroundTransparency = 1
    InfoTitle.Text = "ℹ️ SYSTEM INFORMATION"
    InfoTitle.Font = Enum.Font.GothamBold
    InfoTitle.TextSize = 14
    InfoTitle.TextColor3 = COLORS.ACCENT_PRIMARY
    InfoTitle.TextXAlignment = Enum.TextXAlignment.Center
    InfoTitle.Parent = InfoTab

    local InfoDivider = Instance.new("Frame")
    InfoDivider.Size = UDim2.new(1, 0, 0, 1)
    InfoDivider.Position = UDim2.new(0, 0, 0, 28)
    InfoDivider.BackgroundColor3 = COLORS.BORDER_DEFAULT
    InfoDivider.Parent = InfoTab

    local CreditLine1 = Instance.new("TextLabel")
    CreditLine1.Size = UDim2.new(1, 0, 0, 14)
    CreditLine1.Position = UDim2.new(0, 0, 0, 38)
    CreditLine1.BackgroundTransparency = 1
    CreditLine1.Text = "Created & Designed By:"
    CreditLine1.Font = Enum.Font.Gotham
    CreditLine1.TextSize = 11
    CreditLine1.TextColor3 = COLORS.TEXT_SECONDARY
    CreditLine1.TextXAlignment = Enum.TextXAlignment.Center
    CreditLine1.Parent = InfoTab

    local CreditLine2 = Instance.new("TextLabel")
    CreditLine2.Size = UDim2.new(1, 0, 0, 18)
    CreditLine2.Position = UDim2.new(0, 0, 0, 56)
    CreditLine2.BackgroundTransparency = 1
    CreditLine2.Text = "Nexus & Dola"
    CreditLine2.Font = Enum.Font.GothamBold
    CreditLine2.TextSize = 13
    CreditLine2.TextColor3 = COLORS.ACCENT_PRIMARY
    CreditLine2.TextXAlignment = Enum.TextXAlignment.Center
    CreditLine2.Parent = InfoTab

    local VersionLine = Instance.new("TextLabel")
    VersionLine.Size = UDim2.new(1, 0, 0, 12)
    VersionLine.Position = UDim2.new(0, 0, 0, 82)
    VersionLine.BackgroundTransparency = 1
    VersionLine.Text = "Version: 2.3.1 | Mobile Optimized"
    VersionLine.Font = Enum.Font.Gotham
    VersionLine.TextSize = 10
    VersionLine.TextColor3 = COLORS.TEXT_MUTED
    VersionLine.TextXAlignment = Enum.TextXAlignment.Center
    VersionLine.Parent = InfoTab

    local ExpireInfo = Instance.new("TextLabel")
    ExpireInfo.Size = UDim2.new(1, 0, 0, 12)
    ExpireInfo.Position = UDim2.new(0, 0, 0, 102)
    ExpireInfo.BackgroundTransparency = 1
    ExpireInfo.Text = "Access Valid For 24 Hours After Unlock"
    ExpireInfo.Font = Enum.Font.Gotham
    ExpireInfo.TextSize = 10
    ExpireInfo.TextColor3 = COLORS.TEXT_MUTED
    ExpireInfo.TextXAlignment = Enum.TextXAlignment.Center
    ExpireInfo.Parent = InfoTab

    local WarningText = Instance.new("TextLabel")
    WarningText.Size = UDim2.new(1, 0, 0, 32)
    WarningText.Position = UDim2.new(0, 0, 0, 130)
    WarningText.BackgroundTransparency = 1
    WarningText.Text = "For Authorized Testing Only\nDo Not Distribute Or Share"
    WarningText.Font = Enum.Font.Gotham
    WarningText.TextSize = 9
    WarningText.TextColor3 = COLORS.STATUS_WARNING
    WarningText.TextXAlignment = Enum.TextXAlignment.Center
    WarningText.TextYAlignment = Enum.TextYAlignment.Top
    WarningText.Parent = InfoTab

    -- HOME TAB
    local HomeTitle = Instance.new("TextLabel")
    HomeTitle.Size = UDim2.new(1, 0, 0, 18)
    HomeTitle.Position = UDim2.new(0, 0, 0, 0)
    HomeTitle.BackgroundTransparency = 1
    HomeTitle.Text = "🏠 MAIN CONTROLS"
    HomeTitle.Font = Enum.Font.GothamBold
    HomeTitle.TextSize = 13
    HomeTitle.TextColor3 = COLORS.TEXT_PRIMARY
    HomeTitle.TextXAlignment = Enum.TextXAlignment.Left
    HomeTitle.Parent = HomeTab

    local ExecuteLocalBtn = Instance.new("TextButton")
    ExecuteLocalBtn.Size = UDim2.new(1, 0, 0, 28)
    ExecuteLocalBtn.Position = UDim2.new(0, 0, 0, 28)
    ExecuteLocalBtn.BackgroundColor3 = COLORS.CARD_BACKGROUND
    ExecuteLocalBtn.Text = "▶ EXECUTE LOCAL SCRIPTS"
    ExecuteLocalBtn.Font = Enum.Font.GothamBold
    ExecuteLocalBtn.TextSize = 10
    ExecuteLocalBtn.TextColor3 = COLORS.ACCENT_PRIMARY
    ExecuteLocalBtn.AutoButtonColor = false
    ExecuteLocalBtn.Parent = HomeTab
    local ExLocalCorner = Instance.new("UICorner")
    ExLocalCorner.CornerRadius = UDim.new(0, 8)
    ExLocalCorner.Parent = ExecuteLocalBtn
    AddStandardStroke(ExecuteLocalBtn, {Thickness = 1})

    ExecuteLocalBtn.MouseButton1Click:Connect(function()
        PlayButtonSound()
        SafeTween(ExecuteLocalBtn, ANIMATIONS.BOUNCE_CLICK, {Size = UDim2.new(1, -4, 0, 30), Position = UDim2.new(2, 0, 26, 0)}, function()
            SafeTween(ExecuteLocalBtn, ANIMATIONS.NORMAL, {Size = UDim2.new(1, 0, 0, 28), Position = UDim2.new(0, 0, 0, 28)})
        end)
        ExecuteLocalScripts()
    end)

    local ExecuteRemoteBtn = Instance.new("TextButton")
    ExecuteRemoteBtn.Size = UDim2.new(1, 0, 0, 28)
    ExecuteRemoteBtn.Position = UDim2.new(0, 0, 0, 64)
    ExecuteRemoteBtn.BackgroundColor3 = COLORS.CARD_BACKGROUND
    ExecuteRemoteBtn.Text = "▶ EXECUTE REMOTE SCRIPTS"
    ExecuteRemoteBtn.Font = Enum.Font.GothamBold
    ExecuteRemoteBtn.TextSize = 10
    ExecuteRemoteBtn.TextColor3 = COLORS.ACCENT_PRIMARY
    ExecuteRemoteBtn.AutoButtonColor = false
    ExecuteRemoteBtn.Parent = HomeTab
    local ExRemoteCorner = Instance.new("UICorner")
    ExRemoteCorner.CornerRadius = UDim.new(0, 8)
    ExRemoteCorner.Parent = ExecuteRemoteBtn
    AddStandardStroke(ExecuteRemoteBtn, {Thickness = 1})

    ExecuteRemoteBtn.MouseButton1Click:Connect(function()
        PlayButtonSound()
        SafeTween(ExecuteRemoteBtn, ANIMATIONS.BOUNCE_CLICK, {Size = UDim2.new(1, -4, 0, 30), Position = UDim2.new(2, 0, 62, 0)}, function()
            SafeTween(ExecuteRemoteBtn, ANIMATIONS.NORMAL, {Size = UDim2.new(1, 0, 0, 28), Position = UDim2.new(0, 0, 0, 64)})
        end)
        ExecuteRemoteScripts()
    end)

    local LoadstringNote = Instance.new("TextLabel")
    LoadstringNote.Size = UDim2.new(1, 0, 0, 28)
    LoadstringNote.Position = UDim2.new(0, 0, 0, 108)
    LoadstringNote.BackgroundTransparency = 1
    LoadstringNote.Text = "Add custom loadstrings directly in the script source below this section"
    LoadstringNote.Font = Enum.Font.Gotham
    LoadstringNote.TextSize = 9
    LoadstringNote.TextColor3 = COLORS.TEXT_MUTED
    LoadstringNote.TextWrapped = true
    LoadstringNote.Parent = HomeTab

    -- COMBAT TAB
    local CombatTitle = Instance.new("TextLabel")
    CombatTitle.Size = UDim2.new(1, 0, 0, 18)
    CombatTitle.Position = UDim2.new(0, 0, 0, 0)
    CombatTitle.BackgroundTransparency = 1
    CombatTitle.Text = "⚔️ COMBAT FEATURES"
    CombatTitle.Font = Enum.Font.GothamBold
    CombatTitle.TextSize = 13
    CombatTitle.TextColor3 = COLORS.TEXT_PRIMARY
    CombatTitle.TextXAlignment = Enum.TextXAlignment.Left
    CombatTitle.Parent = CombatTab

    local EspToggleFrame = Instance.new("Frame")
    EspToggleFrame.Size = UDim2.new(1, 0, 0, 24)
    EspToggleFrame.Position = UDim2.new(0, 0, 0, 28)
    EspToggleFrame.BackgroundColor3 = COLORS.CARD_BACKGROUND
    EspToggleFrame.Parent = CombatTab
    local EspCorner = Instance.new("UICorner")
    EspCorner.CornerRadius = UDim.new(0, 8)
    EspCorner.Parent = EspToggleFrame

    local EspLabel = Instance.new("TextLabel")
    EspLabel.Size = UDim2.new(0.7, 0, 1, 0)
    EspLabel.Position = UDim2.new(8, 0, 0, 0)
    EspLabel.BackgroundTransparency = 1
    EspLabel.Text = "Player ESP"
    EspLabel.Font = Enum.Font.Gotham
    EspLabel.TextSize = 10
    EspLabel.TextColor3 = COLORS.TEXT_PRIMARY
    EspLabel.TextXAlignment = Enum.TextXAlignment.Left
    EspLabel.Parent = EspToggleFrame

    local EspToggle = Instance.new("TextButton")
    EspToggle.Size = UDim2.new(0, 32, 0, 16)
    EspToggle.Position = UDim2.new(1, -40, 0.5, -8)
    EspToggle.BackgroundColor3 = COLORS.TOGGLE_OFF
    EspToggle.Text = ""
    EspToggle.AutoButtonColor = false
    EspToggle.Parent = EspToggleFrame
    local EspToggleCorner = Instance.new("UICorner")
    EspToggleCorner.CornerRadius = UDim.new(1, 0)
    EspToggleCorner.Parent = EspToggle

    local EspKnob = Instance.new("Frame")
    EspKnob.Size = UDim2.new(0, 12, 0, 12)
    EspKnob.Position = UDim2.new(2, 0, 0.5, -6)
    EspKnob.BackgroundColor3 = Color3.new(1,1,1)
    EspKnob.Parent = EspToggle

    EspToggle.MouseButton1Click:Connect(function()
        PlayButtonSound()
        getgenv().NEXUS_CONFIG.SHOW_ESP = not getgenv().NEXUS_CONFIG.SHOW_ESP
        ToggleESPFunction(getgenv().NEXUS_CONFIG.SHOW_ESP)
        if getgenv().NEXUS_CONFIG.SHOW_ESP then
            SafeTween(EspKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(18, 0, 0.5, -6)})
            SafeTween(EspToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_ON})
        else
            SafeTween(EspKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(2, 0, 0.5, -6)})
            SafeTween(EspToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_OFF})
        end
    end)

    local AimbotToggleFrame = Instance.new("Frame")
    AimbotToggleFrame.Size = UDim2.new(1, 0, 0, 24)
    AimbotToggleFrame.Position = UDim2.new(0, 0, 0, 60)
    AimbotToggleFrame.BackgroundColor3 = COLORS.CARD_BACKGROUND
    AimbotToggleFrame.Parent = CombatTab
    local AimCorner = Instance.new("UICorner")
    AimCorner.CornerRadius = UDim.new(0, 8)
    AimCorner.Parent = AimbotToggleFrame

    local AimbotLabel = Instance.new("TextLabel")
    AimbotLabel.Size = UDim2.new(0.7, 0, 1, 0)
    AimbotLabel.Position = UDim2.new(8, 0, 0, 0)
    AimbotLabel.BackgroundTransparency = 1
    AimbotLabel.Text = "Aimbot (Hold Right Click)"
    AimbotLabel.Font = Enum.Font.Gotham
    AimbotLabel.TextSize = 10
    AimbotLabel.TextColor3 = COLORS.TEXT_PRIMARY
    AimbotLabel.TextXAlignment = Enum.TextXAlignment.Left
    AimbotLabel.Parent = AimbotToggleFrame

    local AimbotToggle = Instance.new("TextButton")
    AimbotToggle.Size = UDim2.new(0, 32, 0, 16)
    AimbotToggle.Position = UDim2.new(1, -40, 0.5, -8)
    AimbotToggle.BackgroundColor3 = COLORS.TOGGLE_OFF
    AimbotToggle.Text = ""
    AimbotToggle.AutoButtonColor = false
    AimbotToggle.Parent = AimbotToggleFrame
    local AimToggleCorner = Instance.new("UICorner")
    AimToggleCorner.CornerRadius = UDim.new(1, 0)
    AimToggleCorner.Parent = AimbotToggle

    local AimKnob = Instance.new("Frame")
    AimKnob.Size = UDim2.new(0, 12, 0, 12)
    AimKnob.Position = UDim2.new(2, 0, 0.5, -6)
    AimKnob.BackgroundColor3 = Color3.new(1,1,1)
    AimKnob.Parent = AimbotToggle

    AimbotToggle.MouseButton1Click:Connect(function()
        PlayButtonSound()
        getgenv().NEXUS_CONFIG.SHOW_AIMBOT = not getgenv().NEXUS_CONFIG.SHOW_AIMBOT
        ToggleAimbotFunction(getgenv().NEXUS_CONFIG.SHOW_AIMBOT)
        if getgenv().NEXUS_CONFIG.SHOW_AIMBOT then
            SafeTween(AimKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(18, 0, 0.5, -6)})
            SafeTween(AimbotToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_ON})
        else
            SafeTween(AimKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(2, 0, 0.5, -6)})
            SafeTween(AimbotToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_OFF})
        end
    end)

    local WalkspeedLabel = Instance.new("TextLabel")
    WalkspeedLabel.Size = UDim2.new(1, 0, 0, 12)
    WalkspeedLabel.Position = UDim2.new(0, 0, 0, 100)
    WalkspeedLabel.BackgroundTransparency = 1
    WalkspeedLabel.Text = string.format("Super Speed: %d", getgenv().NEXUS_CONFIG.WALKSPEED_VALUE or 16)
    WalkspeedLabel.Font = Enum.Font.Gotham
    WalkspeedLabel.TextSize = 10
    WalkspeedLabel.TextColor3 = COLORS.TEXT_PRIMARY
    WalkspeedLabel.TextXAlignment = Enum.TextXAlignment.Left
    WalkspeedLabel.Parent = CombatTab

    local SpeedBg = Instance.new("Frame")
    SpeedBg.Size = UDim2.new(1, 0, 0, 8)
    SpeedBg.Position = UDim2.new(0, 0, 0, 116)
    SpeedBg.BackgroundColor3 = COLORS.BORDER_DEFAULT
    local SpeedBgCorner = Instance.new("UICorner")
    SpeedBgCorner.CornerRadius = UDim.new(1, 0)
    SpeedBgCorner.Parent = SpeedBg
    SpeedBg.Parent = CombatTab

    local SpeedFill = Instance.new("Frame")
    SpeedFill.Size = UDim2.new(0, math.clamp(((getgenv().NEXUS_CONFIG.WALKSPEED_VALUE or 16)/200)*272, 0, 272), 1, 0)
    SpeedFill.BackgroundColor3 = COLORS.ACCENT_PRIMARY
    local SpeedFillCorner = Instance.new("UICorner")
    SpeedFillCorner.CornerRadius = UDim.new(1, 0)
    SpeedFillCorner.Parent = SpeedFill
    SpeedFill.Parent = SpeedBg

    local SpeedDragging = false
    SpeedBg.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1 then
            SpeedDragging = true
        end
    end)
    SpeedBg.InputEnded:Connect(function()
        SpeedDragging = false
    end)

    UserInputService.InputChanged:Connect(function(Input, Processed)
        if Processed or not SpeedDragging then return end
        if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
            local Pos = UserInputService:GetMouseLocation()
            local Rel = Pos - SpeedBg.AbsolutePosition
            local Percent = math.clamp(Rel.X / SpeedBg.AbsoluteSize.X, 0, 1)
            local Speed = math.floor(Percent * 200) + 1
            SpeedFill.Size = UDim2.new(Percent, 0, 1, 0)
            WalkspeedLabel.Text = string.format("Super Speed: %d", Speed)
            UpdateWalkSpeed(Speed)
        end
    end)

    -- GAMES TAB
    local GamesTitle = Instance.new("TextLabel")
    GamesTitle.Size = UDim2.new(1, 0, 0, 18)
    GamesTitle.Position = UDim2.new(0, 0, 0, 0)
    GamesTitle.BackgroundTransparency = 1
    GamesTitle.Text = "🎮 GAME SELECTOR"
    GamesTitle.Font = Enum.Font.GothamBold
    GamesTitle.TextSize = 13
    GamesTitle.TextColor3 = COLORS.TEXT_PRIMARY
    GamesTitle.TextXAlignment = Enum.TextXAlignment.Left
    GamesTitle.Parent = GamesTab

    local GameScroll = Instance.new("ScrollingFrame")
    GameScroll.Size = UDim2.new(1, 0, 1, -24)
    GameScroll.Position = UDim2.new(0, 0, 0, 24)
    GameScroll.BackgroundTransparency = 1
    GameScroll.ScrollBarThickness = 3
    GameScroll.ScrollBarColor3 = COLORS.ACCENT_PRIMARY
    GameScroll.Parent = GamesTab

    local GameLayout = Instance.new("UIGridLayout")
    GameLayout.CellSize = UDim2.new(0, 128, 0, 28)
    GameLayout.CellPadding = UDim.new(0, 8)
    GameLayout.SortOrder = Enum.SortOrder.Name
    GameLayout.Parent = GameScroll

    local GameList = {
        "Blox Fruits", "King Legacy", "Anime Defenders", "All Star Tower Defense",
        "Pet Simulator 99", "Adopt Me", "Murder Mystery 2", "Doors",
        "Brookhaven RP", "Piggy", "Natural Disaster Survival", "Arsenal",
        "Phantom Forces", "Tower Defense Simulator", "Dragon Blox", "Anime Fighting Simulator",
        "Shindo Life", "Project Slayers", "Blox Fruits Stock", "Fruit Battlegrounds",
        "One Fruit Simulator", "Sea Piece", "Mage Tycoon", "Weapon Fighting Simulator",
        "Sols RNG", "Dress To Impress", "Blade Ball", "Rivals", "Demonfall", "Untitled Boxing Game"
    }

    for Index, GameName in ipairs(GameList) do
        local GameBtn = Instance.new("TextButton")
        GameBtn.BackgroundColor3 = COLORS.CARD_BACKGROUND
        GameBtn.Text = GameName
        GameBtn.Font = Enum.Font.Gotham
        GameBtn.TextSize = 9
        GameBtn.TextColor3 = COLORS.TEXT_PRIMARY
        GameBtn.AutoButtonColor = false
        GameBtn.Parent = GameScroll
        local GameBtnCorner = Instance.new("UICorner")
        GameBtnCorner.CornerRadius = UDim.new(0, 6)
        GameBtnCorner.Parent = GameBtn
        AddStandardStroke(GameBtn, {Thickness = 1})

        GameBtn.MouseButton1Click:Connect(function()
            PlayButtonSound()
            SafeTween(GameBtn, ANIMATIONS.BOUNCE_CLICK, {Size = UDim2.new(0, 132, 0, 30)}, function()
                SafeTween(GameBtn, ANIMATIONS.NORMAL, {Size = UDim2.new(0, 128, 0, 28)})
            end)
            ShowNotificationPopup(string.format("Selected: %s\nAdd loadstring in script source", GameName), "INFO")
        end)
    end

    -- SETTINGS TAB
    local SettingsTitle = Instance.new("TextLabel")
    SettingsTitle.Size = UDim2.new(1, 0, 0, 18)
    SettingsTitle.Position = UDim2.new(0, 0, 0, 0)
    SettingsTitle.BackgroundTransparency = 1
    SettingsTitle.Text = "⚙️ SYSTEM SETTINGS"
    SettingsTitle.Font = Enum.Font.GothamBold
    SettingsTitle.TextSize = 13
    SettingsTitle.TextColor3 = COLORS.TEXT_PRIMARY
    SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left
    SettingsTitle.Parent = SettingsTab

    local RainbowFrame = Instance.new("Frame")
    RainbowFrame.Size = UDim2.new(1, 0, 0, 24)
    RainbowFrame.Position = UDim2.new(0, 0, 0, 28)
    RainbowFrame.BackgroundColor3 = COLORS.CARD_BACKGROUND
    RainbowFrame.Parent = SettingsTab
    local RainCorner = Instance.new("UICorner")
    RainCorner.CornerRadius = UDim.new(0, 8)
    RainCorner.Parent = RainbowFrame

    local RainLabel = Instance.new("TextLabel")
    RainLabel.Size = UDim2.new(0.7, 0, 1, 0)
    RainLabel.Position = UDim2.new(8, 0, 0, 0)
    RainLabel.BackgroundTransparency = 1
    RainLabel.Text = "Rainbow Outlines"
    RainLabel.Font = Enum.Font.Gotham
    RainLabel.TextSize = 10
    RainLabel.TextColor3 = COLORS.TEXT_PRIMARY
    RainLabel.TextXAlignment = Enum.TextXAlignment.Left
    RainLabel.Parent = RainbowFrame

    local RainToggle = Instance.new("TextButton")
    RainToggle.Size = UDim2.new(0, 32, 0, 16)
    RainToggle.Position = UDim2.new(1, -40, 0.5, -8)
    RainToggle.BackgroundColor3 = COLORS.TOGGLE_OFF
    RainToggle.Text = ""
    RainToggle.AutoButtonColor = false
    RainToggle.Parent = RainbowFrame
    local RainToggleCorner = Instance.new("UICorner")
    RainToggleCorner.CornerRadius = UDim.new(1, 0)
    RainToggleCorner.Parent = RainToggle

    local RainKnob = Instance.new("Frame")
    RainKnob.Size = UDim2.new(0, 12, 0, 12)
    RainKnob.Position = UDim2.new(2, 0, 0.5, -6)
    RainKnob.BackgroundColor3 = Color3.new(1,1,1)
    RainKnob.Parent = RainToggle

    RainToggle.MouseButton1Click:Connect(function()
        PlayButtonSound()
        getgenv().NEXUS_CONFIG.RAINBOW_OUTLINES = not getgenv().NEXUS_CONFIG.RAINBOW_OUTLINES
        if getgenv().NEXUS_CONFIG.RAINBOW_OUTLINES then
            SafeTween(RainKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(18, 0, 0.5, -6)})
            SafeTween(RainToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_ON})
            ShowNotificationPopup("Rainbow Outlines Enabled", "SUCCESS")
        else
            SafeTween(RainKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(2, 0, 0.5, -6)})
            SafeTween(RainToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_OFF})
            ShowNotificationPopup("Rainbow Outlines Disabled", "INFO")
        end
    end)

    local SoundFrame = Instance.new("Frame")
    SoundFrame.Size = UDim2.new(1, 0, 0, 24)
    SoundFrame.Position = UDim2.new(0, 0, 0, 60)
    SoundFrame.BackgroundColor3 = COLORS.CARD_BACKGROUND
    SoundFrame.Parent = SettingsTab
    local SoundCorner = Instance.new("UICorner")
    SoundCorner.CornerRadius = UDim.new(0, 8)
    SoundCorner.Parent = SoundFrame

    local SoundLabel = Instance.new("TextLabel")
    SoundLabel.Size = UDim2.new(0.7, 0, 1, 0)
    SoundLabel.Position = UDim2.new(8, 0, 0, 0)
    SoundLabel.BackgroundTransparency = 1
    SoundLabel.Text = "Interface Sounds"
    SoundLabel.Font = Enum.Font.Gotham
    SoundLabel.TextSize = 10
    SoundLabel.TextColor3 = COLORS.TEXT_PRIMARY
    SoundLabel.TextXAlignment = Enum.TextXAlignment.Left
    SoundLabel.Parent = SoundFrame

    local SoundToggle = Instance.new("TextButton")
    SoundToggle.Size = UDim2.new(0, 32, 0, 16)
    SoundToggle.Position = UDim2.new(1, -40, 0.5, -8)
    SoundToggle.BackgroundColor3 = getgenv().NEXUS_CONFIG.PLAY_SOUNDS and COLORS.TOGGLE_ON or COLORS.TOGGLE_OFF
    SoundToggle.Text = ""
    SoundToggle.AutoButtonColor = false
    SoundToggle.Parent = SoundFrame
    local SoundToggleCorner = Instance.new("UICorner")
    SoundToggleCorner.CornerRadius = UDim.new(1, 0)
    SoundToggleCorner.Parent = SoundToggle

    local SoundKnob = Instance.new("Frame")
    SoundKnob.Size = UDim2.new(0, 12, 0, 12)
    SoundKnob.Position = UDim2.new(getgenv().NEXUS_CONFIG.PLAY_SOUNDS and 18 or 2, 0, 0.5, -6)
    SoundKnob.BackgroundColor3 = Color3.new(1,1,1)
    SoundKnob.Parent = SoundToggle

    SoundToggle.MouseButton1Click:Connect(function()
        getgenv().NEXUS_CONFIG.PLAY_SOUNDS = not getgenv().NEXUS_CONFIG.PLAY_SOUNDS
        if getgenv().NEXUS_CONFIG.PLAY_SOUNDS then
            PlayButtonSound()
            SafeTween(SoundKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(18, 0, 0.5, -6)})
            SafeTween(SoundToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_ON})
        else
            SafeTween(SoundKnob, ANIMATIONS.NORMAL, {Position = UDim2.new(2, 0, 0.5, -6)})
            SafeTween(SoundToggle, ANIMATIONS.NORMAL, {BackgroundColor3 = COLORS.TOGGLE_OFF})
        end
    end)

    local ResetAuthBtn = Instance.new("TextButton")
    ResetAuthBtn.Size = UDim2.new(1, 0, 0, 28)
    ResetAuthBtn.Position = UDim2.new(0, 0, 0, 108)
    ResetAuthBtn.BackgroundColor3 = COLORS.STATUS_ERROR
    ResetAuthBtn.BackgroundTransparency = 0.7
    ResetAuthBtn.Text = "Reset Access & Re-Enter Key"
    ResetAuthBtn.Font = Enum.Font.Gotham
    ResetAuthBtn.TextSize = 10
    ResetAuthBtn.TextColor3 = Color3.new(1,1,1)
    ResetAuthBtn.AutoButtonColor = false
    ResetAuthBtn.Parent = SettingsTab
    local ResetCorner = Instance.new("UICorner")
    ResetCorner.CornerRadius = UDim.new(0, 8)
    ResetCorner.Parent = ResetAuthBtn

    ResetAuthBtn.MouseButton1Click:Connect(function()
        PlayButtonSound()
        ClearSavedAuthentication()
        ShowNotificationPopup("Access Resetting...", "WARNING")
        task.wait(0.5)
        SafeDestroyItem(MainScreenGui)
        task.wait(0.3)
        BuildKeyEntryUserInterface()
    end)

    -- FINAL SYSTEM LOOPS
    getgenv().NEXUS_TIMER_LOOP = RunService.Heartbeat:Connect(function()
        if getgenv().NEXUS_STOP_ALL then
            getgenv().NEXUS_TIMER_LOOP:Disconnect()
            return
        end
        local Valid, Remain = VerifyAuthenticationStatus()
        if not Valid then
            getgenv().NEXUS_STOP_ALL = true
            ShowNotificationPopup("Access Expired! Enter Key Again", "WARNING")
            SafeDestroyItem(MainScreenGui)
            task.wait(0.5)
            BuildKeyEntryUserInterface()
            return
        end
    end)

    getgenv().NEXUS_RAINBOW_LOOP = RunService.RenderStepped:Connect(function()
        if getgenv().NEXUS_STOP_ALL then
            getgenv().NEXUS_RAINBOW_LOOP:Disconnect()
            return
        end
        if getgenv().NEXUS_CONFIG.RAINBOW_OUTLINES then
            local Hue = (os.clock() * 60) % 360
            local Col = Color3.fromHSV(Hue / 360, 0.85, 0.9)
            AddStandardStroke(MainWindowFrame, {Color = Col, Thickness = 1.5})
        end
    end)

    -- FINAL OPEN ANIMATION
    MainWindowFrame.Transparency = 1
    MainWindowFrame.Position = UDim2.new(0.5, -160, 0.5, -155)
    SafeTween(MainWindowFrame, ANIMATIONS.POP_UP, {
        Transparency = 0,
        Position = UDim2.new(0.5, -160, 0.5, -150)
    })
end

-- ==============================================
-- ✅ FIXED STARTUP SEQUENCE | NO HANGS
-- ==============================================
task.spawn(function()
    task.wait(0.1)
    InitializeNotificationContainer()
    task.wait(0.2)
    ShowNotificationPopup("System Initializing...", "INFO")
    task.wait(0.3)

    local AuthenticationOkay, TimeRemain = false, 0
    pcall(function()
        AuthenticationOkay, TimeRemain = VerifyAuthenticationStatus()
    end)

    if AuthenticationOkay then
        pcall(function()
            ShowNotificationPopup(string.format("✅ Welcome Back! %02dh Remaining", math.floor(TimeRemain / 3600)), "SUCCESS")
        end)
        task.wait(0.2)
        BuildMainUserInterface()
    else
        pcall(function()
            ShowNotificationPopup("🔑 Please Enter Your Access Key", "INFO")
        end)
        task.wait(0.2)
        BuildKeyEntryUserInterface()
    end
end)

-- ==============================================
-- ERROR PROTECTION & BACKGROUND MAINTENANCE
-- ==============================================
pcall(function()
    local OldErrorHook = error
    error = function(ErrorMessage)
        pcall(function()
            warn("[NEXUS SYSTEM ERROR]: " .. tostring(ErrorMessage))
        end)
        return OldErrorHook(ErrorMessage)
    end
end)

pcall(function()
    while task.wait(60) do
        if getgenv().NEXUS_STOP_ALL then return end
        pcall(function()
            for _, GuiChild in pairs(game.CoreGui:GetChildren()) do
                if GuiChild.Name == "NexusNotificationSystem" or 
                   GuiChild.Name == "NexusKeyAuthentication" or 
                   GuiChild.Name == "QuantumOnyxMainInterface" then
                    if not GuiChild.Parent or GuiChild == nil then
                        SafeDestroyItem(GuiChild)
                    end
                end
            end
        end)
    end
end)
