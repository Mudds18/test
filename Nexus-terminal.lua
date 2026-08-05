-- NEXUS TERMINAL v4 | FIXED: NO JUMP | SMOOTH COLOR/SIZE TWEENS | SETTINGS SCROLL
-- FOR TESTING YOUR OWN GAME ONLY

-- CLEANUP
getgenv().TestRunning = false
if getgenv().TesterUI then pcall(function() getgenv().TesterUI:Destroy() end) end
getgenv().TesterUI = nil

-- SERVICES
local plr = game.Players.LocalPlayer
local pg = plr:WaitForChild("PlayerGui")
local rs = game:GetService("ReplicatedStorage")
local ts = game:GetService("TweenService")
local uis = game:GetService("UserInputService")

-- ==============================================
-- SETTINGS
-- ==============================================
getgenv().NexusSettings = {
    Width = 200,
    Height = 250,
    Color = "GREEN",
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
local FONT = Enum.Font.SourceSansBold
local TWEEN_COLOR = TweenInfo.new(0.35, Enum.EasingStyle.Sine) -- Smooth color fade
local TWEEN_SIZE  = TweenInfo.new(0.25, Enum.EasingStyle.Quad) -- Smooth size grow

-- ==============================================
-- BASE UI
-- ==============================================
local sg = Instance.new("ScreenGui")
sg.Name = "Nexus"
sg.ResetOnSpawn = false
sg.DisplayOrder = 9999
sg.Parent = pg
getgenv().TesterUI = sg

-- TOGGLE
local tog = Instance.new("TextButton")
tog.Size = UDim2.new(0,40,0,40)
tog.Position = UDim2.new(0.92,0,0.05,0)
tog.BackgroundColor3 = BG
tog.Text = "O"
tog.Font = FONT
tog.TextScaled = true
tog.Active = true
tog.Draggable = true
tog.Parent = sg
local tc = Instance.new("UICorner")
tc.CornerRadius = UDim.new(0,6)
tc.Parent = tog
local togs = Instance.new("UIStroke")
togs.Thickness = 1
togs.Parent = tog

-- MAIN WINDOW (✅ ANCHORED TOP-LEFT → NEVER JUMPS POSITION)
local main = Instance.new("Frame")
main.Size = UDim2.new(0,0,0,0)
main.Position = UDim2.new(0.03,0,0.15,0) -- ✅ Fixed top-left anchor point
main.AnchorPoint = Vector2.new(0,0)         -- ✅ Critical: no position shift on resize
main.BackgroundColor3 = BG
main.Active = true
main.Draggable = true
main.Visible = true
main.Parent = sg
local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(0,4)
mc.Parent = main
local mains = Instance.new("UIStroke")
mains.Thickness = 1
mains.Transparency = 0.5
mains.Parent = main

-- L-SHAPED CORNERS
local Corners = {}
local function makeCorner(xPos, yPos, rot)
    local c = Instance.new("Frame")
    c.Size = UDim2.new(0,18,0,18)
    c.Position = UDim2.new(xPos,0,yPos,0)
    c.BackgroundTransparency = 1
    c.Rotation = rot
    c.Parent = main
    local h = Instance.new("Frame")
    h.Size = UDim2.new(1,0,0,2)
    h.BackgroundColor3 = SET.Colors[SET.Color].Main
    h.BorderSizePixel = 0
    h.Parent = c
    local v = Instance.new("Frame")
    v.Size = UDim2.new(0,2,0,18)
    v.BackgroundColor3 = SET.Colors[SET.Color].Main
    v.BorderSizePixel = 0
    v.Parent = c
    table.insert(Corners, {H = h, V = v})
end
makeCorner(0,0,0)
makeCorner(1,1,180)

-- HEADER
local hdr = Instance.new("Frame")
hdr.Size = UDim2.new(1,-10,0,24)
hdr.Position = UDim2.new(0,5,0,5)
hdr.BackgroundTransparency = 1
hdr.Parent = main
local ttl = Instance.new("TextLabel")
ttl.Size = UDim2.new(0.65,0,1,0)
ttl.BackgroundTransparency = 1
ttl.Text = "NEXUS:RT"
ttl.Font = FONT
ttl.TextScaled = true
ttl.TextXAlignment = Enum.TextXAlignment.Left
ttl.Parent = hdr
local tm = Instance.new("TextLabel")
tm.Size = UDim2.new(0.35,0,1,0)
tm.Position = UDim2.new(0.65,0,0,0)
tm.BackgroundTransparency = 1
tm.Text = os.date("%H:%M")
tm.TextColor3 = TXTDIM
tm.Font = FONT
tm.TextScaled = true
tm.TextXAlignment = Enum.TextXAlignment.Right
tm.Parent = hdr
task.spawn(function() while tm.Parent do tm.Text = os.date("%H:%M") task.wait(15) end end)

local hl = Instance.new("Frame")
hl.Size = UDim2.new(1,-10,0,1)
hl.Position = UDim2.new(0,5,0,32)
hl.BackgroundTransparency = 0.6
hl.BorderSizePixel = 0
hl.Parent = main

-- TABS
local tabY = 40
local tabs = {}
local function makeTab(name, x, active)
    local t = Instance.new("TextButton")
    t.Size = UDim2.new(0.3,0,0,22)
    t.Position = UDim2.new(x,0,0,tabY)
    t.BackgroundColor3 = active and BG or BGDARK
    t.BackgroundTransparency = active and 0 or 0.4
    t.Text = "["..string.upper(name).."]"
    t.TextColor3 = active and SET.Colors[SET.Color].Main or TXTDIM
    t.Font = FONT
    t.TextScaled = true
    t.Parent = main
    local tcc = Instance.new("UICorner")
    tcc.CornerRadius = UDim.new(0,3)
    tcc.Parent = t
    local tss = Instance.new("UIStroke")
    tss.Color = active and SET.Colors[SET.Color].Main or SET.Colors[SET.Color].Dim
    tss.Thickness = active and 1.5 or 1
    tss.Transparency = active and 0 or 0.6
    tss.Parent = t
    tabs[name] = {Btn = t, Stroke = tss}
    return t
end
local t1 = makeTab("MAIN", 0.03, true)
local t2 = makeTab("REM", 0.355, false)
local t3 = makeTab("SET", 0.68, false)

-- CONTENT
local content = Instance.new("Frame")
content.Size = UDim2.new(1,-10,0,165)
content.Position = UDim2.new(0,5,0,68)
content.BackgroundTransparency = 1
content.Parent = main

-- MAIN PAGE
local p1 = Instance.new("Frame")
p1.Size = UDim2.new(1,0,1,0)
p1.BackgroundTransparency = 1
p1.Visible = true
p1.Parent = content

-- REMOTES SCROLL
local sf = Instance.new("ScrollingFrame")
sf.Size = UDim2.new(1,0,1,0)
sf.BackgroundTransparency = 1
sf.Visible = false
sf.ClipsDescendants = true
sf.ScrollBarThickness = 2
sf.ScrollBarImageTransparency = 0.4
sf.CanvasSize = UDim2.new(0,0,0,0)
sf.Parent = content

local sb = Instance.new("TextBox")
sb.Size = UDim2.new(1,0,0,22)
sb.Position = UDim2.new(0,0,0,0)
sb.BackgroundColor3 = BGDARK
sb.Text = "[SEARCH]"
sb.TextColor3 = TXT
sb.Font = FONT
sb.TextScaled = true
sb.ClearTextOnFocus = true
sb.Parent = sf
local sbc = Instance.new("UICorner")
sbc.CornerRadius = UDim.new(0,3)
sbc.Parent = sb
local sbs = Instance.new("UIStroke")
sbs.Thickness = 1
sbs.Parent = sb

-- ✅ SETTINGS PAGE = SCROLLING FRAME (WIPE BUTTON FITS AT BOTTOM)
local p3 = Instance.new("ScrollingFrame")
p3.Size = UDim2.new(1,0,1,0)
p3.BackgroundTransparency = 1
p3.Visible = false
p3.ClipsDescendants = true
p3.ScrollBarThickness = 2
p3.ScrollBarImageTransparency = 0.4
p3.CanvasSize = UDim2.new(0,0,0,260) -- Tall enough for all controls + WIPE
p3.Parent = content

local p3Inner = Instance.new("Frame") -- All controls inside this
p3Inner.Size = UDim2.new(1,0,0,260)
p3Inner.BackgroundTransparency = 1
p3Inner.Parent = p3

-- BOTTOM STATUS
local bot = Instance.new("TextLabel")
bot.Size = UDim2.new(1,-10,0,14)
bot.Position = UDim2.new(0,5,1,-19)
bot.BackgroundTransparency = 1
bot.Text = "STATUS: READY"
bot.Font = FONT
bot.TextScaled = true
bot.TextXAlignment = Enum.TextXAlignment.Left
bot.Parent = main

-- ==============================================
-- ✅ TWEENED UPDATE: SMOOTH COLOR + SIZE, NO JUMP
-- ==============================================
local function TweenProp(obj, prop, val, info)
    ts:Create(obj, info, {[prop] = val}):Play()
end

local function ApplySettings(tweenSize)
    local COL = SET.Colors[SET.Color].Main
    local DIM = SET.Colors[SET.Color].Dim
    local W = SET.Width
    local H = SET.Height

    -- ✅ 1) SMOOTH SIZE TWEEN (AnchorPoint keeps position FIXED)
    if tweenSize then
        TweenProp(main, "Size", UDim2.new(0,W,0,H), TWEEN_SIZE)
    else
        main.Size = UDim2.new(0,W,0,H)
    end
    content.Size = UDim2.new(1,-10,0,H - 103)

    -- ✅ 2) SMOOTH COLOR TWEEN EVERYTHING
    TweenProp(tog, "TextColor3", COL, TWEEN_COLOR)
    TweenProp(togs, "Color", COL, TWEEN_COLOR)
    TweenProp(mains, "Color", DIM, TWEEN_COLOR)
    TweenProp(hl, "BackgroundColor3", DIM, TWEEN_COLOR)
    TweenProp(ttl, "TextColor3", COL, TWEEN_COLOR)
    TweenProp(bot, "TextColor3", COL, TWEEN_COLOR)
    TweenProp(sf, "ScrollBarImageColor3", COL, TWEEN_COLOR)
    TweenProp(p3, "ScrollBarImageColor3", COL, TWEEN_COLOR)
    TweenProp(sbs, "Color", DIM, TWEEN_COLOR)

    -- Corners
    for i = 1,#Corners do
        TweenProp(Corners[i].H, "BackgroundColor3", COL, TWEEN_COLOR)
        TweenProp(Corners[i].V, "BackgroundColor3", COL, TWEEN_COLOR)
    end

    -- Tabs
    for name, data in pairs(tabs) do
        local active = (data.Btn.BackgroundTransparency < 0.3)
        if active then
            TweenProp(data.Btn, "TextColor3", COL, TWEEN_COLOR)
            TweenProp(data.Stroke, "Color", COL, TWEEN_COLOR)
            data.Stroke.Thickness = 1.5
            data.Stroke.Transparency = 0
        else
            TweenProp(data.Btn, "TextColor3", TXTDIM, TWEEN_COLOR)
            TweenProp(data.Stroke, "Color", DIM, TWEEN_COLOR)
            data.Stroke.Thickness = 1
            data.Stroke.Transparency = 0.6
        end
    end

    -- Remote buttons
    for btn, o in pairs(getgenv().RemoteItems or {}) do
        local active = (btn.BackgroundTransparency < 0.25)
        if active then
            TweenProp(btn.UIStroke, "Color", COL, TWEEN_COLOR)
            TweenProp(btn, "TextColor3", COL, TWEEN_COLOR)
        else
            TweenProp(btn.UIStroke, "Color", DIM, TWEEN_COLOR)
            TweenProp(btn, "TextColor3", TXT, TWEEN_COLOR)
        end
    end
