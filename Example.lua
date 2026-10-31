-- MacLib Modern - full component example
-- Upload MacLib_Modern.lua, then replace the URL below with its raw URL.

local MACLIB_URL = "https://raw.githubusercontent.com/n0namevnnek-web/MacLib/refs/heads/main/maclib.lua?v=20261031-1745"

local MacLib = loadstring(game:HttpGet(MACLIB_URL))()

local Window = MacLib:Window({
	Title = "MacLib Modern",
	Subtitle = "Named icons, assets and glass components",
	Size = UDim2.fromOffset(868, 650),
	ShowUserInfo = true,
	Anonymous = true,
	AnonymousName = "Anonymous User",
	AutoSelect = true,
	Footer = {
		{ Text = "MacLib Modern", Copyable = false },
		{ Text = "|", Copyable = false },
		{ Text = "Compatibility API", Copyable = false },
		{ Text = "|", Copyable = false },
		{ Text = "discord.gg/n4DbXTyNPj", Copyable = true, CopyText = "https://discord.gg/n4DbXTyNPj" },
	},
	Keybind = Enum.KeyCode.RightControl,
	AcrylicBlur = true,

	Tags = {
		{ Title = "NO KEY", Icon = "key-round", Color = Color3.fromRGB(130, 160, 255) },
		{ Title = "PREMIUM", Icon = "crown", Color = Color3.fromRGB(238, 187, 84) },
		{ Title = "SECURE", Icon = "shield-check", Color = Color3.fromRGB(74, 207, 130) },
		{ Title = "MOBILE", Icon = "smartphone", Color = Color3.fromRGB(180, 184, 194) },
	},

	OpenButton = {
		Enabled = true,
		Color = Color3.fromRGB(225, 227, 232),
		Size = UDim2.fromOffset(118, 34),
		Position = UDim2.new(0.5, 0, 0, 18),
		Draggable = true,
		Bobbing = true,
		BounceHeight = 3,
		BounceSpeed = 1.05,
		Pulse = true,
		PulseSpeed = 1.45,
		DynamicColor = false,
		MaxPing = 300,
		UpdateRate = 0.8,
	},
})

local TabGroup = Window:TabGroup()

-- Named Lucide icon.
local HomeTab = TabGroup:Tab({
	Name = "Named Icon",
	Icon = "house",
})

-- A direct Roblox image asset remains fully supported.
local AssetTab = TabGroup:Tab({
	Name = "Asset Icon",
	Image = "rbxassetid://18821914323",
})

-- The optional lucide: prefix is supported too.
local ComponentsTab = TabGroup:Tab({
	Name = "Components",
	Icon = "lucide:boxes",
})

-- Fluent/UltraObsidian-style API used by larger existing scripts.
local CompatibilityTab = Window:AddTab({
	Title = "Compatibility",
	Icon = "workflow",
})

local HomeLeft = HomeTab:Section({ Side = "Left" })
local HomeRight = HomeTab:Section({ Side = "Right" })
local AssetLeft = AssetTab:Section({ Side = "Left" })
local AssetRight = AssetTab:Section({ Side = "Right" })
local ComponentsLeft = ComponentsTab:Section({ Side = "Left" })
local ComponentsRight = ComponentsTab:Section({ Side = "Right" })
local CompatibilitySection = CompatibilityTab:AddSection({
	Title = "Fluent-style Controls",
	Icon = "blocks",
})

local CompatToggle = CompatibilitySection:AddToggle("CompatToggle", {
	Title = "Flagged Toggle",
	Description = "Uses AddToggle(flag, config)",
	Default = false,
	Callback = function(value) print("CompatToggle:", value) end,
})

CompatibilitySection:AddDropdown("CompatDropdown", {
	Title = "Searchable Dropdown",
	Values = { "Alpha", "Beta", "Gamma" },
	Default = "Alpha",
	Searchable = true,
	Callback = function(value) print("CompatDropdown:", value) end,
})

CompatibilitySection:AddSlider("CompatSlider", {
	Title = "Compatible Slider",
	Min = 0,
	Max = 100,
	Default = 35,
	Callback = function(value) print("CompatSlider:", value) end,
})

CompatibilitySection:AddButton({
	Title = "Toggle Lock State",
	Icon = "lock-keyhole",
	Callback = function()
		CompatToggle:SetLocked(not CompatToggle.Locked)
	end,
})

HomeLeft:Header({
	Name = "Modern Glass UI",
	Icon = "sparkles",
})

local Status = HomeLeft:Status({
	Title = "Service Status",
	Description = "All systems are ready",
	Status = "ONLINE",
	Icon = "circle-check",
	Color = Color3.fromRGB(74, 207, 130),
})

local Progress = HomeLeft:ProgressBar({
	Title = "Loading Assets",
	Value = 72,
	Max = 100,
})

