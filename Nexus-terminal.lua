-- NEXUS REMOTE SPAMMER | FULLY WORKING | ALL FIXES | ARCADE FONT | + COPY EZ KEY BUTTON
local CORRECT_KEY = "nexus2026"
local ACCESS_DURATION = 86400
-- ✅ LÄNK TILL KOPIERINGSKNAPPEN
local EZ_KEY_LINK = "https://lootdest.org/s?ZY16brPV"

getgenv().TestRunning = false
if getgenv().TesterUI then pcall(function() getgenv().TesterUI:Destroy() end) end
getgenv().TesterUI = nil
if getgenv().NexusTimerLoop then getgenv().NexusTimerLoop = false end

local plr = game.Players.LocalPlayer
local pg = plr:WaitForChild("PlayerGui")
local rs = game:GetService("ReplicatedStorage")
local ts = game:GetService("TweenService")
local uis = game:GetService("UserInputService")

getgenv().NexusSettings = {
    Width = 200, Height = 250, Color = "GREEN",
    Colors = {
        GREEN  = {Main = Color3.fromRGB(0,255,200),   Dim = Color3.fromRGB(0,180,140)},
        RED    = {Main = Color3.fromRGB(255,60,60),   Dim = Color3.fromRGB(180,30,30)},
        BLUE   = {Main = Color3.fromRGB(60,160,255),  Dim = Color3.fromRGB(30,100,180)},
        YELLOW = {Main = Color3.fromRGB(255,220,50),  Dim = Color3.fromRGB(180,150,20)}
    }
}
local SET = getgenv().NexusSettings
local BG = Color3.fromRGB(10,12,15)
local BGDARK = Color3.fromRGB(6,8,10)
local TXT = Color3.fromRGB(240,245,250)
local TXTDIM = Color3.fromRGB(150,170,180)
local ERR_COL = Color3.fromRGB(255,70,70)
local OK_COL = Color3.fromRGB(70,255,140)
local FONT = Enum.Font.Arcade
local TWEEN_COLOR = TweenInfo.new(0.35, Enum.EasingStyle.Sine)
local TWEEN_SIZE  = TweenInfo.new(0.25, Enum.EasingStyle.Quad)
local TWEEN_FADE  = TweenInfo.new(0.4, Enum.EasingStyle.Quad)
local MAIN_CORNER_RADIUS = 4

-- EXAKTA KNAPP-FÄRGER
local BTN_COLORS = {
    SCAN = Color3.fromRGB(0,255,150),
    TARGET = Color3.fromRGB(255,200,50),
    MASS = Color3.fromRGB(255,80,80),
    STOP = Color3.fromRGB(100,180,255)
}

local sg = Instance.new("ScreenGui")
sg.Name = "Nexus"
sg.ResetOnSpawn = false
sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
sg.DisplayOrder = 9999
sg.Parent = pg
getgenv().TesterUI = sg

-- NOTIS SYSTEM
local NOTIF_TXT = Color3.fromRGB(255,255,255)
local NOTIF_FONT = Enum.Font.SourceSans
local NOTIF_WIDTH = 230
local NOTIF_HEIGHT = 42
local NOTIF_DISPLAY_TIME = 3.5
local TWEEN_NOTIF_IN = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local TWEEN_NOTIF_OUT = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

local notifHolder = Instance.new("Frame")
notifHolder.Name = "NexusNotifs"
notifHolder.BackgroundTransparency = 1
notifHolder.Size = UDim2.new(0, NOTIF_WIDTH, 1, -60)
notifHolder.Position = UDim2.new(1, -14, 0, 50)
notifHolder.AnchorPoint = Vector2.new(1, 0)
notifHolder.Parent = sg

local listLayout = Instance.new("UIListLayout")
listLayout.Parent = notifHolder
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 8)
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right

