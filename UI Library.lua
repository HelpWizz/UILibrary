local library = {
    Version = "1.0",
	WorkspaceName = "Tolu's Library",
	flags = {},
	signals = {},
	objects = {},
	elements = {},
	globals = {},
	subs = {},
	colored = {},
	configuration = {
		hideKeybind = Enum.KeyCode.RightShift,
		smoothDragging = true,
		easingStyle = Enum.EasingStyle.Quart,
		easingDirection = Enum.EasingDirection.Out
	},
    ColourTheme = {
        Main = Color3.fromRGB(34, 36, 39),
        TabFrame = Color3.fromRGB(47, 49, 54),
        ActiveText = Color3.fromRGB(255, 255, 255),
        SupletaryText = Color3.fromRGB(190, 190, 190),
        Secondary = Color3.fromRGB(45, 48, 52),
        Command = Color3.fromRGB(59, 63, 68)
    },
    Font = {
		FredokaOne = Enum.Font.FredokaOne,
    },
    Instances = {
        ScreenGui = Instance.new("ScreenGui"),
        Frame = Instance.new("Frame"),
        ScrollingFrame = Instance.new("ScrollingFrame"),
        TextLabel = Instance.new("TextLabel"),
        TextButton = Instance.new("TextButton"),
        UICorner = Instance.new("UICorner"),
        UISizeConstraint = Instance.new("UISizeConstraint"),
        UIListLayout = Instance.new("UIListLayout")
    },
	keyHandler = {
		notAllowedKeys = {
			[Enum.KeyCode.Return] = true,
			[Enum.KeyCode.Space] = true,
			[Enum.KeyCode.Tab] = true,
			[Enum.KeyCode.Unknown] = true,
			[Enum.KeyCode.Backspace] = true
		},
		notAllowedMouseInputs = {
			[Enum.UserInputType.MouseMovement] = true,
			[Enum.UserInputType.MouseWheel] = true,
			[Enum.UserInputType.MouseButton1] = true,
			[Enum.UserInputType.MouseButton2] = true,
			[Enum.UserInputType.MouseButton3] = true
		},
		allowedKeys = {
			[Enum.KeyCode.LeftShift] = "LShift",
			[Enum.KeyCode.RightShift] = "RShift",
			[Enum.KeyCode.LeftControl] = "LCtrl",
			[Enum.KeyCode.RightControl] = "RCtrl",
			[Enum.KeyCode.LeftAlt] = "LAlt",
			[Enum.KeyCode.RightAlt] = "RAlt",
			[Enum.KeyCode.CapsLock] = "CAPS",
			[Enum.KeyCode.One] = "1",
			[Enum.KeyCode.Two] = "2",
			[Enum.KeyCode.Three] = "3",
			[Enum.KeyCode.Four] = "4",
			[Enum.KeyCode.Five] = "5",
			[Enum.KeyCode.Six] = "6",
			[Enum.KeyCode.Seven] = "7",
			[Enum.KeyCode.Eight] = "8",
			[Enum.KeyCode.Nine] = "9",
			[Enum.KeyCode.Zero] = "0",
			[Enum.KeyCode.KeypadOne] = "Num-1",
			[Enum.KeyCode.KeypadTwo] = "Num-2",
			[Enum.KeyCode.KeypadThree] = "Num-3",
			[Enum.KeyCode.KeypadFour] = "Num-4",
			[Enum.KeyCode.KeypadFive] = "Num-5",
			[Enum.KeyCode.KeypadSix] = "Num-6",
			[Enum.KeyCode.KeypadSeven] = "Num-7",
			[Enum.KeyCode.KeypadEight] = "Num-8",
			[Enum.KeyCode.KeypadNine] = "Num-9",
			[Enum.KeyCode.KeypadZero] = "Num-0",
			[Enum.KeyCode.Minus] = "-",
			[Enum.KeyCode.Equals] = "=",
			[Enum.KeyCode.Tilde] = "~",
			[Enum.KeyCode.LeftBracket] = "[",
			[Enum.KeyCode.RightBracket] = "]",
			[Enum.KeyCode.RightParenthesis] = ")",
			[Enum.KeyCode.LeftParenthesis] = "(",
			[Enum.KeyCode.Semicolon] = ";",
			[Enum.KeyCode.Quote] = "'",
			[Enum.KeyCode.BackSlash] = "\\",
			[Enum.KeyCode.Comma] = ",",
			[Enum.KeyCode.Period] = ".",
			[Enum.KeyCode.Slash] = "/",
			[Enum.KeyCode.Asterisk] = "*",
			[Enum.KeyCode.Plus] = "+",
			[Enum.KeyCode.Period] = ".",
			[Enum.KeyCode.Backquote] = "`"
		}
	},
	gui_parent = (function()
		local success, failure = pcall(function()
			return game:GetService("CoreGui")
		end)
		if success and failure then
			return failure
		end
		success, failure = pcall(function()
			return (game:IsLoaded() or (game.Loaded:Wait() or 1)) and game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
		end)
		if success and failure then
			return failure
		end
		success, failure = pcall(function()
			return game:GetService("StarterGui")
		end)
		if success and failure then
			return failure
		end
		return error("Seriously bad engine. Can't find a place to store the GUI. Robust code can't help this much incompetence.")
	end)(),
}

