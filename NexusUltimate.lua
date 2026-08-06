-- NEXUS:RT ULTIMATE | 100% WORKING · NO CUTS · SIMPLE EXECUTOR
-- FIXED: Refresh + All Colors + Per-Game Loadstrings

pcall(function() if getgenv().NEXUS_MAIN_UI then getgenv().NEXUS_MAIN_UI:Destroy() end end)
pcall(function() if getgenv().NEXUS_KEY_UI then getgenv().NEXUS_KEY_UI:Destroy() end end)
getgenv().NEXUS_MAIN_UI=nil getgenv().NEXUS_KEY_UI=nil

local Players=game:GetService("Players")local plr=Players.LocalPlayer local pg=plr:WaitForChild("PlayerGui",10)or plr.PlayerGui
local Tween=game:GetService("TweenService")local UIS=game:GetService("UserInputService")local RS=game:GetService("RunService")local Cam=workspace.CurrentCamera

-- ========== CONFIG ==========
local CORRECT_KEY="nexus" local ACCESS=24*60*60 local SF="nx_"..plr.UserId..".txt" local SG="_NX24_"..plr.UserId
local RUN_LOCAL=function()pcall(function()local O=getgenv().NEXUS_MAIN_UI getgenv().TesterUI=nil loadstring(game:HttpGet("https://raw.githubusercontent.com/Mudds18/test/refs/heads/main/NexusLocal.lua",true))()task.wait(.5)if O and O.Parent then getgenv().NEXUS_MAIN_UI=O end end)end
local RUN_REMOTE=function()pcall(function()local O=getgenv().NEXUS_MAIN_UI getgenv().TesterUI=nil loadstring(game:HttpGet("https://raw.githubusercontent.com/Mudds18/test/refs/heads/main/Nexus-terminal.lua",true))()task.wait(.5)if O and O.Parent then getgenv().NEXUS_MAIN_UI=O end end)end