local function Notify(text, buttonColor)
    if typeof(buttonColor) ~= "Color3" then buttonColor = BTN_COLORS.SCAN end
    local bgTransparency = 0.75
    local outlineThickness = 1.6

    local notif = Instance.new("Frame")
    notif.Name = "Notif_"..os.clock()
    notif.BackgroundColor3 = buttonColor
    notif.BackgroundTransparency = bgTransparency
    notif.Size = UDim2.new(0, NOTIF_WIDTH, 0, NOTIF_HEIGHT)
    notif.Position = UDim2.new(1.2, 0, 0, 0)
    notif.LayoutOrder = os.clock()
    notif.ClipsDescendants = true
    notif.Parent = notifHolder
    Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 6)

    local outline = Instance.new("UIStroke")
    outline.Thickness = outlineThickness
    outline.Color = buttonColor
    outline.Transparency = 0
    outline.Parent = notif

    local accentBar = Instance.new("Frame")
    accentBar.BackgroundColor3 = buttonColor
    accentBar.BorderSizePixel = 0
    accentBar.Size = UDim2.new(0, 3, 1, 0)
    accentBar.Parent = notif

    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 10)
    padding.PaddingTop = UDim.new(0, 8)
    padding.PaddingBottom = UDim.new(0, 8)
    padding.Parent = notif

    local notifText = Instance.new("TextLabel")
    notifText.BackgroundTransparency = 1
    notifText.Size = UDim2.new(1, -20, 1, 0)
    notifText.Position = UDim2.new(0, 0, 0, 0)
    notifText.Text = text
    notifText.Font = NOTIF_FONT
    notifText.TextSize = 14
    notifText.TextColor3 = NOTIF_TXT
    notifText.TextXAlignment = Enum.TextXAlignment.Left
    notifText.TextYAlignment = Enum.TextYAlignment.Center
    notifText.TextWrapped = true
    notifText.Parent = notif

    local closeBtn = Instance.new("TextButton")
    closeBtn.BackgroundTransparency = 1
    closeBtn.Size = UDim2.new(0, 14, 0, 14)
    closeBtn.Position = UDim2.new(1, -14, 0.5, -7)
    closeBtn.Text = "✕"
    closeBtn.Font = NOTIF_FONT
    closeBtn.TextSize = 14
    closeBtn.TextColor3 = Color3.fromRGB(220,220,220)
    closeBtn.Parent = notif
    closeBtn.MouseButton1Click:Connect(function()
        local out = ts:Create(notif, TWEEN_NOTIF_OUT, {Position = UDim2.new(1.2, 0, 0, 0), BackgroundTransparency = 1})
        out:Play()
        out.Completed:Connect(function() pcall(function() notif:Destroy() end) end)
    end)

    ts:Create(notif, TWEEN_NOTIF_IN, {Position = UDim2.new(0, 0, 0, 0)}):Play()
    task.delay(NOTIF_DISPLAY_TIME, function()
        if not notif.Parent then return end
        local out = ts:Create(notif, TWEEN_NOTIF_OUT, {Position = UDim2.new(1.2, 0, 0, 0), BackgroundTransparency = 1})
        out:Play()
        out.Completed:Connect(function() pcall(function() notif:Destroy() end) end)
    end)
end

-- SAVE SYSTEM
local SAVE_FILE = "nexus_access_"..plr.UserId..".txt"
local SAVE_KEY = "_NexusAccess_"..plr.UserId
local hasFile = pcall(function() isfile("") end)
local function getSavedTime()
    if hasFile then local o,d=pcall(function() if isfile(SAVE_FILE) then return readfile(SAVE_FILE) end end) if o and d and tonumber(d) then return tonumber(d) end end
    local o,v=pcall(function() return sg:GetAttribute(SAVE_KEY) end) if o and v and tonumber(v) then return tonumber(v) end
    local o2,v2=pcall(function() return getgenv()[SAVE_KEY] end) if o2 and v2 and tonumber(v2) then return tonumber(v2) end
    return nil
end
local function saveAccess() local n=os.time() if hasFile then pcall(function() writefile(SAVE_FILE,tostring(n)) end) end pcall(function() sg:SetAttribute(SAVE_KEY,n) end) pcall(function() getgenv()[SAVE_KEY]=n end) end
local function clearAllSaves() if hasFile then pcall(function() if isfile(SAVE_FILE) then delfile(SAVE_FILE) end end) end pcall(function() sg:SetAttribute(SAVE_KEY,nil) end) pcall(function() getgenv()[SAVE_KEY]=nil end) end
local function checkAccess() local s=getSavedTime() if not s then return false,0 end local l=ACCESS_DURATION-(os.time()-s) if l>0 then return true,l end clearAllSaves() return false,0 end

local function TweenProp(o,p,v,i) ts:Create(o,i or TWEEN_COLOR,{[p]=v}):Play() end

-- TOGGLE
local tog = Instance.new("TextButton")
tog.Size=UDim2.new(0,40,0,40) tog.Position=UDim2.new(0.92,0,0.05,0) tog.BackgroundColor3=BG 
tog.Text="💀" tog.Active=true tog.Draggable=true tog.Visible=false tog.Parent=sg
Instance.new("UICorner",tog).CornerRadius=UDim.new(0,6)
local togs=Instance.new("UIStroke",tog) togs.Thickness=1