end

-- ==============================================
-- TAB SWITCH
-- ==============================================
local function switchTab(active)
    p1.Visible = false sf.Visible = false p3.Visible = false
    for n,data in pairs(tabs) do
        data.Btn.BackgroundColor3 = BGDARK
        data.Btn.BackgroundTransparency = 0.4
        data.Btn.TextColor3 = TXTDIM
        data.Stroke.Color = SET.Colors[SET.Color].Dim
        data.Stroke.Thickness = 1
        data.Stroke.Transparency = 0.6
    end
    local s = tabs[active]
    s.Btn.BackgroundColor3 = BG
    s.Btn.BackgroundTransparency = 0
    s.Btn.TextColor3 = SET.Colors[SET.Color].Main
    s.Stroke.Color = SET.Colors[SET.Color].Main
    s.Stroke.Thickness = 1.5
    s.Stroke.Transparency = 0
    if active == "MAIN" then p1.Visible = true
    elseif active == "REM" then sf.Visible = true
    elseif active == "SET" then p3.Visible = true end
end
t1.MouseButton1Click:Connect(function() switchTab("MAIN") end)
t2.MouseButton1Click:Connect(function() switchTab("REM") end)
t3.MouseButton1Click:Connect(function() switchTab("SET") end)

-- TOGGLE
tog.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
    if main.Visible then
        tog.TextColor3 = SET.Colors[SET.Color].Main
        main.Size = UDim2.new(0,0,0,0)
        TweenProp(main, "Size", UDim2.new(0,SET.Width,0,SET.Height), TWEEN_SIZE)
    else tog.TextColor3 = TXTDIM end