HomeLeft:ButtonRow({
	Buttons = {
		{
			Title = "Refresh",
			Icon = "refresh-cw",
			Callback = function()
				Progress:SetValue(math.random(20, 100))
			end,
		},
		{
			Title = "Online",
			Icon = "wifi",
			Callback = function()
				Status:SetStatus("ONLINE", Color3.fromRGB(74, 207, 130))
				Status:SetDescription("Connection refreshed successfully")
			end,
		},
		{
			Title = "Notify",
			Icon = "bell",
			Callback = function()
				Window:Notify({
					Title = "MacLib Modern",
					Description = "Named Lucide icons are working.",
					Lifetime = 4,
				})
			end,
		},
	},
})

HomeLeft:Code({
	Language = "Luau",
	Code = [=[TabGroup:Tab({ Name = "Home", Icon = "house" })
TabGroup:Tab({ Name = "Custom", Icon = "rbxassetid://18821914323" })]=],
})

HomeRight:Header({
	Name = "Discord Community",
	Icon = "messages-square",
})

local DiscordBox = HomeRight:AddDiscordBox("NNVNDiscord", {
	Title = "NNVN Community",
	Description = "News, support and updates",
	Invite = "https://discord.gg/n4DbXTyNPj",
	Icon = "messages-square",
	ButtonText = "Copy Discord Invite",
	AutoRefresh = 60,
})

HomeRight:Button({
	Name = "Refresh Discord Stats",
	Icon = "refresh-cw",
	Callback = function()
		DiscordBox:Refresh()
	end,
})

HomeRight:Button({
	Name = "Customize Ping Button",
	Icon = "activity",
	Callback = function()
		Window:EditOpenButton({
			Color = Color3.fromRGB(225, 227, 232),
			Size = UDim2.fromOffset(128, 36),
			BounceHeight = 4,
			PulseSpeed = 1.4,
			DynamicColor = false,
		})
	end,
})

AssetLeft:Header({
	Name = "rbxassetid Test",
	Icon = "rbxassetid://18821914323",
})

AssetLeft:Paragraph({
	Header = "Direct assets still work",
	Body = "This tab, header and button use rbxassetid:// directly. You can mix asset images and Lucide names in the same window.",
})

AssetLeft:Button({
	Name = "Asset Icon Button",
	Icon = "rbxassetid://18821914323",
	Callback = function()
		Window:Notify({
			Title = "Asset icon works",
			Description = "Direct Roblox image assets remain supported.",
			Lifetime = 4,
		})
	end,
})

AssetRight:Header({
	Name = "Custom Icon Registry",
	Icon = "library",
})

AssetRight:Code({
	Language = "Luau",
	Code = [=[MacLib:RegisterIcon("my-logo", "rbxassetid://18821914323")
Section:Button({ Name = "Custom", Icon = "my-logo" })]=],
})

MacLib:RegisterIcon("demo-logo", "rbxassetid://18821914323")

AssetRight:Button({
	Name = "Registered Custom Icon",
	Icon = "demo-logo",
	Callback = function()
		print("Registered icon works")
	end,
})

ComponentsLeft:Header({
	Name = "Standard Controls",
	Icon = "sliders-horizontal",
})

ComponentsLeft:Toggle({
	Name = "Example Toggle",
	Default = false,
	Callback = function(value)
		print("Toggle:", value)
	end,
})

ComponentsLeft:Slider({
	Name = "Example Slider",
	Minimum = 0,
	Maximum = 100,
	Default = 50,
	Callback = function(value)
		print("Slider:", value)
	end,
})

ComponentsLeft:Dropdown({
	Name = "Searchable Dropdown",
	Options = { "Beginning Isle", "Bamboo Isle", "Sovereign Isle", "Weather Isle" },
	Search = true,
	Default = 1,
	Callback = function(value)
		print("Dropdown:", value)
	end,
})

ComponentsRight:Header({
	Name = "Icon Formats",
	Icon = "image",
})

ComponentsRight:Paragraph({
	Header = "Supported values",
	Body = "Lucide name, lucide:name, rbxassetid://, rbxasset://, HTTP image URL, rbxthumb://, numeric asset ID and registered custom icons.",
})

ComponentsRight:Button({
	Name = "Lucide Name",
	Icon = "wand-sparkles",
	Callback = function() print("Lucide icon") end,
})

ComponentsRight:Button({
	Name = "Lucide Prefix",
	Icon = "lucide:badge-check",
	Callback = function() print("Prefixed Lucide icon") end,
})

ComponentsRight:Button({
	Name = "Numeric Asset ID",
	Icon = 18821914323,
	Callback = function() print("Numeric asset icon") end,
})

Window:Notify({
	Title = "Example loaded",
	Description = "Test the Named Icon, Asset Icon and Components tabs.",
	Lifetime = 5,
})

-- AutoSelect already opens the first tab. This also demonstrates the manual API.
Window:Select(HomeTab)
