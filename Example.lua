-- ?t=<time> busts raw.githubusercontent.com's ~5 min CDN cache so you always get the latest push
local MacLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/n0namevnnek-web/MacLib/refs/heads/main/maclib.lua?t=" .. tostring(os.time())))()

local Window = MacLib:Window({
	Title = "Maclib Demo",
	Subtitle = "This is a subtitle.",
	Size = UDim2.fromOffset(868, 650),
	DragStyle = 1,
	DisabledWindowControls = {},
	ShowUserInfo = true,
	Keybind = Enum.KeyCode.RightControl,
	AcrylicBlur = true,
})

local globalSettings = {
	UIBlurToggle = Window:GlobalSetting({
		Name = "UI Blur",
		Default = Window:GetAcrylicBlurState(),
		Callback = function(bool)
			Window:SetAcrylicBlurState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Enabled" or "Disabled") .. " UI Blur",
				Lifetime = 5
			})
		end,
	}),
	NotificationToggler = Window:GlobalSetting({
		Name = "Notifications",
		Default = Window:GetNotificationsState(),
		Callback = function(bool)
			Window:SetNotificationsState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Enabled" or "Disabled") .. " Notifications",
				Lifetime = 5
			})
		end,
	}),
	ShowUserInfo = Window:GlobalSetting({
		Name = "Show User Info",
		Default = Window:GetUserInfoState(),
		Callback = function(bool)
			Window:SetUserInfoState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Showing" or "Redacted") .. " User Info",
				Lifetime = 5
			})
		end,
	})
}

local tabGroups = {
	TabGroup1 = Window:TabGroup()
}

local tabs = {
	Main = tabGroups.TabGroup1:Tab({ Name = "Demo", Image = "rbxassetid://18821914323" }),
	Settings = tabGroups.TabGroup1:Tab({ Name = "Settings", Image = "rbxassetid://10734950309" })
}

local sections = {
	MainSection1 = tabs.Main:Section({ Side = "Left" }),
}

sections.MainSection1:Header({
	Name = "Header #1"
})

sections.MainSection1:Button({
	Name = "Button",
	Tooltip = "Opens a confirmation dialog", -- hover this control to see the tooltip
	Callback = function()
		Window:Dialog({
			Title = Window.Settings.Title,
			Description = "Lorem ipsum odor amet, consectetuer adipiscing elit. Eros vestibulum aliquet mattis, ex platea nunc.",
			Buttons = {
				{
					Name = "Confirm",
					Callback = function()
						print("Confirmed!")
					end,
				},
				{
					Name = "Cancel"
				}
			}
		})
	end,
})

sections.MainSection1:Input({
	Name = "Input",
	Placeholder = "Input",
	AcceptedCharacters = "All",
	Callback = function(input)
		Window:Notify({
			Title = Window.Settings.Title,
			Description = "Successfully set input to " .. input
		})
	end,
	onChanged = function(input)
		print("Input is now " .. input)
	end,
}, "Input")

sections.MainSection1:Slider({
	Name = "Slider",
	Default = 50,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
	Callback = function(Value)
		print("Changed to ".. Value)
	end
}, "Slider")

sections.MainSection1:Slider({
	Name = "Slider with a longer descriptive name",
	Default = 25,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
	Callback = function(Value)
		print("Changed to ".. Value)
	end
}, "LongNameSlider")

sections.MainSection1:Toggle({
	Name = "Toggle",
	Default = false,
	Tooltip = "Toggle the demo feature on or off", -- hover the row to see the tooltip
	Callback = function(value)
		Window:Notify({
			Title = Window.Settings.Title,
			Description = (value and "Enabled " or "Disabled ") .. "Toggle"
		})
	end,
	Submenu = function(sub)
		sub:Dropdown({
			Name = "Submenu Option",
			Options = { "Option A", "Option B", "Option C" },
			Default = 1,
			Callback = function(value)
				print("Submenu selected:", value)
			end,
		})
		sub:Slider({
			Name = "Intensity",
			Default = 50,
			Minimum = 0,
			Maximum = 100,
			DisplayMethod = "Percent",
			Precision = 0,
			Callback = function(value)
				print("Submenu intensity:", value)
			end,
		})
		sub:Input({
			Name = "Label",
			Placeholder = "Type here...",
			AcceptedCharacters = "All",
			Callback = function(text)
				print("Submenu input:", text)
			end,
		})
	end,
}, "Toggle")