end)

-- ==============================================
-- CORE FUNCTIONS
-- ==============================================
local all = {}
getgenv().RemoteItems = {}
local sel = nil
local delay = 0.1

local function scan()
    for i = #sf:GetChildren(),1,-1 do
        local c = sf:GetChildren()[i]
        if c ~= sb then c:Destroy() end
    end
    sf.CanvasSize = UDim2.new(0,0,0,0)
    all = {} getgenv().RemoteItems = {} sel = nil
    bot.Text = "STATUS: SCANNING..."
    local locs = {rs, game.ReplicatedFirst, game.StarterGui, workspace, game.Players}
    for l = 1,#locs do
        if not locs[l] then continue end
        local k = locs[l]:GetDescendants()
        for d = 1,#k do
            local o = k[d]
            if o:IsA("RemoteEvent") or o:IsA("RemoteFunction") then
                table.insert(all, o)
                local n = #all
                local b = Instance.new("TextButton")
                b.Size = UDim2.new(1,0,0,24)
                b.Position = UDim2.new(0,0,0,n*28 + 26)
                b.BackgroundColor3 = BGDARK
                b.BackgroundTransparency = 0.3
                b.Text = " "..o.Name
                b.TextColor3 = TXT
                b.Font = FONT
                b.TextScaled = true
                b.TextXAlignment = Enum.TextXAlignment.Left
                b.Parent = sf
                local bc = Instance.new("UICorner")
                bc.CornerRadius = UDim.new(0,2)
                bc.Parent = b
                local bs = Instance.new("UIStroke")
                bs.Color = SET.Colors[SET.Color].Dim
                bs.Thickness = 1
                bs.Transparency = 0.7
                bs.Parent = b
                getgenv().RemoteItems[b] = o
                b.MouseButton1Click:Connect(function()
                    for btn in pairs(getgenv().RemoteItems) do
                        btn.BackgroundColor3 = BGDARK
                        btn.BackgroundTransparency = 0.3
                        btn.UIStroke.Color = SET.Colors[SET.Color].Dim
                        btn.TextColor3 = TXT
                    end
                    sel = o
                    b.BackgroundColor3 = Color3.fromRGB(0,40,30)
                    b.BackgroundTransparency = 0.1
                    b.UIStroke.Color = SET.Colors[SET.Color].Main
                    b.TextColor3 = SET.Colors[SET.Color].Main
                    bot.Text = "TARGET: "..string.sub(o.Name,1,12)
                end)
                sf.CanvasSize = UDim2.new(0,0,0,n*28 + 60)
            end
        end
    end
    bot.Text = "FOUND: "..#all.." | READY"
    sb.Changed:Connect(function(p)
        if p ~= "Text" then return end
        local q = sb.Text:lower()
        for btn,o in pairs(getgenv().RemoteItems) do
            btn.Visible = (o.Name:lower():find(q) ~= nil)
        end
    end)