-- EYE ICON FÖR TOGGLE
local eyeIcon = Instance.new("ImageLabel")
eyeIcon.Name = "EyeIcon"
eyeIcon.Size = UDim2.new(0, 24, 0, 24)
eyeIcon.Position = UDim2.new(0.5, -12, 0.5, -12)
eyeIcon.BackgroundTransparency = 1
eyeIcon.ScaleType = Enum.ScaleType.Fit
eyeIcon.Parent = tog
local ICON_OPEN = "rbxassetid://15496694259"
local ICON_CLOSED = "rbxassetid://15496693587"
eyeIcon.Image = ICON_OPEN
eyeIcon.ImageColor3 = SET.Colors[SET.Color].Main

-- MAIN
local main = Instance.new("Frame")
main.Size=UDim2.new(0,0,0,0) main.Position=UDim2.new(0.03,0,0.15,0) main.AnchorPoint=Vector2.new(0,0) main.BackgroundColor3=BG main.BackgroundTransparency=1 main.Active=true main.Draggable=true main.Visible=false main.ClipsDescendants=true main.Parent=sg
Instance.new("UICorner",main).CornerRadius=UDim.new(0,MAIN_CORNER_RADIUS)
local mains=Instance.new("UIStroke",main) mains.Thickness=1 mains.Transparency=0.5

-- FIXADE CORNERS
local Corners={}
local CORNER_SIZE = 18
local function makeCorner(posX, posY, rot)
    local c=Instance.new("Frame") 
    c.Size=UDim2.new(0,CORNER_SIZE,0,CORNER_SIZE) 
    local offsetX = posX==0 and MAIN_CORNER_RADIUS or -(CORNER_SIZE + MAIN_CORNER_RADIUS)
    local offsetY = posY==0 and MAIN_CORNER_RADIUS or -(CORNER_SIZE + MAIN_CORNER_RADIUS)
    c.Position=UDim2.new(posX, offsetX, posY, offsetY)
    c.BackgroundTransparency=1 
    c.Rotation=rot 
    c.Parent=main
    local h=Instance.new("Frame") h.Size=UDim2.new(1,0,0,2) h.BackgroundColor3=SET.Colors[SET.Color].Main h.Parent=c
    local v=Instance.new("Frame") v.Size=UDim2.new(0,2,0,CORNER_SIZE) v.BackgroundColor3=SET.Colors[SET.Color].Main v.Parent=c
    table.insert(Corners,{H=h,V=v})
end
makeCorner(0,0,0)
makeCorner(1,1,180)

-- HEADER
local hdr=Instance.new("Frame") hdr.Size=UDim2.new(1,-10,0,24) hdr.Position=UDim2.new(0,5,0,5) hdr.BackgroundTransparency=1 hdr.Parent=main
local ttl=Instance.new("TextLabel") ttl.Size=UDim2.new(0.65,0,1,0) ttl.BackgroundTransparency=1 ttl.Text="NEXUS:RT" ttl.Font=FONT ttl.TextScaled=true ttl.TextXAlignment=Enum.TextXAlignment.Left ttl.Parent=hdr
local tm=Instance.new("TextLabel") tm.Size=UDim2.new(0.35,0,1,0) tm.Position=UDim2.new(0.65,0,0,0) tm.BackgroundTransparency=1 tm.Text=os.date("%H:%M") tm.TextColor3=TXTDIM tm.Font=FONT tm.TextScaled=true tm.TextXAlignment=Enum.TextXAlignment.Right tm.Parent=hdr
task.spawn(function() while tm.Parent do tm.Text=os.date("%H:%M") task.wait(15) end end)
local hl=Instance.new("Frame") hl.Size=UDim2.new(1,-10,0,1) hl.Position=UDim2.new(0,5,0,32) hl.BackgroundColor3=SET.Colors[SET.Color].Dim hl.BackgroundTransparency=0.6 hl.Parent=main

-- TIMER
local timerLabel=Instance.new("TextLabel") timerLabel.Size=UDim2.new(1,-10,0,16) timerLabel.Position=UDim2.new(0,5,0,37) timerLabel.BackgroundTransparency=1 timerLabel.Text="" timerLabel.TextColor3=SET.Colors[SET.Color].Main timerLabel.Font=FONT timerLabel.TextScaled=true timerLabel.TextXAlignment=Enum.TextXAlignment.Center timerLabel.Parent=main

-- TABS
local tabs={}
local function makeTab(n,x,a)
    local t=Instance.new("TextButton") t.Size=UDim2.new(0.3,0,0,22) t.Position=UDim2.new(x,0,0,58) t.BackgroundColor3=a and BG or BGDARK t.BackgroundTransparency=a and 0 or 0.4 t.Text="["..n:upper().."]" t.TextColor3=a and SET.Colors[SET.Color].Main or TXTDIM t.Font=FONT t.TextScaled=true t.Parent=main
    Instance.new("UICorner",t).CornerRadius=UDim.new(0,3)
    local s=Instance.new("UIStroke",t) s.Color=a and SET.Colors[SET.Color].Main or SET.Colors[SET.Color].Dim s.Thickness=a and 1.5 or 1 s.Transparency=a and 0 or 0.6
    tabs[n]={Btn=t,Stroke=s} return t