--> Variables
local UserInputService = game:GetService("UserInputService")
local resolvevararg
local MainScreenGui = nil
local colored, colors = library.colored, library.colors

do
	local varargresolve = {
		Window = {"Name"},
		Tab = {"Name"},
		Section = {"Name"},
		Label = {"Text", "Flag", "UnloadValue", "UnloadFunc"},
		Toggle = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Locked", "Keybind", "Condition", "AllowDuplicateCalls"},
		Textbox = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Placeholder", "Type", "Min", "Max", "Decimals", "Hex", "Binary", "Base", "RichTextBox", "MultiLine", "TextScaled", "TextFont", "PreFormat", "PostFormat", "CustomProperties", "AllowDuplicateCalls"},
		Slider = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Min", "Max", "Decimals", "Format", "IllegalInput", "Textbox", "AllowDuplicateCalls"},
		Button = {"Name", "Callback", "Locked", "Condition"},
		Keybind = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Pressed", "KeyNames", "AllowDuplicateCalls"},
		Dropdown = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "List", "Filter", "Method", "Nothing", "Sort", "MultiSelect", "ItemAdded", "ItemRemoved", "ItemChanged", "ItemsCleared", "ScrollUpButton", "ScrollDownButton", "ScrollButtonRate", "DisablePrecisionScrolling", "AllowDuplicateCalls"},
		SearchBox = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "List", "Filter", "Method", "Nothing", "Sort", "MultiSelect", "ItemAdded", "ItemRemoved", "ItemChanged", "ItemsCleared", "ScrollUpButton", "ScrollDownButton", "ScrollButtonRate", "DisablePrecisionScrolling", "RegEx", "AllowDuplicateCalls"},
		Colorpicker = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Rainbow", "Random", "AllowDuplicateCalls"},
		Persistence = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Workspace", "Persistive", "Suffix", "LoadCallback", "SaveCallback", "PostLoadCallback", "PostSaveCallback", "ScrollUpButton", "ScrollDownButton", "ScrollButtonRate", "DisablePrecisionScrolling", "AllowDuplicateCalls"},
		Designer = {"Backdrop", "Image", "Info", "Credit"}
	}
	function resolvevararg(objtype, ...)
		local data = varargresolve[objtype]
		local t = {}
		if data then
			for index, value in next, {...} do
				t[data[index]] = value
			end
		end
		return t
	end
end

function library:CreateWindow(options, ...)
	options = (options and type(options) == "string" and resolvevararg("Window", options, ...)) or options
	local homepage = nil
	local windowoptions = options
	local windowName = options.Name or "Unnamed Window"
	options.Name = windowName

	--> Create Window
	local SympleHubLibrary = library.Instances.ScreenGui
	library.MainScreenGui, MainScreenGui = SympleHubLibrary, SympleHubLibrary
	local main = library.Instances.Frame
	local tab = library.Instances.Frame
	local title = library.Instances.TextLabel
	local mainUiCorner = library.Instances.UICorner
	local mainUiSizeConstraint = library.Instances.UISizeConstraint
	local tabUiCorner = library.Instances.UICorner
	local tabUiListLayout = library.Instances.UIListLayout
	local submenuOpen = nil
	library.globals["__Window" .. options.Name] = {
		submenuOpen = submenuOpen
	}
	SympleHubLibrary.Name = "     "
	SympleHubLibrary.Parent = library.gui_parent
	SympleHubLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	SympleHubLibrary.DisplayOrder = 10000
	SympleHubLibrary.ResetOnSpawn = false
	main.Name = "main"
	main.Parent = SympleHubLibrary
	main.AnchorPoint = Vector2.new(0.5, 0.5)
	main.BackgroundColor3 = library.ColourTheme.Main
	colored[1 + #colored] = {main, "BackgroundColor3", "Main"}
	main.Size = UDim2.fromScale(0.352, 0.497)
	main.Position = UDim2.fromScale(0.5, 0.5)
	mainUiSizeConstraint.Parent = main
	mainUiSizeConstraint.MaxSize = Vector2.new(675, 482)
	mainUiCorner.Parent = main
	mainUiCorner.CornerRadius = Vector2.new(0, 13)
	tab.Name = "tabHolder"
	tab.Parent = main
	tab.BackgroundColor3 = library.ColourTheme.TabFrame
	tab.Size = UDim2.fromScale(0.909, 0.099)
	tab.Position = UDim2.fromScale(0.046, 0.203)
	tabUiListLayout.Parent = tab
	tabUiListLayout.FillDirection = Enum.FillDirection.Horizontal
	tabUiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
	tabUiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	tabUiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	tabUiCorner.Parent = main
	tabUiCorner.CornerRadius = Vector2.new(0, 13)
	colored[1 + #colored] = {tab, "BackgroundColor3", "TabFrame"}
	title.Name = "Title"
	title.Parent = main
	title.Position = UDim2.fromScale(0.5, 0.039)
	title.AnchorPoint = Vector2.new(0.5, 0)
	title.BackgroundTransparency = 1
	title.FontFace = library.Font.FredokaOne
	title.Text = options.Name
end

library.NewWindow = library.CreateWindow
library.AddWindow = library.CreateWindow
library.Window = library.CreateWindow
library.W = library.CreateWindow
return library