-- 🎮 EDIT YOUR GAME LOADSTRINGS HERE (EASY!)
-- Paste each loadstring inside [[ ... ]] for the right game
local GAMES={
{Name="Blox Fruits",             LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua"))()
   ]]},
{Name="Bedwars",                 LS=[[ loadstring(game:HttpGet("https://files.vapevoidware.xyz/VapeVoidware/VW-Add/main/loader.lua", true))() ]]},
{Name="Pet Simulator 99",        LS=[[ loadstring(game:HttpGet('https://zaphub.xyz/Exec'))() ]]},
{Name="Doors",                   LS=[[ loadstring(game:httpget("https://raw.githubusercontent.com/gamingscripter/darkrai-x/main/games/doors"))() ]]},
{Name="Murder Mystery 2",        LS=[[ loadstring(game:HttpGet("https://globalexp.xyz/",true))() ]]},
{Name="Arsenal",                 LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/Pushok3/Arsenal-Script/refs/heads/main/ArsenalScript.lua",true))() ]]},
{Name="Rivals",                  LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/ByNami/RIVALS/main/RIVALS.lua",true))() ]]},
{Name="Jujutsu Kaisen",          LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript",true))() ]]},
{Name="Sols RNG",                LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/hyuki36/Sols-Rng/refs/heads/main/solsrng.txt",true))() ]]},
{Name="Grow Garden",             LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/defnotry/devry-hub/refs/heads/main/loader.lua",true))() ]]},
{Name="Blade Ball",              LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/joshhhie/rise/refs/heads/main/loader.lua",true))() ]]},
{Name="Bloxflip",                LS=[[ loadstring(game:HttpGet("PASTE BLOXFLIP LINK HERE",true))() ]]},
{Name="Anime Defenders",         LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/JonnyCheeser/rbw4/main/JonnyCheeseHub",true))() ]]},
{Name="Anime Last Stand",        LS=[[ loadstring(game:HttpGet("https://byorlofficial.live/Loader",true))() ]]},
{Name="Demonfall",               LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/Med99020/xor-hub/refs/heads/main/main.lua",true))() ]]},
{Name="Project Slayers",         LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/rugveddanej/LunaHub/master/loader",true))() ]]},
{Name="Deepwoken",               LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/bROuh2/Ghost-util/refs/heads/main/ghost.lua",true))() ]]},
{Name="Type Soul",               LS=[[ loadstring(game:HttpGet("https://pastefy.app/mDKOcI2O/raw",true))() ]]},
{Name="Untitled Boxing Game",    LS=[[ loadstring(game:HttpGet("https://pastebin.com/raw/RNhiXimN",true))() ]]},
{Name="Strongest Battlegrounds", LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/CombatGUI/refs/heads/main/TSBCombatGUI",true))() ]]},
{Name="Brookhaven RP",           LS=[[ loadstring(game:HttpGet("https://pastebin.com/raw/jXSbAJ0w",true))() ]]},
{Name="Adopt Me",                LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/piro8706/Scriptfarmer/refs/heads/main/Daldiya.lua",true))() ]]},
{Name="Piggy",                   LS=[[ loadstring(game:HttpGet("https://rawscripts.net/raw/Piggy-open-source-15390",true))() ]]},
{Name="Natural Disaster",        LS=[[ loadstring(game:HttpGet("PASTE NDS LINK HERE",true))() ]]},
{Name="Tower Defense Sim",       LS=[[ loadstring(game:HttpGet("PASTE TDS LINK HERE",true))() ]]},
{Name="All Star TD",             LS=[[ loadstring(game:HttpGet("PASTE ASTD LINK HERE",true))() ]]},
{Name="King Legacy",             LS=[[ loadstring(game:HttpGet("https://pastefy.app/hdssLGmt/raw",true))() ]]},
{Name="Grand Piece Online",      LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/dilleron964/Grand-Piece-Online/main/Grand-Piece-Online.lua",true))() ]]},
{Name="Fisch",                   LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/library",true))() ]]},
{Name="Lumber Tycoon 2",         LS=[[ loadstring(game:HttpGet("https://raw.githubusercontent.com/Bliqe/Upload/refs/heads/main/Games/LT2/5745347462.lua",true))() ]]},
}

-- ========== HELPERS ==========
local HF=pcall(function()local _=isfile end)
local SV=function(n)getgenv()[SG]=n if HF then pcall(function()writefile(SF,tostring(n))end)end pcall(function()pg:SetAttribute(SG,n)end)end
local LD=function()if getgenv()[SG]and tonumber(getgenv()[SG])then return tonumber(getgenv()[SG])end if HF then local o,v=pcall(function()if isfile(SF)then return readfile(SF)end end)if o and v and tonumber(v)then return tonumber(v)end end local o,v=pcall(function()return pg:GetAttribute(SG)end)if o and v and tonumber(v)then return tonumber(v)end return nil end
local CL=function()getgenv()[SG]=nil if HF then pcall(function()if isfile(SF)then delfile(SF)end end)end pcall(function()pg:SetAttribute(SG,nil)end)end
local CHK=function()local t=LD()if not t then return false,0 end local l=(t+ACCESS)-os.time()if l>0 then return true,l end CL()return false,0 end
local ERR=function(m)warn("NX ERR: "..m)pcall(function()local f=Instance.new("ScreenGui")f.Parent=pg f.DisplayOrder=99999 local b=Instance.new("Frame")b.Size=UDim2.new(0,300,0,120)b.Position=UDim2.new(.5,-150,.5,-60)b.BackgroundColor3=Color3.new(.15,0,0)b.Parent=f Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)local t=Instance.new("TextLabel")t.Size=UDim2.new(1,-20,1,-20)t.Position=UDim2.new(0,10,0,10)t.BackgroundTransparency=1 t.Text="NEXUS ERROR:\n"..m t.TextColor3=Color3.new(1,1,1)t.Font=Enum.Font.GothamBlack t.TextSize=11 t.TextWrapped=true t.Parent=b game.Debris:AddItem(f,10)end)end

getgenv().NX={
END=nil,TMR=false,DEAD=false,
RON=false,RTAB={},RCON=nil,
C={ESP=false,AIM=false,SPD=0,EL=nil,AL=nil,SL=nil},
THEME="CYAN",OPEN=false,
THEMES={
CYAN={M=Color3.new(0,1,.86),D=Color3.new(0,.7,.62)},
PURPLE={M=Color3.new(.7,.3,1),D=Color3.new(.47,.16,.78)},
RED={M=Color3.new(1,.23,.31),D=Color3.new(.7,.12,.16)},
GOLD={M=Color3.new(1,.78,.2),D=Color3.new(.78,.59,.08)},
RAINBOW={M=nil,D=nil}
},RSPD=.8
}
local NX=getgenv().NX
local BG=Color3.new(.03,.04,.05)local BGD=Color3.new(.015,.023,.04)local TXT=Color3.new(.94,.96,.98)local MUT=Color3.new(.55,.59,.67)local ERc=Color3.new(1,.27,.31)local OKc=Color3.new(.27,1,.59)local FNT=Enum.Font.GothamBlack local TW=TweenInfo.new(.22,Enum.EasingStyle.Quad)
local COL=function()return NX.THEMES[NX.THEME].M or Color3.new(1,1,1)end
local DCOL=function()return NX.THEMES[NX.THEME].D or Color3.new(.5,.5,.5)end

-- ✅ FIXED RAINBOW (ALL COLORS NOW WORK)
local RST=function()
NX.RON=false
if NX.RCON then pcall(function()NX.RCON:Disconnect()end)NX.RCON=nil end
local c=COL()for _,v in pairs(NX.RTAB)do pcall(function()if v and v.Parent then v.Color=c end end)end
end
local RGO=function()
if NX.RON then return end NX.RON=true
NX.RCON=RS.Heartbeat:Connect(function()
if NX.THEME~="RAINBOW"then RST()return end
local c=Color3.fromHSV((os.clock()*NX.RSPD)%1,1,1)
for i=#NX.RTAB,1,-1 do local v=NX.RTAB[i]if not v or not v.Parent then table.remove(NX.RTAB,i)else pcall(function()v.Color=c end)end end
end)
end
local RADD=function(o)if not o then return end table.insert(NX.RTAB,o)if NX.THEME=="RAINBOW"and NX.RON then pcall(function()o.Color=Color3.fromHSV((os.clock()*NX.RSPD)%1,1,1)end)else pcall(function()o.Color=COL()end)end end

local DIE=function()
if NX.DEAD then return end NX.DEAD=true NX.TMR=false CL()
pcall(function()NX.C.ESP=false if NX.C.EL then NX.C.EL:Disconnect()end end)
pcall(function()NX.C.AIM=false if NX.C.AL then NX.C.AL:Disconnect()end end)
pcall(function()NX.C.SPD=0 if NX.C.SL then NX.C.SL:Disconnect()end end)
pcall(RST)table.clear(NX.RTAB)
pcall(function()if getgenv().NEXUS_MAIN_UI then getgenv().NEXUS_MAIN_UI:Destroy()end end)
pcall(function()if getgenv().NEXUS_KEY_UI then getgenv().NEXUS_KEY_UI:Destroy()end end)
getgenv().NEXUS_MAIN_UI=nil getgenv().NEXUS_KEY_UI=nil
end

-- COMBAT
local ESP=function(on)
NX.C.ESP=on if NX.C.EL then pcall(function()NX.C.EL:Disconnect()end)NX.C.EL=nil end
pcall(function()for _,v in pairs(workspace:GetDescendants())do if v:IsA("BillboardGui")and v.Name=="NXESP"then v:Destroy()end end end)
if on then NX.C.EL=RS.RenderStepped:Connect(function()pcall(function()for _,p in pairs(Players:GetPlayers())do
if p==plr or not p.Character then continue end
local ch=p.Character local hrp=ch:FindFirstChild("HumanoidRootPart")local hm=ch:FindFirstChildOfClass("Humanoid")
if not hrp or not hm or hm.Health<=0 then continue end
local e=hrp:FindFirstChild("NXESP")
if not e then
e=Instance.new("BillboardGui")e.Name="NXESP"e.Size=UDim2.new(4,0,6,0)e.AlwaysOnTop=true e.MaxDistance=1500 e.Parent=hrp
local f=Instance.new("Frame")f.Size=UDim2.new(1,0,1,0)f.BackgroundTransparency=.88 f.BackgroundColor3=COL()f.Parent=e
local s=Instance.new("UIStroke")s.Thickness=1.2 s.Color=COL()s.Parent=f RADD(s)
local n=Instance.new("TextLabel")n.Size=UDim2.new(1,0,0,14)n.Position=UDim2.new(0,0,0,-16)n.BackgroundTransparency=1 n.Text=p.Name n.Font=FNT n.TextSize=11 n.TextColor3=TXT n.TextStrokeTransparency=.5 n.Parent=e
local hp=Instance.new("TextLabel")hp.Name="HP"hp.Size=UDim2.new(1,0,0,12)hp.Position=UDim2.new(0,0,1,2)hp.BackgroundTransparency=1 hp.Text=math.floor(hm.Health).."/"..hm.MaxHealth hp.Font=FNT hp.TextSize=9 hp.TextColor3=hm.Health>hm.MaxHealth*.3 and OKc or ERc hp.TextStrokeTransparency=.5 hp.Parent=e
else local hm2=ch:FindFirstChildOfClass("Humanoid")local hp2=e:FindFirstChild("HP")if hm2 and hp2 then hp2.Text=math.floor(hm2.Health).."/"..hm2.MaxHealth hp2.TextColor3=hm2.Health>hm2.MaxHealth*.3 and OKc or ERc end end
end end)end)end
end
local AIM=function(on)
NX.C.AIM=on if NX.C.AL then pcall(function()NX.C.AL:Disconnect()end)NX.C.AL=nil end
if on then NX.C.AL=RS.RenderStepped:Connect(function()pcall(function()
if not UIS:IsMouseButtonPressed(Enum.MouseButton.Right)then return end
local t,d=nil,math.huge local ms=UIS:GetMouseLocation()
for _,p in pairs(Players:GetPlayers())do
if p==plr or not p.Character then continue end
local ch=p.Character local hd=ch:FindFirstChild("Head")or ch:FindFirstChild("HumanoidRootPart")local hm=ch:FindFirstChildOfClass("Humanoid")
if not hd or not hm or hm.Health<=0 then continue end
local vp,on=Cam:WorldToViewportPoint(hd.Position+Vector3.new(0,.5,0))
if not on or vp.Z<0 then continue end
local dv=(Vector2.new(vp.X,vp.Y)-ms).Magnitude
if dv<d and dv<260 then t=hd d=dv end
end
if t then Cam.CFrame=Cam.CFrame:Lerp(CFrame.new(Cam.CFrame.Position,t.Position+Vector3.new(0,.5,0)),.15)end
end)end)end
end
local SPD=function(n)
NX.C.SPD=tonumber(n)or 0 if NX.C.SL then pcall(function()NX.C.SL:Disconnect()end)NX.C.SL=nil end
pcall(function()local c=plr.Character if c then local h=c:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=16 end end end)
if NX.C.SPD>0 then NX.C.SL=RS.RenderStepped:Connect(function()pcall(function()local c=plr.Character if c then local h=c:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=NX.C.SPD end end end)end)end
end

local MB=function(p,t,c,po,sz,fn)
local b=Instance.new("TextButton")b.Size=sz or UDim2.new(.85,0,0,34)b.Position=po
b.BackgroundColor3=BGD b.BackgroundTransparency=.2 b.Text=t b.Font=FNT b.TextSize=11 b.TextColor3=c
b.AutoButtonColor=false b.TextXAlignment=Enum.TextXAlignment.Center b.TextYAlignment=Enum.TextYAlignment.Center b.Parent=p
Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
local s=Instance.new("UIStroke")s.Color=c s.Thickness=1 s.Transparency=.5 s.Parent=b RADD(s)
b.MouseEnter:Connect(function()Tween:Create(b,TW,{BackgroundTransparency=0}):Play()Tween:Create(s,TW,{Transparency=0}):Play()end)
b.MouseLeave:Connect(function()Tween:Create(b,TW,{BackgroundTransparency=.2}):Play()Tween:Create(s,TW,{Transparency=.5}):Play()end)
if fn then b.MouseButton1Click:Connect(function()pcall(fn)end)end
return b,s
end

-- ========== ✅ FIXED UI BUILDER (REFRESH + ALL COLORS WORK) ==========
local BUILD
BUILD=function()
pcall(function()if getgenv().NEXUS_MAIN_UI then getgenv().NEXUS_MAIN_UI:Destroy()end end)
pcall(RST)table.clear(NX.RTAB)

local sg=Instance.new("ScreenGui")sg.Name="NexusMain"sg.ResetOnSpawn=false sg.DisplayOrder=50 sg.ZIndexBehavior=Enum.ZIndexBehavior.Global sg.Parent=pg
getgenv().NEXUS_MAIN_UI=sg

local nh=Instance.new("Frame")nh.BackgroundTransparency=1 nh.Size=UDim2.new(0,220,1,-60)nh.Position=UDim2.new(1,-12,0,50)nh.AnchorPoint=Vector2.new(1,0)nh.Parent=sg
local ll=Instance.new("UIListLayout")ll.Parent=nh ll.SortOrder=Enum.SortOrder.LayoutOrder ll.Padding=UDim.new(0,6)ll.HorizontalAlignment=Enum.HorizontalAlignment.Right
local NT=function(tx,c)c=c or OKc
local n=Instance.new("Frame")n.BackgroundColor3=c n.BackgroundTransparency=.75 n.Size=UDim2.new(0,220,0,40)n.Position=UDim2.new(1.2,0,0,0)n.LayoutOrder=os.clock()n.Parent=nh
Instance.new("UICorner",n).CornerRadius=UDim.new(0,6)
local s=Instance.new("UIStroke")s.Color=c s.Parent=n RADD(s)
local tt=Instance.new("TextLabel")tt.BackgroundTransparency=1 tt.Size=UDim2.new(1,-16,1,0)tt.Position=UDim2.new(0,8,0,0)
tt.Text=tx tt.Font=FNT tt.TextSize=10 tt.TextColor3=Color3.new(1,1,1)tt.TextWrapped=true
tt.TextXAlignment=Enum.TextXAlignment.Left tt.TextYAlignment=Enum.TextYAlignment.Center tt.Parent=n
Tween:Create(n,TweenInfo.new(.3,Enum.EasingStyle.Back),{Position=UDim2.new(0,0,0,0)}):Play()
task.delay(3,function()Tween:Create(n,TW,{Position=UDim2.new(1.2,0,0,0),BackgroundTransparency=1}):Play()task.delay(.3,function()pcall(function()n:Destroy()end)end)end)
end

local tg=Instance.new("TextButton")tg.Size=UDim2.new(0,46,0,46)tg.Position=UDim2.new(.9,0,.05,0)
tg.BackgroundColor3=BG tg.Text=""tg.Active=true tg.Draggable=true tg.Visible=NX.OPEN tg.Parent=sg
Instance.new("UICorner",tg).CornerRadius=UDim.new(0,10)
local tgs=Instance.new("UIStroke")tgs.Thickness=1.5 tgs.Color=COL()tgs.Parent=tg RADD(tgs)
local eye=Instance.new("ImageLabel")eye.Size=UDim2.new(0,24,0,24)eye.Position=UDim2.new(.5,-12,.5,-12)
eye.BackgroundTransparency=1 eye.ScaleType=Enum.ScaleType.Fit eye.Image="rbxassetid://15496694259"eye.ImageColor3=COL()eye.Parent=tg

local mf=Instance.new("Frame")mf.Size=UDim2.new(0,370,0,320)mf.Position=UDim2.new(.5,-185,.5,-160)
mf.BackgroundColor3=BG mf.Active=true mf.Draggable=true mf.Visible=NX.OPEN mf.ClipsDescendants=true mf.Parent=sg
Instance.new("UICorner",mf).CornerRadius=UDim.new(0,12)
local mfs=Instance.new("UIStroke")mfs.Thickness=1.5 mfs.Color=DCOL()mfs.Transparency=.3 mfs.Parent=mf RADD(mfs)

local hd=Instance.new("Frame")hd.Size=UDim2.new(1,-14,0,54)hd.Position=UDim2.new(0,7,0,6)hd.BackgroundTransparency=1 hd.Parent=mf
local t1=Instance.new("TextLabel")t1.Size=UDim2.new(.6,0,0,28)t1.Position=UDim2.new(0,0,0,0)
t1.BackgroundTransparency=1 t1.Text="NEXUS:RT"t1.Font=Enum.Font.FredokaOne t1.TextSize=28 t1.TextColor3=COL()
t1.TextXAlignment=Enum.TextXAlignment.Left t1.TextYAlignment=Enum.TextYAlignment.Top t1.Parent=hd
local t2=Instance.new("TextLabel")t2.Size=UDim2.new(.6,0,0,14)t2.Position=UDim2.new(0,0,0,30)
t2.BackgroundTransparency=1 t2.Text="ULTIMATE"t2.Font=FNT t2.TextSize=11 t2.TextColor3=MUT
t2.TextXAlignment=Enum.TextXAlignment.Left t2.TextYAlignment=Enum.TextYAlignment.Top t2.Parent=hd
local cl=Instance.new("TextLabel")cl.Size=UDim2.new(.35,0,1,0)cl.Position=UDim2.new(.65,0,0,0)
cl.BackgroundTransparency=1 cl.Text=os.date("%H:%M")cl.TextColor3=MUT cl.Font=FNT cl.TextSize=11
cl.TextXAlignment=Enum.TextXAlignment.Right cl.TextYAlignment=Enum.TextYAlignment.Center cl.Parent=hd
task.spawn(function()while cl and cl.Parent do cl.Text=os.date("%H:%M")task.wait(30)end end)
local hl=Instance.new("Frame")hl.Size=UDim2.new(1,-14,0,1)hl.Position=UDim2.new(0,7,0,66)hl.BackgroundColor3=DCOL()hl.Transparency=.5 hl.Parent=mf

local tm=Instance.new("TextLabel")tm.Size=UDim2.new(1,-14,0,14)tm.Position=UDim2.new(0,7,0,72)
tm.BackgroundTransparency=1 tm.Text=""tm.TextColor3=COL()tm.Font=FNT tm.TextSize=10
tm.TextXAlignment=Enum.TextXAlignment.Right tm.TextYAlignment=Enum.TextYAlignment.Center tm.Parent=mf
local FMT=function(s)return string.format("%02d:%02d:%02d",math.floor(s/3600),math.floor((s%3600)/60),s%60)end
if NX.END then
NX.TMR=true task.spawn(function()while NX.TMR and tm and tm.Parent do
local l=math.max(0,NX.END-os.time())tm.Text="⏱ "..FMT(l)
if l<=0 then pcall(DIE)return end task.wait(1)
end end)
end

local TABS={"INFO","MAIN","GAMES","COMBAT","SET"}local TB={}local TZ=1/#TABS
for i,n in ipairs(TABS)do
local t=Instance.new("TextButton")t.Size=UDim2.new(TZ-.025,0,0,22)t.Position=UDim2.new(.0125+(i-1)*TZ,0,0,90)
t.BackgroundColor3=i==1 and BG or BGD t.BackgroundTransparency=i==1 and 0 or .3
t.Text="["..n.."]"t.Font=FNT t.TextSize=10 t.TextColor3=i==1 and COL()or MUT
t.AutoButtonColor=false t.TextXAlignment=Enum.TextXAlignment.Center t.TextYAlignment=Enum.TextYAlignment.Center t.Parent=mf
Instance.new("UICorner",t).CornerRadius=UDim.new(0,4)
local s=Instance.new("UIStroke")s.Color=i==1 and COL()or DCOL()s.Thickness=i==1 and 1.5 or 1 s.Transparency=i==1 and 0 or .5 s.Parent=t RADD(s)
TB[n]={B=t,S=s}
end

local ct=Instance.new("Frame")ct.Size=UDim2.new(1,-14,0,212)ct.Position=UDim2.new(0,7,0,118)ct.BackgroundTransparency=1 ct.ClipsDescendants=true ct.Parent=mf
local PG={}for _,n in ipairs(TABS)do
local p=Instance.new("ScrollingFrame")p.Size=UDim2.new(1,0,1,0)p.BackgroundTransparency=1 p.ScrollBarThickness=3
pcall(function()p.ScrollBarImageColor3=COL()end)p.CanvasSize=UDim2.new(0,0,0,0)p.Visible=(n=="INFO")p.Parent=ct PG[n]=p
end

-- INFO
local ii=Instance.new("Frame")ii.Size=UDim2.new(1,0,0,230)ii.BackgroundTransparency=1 ii.Parent=PG.INFO PG.INFO.CanvasSize=UDim2.new(0,0,0,230)
local av=Instance.new("ImageLabel")av.Size=UDim2.new(0,56,0,56)av.Position=UDim2.new(.5,-28,0,6)av.BackgroundTransparency=1 av.ScaleType=Enum.ScaleType.Fit av.Parent=ii
pcall(function()local th,rd=Players:GetUserThumbnailAsync(plr.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420)if rd then av.Image=th end end)
Instance.new("UICorner",av).CornerRadius=UDim.new(1,0)
local avs=Instance.new("UIStroke")avs.Color=COL()avs.Parent=av RADD(avs)
local un=Instance.new("TextLabel")un.Size=UDim2.new(1,0,0,16)un.Position=UDim2.new(0,0,0,70)
un.BackgroundTransparency=1 un.Text="@"..plr.Name un.Font=Enum.Font.FredokaOne un.TextSize=16 un.TextColor3=TXT un.TextXAlignment=Enum.TextXAlignment.Center un.Parent=ii
local jd=os.date("%B %d, %Y",os.time()-plr.AccountAge*86400)
local jn=Instance.new("TextLabel")jn.Size=UDim2.new(1,0,0,11)jn.Position=UDim2.new(0,0,0,90)
jn.BackgroundTransparency=1 jn.Text="Joined: "..jd jn.Font=FNT jn.TextSize=10 jn.TextColor3=MUT jn.TextXAlignment=Enum.TextXAlignment.Center jn.Parent=ii
local a2=Instance.new("TextLabel")a2.Size=UDim2.new(1,0,0,11)a2.Position=UDim2.new(0,0,0,105)
a2.BackgroundTransparency=1 a2.Text="Age: "..plr.AccountAge.."d"a2.Font=FNT a2.TextSize=10 a2.TextColor3=MUT a2.TextXAlignment=Enum.TextXAlignment.Center a2.Parent=ii
local cr=Instance.new("TextLabel")cr.Size=UDim2.new(1,0,0,13)cr.Position=UDim2.new(0,0,0,132)
cr.BackgroundTransparency=1 cr.Text="— CREDITS —"cr.Font=FNT cr.TextSize=11 cr.TextColor3=COL()cr.TextXAlignment=Enum.TextXAlignment.Center cr.Parent=ii
local c1=Instance.new("TextLabel")c1.Size=UDim2.new(1,0,0,11)c1.Position=UDim2.new(0,0,0,152)
c1.BackgroundTransparency=1 c1.Text="DEV: NEXUS"c1.Font=FNT c1.TextSize=10 c1.TextColor3=TXT c1.TextXAlignment=Enum.TextXAlignment.Center c1.Parent=ii
local c2=Instance.new("TextLabel")c2.Size=UDim2.new(1,0,0,11)c2.Position=UDim2.new(0,0,0,168)
c2.BackgroundTransparency=1 c2.Text="BUILD: FINAL"c2.Font=FNT c2.TextSize=10 c2.TextColor3=TXT c2.TextXAlignment=Enum.TextXAlignment.Center c2.Parent=ii

-- MAIN
MB(PG.MAIN,"[ RUN LOCAL SCRIPT ]",Color3.new(0,1,.7),UDim2.new(.075,0,0,20),UDim2.new(.85,0,0,38),function()RUN_LOCAL()NT("✅ Local Running",OKc)end)
MB(PG.MAIN,"[ RUN REMOTE SCRIPT ]",Color3.new(.31,.7,1),UDim2.new(.075,0,0,70),UDim2.new(.85,0,0,38),function()RUN_REMOTE()NT("✅ Remote Running",OKc)end)

-- ✅ GAMES TAB: EACH BUTTON RUNS ITS OWN LOADSTRING
local sb=Instance.new("TextBox")sb.Size=UDim2.new(.9,0,0,30)sb.Position=UDim2.new(.05,0,0,8)
sb.BackgroundColor3=BGD sb.BackgroundTransparency=.2 sb.Text="Search Games..."sb.PlaceholderText="Type..."
sb.Font=FNT sb.TextSize=10 sb.TextColor3=TXT sb.TextXAlignment=Enum.TextXAlignment.Center sb.ClearTextOnFocus=true sb.Parent=PG.GAMES
Instance.new("UICorner",sb).CornerRadius=UDim.new(0,6)
local sbs=Instance.new("UIStroke")sbs.Color=COL()sbs.Thickness=1 sbs.Parent=sb RADD(sbs)
local gc=Instance.new("Frame")gc.Size=UDim2.new(1,0,0,1400)gc.BackgroundTransparency=1 gc.Parent=PG.GAMES PG.GAMES.CanvasSize=UDim2.new(0,0,0,1400)
local GBS={}
local RG=function(q)
q=(q or""):lower()
for _,b in pairs(GBS)do pcall(function()b:Destroy()end)end GBS={}
local y=46
for _,g in ipairs(GAMES)do
if q==""or string.find(g.Name:lower(),q,1,true)then
local b,_=MB(gc,"[ "..g.Name.." ]",COL(),UDim2.new(.05,0,0,y),UDim2.new(.9,0,0,30),function()
-- ✅ RUNS THIS GAME'S LOADSTRING WHEN PRESSED
pcall(function()
local OUR=getgenv().NEXUS_MAIN_UI getgenv().TesterUI=nil
loadstring(g.LS)() -- EXECUTES THE GAME'S SCRIPT
task.wait(.5)if OUR and OUR.Parent then getgenv().NEXUS_MAIN_UI=OUR end
end)
NT("🎮 Running: "..g.Name,COL())
end)
table.insert(GBS,b)y=y+36
end
end
PG.GAMES.CanvasSize=UDim2.new(0,0,0,math.max(y+20,200))
end
sb.Changed:Connect(function(p)if p=="Text"then RG(sb.Text=="Search Games..."and""or sb.Text)end end)
task.spawn(function()RG("")end)

-- COMBAT
local es=false local eb,_=MB(PG.COMBAT,"[ ESP: OFF ]",Color3.new(1,.31,.39),UDim2.new(.075,0,0,15),UDim2.new(.85,0,0,32),nil)
eb.MouseButton1Click:Connect(function()es=not es eb.Text=es and"[ ESP: ON ]"or"[ ESP: OFF ]"eb.TextColor3=es and OKc or Color3.new(1,.31,.39)pcall(function()ESP(es)end)NT("ESP "..(es and"ON"or"OFF"),es and OKc or ERc)end)
local as=false local ab,_=MB(PG.COMBAT,"[ AIM: OFF (RMB) ]",Color3.new(1,.78,.2),UDim2.new(.075,0,0,55),UDim2.new(.85,0,0,32),nil)
ab.MouseButton1Click:Connect(function()as=not as ab.Text=as and"[ AIM: ON (RMB) ]"or"[ AIM: OFF ]"ab.TextColor3=as and OKc or Color3.new(1,.78,.2)pcall(function()AIM(as)end)NT("AIM "..(as and"ON"or"OFF"),as and OKc or ERc)end)
local sl=Instance.new("TextLabel")sl.Size=UDim2.new(1,-16,0,11)sl.Position=UDim2.new(0,8,0,96)
sl.BackgroundTransparency=1 sl.Text="SPEED (0 = OFF)"sl.Font=FNT sl.TextSize=10 sl.TextColor3=MUT sl.TextXAlignment=Enum.TextXAlignment.Left sl.Parent=PG.COMBAT
local si=Instance.new("TextBox")si.Size=UDim2.new(.45,0,0,30)si.Position=UDim2.new(.075,0,0,112)
si.BackgroundColor3=BGD si.BackgroundTransparency=.2 si.Text="0"si.Font=FNT si.TextSize=11 si.TextColor3=Color3.new(.39,.86,1)
si.TextXAlignment=Enum.TextXAlignment.Center si.ClearTextOnFocus=true si.Parent=PG.COMBAT
Instance.new("UICorner",si).CornerRadius=UDim.new(0,6)
MB(PG.COMBAT,"[ SET SPEED ]",Color3.new(.39,.86,1),UDim2.new(.075,0,0,150),UDim2.new(.45,0,0,30),function()
local nn=tonumber(si.Text)if not nn or nn<0 then NT("❌ Invalid",ERc)return end
pcall(function()SPD(nn)end)sl.Text=nn>0 and"SPEED: "..nn or"SPEED: OFF"NT(nn>0 and"Speed: "..nn or"Speed OFF",OKc)
end)

-- ✅ SET TAB: ALL COLORS + REFRESH + CLOSE 100% WORKING
local th=Instance.new("TextLabel")th.Size=UDim2.new(1,-16,0,12)th.Position=UDim2.new(0,8,0,8)
th.BackgroundTransparency=1 th.Text="— UI THEMES —"th.Font=FNT th.TextSize=10 th.TextColor3=MUT th.TextXAlignment=Enum.TextXAlignment.Left th.Parent=PG.SET
local TN={"CYAN","PURPLE","RED","GOLD","RAINBOW"}
for i,n in ipairs(TN)do
local c=NX.THEMES[n].M or Color3.new(1,1,1)
local b=Instance.new("TextButton")
b.Size=UDim2.new(.28,0,0,28)b.Position=UDim2.new(.02+((i-1)%3)*.32,0,0,26+math.floor((i-1)/3)*36)
b.BackgroundColor3=n=="RAINBOW"and Color3.new(.2,.2,.2)or c
b.BackgroundTransparency=n=="RAINBOW"and .2 or 0
b.Text=n b.Font=FNT b.TextSize=10
b.TextColor3=n=="RAINBOW"and TXT or Color3.new(0,0,0)
b.TextXAlignment=Enum.TextXAlignment.Center b.TextYAlignment=Enum.TextYAlignment.Center b.Parent=PG.SET
Instance.new("UICorner",b).CornerRadius=UDim.new(0,5)
local bs=Instance.new("UIStroke")bs.Color=c bs.Thickness=NX.THEME==n and 2 or 1 bs.Transparency=NX.THEME==n and 0 or .5 bs.Parent=b RADD(bs)
-- ✅ FIXED THEME SWITCH (NO NIL · STAYS OPEN)
b.MouseButton1Click:Connect(function()
NX.THEME=n NX.OPEN=true
pcall(BUILD) -- REBUILDS WITH NEW COLOR
if n=="RAINBOW"then pcall(RGO)NT("🌈 Rainbow ON",Color3.new(1,1,1))else NT("Theme → "..n,c)end
end)
end
-- ✅ FIXED REFRESH BUTTON
MB(PG.SET,"[ REFRESH UI ]",MUT,UDim2.new(.075,0,0,130),UDim2.new(.85,0,0,32),function()
NX.OPEN=true pcall(BUILD)NT("🔄 Refreshed",MUT)
end)
-- ✅ FIXED CLOSE BUTTON
MB(PG.SET,"[ FULLY CLOSE ]",ERc,UDim2.new(.075,0,0,170),UDim2.new(.85,0,0,32),function()
NT("❌ Closing...",ERc)task.wait(.3)pcall(DIE)
end)

-- TAB SWITCH
local SW=function(an)
for _,v in pairs(PG)do v.Visible=false end
for _,d in pairs(TB)do d.B.BackgroundColor3=BGD d.B.BackgroundTransparency=.3 d.B.TextColor3=MUT d.S.Color=DCOL()d.S.Thickness=1 d.S.Transparency=.5 end
local a=TB[an]a.B.BackgroundColor3=BG a.B.BackgroundTransparency=0 a.B.TextColor3=COL()a.S.Color=COL()a.S.Thickness=1.5 a.S.Transparency=0
PG[an].Visible=true task.spawn(function()PG[an].CanvasPosition=Vector2.new(0,0)end)
end
for n,d in pairs(TB)do d.B.MouseButton1Click:Connect(function()SW(n)end)end

-- TOGGLE
tg.MouseButton1Click:Connect(function()
NX.OPEN=not NX.OPEN
if NX.OPEN then
mf.Visible=true mf.BackgroundTransparency=1 mf.Size=UDim2.new(0,0,0,0)
Tween:Create(mf,TweenInfo.new(.3,Enum.EasingStyle.Back),{Size=UDim2.new(0,370,0,320),BackgroundTransparency=0}):Play()
if NX.THEME=="RAINBOW"then pcall(RGO)end
else
Tween:Create(mf,TW,{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1}):Play()pcall(RST)
task.delay(.3,function()if not NX.OPEN then mf.Visible=false end end)
end
end)

if NX.OPEN then
mf.Size=UDim2.new(0,0,0,0)mf.BackgroundTransparency=1
Tween:Create(mf,TweenInfo.new(.3,Enum.EasingStyle.Back),{Size=UDim2.new(0,370,0,320),BackgroundTransparency=0}):Play()
if NX.THEME=="RAINBOW"then pcall(RGO)end
end
end

-- ========== KEY UI ==========
local OKEY=function()
local sg=Instance.new("ScreenGui")sg.Name="NexusKey"sg.ResetOnSpawn=false sg.DisplayOrder=100 sg.ZIndexBehavior=Enum.ZIndexBehavior.Global sg.Parent=pg
getgenv().NEXUS_KEY_UI=sg

local kf=Instance.new("Frame")kf.Size=UDim2.new(0,320,0,230)kf.Position=UDim2.new(.5,-160,.5,-115)
kf.BackgroundColor3=BG kf.Active=true kf.Draggable=true kf.Parent=sg
Instance.new("UICorner",kf).CornerRadius=UDim.new(0,12)
local ks=Instance.new("UIStroke")ks.Color=COL()ks.Thickness=1.4 ks.Transparency=.4 ks.Parent=kf RADD(ks)

local kt=Instance.new("TextLabel")kt.Size=UDim2.new(1,-20,0,30)kt.Position=UDim2.new(0,10,0,15)
kt.BackgroundTransparency=1 kt.Text="NEXUS:RT ULTIMATE"kt.Font=Enum.Font.FredokaOne kt.TextSize=26 kt.TextColor3=COL()kt.TextXAlignment=Enum.TextXAlignment.Center kt.Parent=kf
local kd=Instance.new("TextLabel")kd.Size=UDim2.new(1,-20,0,12)kd.Position=UDim2.new(0,10,0,50)
kd.BackgroundTransparency=1 kd.Text="ENTER KEY · 24H ACCESS"kd.Font=FNT kd.TextSize=10 kd.TextColor3=MUT kd.TextXAlignment=Enum.TextXAlignment.Center kd.Parent=kf

local ki=Instance.new("TextBox")ki.Size=UDim2.new(1,-30,0,42)ki.Position=UDim2.new(0,15,0,72)
ki.BackgroundColor3=BGD ki.Text=""ki.PlaceholderText="Type key here..."
ki.Font=FNT ki.TextSize=13 ki.TextColor3=TXT ki.TextXAlignment=Enum.TextXAlignment.Center ki.ClearTextOnFocus=false ki.Parent=kf
Instance.new("UICorner",ki).CornerRadius=UDim.new(0,8)
local kis=Instance.new("UIStroke")kis.Color=COL()kis.Thickness=1.2 kis.Transparency=.5 kis.Parent=ki

local st=Instance.new("TextLabel")st.Size=UDim2.new(1,-20,0,14)st.Position=UDim2.new(0,10,0,122)
st.BackgroundTransparency=1 st.Text=""st.Font=FNT st.TextSize=11 st.TextXAlignment=Enum.TextXAlignment.Center st.Parent=kf

MB(kf,"[ COPY EZ KEY ]",COL(),UDim2.new(0,15,0,142),UDim2.new(1,-30,0,34),function()
local o=pcall(function()setclipboard("https://lootdest.org/s?ZY16brPV")end)
pcall(function()local f=Instance.new("ScreenGui")f.Parent=pg local t=Instance.new("TextLabel")t.Size=UDim2.new(0,200,0,30)t.Position=UDim2.new(.5,-100,.85,0)t.BackgroundTransparency=1 t.Text=o and"✅ Copied!"or"❌ Failed"t.TextColor3=o and OKc or ERc t.Font=FNT t.TextSize=12 t.TextXAlignment=Enum.TextXAlignment.Center t.Parent=f game.Debris:AddItem(f,2)end)
end)

local VK=function()
local v=(ki.Text or""):gsub("%s+",""):lower()
if v==CORRECT_KEY:lower()then
local NOW=os.time()SV(NOW)NX.END=NOW+ACCESS NX.OPEN=true
st.Text="✅ ACCESS GRANTED"st.TextColor3=OKc kis.Color=OKc
task.wait(1)pcall(function()sg:Destroy()end)getgenv().NEXUS_KEY_UI=nil
BUILD()
else
st.Text="❌ WRONG KEY"st.TextColor3=ERc kis.Color=ERc
task.delay(2,function()if st and st.Parent then st.Text=""kis.Color=COL()end end)
end
end
ki.FocusLost:Connect(function(e)if e then pcall(VK)end end)
UIS.InputBegan:Connect(function(i,g)if g then return end if i.KeyCode==Enum.KeyCode.Return then pcall(VK)end end)
end

-- ========== STARTUP ==========
local o,e=pcall(function()
local H,L=CHK()
if H then NX.END=LD()+ACCESS NX.OPEN=true BUILD()
else OKEY()end
end)
if not o then ERR(e)end