end
local t1=makeTab("MAIN",0.03,true) local t2=makeTab("REM",0.355,false) local t3=makeTab("SET",0.68,false)

-- CONTENT
local content=Instance.new("Frame") content.Size=UDim2.new(1,-10,0,165) content.Position=UDim2.new(0,5,0,86) content.BackgroundTransparency=1 content.Parent=main
local p1=Instance.new("Frame") p1.Size=UDim2.new(1,0,1,0) p1.BackgroundTransparency=1 p1.Visible=true p1.Parent=content

-- SCROLL FRAME
local sf=Instance.new("ScrollingFrame") sf.Size=UDim2.new(1,0,1,0) sf.BackgroundTransparency=1 sf.Visible=false sf.ClipsDescendants=true sf.ScrollBarThickness=3 sf.ScrollBarImageTransparency=0.3 sf.CanvasSize=UDim2.new(0,0,0,0) sf.ScrollingDirection=Enum.ScrollingDirection.Y sf.Parent=content
local sb=Instance.new("TextBox") sb.Size=UDim2.new(1,0,0,22) sb.Text="[SEARCH]" sb.TextColor3=TXT sb.Font=FONT sb.TextScaled=true sb.ClearTextOnFocus=true sb.Parent=sf
Instance.new("UICorner",sb).CornerRadius=UDim.new(0,3) Instance.new("UIStroke",sb).Thickness=1

local p3=Instance.new("ScrollingFrame") p3.Size=UDim2.new(1,0,1,0) p3.BackgroundTransparency=1 p3.Visible=false p3.ClipsDescendants=true p3.ScrollBarThickness=2 p3.CanvasSize=UDim2.new(0,0,0,260) p3.Parent=content
local p3Inner=Instance.new("Frame") p3Inner.Size=UDim2.new(1,0,0,260) p3Inner.BackgroundTransparency=1 p3Inner.Parent=p3

-- STATUS
local bot=Instance.new("TextLabel") bot.Size=UDim2.new(1,-10,0,14) bot.Position=UDim2.new(0,5,1,-19) bot.BackgroundTransparency=1 bot.Text="STATUS: READY" bot.TextColor3=SET.Colors[SET.Color].Main bot.Font=FONT bot.TextScaled=true bot.TextXAlignment=Enum.TextXAlignment.Left bot.Parent=main

-- TIMER LOOP
local function fmt(s) return string.format("%02d : %02d : %02d",math.floor(s/3600),math.floor((s%3600)/60),s%60) end
local function startCountdown(total)
    getgenv().NexusTimerLoop=true local r=math.floor(total)
    task.spawn(function()
        while getgenv().NexusTimerLoop and r>0 and timerLabel.Parent do
            timerLabel.Text="⏱ ACCESS: "..fmt(r) task.wait(1) r-=1
        end
        if r<=0 then
            getgenv().NexusTimerLoop=false clearAllSaves() getgenv().TestRunning=false
            TweenProp(main,"Size",UDim2.new(0,0,0,0),TWEEN_SIZE) TweenProp(main,"BackgroundTransparency",1,TWEEN_FADE) tog.Visible=false task.wait(0.35) main.Visible=false
        end
    end)
end

-- ✅ NYCKEL UI MED KOPIERINGSKNAPP
local KeyUI=Instance.new("Frame") KeyUI.Size=UDim2.new(0,0,0,0) KeyUI.Position=UDim2.new(0.5,0,0.5,0) KeyUI.AnchorPoint=Vector2.new(0.5,0.5) KeyUI.BackgroundColor3=BG KeyUI.BackgroundTransparency=1 KeyUI.Active=true KeyUI.Draggable=true KeyUI.Parent=sg
Instance.new("UICorner",KeyUI).CornerRadius=UDim.new(0,6)
local ks=Instance.new("UIStroke",KeyUI) ks.Thickness=1.2 ks.Color=SET.Colors[SET.Color].Dim ks.Transparency=0.5
local kT=Instance.new("TextLabel",KeyUI) kT.Size=UDim2.new(1,-20,0,30) kT.Position=UDim2.new(0,10,0,8) kT.BackgroundTransparency=1 kT.Text="NEXUS REMOTE SPAMMER" kT.TextColor3=SET.Colors[SET.Color].Main kT.Font=FONT kT.TextScaled=true
local kD=Instance.new("TextLabel",KeyUI) kD.Size=UDim2.new(1,-20,0,18) kD.Position=UDim2.new(0,10,0,42) kD.BackgroundTransparency=1 kD.Text="ENTER ACCESS KEY" kD.TextColor3=TXTDIM kD.Font=FONT kD.TextScaled=true
local kI=Instance.new("TextBox") kI.Size=UDim2.new(1,-30,0,36) kI.Position=UDim2.new(0,15,0,70) kI.BackgroundColor3=BGDARK kI.Text="" kI.PlaceholderText="Type key..." kI.TextColor3=TXT kI.Font=FONT kI.TextScaled=true kI.ClearTextOnFocus=false kI.Parent=KeyUI
Instance.new("UICorner",kI).CornerRadius=UDim.new(0,4)
local kis=Instance.new("UIStroke",kI) kis.Thickness=1 kis.Color=SET.Colors[SET.Color].Dim
local kS=Instance.new("TextLabel",KeyUI) kS.Size=UDim2.new(1,-20,0,16) kS.Position=UDim2.new(0,10,0,115) kS.BackgroundTransparency=1 kS.Text="" kS.TextColor3=TXTDIM kS.Font=FONT kS.TextScaled=true

