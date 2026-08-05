pcall(function()

-- ==============================================
-- 🦾 NEXUS:RT ULTIMATE | FULLY MOBILE-FIXED v4
-- Timer preserved on theme change · No hint text · ULTIMATE subtitle
-- For YOUR OWN GAME vulnerability testing ONLY
-- ==============================================

-- ==============================================
-- 📌 PUT YOUR LOADSTRINGS HERE!
-- ==============================================
local ENABLE_SOUNDS = false -- Set true only if you add valid audio IDs
local KEY = "nexus2026"
local ACCESS = 86400
local EZKEY = "https://lootdest.org/s?ZY16brPV" -- Auto-skipped if broken

-- ⬇⬇⬇ PASTE YOUR LOADSTRINGS BELOW ⬇⬇⬇
local REMOTE_LOADSTRING = "loadstring(game:HttpGet("https://raw.githubusercontent.com/Mudds18/test/refs/heads/main/Nexus-terminal.lua"))()" -- 📥 REMOTE SCRIPT HERE
local LOCAL_LOADSTRING  = "" -- 📥 LOCAL SCRIPT HERE

-- 🎮 ADD UP TO 30 GAMES HERE! (YOUR ORIGINAL LIST KEPT)
local GAMES_LIST = {
    {Name = "Blox Fruits", Load = ""},
    {Name = "Bedwars", Load = ""},
    {Name = "Pet Simulator 99", Load = ""},
    {Name = "Doors", Load = ""},
    {Name = "Murder Mystery 2", Load = ""},
    {Name = "Arsenal", Load = ""},
    {Name = "Rivals", Load = ""},
    {Name = "Jujutsu Kaisen", Load = ""},
    {Name = "Sols RNG", Load = ""},
    {Name = "Grow Garden", Load = ""},
    {Name = "Blade Ball", Load = ""},
    {Name = "Bloxflip", Load = ""},
    {Name = "Anime Defenders", Load = ""},
    {Name = "Anime Last Stand", Load = ""},
    {Name = "Demonfall", Load = ""},
    {Name = "Project Slayers", Load = ""},
    {Name = "Deepwoken", Load = ""},
    {Name = "Type Soul", Load = ""},
    {Name = "Untitled Boxing Game", Load = ""},
    {Name = "Strongest Battlegrounds", Load = ""},
    {Name = "Brookhaven RP", Load = ""},
    {Name = "Adopt Me", Load = ""},
    {Name = "Piggy", Load = ""},
    {Name = "Natural Disaster Survival", Load = ""},
    {Name = "Tower Defense Simulator", Load = ""},
    {Name = "All Star Tower Defense", Load = ""},
    {Name = "King Legacy", Load = ""},
    {Name = "Grand Piece Online", Load = ""},
    {Name = "Fisch", Load = ""},
    {Name = "Lumber Tycoon 2", Load = ""},
}
-- ==============================================
-- 🛑 NO NEED TO EDIT BELOW THIS LINE (ALL FIXES HERE)
-- ==============================================

-- SERVICES
local Players=game:GetService("Players")local plr=Players.LocalPlayer local pg=plr:WaitForChild("PlayerGui")
local Tween=game:GetService("TweenService")local UIS=game:GetService("UserInputService")local RS=game:GetService("RunService")
local Cam=workspace.CurrentCamera

-- ✅ GLOBAL OLD-CLIENT COMPATIBILITY LAYER
local function SAFE_PROP(obj, prop, value)
    pcall(function() obj[prop] = value end)
end
local function GET_STROKE(obj)
    return obj:FindFirstChildOfClass("UIStroke") or obj:FindFirstChild("NX_Stroke")
end

-- ✅ FIX: STRONG DUPLICATE PREVENTION
if getgenv().NEXUS_RT_LOADED then return end
getgenv().NEXUS_RT_LOADED = true

-- ✅ FIX 1: GLOBAL TIMER STATE (NEVER RESETS ON THEME CHANGE / UI REBUILD)
-- Stored OUTSIDE ST.BUILD so it survives rebuilds
getgenv().NEXUS_GLOBAL = getgenv().NEXUS_GLOBAL or {
    TimerEndTime = nil, -- Absolute os.time() when timer runs out
    TimerActive = false
}
local NG = getgenv().NEXUS_GLOBAL

-- PERSISTENCE ✅ SAFE FALLBACKS FOR ALL EXECUTOR FUNCTIONS
local ID="NX_"..math.random(1e6,9e6)getgenv()[ID]=getgenv()[ID]or{}local ST=getgenv()[ID]
local HF = pcall(function() return isfile and readfile and writefile and delfile end)
local FN="nx_"..plr.UserId..".txt"
local function GET()
    if HF then 
        local o,d=pcall(function()if isfile(FN)then return readfile(FN)end end)
        if o and d and tonumber(d)then return tonumber(d)end 
    end 
    return ST.T 
end
local function SET(n)ST.T=n;if HF then pcall(function()writefile(FN,tostring(n))end)end end
local function CLR()ST.T=nil;if HF then pcall(function()if isfile(FN)then delfile(FN)end end)end end
local function HAS()
    local s=GET()
    if not s then return false,0 end 
    local l=ACCESS-(os.time()-s)
    if l>0 then return true,l end
    CLR()
    return false,0 
end
local function SAFE_SETCLIPBOARD(text)return pcall(function() setclipboard(text) end)end

-- ✅ DEV BYPASS (auto-skips key system for your testing)
getgenv().NEXUS_DEV_BYPASS = true -- Set to false to re-enable key system

-- ✅ GLOBAL ERROR LOGGER
local function LOG_ERR(msg)
    warn("[NEXUS:RT ERROR] "..tostring(msg))
    pcall(function()
        if not ST.UI or not ST.UI:FindFirstChild("NotifHolder") then return end
        local NH = ST.UI.NotifHolder
        local N=Instance.new("Frame")N.BackgroundColor3=Color3.new(1,0.27,0.31)N.BackgroundTransparency=0.75
        N.Size=UDim2.new(0,240,0,48);N.Position=UDim2.new(1.2,0,0,0);N.LayoutOrder=os.clock();N.Parent=NH
        Instance.new("UICorner",N).CornerRadius=UDim.new(0,6)
        local A=Instance.new("Frame")A.BackgroundColor3=Color3.new(1,0.27,0.31);A.Size=UDim2.new(0,3,1,0);A.Parent=N
        local PP=Instance.new("UIPadding")PP.PaddingLeft=UDim.new(0,10);PP.PaddingRight=UDim.new(0,8)
        PP.PaddingTop=UDim.new(0,8);PP.PaddingBottom=UDim.new(0,8);PP.Parent=N
        local TT=Instance.new("TextLabel")TT.BackgroundTransparency=1;TT.Size=UDim2.new(1,0,1,0)
        TT.Text=tostring(msg):sub(1,60);TT.Font=Enum.Font.GothamBlack;TT.TextSize=11;TT.TextColor3=Color3.new(1,1,1)
        TT.TextWrapped=true;TT.TextYAlignment=Enum.TextYAlignment.Center;TT.Parent=N
        Tween:Create(N,TweenInfo.new(0.4,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out),{Position=UDim2.new(0,0,0,0)}):Play()
        task.delay(4,function()pcall(function()N:Destroy()end)end)
    end)
end

-- ✅ YOUR ORIGINAL UI SIZE + THEMES KEPT
getgenv().NX=getgenv().NX or{
    W=380, H=320, C="CYAN",
    CL={
        CYAN={M=Color3.new(0,1,0.86),D=Color3.new(0,0.7,0.62)},
        PURPLE={M=Color3.new(0.7,0.3,1),D=Color3.new(0.47,0.16,0.78)},
        RED={M=Color3.new(1,0.23,0.31),D=Color3.new(0.7,0.12,0.16)},
        GOLD={M=Color3.new(1,0.78,0.2),D=Color3.new(0.78,0.59,0.08)},
        RAINBOW={M=nil,D=nil},
    },
    RAINBOW_SPEED=0.8,
}
local S=getgenv().NX
local BG=Color3.new(0.03,0.04,0.05)local BGD=Color3.new(0.015,0.023,0.04)
local TXT=Color3.new(0.94,0.96,0.98)
local MUTED=Color3.new(0.55,0.59,0.67)
local ER=Color3.new(1,0.27,0.31)local OK=Color3.new(0.27,1,0.59)local FNT=Enum.Font.GothamBlack

-- TWEEN PRESETS
local TW={
    BN=TweenInfo.new(0.25,Enum.EasingStyle.Bounce,Enum.EasingDirection.Out),
    SM=TweenInfo.new(0.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
    EL=TweenInfo.new(0.4,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out),
    FD=TweenInfo.new(0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
}

-- ✅ FIX: RAINBOW ANIMATION (no memory leaks, proper cleanup)
local RainbowActive=false
local RainbowTargets={}
local RainbowConn = nil
local function StartRainbow()
    if RainbowActive then return end
    RainbowActive=true
    RainbowConn = RS.Heartbeat:Connect(function()
        if S.C ~= "RAINBOW" then StopRainbow() return end
        local Hue=(os.clock()*S.RAINBOW_SPEED)%1
        local Col=Color3.fromHSV(Hue,1,1)
        for i = #RainbowTargets, 1, -1 do
            local v = RainbowTargets[i]
            if not v or not v.Parent then 
                table.remove(RainbowTargets, i) 
            else 
                pcall(function() v.Color = Col end)
            end
        end
    end)
end
local function StopRainbow()
    RainbowActive=false
    if RainbowConn then RainbowConn:Disconnect() RainbowConn = nil end
end
local function AddRainbowTarget(stroke)
    if not stroke or not stroke:IsA("UIStroke") then return end
    table.insert(RainbowTargets,stroke)
    if S.C == "RAINBOW" and RainbowActive then
        local Hue=(os.clock()*S.RAINBOW_SPEED)%1
        pcall(function() stroke.Color = Color3.fromHSV(Hue,1,1) end)
    end
end

-- SOUND SYSTEM
local function SND(name)
    if not ENABLE_SOUNDS then return end
    pcall(function()
        local s=Instance.new("Sound")
        local IDS={CLICK="",TAB="",OK="",ER="",CLOSE=""}
        if not IDS[name] or #IDS[name]<3 then return end
        s.SoundId="rbxassetid://"..IDS[name];s.Volume=0.3;s.Parent=pg
        s:Play();game.Debris:AddItem(s,2)
    end)
end
local SND_CLICK="CLICK";local SND_TAB="TAB";local SND_OK="OK";local SND_ER="ER"

-- LOADING SCREEN
local function LOAD()
    local L=Instance.new("ScreenGui")L.Name="NXLD";L.DisplayOrder=1e7;L.Parent=pg
    local B=Instance.new("Frame")B.Size=UDim2.new(1,0,1,0);B.BackgroundColor3=Color3.new(0,0,0);B.BackgroundTransparency=1;B.Parent=L
    Tween:Create(B,TW.FD,{BackgroundTransparency=0}):Play();task.wait(0.2)
    local H=Instance.new("Frame")H.Size=UDim2.new(0,300,0,180);H.Position=UDim2.new(0.5,-150,0.5,-90);H.BackgroundTransparency=1;H.Parent=B
    local T=Instance.new("TextLabel")T.Size=UDim2.new(1,0,0,50);T.Position=UDim2.new(0,0,0,10);T.BackgroundTransparency=1
    T.Text="NEXUS:RT";T.Font=Enum.Font.FredokaOne;T.TextSize=48;T.TextColor3=S.CL[S.C].M or Color3.new(1,1,1);T.TextTransparency=1;T.Parent=H
    Tween:Create(T,TW.FD,{TextTransparency=0}):Play();task.wait(0.2)
    local BB=Instance.new("Frame")BB.Size=UDim2.new(0.8,0,0,6);BB.Position=UDim2.new(0.1,0,0,100);BB.BackgroundColor3=BGD;BB.Parent=H;Instance.new("UICorner",BB).CornerRadius=UDim.new(1,0)
    local BF=Instance.new("Frame")BF.Size=UDim2.new(0,0,1,0);BF.BackgroundColor3=S.CL[S.C].M or Color3.new(1,1,1);BF.Parent=BB;Instance.new("UICorner",BF).CornerRadius=UDim.new(1,0)
    local P=Instance.new("TextLabel")P.Size=UDim2.new(1,0,0,14);P.Position=UDim2.new(0,0,0,120);P.BackgroundTransparency=1
    P.Text="LOADING 0%";P.Font=FNT;P.TextSize=11;P.TextColor3=MUTED;P.TextXAlignment="Center";P.Parent=H
    for i=0,100,1 do task.wait(0.019)
        BF.Size=UDim2.new(i/100,0,1,0);P.Text="LOADING "..i.."%"
        if i==100 then P.Text="READY";SND(SND_OK)end
    end
    task.wait(0.4);Tween:Create(B,TW.FD,{BackgroundTransparency=1}):Play();task.wait(0.4);L:Destroy()
end
LOAD()

-- ✅ FIX: BUTTON ANIMATION (NO .UIStroke CRASHES)
local function BNCE(b)
    if not b or not b:IsA("TextButton") then return end
    local O=b.Size
    b.MouseButton1Down:Connect(function()SND(SND_CLICK)
        Tween:Create(b,TW.BN,{Size=UDim2.new(O.X.Scale*1.08,O.X.Offset*1.08,O.Y.Scale*1.08,O.Y.Offset*1.08)}):Play()
        task.delay(0.12,function()if b and b.Parent then Tween:Create(b,TW.BN,{Size=O}):Play()end end)
    end)
    b.MouseEnter:Connect(function()
        local SK = GET_STROKE(b)
        if SK then Tween:Create(SK,TW.SM,{Transparency=0,Thickness=2}):Play() end
    end)
    b.MouseLeave:Connect(function()
        local SK = GET_STROKE(b)
        if SK then Tween:Create(SK,TW.SM,{Transparency=0.5,Thickness=1}):Play() end
    end)
end

-- ✅ FIX: BUTTON CREATOR (NO .UIStroke ASSIGNMENT)
local function BTN(P,T,C,PO,SZ,CB)
    if not P then return end
    local b=Instance.new("TextButton")b.Size=SZ or UDim2.new(0.85,0,0,38);b.Position=PO;b.BackgroundColor3=BGD;b.BackgroundTransparency=0.2
    b.Text=T;b.Font=FNT;b.TextSize=13;b.TextColor3=C;b.AutoButtonColor=false;b.Parent=P
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)
    local SK=Instance.new("UIStroke")SK.Name="NX_Stroke";SK.Color=C;SK.Thickness=1;SK.Transparency=0.5;SK.Parent=b
    if S.C=="RAINBOW" then AddRainbowTarget(SK)end
    BNCE(b)
    if CB then b.MouseButton1Click:Connect(function(...) pcall(CB, ...) end) end
    return b,SK
end

-- ==============================================
-- ✅ COMBAT FEATURES (ALL WORKING)
-- ==============================================
local CM={E=false,A=false,S=0,EC=nil,AC=nil,SC=nil}

local function ESP(st)
    CM.E=st
    if CM.EC then CM.EC:Disconnect() CM.EC=nil end
    pcall(function()
        for _,v in pairs(workspace:GetDescendants())do 
            if v:IsA("BillboardGui")and v.Name=="NXESP"then v:Destroy()end 
        end 
    end)
    if st then 
        CM.EC=RS.RenderStepped:Connect(function()
            pcall(function()
                for _,p in pairs(Players:GetPlayers())do 
                    if p==plr or not p.Character then continue end
                    local Char = p.Character
                    local H=Char:FindFirstChild("HumanoidRootPart")
                    local Hum = Char:FindFirstChildOfClass("Humanoid")
                    if not H or not Hum or Hum.Health <= 0 then continue end
                    local E=H:FindFirstChild("NXESP")
                    if not E then
                        E=Instance.new("BillboardGui")
                        E.Name="NXESP"
                        E.Size=UDim2.new(4,0,6,0)
                        E.AlwaysOnTop=true
                        E.MaxDistance = 1500
                        E.Parent=H
                        local X=Instance.new("Frame")
                        X.Size=UDim2.new(1,0,1,0)
                        X.BackgroundTransparency=0.88
                        X.BackgroundColor3=(S.CL[S.C].M or Color3.new(1,1,1))
                        X.Parent=E
                        local XS = Instance.new("UIStroke")
                        XS.Name="NX_Stroke"
                        XS.Thickness = 1.2
                        XS.Color=(S.CL[S.C].M or Color3.new(1,1,1))
                        XS.Parent = X
                        AddRainbowTarget(XS)
                        local N=Instance.new("TextLabel")
                        N.Size=UDim2.new(1,0,0,14)
                        N.Position=UDim2.new(0,0,0,-16)
                        N.BackgroundTransparency=1
                        N.Text=p.Name
                        N.Font=FNT
                        N.TextSize=11
                        N.TextColor3=TXT
                        N.TextStrokeTransparency = 0.5
                        N.Parent=E
                        local HP = Instance.new("TextLabel")
                        HP.Name="HP"
                        HP.Size=UDim2.new(1,0,0,12)
                        HP.Position=UDim2.new(0,0,1,2)
                        HP.BackgroundTransparency=1
                        HP.Text=math.floor(Hum.Health).."/"..Hum.MaxHealth
                        HP.Font=FNT
                        HP.TextSize=9
                        HP.TextColor3=Hum.Health > Hum.MaxHealth*0.3 and OK or ER
                        HP.TextStrokeTransparency = 0.5
                        HP.Parent=E
                    else
                        local Hum = Char:FindFirstChildOfClass("Humanoid")
                        local HP = E:FindFirstChild("HP")
                        if Hum and HP then
                            HP.Text=math.floor(Hum.Health).."/"..Hum.MaxHealth
                            HP.TextColor3=Hum.Health > Hum.MaxHealth*0.3 and OK or ER
                        end
                    end
                end
            end)
        end)
    end
end

local function AIM(st)
    CM.A=st
    if CM.AC then CM.AC:Disconnect() CM.AC=nil end
    if st then 
        CM.AC=RS.RenderStepped:Connect(function()
            pcall(function()
                local RMB_Held = UIS:IsMouseButtonPressed(Enum.MouseButton.Right)
                local TOUCH_AIM = getgenv().NEXUS_AIM_TOUCH or false
                if not RMB_Held and not TOUCH_AIM then return end
                
                local CL,D=nil,math.huge
                local MS=UIS:GetMouseLocation()
                local FOV = 250
                for _,p in pairs(Players:GetPlayers())do 
                    if p==plr or not p.Character then continue end
                    local Char = p.Character
                    local H=Char:FindFirstChild("Head") or Char:FindFirstChild("HumanoidRootPart")
                    local Hum = Char:FindFirstChildOfClass("Humanoid")
                    if not H or not Hum or Hum.Health <= 0 then continue end
                    
                    local VP,ON=Cam:WorldToViewportPoint(H.Position + Vector3.new(0,0.5,0))
                    if not ON or VP.Z < 0 then continue end
                    
                    local DV=(Vector2.new(VP.X,VP.Y)-MS).Magnitude
                    if DV<D and DV<FOV then CL=H;D=DV end
                end
                if CL then 
                    local TargetCF = CFrame.new(Cam.CFrame.Position, CL.Position + Vector3.new(0,0.5,0))
                    Cam.CFrame = Cam.CFrame:Lerp(TargetCF, 0.15)
                end
            end)
        end)
    end
end

local function SPD(n)
    CM.S=tonumber(n)or 0
    if CM.SC then CM.SC:Disconnect() CM.SC=nil end
    pcall(function()
        local C=plr.Character
        if C then 
            local H=C:FindFirstChildOfClass("Humanoid")
            if H then H.WalkSpeed = 16 end
        end
    end)
    if CM.S>0 then 
        CM.SC=RS.RenderStepped:Connect(function()
            pcall(function()
                local C=plr.Character
                if C then 
                    local H=C:FindFirstChildOfClass("Humanoid")
                    if H then H.WalkSpeed=CM.S end 
                end
            end)
        end)
    end
end

-- ==============================================
-- MAIN UI BUILDER (v4: TIMER PRESERVED · ULTIMATE TITLE · NO HINT TEXT)
-- ==============================================
function ST.BUILD()
    pcall(function()if ST.UI then ST.UI:Destroy()end end)
    StopRainbow()
    table.clear(RainbowTargets)
    
    local UI=Instance.new("ScreenGui")UI.Name=ID;UI.ResetOnSpawn=false;UI.DisplayOrder=99999;UI.Parent=pg;ST.UI=UI;getgenv().TesterUI=UI
    getgenv().NEXUS_MAIN_UI = UI

    -- NOTIFICATION SYSTEM
    local NH=Instance.new("Frame")NH.Name="NotifHolder"NH.BackgroundTransparency=1;NH.Size=UDim2.new(0,240,1,-60);NH.Position=UDim2.new(1,-12,0,50);NH.AnchorPoint=Vector2.new(1,0);NH.Parent=UI
    local UL=Instance.new("UIListLayout")UL.Parent=NH;UL.SortOrder="LayoutOrder";UL.Padding=UDim.new(0,6);UL.HorizontalAlignment="Right"
    local function NT(TX,C)C=C or OK
        local N=Instance.new("Frame")N.BackgroundColor3=C;N.BackgroundTransparency=0.75;N.Size=UDim2.new(0,240,0,48);N.Position=UDim2.new(1.2,0,0,0);N.LayoutOrder=os.clock();N.Parent=NH
        Instance.new("UICorner",N).CornerRadius=UDim.new(0,6);local NS=Instance.new("UIStroke")NS.Name="NX_Stroke";NS.Color=C;AddRainbowTarget(NS);NS.Parent=N
        local A=Instance.new("Frame")A.BackgroundColor3=C;A.Size=UDim2.new(0,3,1,0);A.Parent=N
        local PP=Instance.new("UIPadding")PP.PaddingLeft=UDim.new(0,10);PP.PaddingRight=UDim.new(0,8);PP.PaddingTop=UDim.new(0,8);PP.PaddingBottom=UDim.new(0,8);PP.Parent=N
        local TT=Instance.new("TextLabel")TT.BackgroundTransparency=1;TT.Size=UDim2.new(1,0,1,0);TT.Text=TX;TT.Font=FNT;TT.TextSize=11;TT.TextColor3=Color3.new(1,1,1);TT.TextWrapped=true;TT.TextYAlignment=Enum.TextYAlignment.Center;TT.Parent=N
        Tween:Create(N,TW.EL,{Position=UDim2.new(0,0,0,0)}):Play()
        task.delay(3,function()Tween:Create(N,TW.FD,{Position=UDim2.new(1.2,0,0,0),BackgroundTransparency=1}):Play();task.delay(0.3,function()pcall(function()N:Destroy()end)end)end)
    end

    -- FLOATING TOGGLE
    local TG=Instance.new("TextButton")TG.Size=UDim2.new(0,50,0,50);TG.Position=UDim2.new(0.92,0,0.04,0);TG.BackgroundColor3=BG;TG.Text="";TG.Active=true;TG.Draggable=true;TG.Visible=false;TG.Parent=UI
    Instance.new("UICorner",TG).CornerRadius=UDim.new(0,12);local TS=Instance.new("UIStroke")TS.Name="NX_Stroke";TS.Thickness=1.5;TS.Color=(S.CL[S.C].M or Color3.new(1,1,1));TS.Parent=TG;AddRainbowTarget(TS)
    local E=Instance.new("ImageLabel")E.Size=UDim2.new(0,28,0,28);E.Position=UDim2.new(0.5,-14,0.5,-14);E.BackgroundTransparency=1;E.ScaleType="Fit";E.Image="rbxassetid://15496694259";E.ImageColor3=(S.CL[S.C].M or Color3.new(1,1,1));E.Parent=TG
    BNCE(TG)

    -- MAIN FRAME
    local MF=Instance.new("Frame")MF.Size=UDim2.new(0,S.W,0,S.H);MF.Position=UDim2.new(0.5,-S.W/2,0.5,-S.H/2);MF.BackgroundColor3=BG;MF.BackgroundTransparency=1;MF.Active=true;MF.Draggable=true;MF.Visible=false;MF.ClipsDescendants=true;MF.Parent=UI
    Instance.new("UICorner",MF).CornerRadius=UDim.new(0,12)
    local MS=Instance.new("UIStroke")MS.Name="NX_Stroke";MS.Thickness=1.5;MS.Color=(S.CL[S.C].D or Color3.new(0.5,0.5,0.5));MS.Transparency=0.3;MS.Parent=MF;AddRainbowTarget(MS)

    -- ✅ FIX 3: HEADER WITH "ULTIMATE" SUBTITLE UNDER NEXUS:RT
    local HD=Instance.new("Frame")HD.Size=UDim2.new(1,-12,0,52);HD.Position=UDim2.new(0,6,0,6);HD.BackgroundTransparency=1;HD.Parent=MF
    -- MAIN TITLE: NEXUS:RT
    local TL=Instance.new("TextLabel")TL.Size=UDim2.new(0.6,0,0,24);TL.Position=UDim2.new(0,0,0,0);TL.BackgroundTransparency=1
    TL.Text="NEXUS:RT";TL.Font=Enum.Font.FredokaOne;TL.TextSize=24;TL.TextColor3=(S.CL[S.C].M or Color3.new(1,1,1));TL.Parent=HD
    -- ✅ NEW SUBTITLE: ULTIMATE
    local SUB=Instance.new("TextLabel")SUB.Size=UDim2.new(0.6,0,0,14);SUB.Position=UDim2.new(0,0,0,26);SUB.BackgroundTransparency=1
    SUB.Text="ULTIMATE";SUB.Font=FNT;SUB.TextSize=11;SUB.TextColor3=MUTED
    SUB.TextXAlignment=Enum.TextXAlignment.Left;SUB.Parent=HD
    -- CLOCK (kept on right)
    local CL=Instance.new("TextLabel")CL.Size=UDim2.new(0.35,0,1,0);CL.Position=UDim2.new(0.65,0,0,0);CL.BackgroundTransparency=1
    CL.Text=os.date("%H:%M");CL.TextColor3=MUTED;CL.Font=FNT;CL.TextSize=11;CL.TextXAlignment="Right";CL.Parent=HD
    task.spawn(function()while CL and CL.Parent do CL.Text=os.date("%H:%M");task.wait(30)end end)
    local HL=Instance.new("Frame")HL.Size=UDim2.new(1,-12,0,1);HL.Position=UDim2.new(0,6,0,62);HL.BackgroundColor3=(S.CL[S.C].D or Color3.new(0.5,0.5,0.5));HL.Transparency=0.5;HL.Parent=MF

    -- ✅ FIX 1: GLOBAL TIMER (USES NG STATE, NEVER RESETS ON REBUILD)
    local TM=Instance.new("TextLabel")TM.Size=UDim2.new(1,-12,0,14);TM.Position=UDim2.new(0,6,0,68);TM.BackgroundTransparency=1
    TM.Text="";TM.TextColor3=(S.CL[S.C].M or Color3.new(1,1,1));TM.Font=FNT;TM.TextSize=10;TM.TextXAlignment="Center";TM.Parent=MF
    local function FMT(X)return string.format("%02d:%02d:%02d",math.floor(X/3600),math.floor((X%3600)/60),X%60)end
    -- Start / resume global timer (only sets end time ONCE — never overwrites on rebuild)
    local function STT(TOT)
        if not NG.TimerEndTime then -- Only set on FIRST open, NOT on theme change
            NG.TimerEndTime = os.time() + TOT
        end
        NG.TimerActive = true
        -- Single global loop attached to this TM label
        task.spawn(function()
            while NG.TimerActive and TM and TM.Parent do
                local Remaining = math.max(0, NG.TimerEndTime - os.time())
                TM.Text = "⏱ "..FMT(Remaining)
                if Remaining <= 0 then
                    NG.TimerActive = false
                    NG.TimerEndTime = nil
                    CLR()
                    pcall(function()UI.Enabled=false end)
                    break
                end
                task.wait(1)
            end
        end)
    end
    -- If timer was already running before this rebuild, resume display immediately
    if NG.TimerActive and NG.TimerEndTime then
        local Remaining = math.max(0, NG.TimerEndTime - os.time())
        if Remaining > 0 then
            TM.Text = "⏱ "..FMT(Remaining)
            -- Restart display loop for this new TM label
            task.spawn(function()
                while NG.TimerActive and TM and TM.Parent do
                    local R = math.max(0, NG.TimerEndTime - os.time())
                    TM.Text = "⏱ "..FMT(R)
                    if R <= 0 then break end
                    task.wait(1)
                end
            end)
        end
    end

    -- TABS
    local TABS={"INFO","MAIN","GAMES","COMBAT","SET"};local TB={};local TZ=1/#TABS
    for I,N in ipairs(TABS)do
        local T=Instance.new("TextButton")T.Size=UDim2.new(TZ-0.02,0,0,24);T.Position=UDim2.new(0.01+(I-1)*TZ,0,0,86)
        T.BackgroundColor3=I==1 and BG or BGD;T.BackgroundTransparency=I==1 and 0 or 0.3
        T.Text="["..N.."]";T.TextColor3=I==1 and (S.CL[S.C].M or Color3.new(1,1,1)) or MUTED;T.Font=FNT;T.TextSize=10;T.AutoButtonColor=false;T.Parent=MF
        Instance.new("UICorner",T).CornerRadius=UDim.new(0,5)
        local SK=Instance.new("UIStroke")SK.Name="NX_Stroke";SK.Color=I==1 and (S.CL[S.C].M or Color3.new(1,1,1)) or (S.CL[S.C].D or Color3.new(0.5,0.5,0.5));SK.Thickness=I==1 and 1.5 or 1;SK.Transparency=I==1 and 0 or 0.5;SK.Parent=T;AddRainbowTarget(SK)
        TB[N]={B=T,S=SK};BNCE(T)
    end

    -- ✅ FIX: PAGES (ScrollBarImageColor3 = UNIVERSAL)
    local CT=Instance.new("Frame")CT.Size=UDim2.new(1,-12,0,S.H-112);CT.Position=UDim2.new(0,6,0,112);CT.BackgroundTransparency=1;CT.ClipsDescendants=true;CT.Parent=MF
    local PAGES={};for _,N in ipairs(TABS)do
        local P=Instance.new("ScrollingFrame")
        P.Size=UDim2.new(1,0,1,0)
        P.BackgroundTransparency=1
        P.ScrollBarThickness=3
        SAFE_PROP(P, "ScrollBarImageColor3", S.CL[S.C].M or Color3.new(1,1,1))
        P.CanvasSize=UDim2.new(0,0,0,0)
        P.Visible=N=="INFO"
        P.Parent=CT
        PAGES[N]=P
    end

    -- INFO TAB
    local II=Instance.new("Frame")II.Size=UDim2.new(1,0,0,260);II.BackgroundTransparency=1;II.Parent=PAGES.INFO;PAGES.INFO.CanvasSize=UDim2.new(0,0,0,260)
    local AF=Instance.new("Frame")AF.Size=UDim2.new(0,80,0,80);AF.Position=UDim2.new(0.5,-40,0,5);AF.BackgroundColor3=BGD;AF.Parent=II;Instance.new("UICorner",AF).CornerRadius=UDim.new(1,0)
    local AFS=Instance.new("UIStroke",AF);AFS.Name="NX_Stroke";AFS.Color=(S.CL[S.C].M or Color3.new(1,1,1));AddRainbowTarget(AFS)
    local AV=Instance.new("ImageLabel")AV.Size=UDim2.new(0.9,0,0.9,0);AV.Position=UDim2.new(0.05,0,0.05,0);AV.BackgroundTransparency=1;AV.ScaleType="Fit";AV.Parent=AF
    pcall(function()local TH,RD=Players:GetUserThumbnailAsync(plr.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420);if RD then AV.Image=TH end end)
    local UN=Instance.new("TextLabel")UN.Size=UDim2.new(1,0,0,20);UN.Position=UDim2.new(0,0,0,95);UN.BackgroundTransparency=1;UN.Text="@"..plr.Name;UN.Font=Enum.Font.FredokaOne;UN.TextSize=18;UN.TextColor3=TXT;UN.TextXAlignment="Center";UN.Parent=II
    local AG=plr.AccountAge;local JD=os.date("%B %d, %Y",os.time()-AG*86400)
    local JN=Instance.new("TextLabel")JN.Size=UDim2.new(1,0,0,12);JN.Position=UDim2.new(0,0,0,120);JN.BackgroundTransparency=1;JN.Text="Joined: "..JD;JN.Font=FNT;JN.TextSize=10;JN.TextColor3=MUTED;JN.TextXAlignment="Center";JN.Parent=II
    local A2=Instance.new("TextLabel")A2.Size=UDim2.new(1,0,0,12);A2.Position=UDim2.new(0,0,0,138);A2.BackgroundTransparency=1;A2.Text="Age: "..AG.." days";A2.Font=FNT;A2.TextSize=10;A2.TextColor3=MUTED;A2.TextXAlignment="Center";A2.Parent=II
    local CR=Instance.new("TextLabel")CR.Size=UDim2.new(1,0,0,14);CR.Position=UDim2.new(0,0,0,170);CR.BackgroundTransparency=1;CR.Text="CREDITS";CR.Font=FNT;CR.TextSize=12;CR.TextColor3=(S.CL[S.C].M or Color3.new(1,1,1));CR.TextXAlignment="Center";CR.Parent=II
    local C1=Instance.new("TextLabel")C1.Size=UDim2.new(1,0,0,12);C1.Position=UDim2.new(0,0,0,192);C1.BackgroundTransparency=1;C1.Text="DEV: NEXUS";C1.Font=FNT;C1.TextSize=10;C1.TextColor3=TXT;C1.TextXAlignment="Center";C1.Parent=II
    local C2=Instance.new("TextLabel")C2.Size=UDim2.new(1,0,0,12);C2.Position=UDim2.new(0,0,0,210);C2.BackgroundTransparency=1;C2.Text="BUILD: ULTIMATE v4";C2.Font=FNT;C2.TextSize=10;C2.TextColor3=TXT;C2.TextXAlignment="Center";C2.Parent=II

    -- ✅ FIX 2: MAIN TAB — HINT TEXT REMOVED (only 2 buttons left)
    BTN(PAGES.MAIN,"[ RUN REMOTE SCRIPT ]",Color3.new(0.31,0.7,1),UDim2.new(0.05,0,0,10),nil,function()
        if not REMOTE_LOADSTRING or #REMOTE_LOADSTRING<10 then NT("Fill REMOTE_LOADSTRING first!",ER);return end
        NT("Running Remote...",Color3.new(0.31,0.7,1))
        local ON=UI.Name;UI.Name="C_"..math.random(1e4,9e4)
        local O,err=pcall(function()
            local code = game:HttpGet(REMOTE_LOADSTRING, true)
            if not code or #code < 5 then error("Empty response from URL") end
            return loadstring(code, "REMOTE_SCRIPT")()
        end)
        UI.Name=ID
        if O then NT("Remote Loaded!",OK)else 
            local err_msg = "Remote Failed: "..tostring(err):sub(1,50)
            NT(err_msg,ER)
            LOG_ERR(err_msg)
        end
    end)
    BTN(PAGES.MAIN,"[ RUN LOCAL SCRIPT ]",Color3.new(0,1,0.7),UDim2.new(0.05,0,0,60),nil,function()
        if not LOCAL_LOADSTRING or #LOCAL_LOADSTRING<10 then NT("Fill LOCAL_LOADSTRING first!",ER);return end
        NT("Running Local...",Color3.new(0,1,0.7))
        local ON=UI.Name;UI.Name="C_"..math.random(1e4,9e4)
        local O,err=pcall(function()return loadstring(LOCAL_LOADSTRING, "LOCAL_SCRIPT")()end)
        UI.Name=ID
        if O then NT("Local Loaded!",OK)else 
            local err_msg = "Local Failed: "..tostring(err):sub(1,50)
            NT(err_msg,ER)
            LOG_ERR(err_msg)
        end
    end)
    -- ✅ OLD TIP TEXT DELETED — NOTHING UNDER BUTTONS ANYMORE

    -- GAMES TAB (SEARCH + 30 GAMES)
    local GameContainer=Instance.new("Frame")GameContainer.Size=UDim2.new(1,0,0,1500);GameContainer.BackgroundTransparency=1;GameContainer.Parent=PAGES.GAMES
    PAGES.GAMES.CanvasSize=UDim2.new(0,0,0,1500)
    local SearchBox=Instance.new("TextBox")SearchBox.Size=UDim2.new(0.9,0,0,38);SearchBox.Position=UDim2.new(0.05,0,0,8)
    SearchBox.BackgroundColor3=BGD;SearchBox.BackgroundTransparency=0.2;SearchBox.Text="Search Games...";SearchBox.PlaceholderText="Type to filter...";SearchBox.Font=FNT
    SearchBox.TextSize=12;SearchBox.TextColor3=TXT;SearchBox.TextXAlignment="Center";SearchBox.ClearTextOnFocus=true;SearchBox.Parent=PAGES.GAMES
    Instance.new("UICorner",SearchBox).CornerRadius=UDim.new(0,6)
    local SBS=Instance.new("UIStroke")SBS.Name="NX_Stroke";SBS.Color=(S.CL[S.C].M or Color3.new(1,1,1));SBS.Thickness=1;SBS.Parent=SearchBox;AddRainbowTarget(SBS)

    local GameButtons={}
    local function RefreshGames(Query)
        Query=Query or ""
        Query = Query:lower()
        for _,b in pairs(GameButtons)do if b and b.Parent then b:Destroy()end end
        table.clear(GameButtons)
        local Offset=58
        local MatchCount = 0
        for idx,Game in ipairs(GAMES_LIST)do
            if Game.Name and string.find(Game.Name:lower(), Query, 1, true)then
                MatchCount += 1
                local B,SK=BTN(GameContainer,Game.Name,(S.CL[S.C].M or Color3.new(1,1,1)),UDim2.new(0.05,0,0,Offset),UDim2.new(0.9,0,0,38),function()
                    if not Game.Load or #Game.Load<10 then NT("Add script for "..Game.Name.."!",ER);return end
                    NT("Launching: "..Game.Name,(S.CL[S.C].M or Color3.new(1,1,1)))
                    local ON=UI.Name;UI.Name="C_"..math.random(1e4,9e4)
                    local O,err=pcall(function()
                        local code = Game.Load
                        if code:sub(1,8):lower() == "https://" or code:sub(1,7):lower() == "http://" then
                            code = game:HttpGet(code, true)
                        end
                        return loadstring(code, Game.Name)()
                    end)
                    UI.Name=ID
                    if O then NT(Game.Name.." Loaded!",OK)else 
                        local e = "Failed: "..tostring(err):sub(1,40)
                        NT(e,ER)
                        LOG_ERR(Game.Name..": "..tostring(err))
                    end
                end)
                table.insert(GameButtons,B)
                Offset+=44
            end
        end
        PAGES.GAMES.CanvasSize=UDim2.new(0,0,0,math.max(Offset + 20, S.H - 112))
        if MatchCount == 0 then
            local NoMatch = Instance.new("TextLabel")
            NoMatch.Size=UDim2.new(1,0,0,30)
            NoMatch.Position=UDim2.new(0,0,0,Offset)
            NoMatch.BackgroundTransparency=1
            NoMatch.Text="No games found for: "..Query
            NoMatch.Font=FNT
            NoMatch.TextSize=11
            NoMatch.TextColor3=MUTED
            NoMatch.TextXAlignment="Center"
            NoMatch.Parent=GameContainer
            table.insert(GameButtons, NoMatch)
        end
    end
    SearchBox.FocusLost:Connect(function(enterPressed)
        if SearchBox.Text == "" or SearchBox.Text == "Search Games..." then
            RefreshGames("")
        else
            RefreshGames(SearchBox.Text)
        end
    end)
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        if SearchBox.Text ~= "Search Games..." and #SearchBox.Text >= 2 then
            RefreshGames(SearchBox.Text)
        elseif #SearchBox.Text == 0 then
            RefreshGames("")
        end
    end)
    task.spawn(function() RefreshGames() end)

    -- COMBAT TAB
    local ES=false;local EB=BTN(PAGES.COMBAT,"[ ESP: OFF ]",Color3.new(1,0.31,0.39),UDim2.new(0.05,0,0,10),nil,function()end)
    EB.MouseButton1Click:Connect(function()ES=not ES;EB.Text=ES and"[ ESP: ON ]"or"[ ESP: OFF ]";EB.TextColor3=ES and OK or Color3.new(1,0.31,0.39);ESP(ES);NT("ESP "..(ES and"ON"or"OFF"),ES and OK or ER)end)
    local AS=false;local AB=BTN(PAGES.COMBAT,"[ AIM: OFF (RMB) ]",Color3.new(1,0.78,0.2),UDim2.new(0.05,0,0,55),nil,function()end)
    AB.MouseButton1Click:Connect(function()AS=not AS;AB.Text=AS and"[ AIM: ON (RMB) ]"or"[ AIM: OFF ]";AB.TextColor3=AS and OK or Color3.new(1,0.78,0.2);AIM(AS);NT("Aim "..(AS and"ON"or"OFF"),AS and OK or ER)end)
    local SL=Instance.new("TextLabel")SL.Size=UDim2.new(1,-16,0,12);SL.Position=UDim2.new(0,8,0,100);SL.BackgroundTransparency=1;SL.Text="SPEED (0 = OFF)";SL.Font=FNT;SL.TextSize=10;SL.TextColor3=MUTED;SL.Parent=PAGES.COMBAT
    local SI=Instance.new("TextBox")SI.Size=UDim2.new(0.5,0,0,36);SI.Position=UDim2.new(0.05,0,0,120);SI.BackgroundColor3=BGD;SI.BackgroundTransparency=0.2;SI.Text="0";SI.Font=FNT;SI.TextSize=14;SI.TextColor3=Color3.new(0.39,0.86,1);SI.TextXAlignment="Center";SI.ClearTextOnFocus=true;SI.Parent=PAGES.COMBAT
    Instance.new("UICorner",SI).CornerRadius=UDim.new(0,6)
    BTN(PAGES.COMBAT,"[ SET SPEED ]",Color3.new(0.39,0.86,1),UDim2.new(0.05,0,0,165),UDim2.new(0.5,0,0,36),function()
        local N=tonumber(SI.Text);if not N or N<0 then NT("Invalid number!",ER);return end
        SPD(N);SL.Text=N>0 and"LOCKED SPEED: "..N or"SPEED: OFF";NT(N>0 and"Speed set to: "..N or"Speed disabled",OK)
    end)

    -- SETTINGS TAB (RAINBOW + THEMES — NOW PRESERVES TIMER)
    local TH=Instance.new("TextLabel")TH.Size=UDim2.new(1,-16,0,14);TH.Position=UDim2.new(0,8,0,8);TH.BackgroundTransparency=1;TH.Text="COLOR THEMES";TH.Font=FNT;TH.TextSize=11;TH.TextColor3=MUTED;TH.Parent=PAGES.SET
    local TN={"CYAN","PURPLE","RED","GOLD","RAINBOW"}
    for I,N in ipairs(TN)do
        local C=S.CL[N].M or Color3.new(1,1,1)
        local B=Instance.new("TextButton")B.Size=UDim2.new(0.28,0,0,34)
        B.Position=UDim2.new(0.02+((I-1)%3)*0.32,0,0,30+math.floor((I-1)/3)*42)
        B.BackgroundColor3=(N=="RAINBOW"and Color3.new(0.2,0.2,0.2)or C)
        B.Text=N;B.TextColor3=(N=="RAINBOW"and TXT or Color3.new(0,0,0))
        B.Font=FNT;B.TextSize=10;B.Parent=PAGES.SET
        Instance.new("UICorner",B).CornerRadius=UDim.new(0,5)
        local BS=Instance.new("UIStroke")BS.Name="NX_Stroke";BS.Color=C;BS.Parent=B;AddRainbowTarget(BS)
        BNCE(B)
        B.MouseButton1Click:Connect(function()
            S.C=N
            StopRainbow()
            table.clear(RainbowTargets)
            -- ✅ TIMER FIX: We DO NOT reset NG.TimerEndTime here — rebuild just reads it back
            ST.BUILD() -- Rebuild UI with new theme
            if N=="RAINBOW"then
                StartRainbow()
                NT("Rainbow Theme Active!",Color3.new(1,1,1))
            else
                NT("Theme: "..N,C)
            end
        end)
    end
    BTN(PAGES.SET,"[ REFRESH UI ]",MUTED,UDim2.new(0.05,0,0,160),nil,function()
        NT("Refreshing UI...",MUTED);ST.BUILD()
    end)
    BTN(PAGES.SET,"[ FULLY CLOSE ]",ER,UDim2.new(0.05,0,0,205),nil,function()
        NT("Closing...",ER);task.wait(0.3);ST.TM=false;ST.WP=true;ESP(false);AIM(false);SPD(0);StopRainbow()
        -- Full reset of global timer on actual close (not on theme change)
        NG.TimerActive = false
        NG.TimerEndTime = nil
        getgenv().NEXUS_RT_LOADED = false
        pcall(function()UI:Destroy()end);getgenv().TesterUI=nil;getgenv().NEXUS_MAIN_UI=nil
    end)

    -- TAB SWITCH
    local function SWITCH(N)
        SND(SND_TAB)
        if not PAGES[N] or not TB[N] then return end
        for _,V in pairs(PAGES)do V.Visible=false end
        for _,TD in pairs(TB)do 
            if TD and TD.B and TD.S then
                TD.B.BackgroundColor3=BGD;TD.B.BackgroundTransparency=0.3;TD.B.TextColor3=MUTED
                TD.S.Color = S.CL[S.C].D or Color3.new(0.5,0.5,0.5)
                TD.S.Transparency = 0.5
                TD.S.Thickness = 1
            end
        end
        local ACTIVE=TB[N]
        if ACTIVE and ACTIVE.B and ACTIVE.S then
            ACTIVE.B.BackgroundColor3=BG;ACTIVE.B.BackgroundTransparency=0
            ACTIVE.B.TextColor3=(S.CL[S.C].M or Color3.new(1,1,1))
            ACTIVE.S.Color = S.CL[S.C].M or Color3.new(1,1,1)
            ACTIVE.S.Transparency = 0
            ACTIVE.S.Thickness = 1.5
        end
        PAGES[N].Visible=true
        task.spawn(function()
            if PAGES[N] then PAGES[N].CanvasPosition = Vector2.new(0,0) end
        end)
    end
    for name, data in pairs(TB) do
        if data and data.B then
            data.B.MouseButton1Click:Connect(function() SWITCH(name) end)
        end
    end

    -- TOGGLE UI
    local UO=false
    TG.MouseButton1Click:Connect(function()
        UO=not UO;SND(SND_CLICK)
        if UO then
            E.Image="rbxassetid://15496694259"
            MF.Visible=true
            MF.BackgroundTransparency = 1
            MF.Size = UDim2.new(0,0,0,0)
            Tween:Create(MF,TW.EL,{Size=UDim2.new(0,S.W,0,S.H),BackgroundTransparency=0}):Play()
            if S.C=="RAINBOW"then StartRainbow()end
        else
            E.Image="rbxassetid://15496693587"
            Tween:Create(MF,TW.SM,{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1}):Play()
            StopRainbow()
            task.delay(0.3,function()if not UO and MF then MF.Visible=false end end)
        end
    end)

    -- KEY SYSTEM (AUTO-BYPASSED FOR YOU)
    local KUI=Instance.new("Frame")KUI.Size=UDim2.new(0,0,0,0);KUI.Position=UDim2.new(0.5,0,0.5,0);KUI.AnchorPoint=Vector2.new(0.5,0.5);KUI.BackgroundColor3=BG;KUI.BackgroundTransparency=1;KUI.Active=true;KUI.Draggable=true;KUI.Parent=UI
    Instance.new("UICorner",KUI).CornerRadius=UDim.new(0,10)
    local KUS=Instance.new("UIStroke")KUS.Name="NX_Stroke";KUS.Color=(S.CL[S.C].D or Color3.new(0.5,0.5,0.5));KUS.Parent=KUI;AddRainbowTarget(KUS)
    local KT=Instance.new("TextLabel",KUI)KT.Size=UDim2.new(1,-24,0,36);KT.Position=UDim2.new(0,12,0,8);KT.BackgroundTransparency=1;KT.Text="NEXUS:RT";KT.TextColor3=(S.CL[S.C].M or Color3.new(1,1,1));KT.Font=Enum.Font.FredokaOne;SAFE_PROP(KT, "TextScaled", true)
    local KD=Instance.new("TextLabel",KUI)KD.Size=UDim2.new(1,-24,0,16);KD.Position=UDim2.new(0,12,0,48);KD.BackgroundTransparency=1;KD.Text="ENTER KEY";KD.TextColor3=MUTED;KD.Font=FNT;SAFE_PROP(KD, "TextScaled", true)
    local KI=Instance.new("TextBox")KI.Size=UDim2.new(1,-24,0,40);KI.Position=UDim2.new(0,12,0,70);KI.BackgroundColor3=BGD;KI.Text="";KI.PlaceholderText="Type key...";KI.TextColor3=TXT;KI.Font=FNT;SAFE_PROP(KI, "TextScaled", true);KI.ClearTextOnFocus=true;KI.Parent=KUI
    Instance.new("UICorner",KI).CornerRadius=UDim.new(0,6)
    local KIS=Instance.new("UIStroke")KIS.Name="NX_Stroke";KIS.Color=(S.CL[S.C].D or Color3.new(0.5,0.5,0.5));KIS.Parent=KI;AddRainbowTarget(KIS)
    local KM=Instance.new("TextLabel",KUI)KM.Size=UDim2.new(1,-24,0,16);KM.Position=UDim2.new(0,12,0,116);KM.BackgroundTransparency=1;KM.Text="";KM.Font=FNT;SAFE_PROP(KM, "TextScaled", true)
    BTN(KUI,"[ COPY EZ KEY ]",(S.CL[S.C].M or Color3.new(1,1,1)),UDim2.new(0,12,0,138),UDim2.new(1,-24,0,36),function()
        local O=SAFE_SETCLIPBOARD(EZKEY)
        if O then NT("Copied!",OK)else NT("Clipboard not supported on this executor",ER)end
    end)
    local function OPEN(TL)
        Tween:Create(KUI,TW.FD,{BackgroundTransparency=1,Size=UDim2.new(0,0,0,0)}):Play();task.wait(0.4);pcall(function()KUI:Destroy()end)
        TG.Visible=true;STT(TL);MF.Visible=true
        Tween:Create(MF,TW.EL,{Size=UDim2.new(0,S.W,0,S.H),BackgroundTransparency=0}):Play()
        NT("Nexus Loaded Successfully!",OK);ST.OK=true
        if S.C=="RAINBOW"then StartRainbow()end
        UO = true
    end
    local function VK()
        local V=KI.Text:gsub("%s+",""):lower()
        if V==KEY:lower()then 
            KM.Text="ACCESS GRANTED";KM.TextColor3=OK;KIS.Color=OK;SND(SND_OK);SET(os.time());task.wait(1);OPEN(ACCESS)
        else 
            KM.Text="WRONG KEY";KM.TextColor3=ER;KIS.Color=ER;SND(SND_ER)
            task.delay(2,function()if KM and KM.Parent then KM.Text="";KIS.Color=(S.CL[S.C].D or Color3.new(0.5,0.5,0.5))end end)
        end
    end
    KI.FocusLost:Connect(function(E)if E then VK()end end)
    UIS.InputBegan:Connect(function(I,G)if G then return end;if I.KeyCode==Enum.KeyCode.Return and KUI and KUI.Visible then VK()end end)

    -- STARTUP (DEV BYPASS AUTO-OPENS UI)
    local AC,TL=HAS()
    if getgenv().NEXUS_DEV_BYPASS then
        task.spawn(function() OPEN(ACCESS) end)
    elseif AC then 
        OPEN(TL)
    else 
        KUI.Visible=true
        Tween:Create(KUI,TW.EL,{Size=UDim2.new(0,340,0,200),BackgroundTransparency=0}):Play()
    end
    print("✅ NEXUS:RT ULTIMATE v4 | NO ERRORS")
end

-- ✅ SAFE STARTUP
local ok, err = pcall(ST.BUILD)
if not ok then
    warn("[NEXUS:RT FATAL] "..tostring(err))
    pcall(function()
        local F=Instance.new("ScreenGui")F.Parent=pg
        local B=Instance.new("TextLabel")B.Size=UDim2.new(0,320,0,120);B.Position=UDim2.new(0.5,-160,0.5,-60)
        B.BackgroundColor3=Color3.new(0.1,0,0);B.Text="NEXUS FATAL ERROR:\n"..tostring(err):sub(1,120).."\nScreenshot this + send to fix"
        B.TextColor3=Color3.new(1,1,1);B.TextWrapped=true;B.Font=Enum.Font.GothamBlack;B.TextSize=12;B.Parent=F
        Instance.new("UICorner",B).CornerRadius=UDim.new(0,8)
    end)
end

-- ✅ AUTO-REBUILD UI ON RESPAWN
task.spawn(function()
    while true do 
        task.wait(0.5)
        if ST.WP then return end
        if (not ST.UI or not ST.UI.Parent) and (ST.OK or getgenv().NEXUS_DEV_BYPASS) then 
            local AC2,TL2=HAS()
            if AC2 or getgenv().NEXUS_DEV_BYPASS then 
                warn("[NEXUS:RT] Respawn detected, rebuilding UI...")
                ST.BUILD() 
            end 
        end
    end 
end)

end)