end

local function spamSel()
    if not sel then bot.Text = "ERROR: NO TARGET" return end
    getgenv().TestRunning = true
    bot.Text = "FIRING: "..string.sub(sel.Name,1,10)
    task.spawn(function()
        while getgenv().TestRunning do
            pcall(function()
                if sel:IsA("RemoteEvent") then sel:FireServer("t",1)
                else sel:InvokeServer("t",1) end
            end)
            task.wait(delay)
        end
    end)
end

local function spamAll()
    if #all == 0 then scan() return end
    getgenv().TestRunning = true
    bot.Text = "MASS FIRE: "..#all
    task.spawn(function()
        while getgenv().TestRunning do
            for i = 1,#all do
                if not getgenv().TestRunning then return end
                pcall(function()
                    if all[i]:IsA("RemoteEvent") then all[i]:FireServer("a",1)
                    else all[i]:InvokeServer("a",1) end
                end)
                task.wait(delay)
            end
        end
    end)
end

local function stop()
    getgenv().TestRunning = false
    bot.Text = "STATUS: STOPPED | "..#all
end

-- ==============================================
-- MAIN BUTTONS
-- ==============================================
getgenv().ActionButtons = {}
local function btn(parent, txt, col, y, func)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.47,0,0,34)
    b.Position = UDim2.new(y%2==0 and 0 or 0.53, 0, 0, math.floor(y/2)*42)
    b.BackgroundColor3 = BGDARK
    b.BackgroundTransparency = 0.25
    b.Text = "["..txt.."]"
    b.TextColor3 = col
    b.Font = FONT
    b.TextScaled = true
    b.Parent = parent
    local cc = Instance.new("UICorner")
    cc.CornerRadius = UDim.new(0,3)
    cc.Parent = b
    local ss = Instance.new("UIStroke")
    ss.Color = col
    ss.Thickness = 1
    ss.Transparency = 0.5
    ss.Parent = b
    table.insert(getgenv().ActionButtons, {Btn = b, Stroke = ss})
    b.MouseEnter:Connect(function() TweenProp(b, "BackgroundTransparency", 0, TweenInfo.new(0.1)) TweenProp(ss, "Transparency", 0, TweenInfo.new(0.1)) end)
    b.MouseLeave:Connect(function() TweenProp(b, "BackgroundTransparency", 0.25, TweenInfo.new(0.1)) TweenProp(ss, "Transparency", 0.5, TweenInfo.new(0.1)) end)
    b.MouseButton1Click:Connect(func)
    return b