-- ✅ NY: COPY EZ KEY KNAPP (MATCHAR KEY UI TEMAT EXAKT)
local copyBtn = Instance.new("TextButton")
copyBtn.Name = "CopyEzKey"
copyBtn.Size = UDim2.new(1, -30, 0, 32) -- Samma bredd som nyckelrutan
copyBtn.Position = UDim2.new(0, 15, 0, 137) -- Precis under status-texten
copyBtn.BackgroundColor3 = BGDARK -- Samma mörka bakgrund som input
copyBtn.BackgroundTransparency = 0.2
copyBtn.Text = "[ COPY EZ KEY ]"
copyBtn.TextColor3 = SET.Colors[SET.Color].Main -- Tematets huvudfärg
copyBtn.Font = FONT -- Samma Arcade font
copyBtn.TextScaled = true
copyBtn.Parent = KeyUI
Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 4) -- Samma rundade hörn som input
local copyStroke = Instance.new("UIStroke")
copyStroke.Thickness = 1 -- Samma tjocklek som inputens stroke
copyStroke.Color = SET.Colors[SET.Color].Dim -- Samma stroke-färg som input
copyStroke.Transparency = 0.5
copyStroke.Parent = copyBtn

-- Hover-effekter (samma som övriga knappar i skriptet)
copyBtn.MouseEnter:Connect(function()
    TweenProp(copyBtn, "BackgroundTransparency", 0)
    TweenProp(copyStroke, "Transparency", 0)
end)
copyBtn.MouseLeave:Connect(function()
    TweenProp(copyBtn, "BackgroundTransparency", 0.2)
    TweenProp(copyStroke, "Transparency", 0.5)
end)

-- Kopiera länk vid klick + bekräftelsenotis
copyBtn.MouseButton1Click:Connect(function()
    local ok = pcall(function()
        setclipboard(EZ_KEY_LINK) -- Kopierar länken till urklipp
    end)
    if ok then
        Notify("Link copied to clipboard!", SET.Colors[SET.Color].Main)
        copyBtn.Text = "[ COPIED! ]"
        task.delay(1.5, function() if copyBtn.Parent then copyBtn.Text = "[ COPY EZ KEY ]" end end)
    else
        Notify("Copy failed", ERR_COL)
    end
end)
-- ✅ SLUT PÅ KOPIERINGSKNAPP

-- OPEN MAIN
local function openMainUI(tl)
    TweenProp(KeyUI,"BackgroundTransparency",1,TWEEN_FADE) TweenProp(KeyUI,"Size",UDim2.new(0,0,0,0),TWEEN_FADE) task.wait(0.45) if KeyUI then KeyUI:Destroy() end
    tog.Visible=true startCountdown(tl)
    main.Visible=true main.BackgroundTransparency=1 main.Size=UDim2.new(0,0,0,0)
    ts:Create(main,TweenInfo.new(0.3,Enum.EasingStyle.Back,0.2),{Size=UDim2.new(0,SET.Width,0,SET.Height),BackgroundTransparency=0}):Play()
    Notify("Nexus loaded", SET.Colors.GREEN.Main)
end

-- TOGGLE CLICK MED ÖGON-ICON BYTE
local uiOpen=false
tog.MouseButton1Click:Connect(function()
    uiOpen=not uiOpen
    if uiOpen then 
        eyeIcon.Image = ICON_OPEN
        eyeIcon.ImageColor3 = SET.Colors[SET.Color].Main
        main.Visible=true 
        TweenProp(main,"Size",UDim2.new(0,SET.Width,0,SET.Height),TWEEN_SIZE) 
        TweenProp(main,"BackgroundTransparency",0,TWEEN_FADE)
    else 
        eyeIcon.Image = ICON_CLOSED
        eyeIcon.ImageColor3 = TXTDIM
        TweenProp(main,"Size",UDim2.new(0,0,0,0),TWEEN_SIZE) 
        TweenProp(main,"BackgroundTransparency",1,TWEEN_FADE) 
        task.delay(0.3,function() if not uiOpen then main.Visible=false end end) 
    end
end)

