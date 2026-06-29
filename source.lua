local Fatality;
if isfile and isfile("source.lua") then
	Fatality = loadstring(readfile("source.lua"))();
else
	Fatality = loadstring(game:HttpGet("https://raw.githubusercontent.com/cardsense0/femboytality/main/source.lua"))();
end
local Notification = Fatality:CreateNotifier();

Fatality:Loader({
	Name = "FATALITY",
	Duration = 4
});

Notification:Notify({
	Title = "FATALITY",
	Content = "Hello, "..game.Players.LocalPlayer.DisplayName..' Welcome back!',
	Icon = "clipboard"
})

local Window = Fatality.new({
	Name = "FATALITY",
	Expire = "never",
});

local Rage = Window:AddMenu({ Name = "RAGE", Icon = "skull" })
local Legit = Window:AddMenu({ Name = "LEGIT", Icon = "target" })
local Visual = Window:AddMenu({ Name = "VISUAL", Icon = "eye" })
local Misc = Window:AddMenu({ Name = "MISC", Icon = "settings" })
local Skins = Window:AddMenu({ Name = "SKINS", Icon = "palette" })
local Lua = Window:AddMenu({ Name = "LUA", Icon = "code" })

do
	local AimbotSub = Rage:AddSubTab({ Name = "Aimbot" })
	local AntiAimSub = Rage:AddSubTab({ Name = "Anti-aim" })
	
	local Col1, Col2 = Rage:AddColumns(2)
	
	local Weapon = Col1:AddCard({ Name = "WEAPON" })
	local Extra = Col2:AddCard({ Name = "EXTRA" })
	local General = Col1:AddCard({ Name = "GENERAL" })
	
	Weapon:AddSlider({ Name = "Hit-chance", Default = 61 })
	Weapon:AddSlider({ Name = "Pointscale", Type = "%", Default = 0 })
	Weapon:AddSlider({ Name = "Min-damage", Type = "%", Default = 85 })
	Weapon:AddDropdown({ Name = "Hitboxes", Values = {"Head",'Neck','Arms','Legs'} })
	Weapon:AddDropdown({ Name = "Multipoint", Values = {"Head",'Neck','Arms','Legs'} })
	Weapon:AddDropdown({ Name = "Target selection", Values = {"Damage"}, Default = "Damage" })
	
	local Autostop = Extra:AddToggle({ Name = "Autostop", Option = true });
	Autostop.Option:AddToggle({ Name = "Between shots" })
	
	Extra:AddToggle({ Name = "Autoscope" });
	Extra:AddToggle({ Name = "Ignore limbs on moving" });
	Extra:AddToggle({ Name = "Autorevolver" });
	
	General:AddToggle({ Name = "Aimbot", Risky = true })
	General:AddToggle({ Name = "Silent aim", Risky = false })
	General:AddSlider({ Name = "Maximum fov", Type = " deg", Default = 0 })
	General:AddToggle({ Name = "Autofire", Risky = false })
	General:AddToggle({ Name = "Delay shot", Risky = false })
	
	local NoSpread = General:AddToggle({ Name = "Nospread", Risky = false, Option = true })
	NoSpread.Option:AddToggle({ Name = "Pitch" })
	
	local Doubletap = General:AddToggle({ Name = "Doubletap", Risky = true, Option = true })
	Doubletap.Option:AddToggle({ Name = "Defensive" })
	
	General:AddButton({
		Name = "Notification",
		Callback = function()
			Notification:Notify({
				Title = "Notification",
				Content = "Testing Notification",
				Duration = math.random(3,7),
				Icon = "info"
			})
		end,
	})
end

do
	local AimbotSub = Legit:AddSubTab({ Name = "Aimbot" })
	local TriggerSub = Legit:AddSubTab({ Name = "Triggerbot" })
	
	local Col1, Col2 = Legit:AddColumns(2)
	
	local Aim = Col1:AddCard({ Name = "AIM" })
	local Rcs = Col2:AddCard({ Name = "RCS" })
	local Backtrack = Col1:AddCard({ Name = "BACKTRACK" })
	local General = Col2:AddCard({ Name = "GENERAL" })
	
	Aim:AddToggle({ Name = "Aim assist" })
	Aim:AddDropdown({ Name = "Mode", Default = "Adaptive", Values = {"Adaptive","Value 1",'Value 2'} })
	Aim:AddSlider({ Name = "Aim speed", Default = 1, Type = "%" })
	Aim:AddSlider({ Name = "Min-damage", Default = 61 })
	Aim:AddToggle({ Name = "Only in scope" })
	
	Rcs:AddToggle({ Name = "Recoil control" })
	Rcs:AddSlider({ Name = "Speed", Default = 1, Type = "%" })
	
	Backtrack:AddSlider({ Name = "Backtrack", Default = 0, Type = "%" })
	
	General:AddToggle({ Name = "Enabled" })
	General:AddDropdown({ Name = "Disablers", Values = {"Flash", 'Smoke'} })
end

do
	local EspSub = Visual:AddSubTab({ Name = "ESP" })
	local ChamsSub = Visual:AddSubTab({ Name = "Chams" })
	
	local Col1, Col2 = Visual:AddColumns(2)
	
	local Misc = Col1:AddCard({ Name = "MISC" })
	local Model = Col2:AddCard({ Name = "MODEL" })
	
	Misc:AddToggle({ Name = "Thirdperson", Option = true }).Option:AddSlider({ Name = "Distance" });
	Misc:AddToggle({ Name = "Overhead override", Option = true }).Option:AddDropdown({ Name = "Override" });
	Misc:AddDropdown({ Name = "Remove scope" })
	
	local pc = Misc:AddToggle({ Name = "Penetration crosshair", Option = true }).Option;
	pc:AddColorPicker({ Name = "Walls", Default = Color3.fromRGB(111, 255, 0) })
	
	Model:AddDropdown({ Name = "Visible", Default = "Disabled", Values = {"Disabled",'Material'} })
	Model:AddDropdown({ Name = "Invisible", Default = "Disabled", Values = {"Disabled",'Material'} })
	
	Model:AddToggle({ Name = 'Glow', Option = true }).Option:AddColorPicker({ Name = "Color" })
end