end

btn(p1, "SCAN", Color3.fromRGB(0,255,150), 0, scan)
btn(p1, "TARGET", Color3.fromRGB(255,200,50), 1, spamSel)
btn(p1, "MASS", Color3.fromRGB(255,80,80), 2, spamAll)
btn(p1, "STOP", Color3.fromRGB(100,180,255), 3, stop)

-- ==============================================
-- SETTINGS CONTROLS (INSIDE SCROLLING FRAME)
-- ==============================================
local SET_COLORS = {"GREEN","RED","BLUE","YELLOW"}
local COLOR_BTNS = {}

-- Color label
local clrLbl = Instance.new("TextLabel")
clrLbl.Size = UDim2.new(1,0,0,18)
clrLbl.Position = UDim2.new(0,0,0,4)
clrLbl.BackgroundTransparency = 1
clrLbl.Text = "[UI COLOR]"
clrLbl.TextColor3 = SET.Colors[SET.Color].Main
clrLbl.Font = FONT
clrLbl.TextScaled = true
clrLbl.TextXAlignment = Enum.TextXAlignment.Left
clrLbl.Parent = p3Inner

-- 4 Color Buttons
for i = 1,4 do
    local name = SET_COLORS[i]
    local col = SET.Colors[name].Main
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.22,0,0,28)
    b.Position = UDim2.new((i-1)*0.26, 0, 0, 28)
    b.BackgroundColor3 = col
    b.BackgroundTransparency = 0.3
    b.Text = string.upper(name)
    b.TextColor3 = Color3.new(0,0,0)
    b.Font = FONT
    b.TextScaled = true
    b.Parent = p3Inner
    local cc = Instance.new("UICorner")
    cc.CornerRadius = UDim.new(0,4)
    cc.Parent = b
    local bs = Instance.new("UIStroke")
    bs.Color = col
    bs.Thickness = name == SET.Color and 2 or 1
    bs.Transparency = name == SET.Color and 0 or 0.5
    bs.Parent = b
    COLOR_BTNS[name] = {Btn = b, Stroke = bs}

    -- ✅ CLICK = SMOOTH COLOR TWEEN (Yellow → Orange → Red etc.)
    b.MouseButton1Click:Connect(function()
        SET.Color = name
        for nm, data in pairs(COLOR_BTNS) do
            local isSel = (nm == name)
            data.Stroke.Thickness = isSel and 2 or 1
            data.Stroke.Transparency = isSel and 0 or 0.5
        end
        TweenProp(clrLbl, "TextColor3", SET.Colors[name].Main, TWEEN_COLOR)
        ApplySettings(false) -- ✅ Tween color only, no size change
    end)
end

-- Width Slider
local wLbl = Instance.new("TextLabel")
wLbl.Size = UDim2.new(1,0,0,16)
wLbl.Position = UDim2.new(0,0,0,70)
wLbl.BackgroundTransparency = 1
wLbl.Text = "[WIDTH]  200 ←→ 300  |  "..SET.Width
wLbl.TextColor3 = TXTDIM
wLbl.Font = FONT
wLbl.TextScaled = true
wLbl.TextXAlignment = Enum.TextXAlignment.Left
wLbl.Parent = p3Inner