-- VERIFY KEY
function verifyKey()
    local v=kI.Text:gsub("%s+",""):lower()
    if v==CORRECT_KEY:lower() then
        kS.Text="✅ KEY ACCEPTED" kS.TextColor3=OK_COL kis.Color=OK_COL
        Notify("Access granted", OK_COL)
        saveAccess() task.wait(1) openMainUI(ACCESS_DURATION)
    else
        kS.Text="❌ WRONG KEY" kS.TextColor3=ERR_COL kis.Color=ERR_COL
        Notify("Invalid key", ERR_COL)
        task.delay(2.5,function() if kS.Parent then kS.Text="" kis.Color=SET.Colors[SET.Color].Dim end end)
    end
end
kI.FocusLost:Connect(function(e) if e then verifyKey() end end)
uis.InputBegan:Connect(function(i,g) if g then return end if i.KeyCode==Enum.KeyCode.Return and KeyUI.Visible then verifyKey() end end)

-- APPLY SETTINGS
local function ApplySettings(tw)
    local C=SET.Colors[SET.Color].Main local D=SET.Colors[SET.Color].Dim
    if tw then TweenProp(main,"Size",UDim2.new(0,SET.Width,0,SET.Height),TWEEN_SIZE) else main.Size=UDim2.new(0,SET.Width,0,SET.Height) end
    content.Size=UDim2.new(1,-10,0,SET.Height-121)
    TweenProp(togs,"Color",C) TweenProp(mains,"Color",D) TweenProp(hl,"BackgroundColor3",D) TweenProp(ttl,"TextColor3",C) TweenProp(timerLabel,"TextColor3",C) TweenProp(bot,"TextColor3",C)
    eyeIcon.ImageColor3 = uiOpen and C or TXTDIM
    -- Uppdaterar kopieringsknappens färg om temat byts innan access
    if copyBtn and copyBtn.Parent then
        copyBtn.TextColor3 = C
        copyStroke.Color = D
        ks.Color = D
        kis.Color = D
    end
    for _,c in pairs(Corners) do TweenProp(c.H,"BackgroundColor3",C) TweenProp(c.V,"BackgroundColor3",C) end
    for _,d in pairs(tabs) do local a=d.Btn.BackgroundTransparency<0.3 TweenProp(d.Btn,"TextColor3",a and C or TXTDIM) TweenProp(d.Stroke,"Color",a and C or D) end
end

-- SWITCH TAB
local function switchTab(a)
    p1.Visible=false sf.Visible=false p3.Visible=false
    for _,d in pairs(tabs) do d.Btn.BackgroundColor3=BGDARK d.Btn.BackgroundTransparency=0.4 d.Btn.TextColor3=TXTDIM d.Stroke.Color=SET.Colors[SET.Color].Dim d.Stroke.Thickness=1 d.Stroke.Transparency=0.6 end
    local s=tabs[a] s.Btn.BackgroundColor3=BG s.Btn.BackgroundTransparency=0 s.Btn.TextColor3=SET.Colors[SET.Color].Main s.Stroke.Color=SET.Colors[SET.Color].Main s.Stroke.Thickness=1.5 s.Stroke.Transparency=0
    if a=="MAIN" then p1.Visible=true elseif a=="REM" then sf.Visible=true task.defer(function() sf.CanvasPosition=Vector2.new(0,0) sf.CanvasSize=sf.CanvasSize end) elseif a=="SET" then p3.Visible=true end
end
t1.MouseButton1Click:Connect(function() switchTab("MAIN") end)
t2.MouseButton1Click:Connect(function() switchTab("REM") end)
t3.MouseButton1Click:Connect(function() switchTab("SET") end)

-- REMOTE SYSTEM
local allRemotes={} local selRem=nil local spamDelay=0.1 local remoteButtons={} local isScanning=false

sb.Changed:Connect(function(p)
    if p~="Text" then return end local q=sb.Text:lower()
    if q=="[search]" or q=="" then for b in pairs(remoteButtons) do b.Visible=true end return end
    for b,r in pairs(remoteButtons) do b.Visible=r.Name:lower():find(q,1,true)~=nil end
end)