sections.MainSection1:Toggle({
	Name = "Auto Normalize Shiny",
	Default = false,
	Callback = function(value)
		Window:Notify({
			Title = Window.Settings.Title,
			Description = (value and "Enabled " or "Disabled ") .. "Auto Normalize"
		})
	end,
	SideMenuSide = "Left", -- which window edge the drawer slides out of: "Left" or "Right" (default "Left")
	SideMenu = function(side)
		side:Dropdown({
			Name = "Target Ball",
			Options = { "Poke Ball", "Great Ball", "Ultra Ball" },
			Default = 1,
			Callback = function(value)
				print("SideMenu ball:", value)
			end,
		})
		side:Slider({
			Name = "Threshold",
			Default = 75,
			Minimum = 0,
			Maximum = 100,
			DisplayMethod = "Percent",
			Precision = 0,
			Callback = function(value)
				print("SideMenu threshold:", value)
			end,
		})
		side:Input({
			Name = "Webhook",
			Placeholder = "https://...",
			AcceptedCharacters = "All",
			Callback = function(text)
				print("SideMenu webhook:", text)
			end,
		})
	end,
}, "AutoNormalizeShiny")

sections.MainSection1:Keybind({
	Name = "Keybind",
	Blacklist = false,
	Callback = function(binded)
		Window:Notify({
			Title = "Demo Window",
			Description = "Pressed keybind - "..tostring(binded.Name),
			Lifetime = 3
		})
	end,
	onBinded = function(bind)
		Window:Notify({
			Title = "Demo Window",
			Description = "Successfully Binded Keybind to - "..tostring(bind.Name),
			Lifetime = 3
		})
	end,
}, "Keybind")

sections.MainSection1:Colorpicker({
	Name = "Colorpicker",
	Default = Color3.fromRGB(0, 255, 255),
	Callback = function(color)
		print("Color: ", color)
	end,
}, "Colorpicker")

sections.MainSection1:Colorpicker({
	Name = "Accent Color",
	Default = Window:GetAccent(),
	Callback = function(color)
		Window:SetAccent(color)
	end,
}, "AccentColor")

local alphaColorPicker = sections.MainSection1:Colorpicker({
	Name = "Transparency Colorpicker",
	Default = Color3.fromRGB(255,0,0),
	Alpha = 0,
	Callback = function(color, alpha)
		print("Color: ", color, " Alpha: ", alpha)
	end,
}, "TransparencyColorpicker")

local rainbowActive
local rainbowConnection
local hue = 0

sections.MainSection1:Toggle({
	Name = "Rainbow",
	Default = false,
	Callback = function(value)
		rainbowActive = value

		if rainbowActive then
			rainbowConnection = game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
				hue = (hue + deltaTime * 0.1) % 1
				alphaColorPicker:SetColor(Color3.fromHSV(hue, 1, 1))
			end)
		elseif rainbowConnection then
			rainbowConnection:Disconnect()
			rainbowConnection = nil
		end
	end,
}, "RainbowToggle")

local optionTable = {
	"Apple",
	"Banana",
	"Orange",
	"Grapes",
	"Pineapple",
	"Mango",
	"Strawberry",
	"Blueberry",
	"Watermelon",
	"Peach"
}

local Dropdown = sections.MainSection1:Dropdown({
	Name = "Dropdown",
	Search = true,
	Multi = false,
	Required = true,
	Options = optionTable,
	Default = 1,
	Callback = function(Value)
		print("Dropdown changed: ".. Value)
	end,
}, "Dropdown")

local MultiDropdown = sections.MainSection1:Dropdown({
	Name = "Multi Dropdown",
	Search = true,
	Multi = true,
	Required = false,
	Options = optionTable,
	Default = {"Apple", "Orange"},
	Callback = function(Value)
		local Values = {}
		for Value, State in next, Value do
			table.insert(Values, Value)
		end
		print("Mutlidropdown changed:", table.concat(Values, ", "))
	end,
}, "MultiDropdown")

sections.MainSection1:Button({
	Name = "Update Selection",
	Callback = function()
		Dropdown:UpdateSelection("Grapes")
		MultiDropdown:UpdateSelection({"Banana", "Pineapple"})
	end,
})

sections.MainSection1:Divider()

sections.MainSection1:Header({
	Text = "Header #2"
})

sections.MainSection1:Paragraph({
	Header = "Paragraph",
	Body = "Paragraph body. Lorem ipsum odor amet, consectetuer adipiscing elit. Morbi tempus netus aliquet per velit est gravida."
})

sections.MainSection1:Label({
	Text = "Label. Lorem ipsum odor amet, consectetuer adipiscing elit."
})

sections.MainSection1:SubLabel({
	Text = "Sub-Label. Lorem ipsum odor amet, consectetuer adipiscing elit."
})

MacLib:SetFolder("Maclib")
tabs.Settings:InsertConfigSection("Left")

Window.onUnloaded(function()
	print("Unloaded!")
end)

tabs.Main:Select()
MacLib:LoadAutoLoadConfig()
