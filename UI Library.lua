

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
local TextService = game:GetService("TextService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local resolvevararg
local MainScreenGui = nil
local isDraggingSomething = false
local lasthidebing = 0
local elements = library.elements
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

local textToSize = nil
do
	local textService = game:GetService("TextService")
	local bigv2 = Vector2.one * math.huge
	function textToSize(object)
		return textService:GetTextSize(object.Text, object.TextSize, object.Font, bigv2)
	end
end
library.subs.textToSize = textToSize

local function makeDraggable(topBarObject, object)
	local dragging = nil
	local dragInput = nil
	local dragStart = nil
	local startPosition = nil
	library.signals[1 + #library.signals] = topBarObject.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPosition = object.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	library.signals[1 + #library.signals] = topBarObject.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	library.signals[1 + #library.signals] = UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			if not isDraggingSomething and library.configuration.smoothDragging then
				TweenService:Create(object, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
					Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
				}):Play()
			elseif not isDraggingSomething and not library.configuration.smoothDragging then
				object.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
			end
		end
	end)
end
library.subs.makeDraggable = makeDraggable





function library:CreateWindow(options, ...)
	options = (options and type(options) == "string" and resolvevararg("Window", options, ...)) or options
	local homepage = nil
	local windowoptions = options
	local windowName = options.Name or "Unnamed Window"
	options.Name = windowName

	--> Create Window
	local SympleHubLibrary = library.Instances.ScreenGui
	library.MainScreenGui, MainScreenGui = SympleHubLibrary, SympleHubLibrary
	local main = Instance.new("Frame") --> temporary fix
	local tab = Instance.new("Frame")
	local title = Instance.new("TextLabel")
	local mainUiCorner = Instance.new("UICorner")
	local mainUiSizeConstraint = Instance.new("UISizeConstraint")
	local tabUiCorner = Instance.new("UICorner")
	local tabUiListLayout = Instance.new("UIListLayout")
	local submenuOpen = nil
	library.globals["__Window" .. options.Name] = {
		submenuOpen = submenuOpen
	}
	SympleHubLibrary.Name = "     "
	SympleHubLibrary.Parent = library.gui_parent
	SympleHubLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	SympleHubLibrary.DisplayOrder = 10000
	SympleHubLibrary.ResetOnSpawn = false
	SympleHubLibrary.IgnoreGuiInset = true
	main.Name = "main"
	main.Parent = SympleHubLibrary
	main.AnchorPoint = Vector2.new(0.5, 0.5)
	main.BackgroundColor3 = library.ColourTheme.Main
	colored[1 + #colored] = {main, "BackgroundColor3", "Main"}
	main.Size = UDim2.fromScale(0.352, 0.497)
	main.Position = UDim2.fromScale(0.5, 0.5)
	mainUiSizeConstraint.Parent = main
	mainUiSizeConstraint.MaxSize = Vector2.new(675, 482)
	mainUiCorner.CornerRadius = UDim.new(0, 8)
	mainUiCorner.Parent = main
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
	tabUiCorner.Parent = tab
	tabUiCorner.CornerRadius = UDim.new(0, 8)
	colored[1 + #colored] = {tab, "BackgroundColor3", "TabFrame"}
	title.Name = "Title"
	title.Parent = main
	title.Position = UDim2.fromScale(0.5, 0.039)
	title.AnchorPoint = Vector2.new(0.5, 0)
	title.Size = UDim2.fromScale(0.36, 0.106)
	title.BackgroundTransparency = 1
	title.Font = library.Font.FredokaOne
	title.TextScaled = true

	title.TextColor3 = library.ColourTheme.ActiveText
	colored[1 + #colored] = {title, "TextColor3", "ActiveText"}
	title.Text = options.Name
	makeDraggable(main, main)
	local IgnoreCoreInputs = nil
	do
		local os_clock = os.clock
		library.signals[1 + #library.signals] = UserInputService.InputBegan:Connect(function(keyCode)
			if IgnoreCoreInputs or UserInputService:GetFocusedTextBox() then
				return
			elseif keyCode.KeyCode == library.configuration.hideKeybind then
				if not lasthidebing or ((os_clock() - lasthidebing) > 12) then
					main.Visible = not main.Visible
				end
				lasthidebing = nil
			end
		end)
	end
	local windowFunctions = {
		tabCount = 0,
		selected = {},
		Flags = elements
	}
	library.globals["__Window" .. windowName].windowFunctions = windowFunctions
	function windowFunctions:Show(x)
		main.Visible = (x == nil) or (x == true) or (x == 1)
		return main.Visible
	end
	function windowFunctions:Hide(x)
		main.Visible = (x == false) or (x == 0)
		return main.Visible
	end
	function windowFunctions:Visibility(x)
		if x == nil then
			main.Visible = not main.Visible
		else
			main.Visible = x and true
		end
		return main.Visible
	end
	windowFunctions.LastTab = nil
	--> create tab
	function windowFunctions:CreateTab(options, ...)
		options = (options and (type(options) == "string") and resolvevararg("Tab", options, ...)) or options or {
			Name = "SympleHubTab"
		}
		local tabName = options.Name or "Unnamed Tab"
		options.Name = tabName
		windowFunctions.tabCount = windowFunctions.tabCount + 1
		local newTab = Instance.new("TextButton")
		local newTabHolder = Instance.new("Frame")
		local newTabHolderUiCorner = Instance.new("UICorner")
		local newTabHolderScrollingFrame = Instance.new("ScrollingFrame")
		local newTabHolderScrollingFrameUiListLayout = Instance.new("UIListLayout")
		library.globals["__Window" .. windowName].newTab = newTab
		newTab.BackgroundTransparency = 1
		newTab.Size = UDim2.fromScale(0.243, 0.488)
		newTab.Font = library.Font.FredokaOne
		newTab.Text = options.Name
		newTab.TextScaled = true
		newTab.LayoutOrder = (options.LastTab and 99999) or tonumber(options.TabOrder or options.LayoutOrder) or (2 + windowFunctions.tabCount)
		local colored_newTab_TextColor3 = nil
		if windowFunctions.tabCount == 1 then
			newTab.TextColor3 = library.ColourTheme.ActiveText
			colored_newTab_TextColor3 = {newTab, "TextColor3", "tabText"}
			colored[1 + #colored] = colored_newTab_TextColor3
			windowFunctions.selected.button = newTab
			windowFunctions.selected.holder = newTabHolder
		else
			newTab.TextColor3 = library.ColourTheme.SupletaryText
			colored_newTab_TextColor3 = {newTab, "TextColor3", "tabText"}
			colored[1 + #colored] = colored_newTab_TextColor3
		end
		newTab.TextScaled = false
		newTab.TextSize = 15
		newTab.Parent = tab
		local function goto()
			if windowFunctions.LastTab then
				windowFunctions.LastTab[4] = 1.35
			end
			if windowFunctions.selected.button.ClassName == "TextButton" then
				TweenService:Create(windowFunctions.selected.button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
					TextColor3 = library.ColourTheme.SupletaryText
				}):Play()
			end
			if colored_newTab_TextColor3 then
				colored_newTab_TextColor3[4] = nil
			end

			windowFunctions.selected.holder.Visible = false
			windowFunctions.selected.button = newTab
			windowFunctions.selected.holder = newTabHolder
			if windowFunctions.selected.button.ClassName == "TextButton" then
				TweenService:Create(windowFunctions.selected.button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
					TextColor3 = library.ColourTheme.ActiveText
				}):Play()
			end
			windowFunctions.selected.holder.Visible = true
			windowFunctions.LastTab = colored_newTab_TextColor3
		end
		if not homepage and newTab.LayoutOrder <= 4 then
			homepage = goto
		end
		library.signals[1 + #library.signals] = newTab.MouseButton1Click:Connect(goto)
		newTabHolder.Name = options.Name.."TabHolder"
		newTabHolder.BackgroundColor3 = library.ColourTheme.Secondary
		newTabHolder.Position = UDim2.fromScale(0.046, 0.333)
		newTabHolder.Size = UDim2.fromScale(0.909, 0.633)
		newTabHolder.Visible = windowFunctions.tabCount == 1
		newTabHolder.Parent = main
		newTabHolderUiCorner.CornerRadius = UDim.new(0, 8)
		newTabHolderUiCorner.Parent = newTabHolder
		newTabHolderScrollingFrame.AutomaticSize = Enum.AutomaticSize.X
		newTabHolderScrollingFrame.BackgroundTransparency = 1
		newTabHolderScrollingFrame.BorderSizePixel = 0
		newTabHolderScrollingFrame.Position = UDim2.new(0.015, 0, 0.026, 0)
		newTabHolderScrollingFrame.Size = UDim2.fromScale(0.975, 0.949)
		newTabHolderScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		newTabHolderScrollingFrame.ScrollBarImageColor3 = library.ColourTheme.ActiveText
		newTabHolderScrollingFrame.ScrollBarThickness = 5
		newTabHolderScrollingFrame.Parent = newTabHolder
		newTabHolderScrollingFrameUiListLayout.Parent = tab
		newTabHolderScrollingFrameUiListLayout.FillDirection = Enum.FillDirection.Vertical
		newTabHolderScrollingFrameUiListLayout.Padding = UDim.new(0, 6)
		newTabHolderScrollingFrameUiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		newTabHolderScrollingFrameUiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		newTabHolderScrollingFrameUiListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
		newTabHolderScrollingFrameUiListLayout.Parent = newTabHolderScrollingFrame

		local tabFunctions = {
			Flags = {},
			Remove = function()
				local relod = nil
				if newTab then
					newTab.Parent = nil
					relod = true
				end
				if newTabHolder then
					newTabHolder.Parent = nil
					relod = true
				end
				if relod then
					windowFunctions:UpdateAll()
				end
			end,
			Select = goto
		}
		function tabFunctions:CreateCommand(options, ...)
			options = (options and type(options) == "string" and resolvevararg("Section", options, ...)) or options
			local sectionName = options.Name or "Unnamed Section"
			local newSection = Instance.new("Frame")
			local newSectionUiCorner = Instance.new("UICorner")
			newSection.BackgroundColor3 = library.ColourTheme.Command
			newSection.Size = UDim2.new(0.98, 0,0, 33)
			newSection.Parent = newTabHolderScrollingFrame
			newSectionUiCorner.CornerRadius = UDim.new(0, 8)
			newSectionUiCorner.Parent = newSection
			
			function tabFunctions:Update(extra)
				local currentHolder = newSection.Parent
				if not newSection.Visible then
					newSection.Visible = true
				end
				if currentHolder then
					currentHolder.CanvasSize = UDim2.new(0, 0, 0, currentHolder:FindFirstChildOfClass("UIListLayout").AbsoluteContentSize.Y)
				end
			end
			tabFunctions:Update()
			
		end
		return tabFunctions
	end
	function windowFunctions:UpdateAll()
		local target = self or windowFunctions
		if target and type(target) == "table" and target.Flags then
			for _, e in next, target.Flags do
				if e and type(e) == "table" then
					if e.Update then
						pcall(e.Update)
					end
					if e.UpdateAll then
						pcall(e.Update)
					end
				end
			end
		end
	end
	library.UpdateAll = windowFunctions.UpdateAll
	return windowFunctions
end


library.NewWindow = library.CreateWindow
library.AddWindow = library.CreateWindow
library.Window = library.CreateWindow
library.W = library.CreateWindow
return library, library.flags