local function scanRemotes()
    if isScanning then Notify("Already scanning", BTN_COLORS.SCAN) return end
    isScanning=true getgenv().TestRunning=false
    Notify("Scanning remotes...", BTN_COLORS.SCAN)
    for b in pairs(remoteButtons) do pcall(function() b:Destroy() end) end remoteButtons={} allRemotes={} selRem=nil
    bot.Text="🔍 SCANNING..." sf.CanvasSize=UDim2.new(0,0,0,30) sf.CanvasPosition=Vector2.new(0,0)
    local locs={rs,game.ReplicatedFirst,game.StarterGui,workspace,game.Players,game.Lighting,game.StarterPack}
    for _,l in ipairs(locs) do if l then pcall(function() for _,o in ipairs(l:GetDescendants()) do if (o:IsA("RemoteEvent") or o:IsA("RemoteFunction")) and not table.find(allRemotes,o) then table.insert(allRemotes,o) end end end) end end
    local c=#allRemotes local t=c<50 and (math.random(100,200)/100) or (math.random(200,500)/100) task.wait(t)
    for i,o in ipairs(allRemotes) do
        local b=Instance.new("TextButton") b.Size=UDim2.new(1,-4,0,24) b.Position=UDim2.new(0,2,0,i*28+26) b.BackgroundColor3=BGDARK b.BackgroundTransparency=0.3 b.Text=" "..o.Name b.TextColor3=TXT b.Font=FONT b.TextScaled=true b.TextXAlignment=Enum.TextXAlignment.Left b.Parent=sf
        Instance.new("UICorner",b).CornerRadius=UDim.new(0,2)
        local bs=Instance.new("UIStroke",b) bs.Color=SET.Colors[SET.Color].Dim bs.Thickness=1 bs.Transparency=0.7
        remoteButtons[b]=o
        b.MouseButton1Click:Connect(function()
            for ob in pairs(remoteButtons) do ob.BackgroundColor3=BGDARK ob.BackgroundTransparency=0.3 ob.TextColor3=TXT if ob:FindFirstChildOfClass("UIStroke") then ob.UIStroke.Color=SET.Colors[SET.Color].Dim ob.UIStroke.Transparency=0.7 end end
            selRem=o b.BackgroundColor3=Color3.fromRGB(0,40,30) b.BackgroundTransparency=0.1 b.TextColor3=SET.Colors[SET.Color].Main bs.Color=SET.Colors[SET.Color].Main bs.Transparency=0
            bot.Text="🎯 TARGET: "..o.Name:sub(1,14)
            Notify("Selected: "..o.Name:sub(1,12), BTN_COLORS.TARGET)
        end)
    end
    sf.CanvasSize=UDim2.new(0,0,0,math.max(#allRemotes*28+60,100))
    bot.Text="✅ FOUND: "..c.." | READY" isScanning=false
    Notify("Found "..c.." remotes", BTN_COLORS.SCAN)
end

local function spamSel()
    if not selRem then
        bot.Text="❌ NO TARGET"
        Notify("No target", BTN_COLORS.TARGET)
        return
    end
    getgenv().TestRunning=true bot.Text="🚀 SELECTED REMOTE SPAMMING"
    Notify("Target spam active", BTN_COLORS.TARGET)
    task.spawn(function() while getgenv().TestRunning do pcall(function() if selRem:IsA("RemoteEvent") then selRem:FireServer("t",1) else selRem:InvokeServer("t",1) end end) task.wait(spamDelay) end end)
end

local function spamAll()
    if #allRemotes==0 then scanRemotes() return end
    getgenv().TestRunning=true bot.Text="💥 MASS SPAMMING ("..#allRemotes..")"
    Notify("Mass spam: "..#allRemotes.." remotes", BTN_COLORS.MASS)
    task.spawn(function() while getgenv().TestRunning do for _,r in ipairs(allRemotes) do if not getgenv().TestRunning then return end pcall(function() if r:IsA("RemoteEvent") then r:FireServer("a",1) else r:InvokeServer("a",1) end end) task.wait(spamDelay) end end end)
end

local function stopSpam()
    getgenv().TestRunning=false bot.Text="⏹️ SPAMMING STOPPED"
    Notify("Spam stopped", BTN_COLORS.STOP)
end

local function makeBtn(p,txt,c,y,fn)
    local b=Instance.new("TextButton") b.Size=UDim2.new(0.47,0,0,34) b.Position=UDim2.new(y%2==0 and 0 or 0.53,0,0,math.floor(y/2)*42) b.BackgroundColor3=BGDARK b.BackgroundTransparency=0.25 b.Text="["..txt.."]" b.TextColor3=c b.Font=FONT b.TextScaled=true b.Parent=p
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,3)
    local s=Instance.new("UIStroke",b) s.Color=c s.Thickness=1 s.Transparency=0.5
    b.MouseEnter:Connect(function() TweenProp(b,"BackgroundTransparency",0) TweenProp(s,"Transparency",0) end)
    b.MouseLeave:Connect(function() TweenProp(b,"BackgroundTransparency",0.25) TweenProp(s,"Transparency",0.5) end)
    b.MouseButton1Click:Connect(fn)
end
makeBtn(p1,"SCAN",BTN_COLORS.SCAN,0,scanRemotes)
makeBtn(p1,"TARGET",BTN_COLORS.TARGET,1,spamSel)
makeBtn(p1,"MASS",BTN_COLORS.MASS,2,spamAll)
makeBtn(p1,"STOP",BTN_COLORS.STOP,3,stopSpam)

for i,n in ipairs({"GREEN","RED","BLUE","YELLOW"}) do
    local c=SET.Colors[n].Main local b=Instance.new("TextButton") b.Size=UDim2.new(0.22,0,0,28) b.Position=UDim2.new((i-1)*0.26,0,0,28) b.BackgroundColor3=c b.Text=n b.TextColor3=Color3.new(0,0,0) b.Font=FONT b.TextScaled=true b.Parent=p3Inner
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)
    b.MouseButton1Click:Connect(function() 
        SET.Color=n ApplySettings(true) 
        Notify("Theme: "..n, c)
    end)
end

local function makeSlider(p,mn,mx,key,y)
    local l=Instance.new("TextLabel") l.Size=UDim2.new(1,0,0,16) l.Position=UDim2.new(0,0,0,y) l.BackgroundTransparency=1 l.Text=key:upper()..": "..mn.." - "..mx.." | "..SET[key] l.TextColor3=TXTDIM l.Font=FONT l.TextScaled=true l.Parent=p
    local s=Instance.new("TextButton") s.Size=UDim2.new(1,0,0,14) s.Position=UDim2.new(0,0,0,y+20) s.BackgroundColor3=BGDARK s.AutoButtonColor=false s.Text="" s.Parent=p Instance.new("UICorner",s).CornerRadius=UDim.new(0,7)
    local f=Instance.new("Frame") f.Size=UDim2.new((SET[key]-mn)/(mx-mn),0,1,0) f.BackgroundColor3=SET.Colors[SET.Color].Main f.Parent=s Instance.new("UICorner",f).CornerRadius=UDim.new(0,7)
    local drag=false local function up(mxX)
        local r=math.clamp((mxX-s.AbsolutePosition.X)/s.AbsoluteSize.X,0,1) SET[key]=math.floor(mn+(mx-mn)*r) f.Size=UDim2.new(r,0,1,0) f.BackgroundColor3=SET.Colors[SET.Color].Main l.Text=key:upper()..": "..mn.." - "..mx.." | "..SET[key] ApplySettings(true)
    end
    s.MouseButton1Down:Connect(function() drag=true local m=plr:GetMouse() up(m.X) end)
    uis.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end end)
    uis.InputChanged:Connect(function(i) if drag and i.UserInputType==Enum.UserInputType.MouseMovement then up(i.Position.X) end end)
    s.MouseButton1Click:Connect(function() local m=plr:GetMouse() up(m.X) end)