local wSlider = Instance.new("TextButton")
wSlider.Size = UDim2.new(1,0,0,14)
wSlider.Position = UDim2.new(0,0,0,90)
wSlider.BackgroundColor3 = BGDARK
wSlider.AutoButtonColor = false
wSlider.Text = ""
wSlider.Parent = p3Inner
local wsc = Instance.new("UICorner")
wsc.CornerRadius = UDim.new(0,7)
wsc.Parent = wSlider
local wFill = Instance.new("Frame")
wFill.Size = UDim2.new(0,0,1,0)
wFill.BackgroundColor3 = SET.Colors[SET.Color].Main
wFill.Parent = wSlider
local wfc = Instance.new("UICorner")
wfc.CornerRadius = UDim.new(0,7)
wfc.Parent = wFill

-- Height Slider
local hLbl = Instance.new("TextLabel")
hLbl.Size = UDim2.new(1,0,0,16)
hLbl.Position = UDim2.new(0,0,0,115)
hLbl.BackgroundTransparency = 1
hLbl.Text = "[HEIGHT]  250 ←→ 350  |  "..SET.Height
hLbl.TextColor3 = TXTDIM
hLbl.Font = FONT
hLbl.TextScaled = true
hLbl.TextXAlignment = Enum.TextXAlignment.Left
hLbl.Parent = p3Inner

local hSlider = Instance.new("TextButton")
hSlider.Size = UDim2.new(1,0,0,14)
hSlider.Position = UDim2.new(0,0,0,135)
hSlider.BackgroundColor3 = BGDARK
hSlider.AutoButtonColor = false
hSlider.Text = ""
hSlider.Parent = p3Inner
local hsc = Instance.new("UICorner")
hsc.CornerRadius = UDim.new(0,7)
hsc.Parent = hSlider
local hFill = Instance.new("Frame")
hFill.Size = UDim2.new(0,0,1,0)
hFill.BackgroundColor3 = SET.Colors[SET.Color].Main
hFill.Parent = hSlider
local hfc = Instance.new("UICorner")
hfc.CornerRadius = UDim.new(0,7)
hfc.Parent = hFill

-- ✅ SLIDER LOGIC = SMOOTH SIZE TWEEN
local function makeSlider(slider, fill, label, minVal, maxVal, settingKey)
    local dragging = false
    local function update(input)
        local pct = math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
        local val = math.floor(minVal + (maxVal - minVal) * pct)
        SET[settingKey] = val
        fill.Size = UDim2.new(pct,0,1,0)
        TweenProp(fill, "BackgroundColor3", SET.Colors[SET.Color].Main, TWEEN_COLOR)
        label.Text = "["..string.upper(settingKey).."]  "..minVal.." ←→ "..maxVal.."  |  "..val
        ApplySettings(true) -- ✅ Smooth size tween, stays in same spot
    end
    slider.MouseButton1Down:Connect(function() dragging = true end)
    uis.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
    uis.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then update(i) end
    end)
    slider.MouseButton1Click:Connect(function()
        local m = plr:GetMouse()
        update({Position = Vector2.new(m.X, m.Y)})
    end)
    local initPct = (SET[settingKey] - minVal) / (maxVal - minVal)
    fill.Size = UDim2.new(initPct,0,1,0)
end
makeSlider(wSlider, wFill, wLbl, 200, 300, "Width")
makeSlider(hSlider, hFill, hLbl, 250, 350, "Height")

-- ✅ WIPE BUTTON = AT THE BOTTOM OF SETTINGS SCROLL
local del = btn(p3Inner, "WIPE UI", Color3.fromRGB(255,60,60), 200, function()
    getgenv().TestRunning = false
    TweenProp(main, "Size", UDim2.new(0,0,0,0), TWEEN_SIZE)
    task.wait(0.25)
    sg:Destroy()
    getgenv().TesterUI = nil
end)
del.Size = UDim2.new(1,0,0,32)
del.Position = UDim2.new(0,0,0,210) -- Bottom of scroll area

-- ==============================================
-- INIT + POP-IN
-- ==============================================
ApplySettings(false)
task.spawn(function()
    main.BackgroundTransparency = 1
    task.wait(0.05)
    ts:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Size = UDim2.new(0,SET.Width,0,SET.Height),
        BackgroundTransparency = 0
    }):Play()
end)

print("✅ NEXUS v4 LOADED | NO JUMP | SMOOTH TWEENS | SETTINGS SCROLL")