end
makeSlider(p3Inner,200,400,"Width",70)
makeSlider(p3Inner,250,400,"Height",115)

local wipe=Instance.new("TextButton") wipe.Size=UDim2.new(1,0,0,32) wipe.Position=UDim2.new(0,0,0,210) wipe.BackgroundColor3=BTN_COLORS.MASS wipe.Text="WIPE UI" wipe.TextColor3=Color3.new(1,1,1) wipe.Font=FONT wipe.TextScaled=true wipe.Parent=p3Inner
Instance.new("UICorner",wipe).CornerRadius=UDim.new(0,3)
wipe.MouseButton1Click:Connect(function()
    Notify("UI wiped", BTN_COLORS.MASS)
    task.wait(0.25)
    getgenv().NexusTimerLoop=false getgenv().TestRunning=false TweenProp(main,"Size",UDim2.new(0,0,0,0),TWEEN_SIZE) TweenProp(main,"BackgroundTransparency",1,TWEEN_FADE) task.wait(0.3) sg:Destroy() getgenv().TesterUI=nil
end)

-- START (Key UI är nu 280x190 för att passa kopieringsknappen)
local hasAccess,timeLeft=checkAccess()
if hasAccess then openMainUI(timeLeft)
else KeyUI.Visible=true TweenProp(KeyUI,"Size",UDim2.new(0,280,0,190),TWEEN_SIZE) TweenProp(KeyUI,"BackgroundTransparency",0,TWEEN_FADE) end
ApplySettings(false)
print("✅ NEXUS LADDAD + COPY EZ KEY KNAPP")
