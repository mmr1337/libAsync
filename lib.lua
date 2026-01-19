-- ===========================
-- ЧАСТЬ 1: Добавьте в раздел Export Types (после export type Keybind)
-- ===========================

export type Textbox = {
	Name: string,
	Default: string,
	Placeholder: string,
	Callback: (string) -> any,
	Option: boolean,
	Flag: string | nil,
	ClearOnFocus: boolean,
}

-- ===========================
-- ЧАСТЬ 2: Обновите export type Elements (замените существующий)
-- ===========================

export type Elements = {
	AddToggle: (self,Config: Toggle) -> {
		Option: Elements	
	},
	AddSlider: (self,Config: Slider) -> {
		Option: Elements	
	},
	AddButton: (self,Config: Button) -> {},
	AddColorPicker: (self,Config: ColorPicker) -> {
		Option: Elements	
	},
	AddDropdown: (self,Config: Dropdown) -> {
		Option: Elements	
	},
	AddKeybind: (self,Config: Keybind) -> {
		Option: Elements	
	},
	AddTextbox: (self,Config: Textbox) -> {
		Option: Elements	
	},
}

-- ===========================
-- ЧАСТЬ 3: Добавьте эту функцию в function Fatality:CreateElements
-- Добавьте ПОСЛЕ функции elements:AddKeybind (перед return elements)
-- ===========================

function elements:AddTextbox(Config: Textbox)
	Config = Config or {};
	Config.Name = Config.Name or "Textbox";
	Config.Default = Config.Default or "";
	Config.Placeholder = Config.Placeholder or "Enter text...";
	Config.Option = Config.Option or false;
	Config.Callback = Config.Callback or function(text) end;
	Config.Flag = Config.Flag or nil;
	Config.ClearOnFocus = Config.ClearOnFocus or false;

	local TextboxFrame = Instance.new("Frame")
	local Textbox_Name = Instance.new("TextLabel")
	local ValueFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local OptionButton = Instance.new("ImageButton")
	local TextBox = Instance.new("TextBox")
	local UICorner_2 = Instance.new("UICorner")

	if SearchAPI then
		SearchAPI.Memory(Config.Name);
	end;

	TextboxFrame.Name = Fatality:RandomString()
	TextboxFrame.Parent = Parent
	TextboxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextboxFrame.BackgroundTransparency = 1.000
	TextboxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextboxFrame.BorderSizePixel = 0
	TextboxFrame.Size = UDim2.new(1, -25, 0, 17)
	TextboxFrame.ZIndex = ZIndex + 1
	Fatality:AddDragBlacklist(TextboxFrame);

	Textbox_Name.Name = Fatality:RandomString()
	Textbox_Name.Parent = TextboxFrame
	Textbox_Name.AnchorPoint = Vector2.new(0, 0.5)
	Textbox_Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Textbox_Name.BackgroundTransparency = 1.000
	Textbox_Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Textbox_Name.BorderSizePixel = 0
	Textbox_Name.Position = UDim2.new(0, 0, 0.5, 0)
	Textbox_Name.Size = UDim2.new(1, 0, 0.800000012, 0)
	Textbox_Name.ZIndex = ZIndex + 2
	Textbox_Name.FontFace = Fatality.FontSemiBold
	Textbox_Name.Text = Config.Name
	Textbox_Name.TextColor3 = Color3.fromRGB(255, 255, 255)
	Textbox_Name.TextSize = 13.000
	Textbox_Name.TextTransparency = 0.200
	Textbox_Name.TextXAlignment = Enum.TextXAlignment.Left
	Fatality:ProtectText(Textbox_Name, Config.Name);

	ValueFrame.Name = Fatality:RandomString()
	ValueFrame.Parent = TextboxFrame
	ValueFrame.AnchorPoint = Vector2.new(1, 0.5)
	ValueFrame.BackgroundColor3 = Fatality.Colors.Black
	ValueFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ValueFrame.BorderSizePixel = 0
	ValueFrame.Position = UDim2.new(1, -3, 0.5, 0)
	ValueFrame.Size = UDim2.new(0, 85, 0.850000024, 0)
	ValueFrame.ZIndex = ZIndex + 2

	UICorner.CornerRadius = UDim.new(0, 2)
	UICorner.Parent = ValueFrame

	OptionButton.Name = Fatality:RandomString()
	OptionButton.Parent = ValueFrame
	OptionButton.AnchorPoint = Vector2.new(0, 0.5)
	OptionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	OptionButton.BackgroundTransparency = 1.000
	OptionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	OptionButton.BorderSizePixel = 0
	OptionButton.Position = UDim2.new(0, -20, 0.5, 0)
	OptionButton.Size = UDim2.new(0, 13, 0, 13)
	OptionButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	OptionButton.Image = "http://www.roblox.com/asset/?id=14007344336"
	OptionButton.ImageTransparency = 0.600
	OptionButton.Visible = Config.Option or false;
	OptionButton.ZIndex = ZIndex + 4;

	TextBox.Parent = ValueFrame
	TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
	TextBox.BackgroundColor3 = Fatality.Colors.Black
	TextBox.BackgroundTransparency = 1.000
	TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.BorderSizePixel = 0
	TextBox.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextBox.Size = UDim2.new(1, -6, 1, -2)
	TextBox.ZIndex = ZIndex + 3
	TextBox.ClearTextOnFocus = Config.ClearOnFocus
	TextBox.FontFace = Fatality.FontSemiBold
	TextBox.PlaceholderText = Config.Placeholder
	TextBox.Text = Config.Default
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.TextSize = 10.000
	TextBox.TextStrokeTransparency = 0.850
	TextBox.TextTransparency = 0.400
	TextBox.TextXAlignment = Enum.TextXAlignment.Left
	TextBox.TextTruncate = Enum.TextTruncate.AtEnd

	UICorner_2.CornerRadius = UDim.new(0, 2)
	UICorner_2.Parent = ValueFrame

	local OpcToggle = function(value)
		if value then
			Fatality:CreateAnimation(Textbox_Name, 0.45, {
				TextTransparency = 0.2,
			})

			Fatality:CreateAnimation(ValueFrame, 0.45, {
				BackgroundTransparency = 0
			})

			Fatality:CreateAnimation(TextBox, 0.45, {
				TextStrokeTransparency = 0.850,
				TextTransparency = 0.400
			})

			Fatality:CreateAnimation(OptionButton, 0.45, {
				ImageTransparency = (Config.Option and 0.6) or 1,
			})
		else
			Fatality:CreateAnimation(Textbox_Name, 0.45, {
				TextTransparency = 1,
			})

			Fatality:CreateAnimation(ValueFrame, 0.45, {
				BackgroundTransparency = 1
			})

			Fatality:CreateAnimation(TextBox, 0.45, {
				TextStrokeTransparency = 1,
				TextTransparency = 1
			})

			Fatality:CreateAnimation(OptionButton, 0.45, {
				ImageTransparency = 1,
			})
		end;
	end;

	OpcToggle(Event:GetAttribute('V'));

	TextBox.FocusLost:Connect(function(enterPressed)
		Config.Default = TextBox.Text;
		Config.Callback(TextBox.Text);
	end);

	TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		if not TextBox:IsFocused() then
			Config.Default = TextBox.Text;
		end;
	end);

	local Respons = Fatality:CreateResponse({
		Rename = function(new_name)
			Textbox_Name.Text = new_name
			Fatality:ProtectText(Textbox_Name, new_name);
		end,
		GetValue = function()
			return TextBox.Text;
		end,
		Signal = Event.Event:Connect(OpcToggle),
		SetValue = function(text)
			local IsSame = TextBox.Text == text;

			TextBox.Text = text;
			Config.Default = text;

			if not IsSame then
				Config.Callback(text);
			end;
		end,
		Clear = function()
			TextBox.Text = "";
			Config.Default = "";
			Config.Callback("");
		end,
		Flag = Config.Flag and Config.Flag.."Textbox",
		Option = (Config.Option and Fatality:CreateOption(OptionButton)) or nil;
	});

	if Config.Flag then
		Fatality.WindowFlags[FatalWindow][Config.Flag.."Textbox"] = Respons;
	end;

	return Respons;
end

-- ===========================
-- ИНСТРУКЦИЯ ПО УСТАНОВКЕ:
-- ===========================
--[[
1. Откройте файл lib.luau на GitHub
2. Найдите строку "export type Keybind" и добавьте ПОСЛЕ неё код из ЧАСТИ 1
3. Найдите "export type Elements" и ЗАМЕНИТЕ его на код из ЧАСТИ 2
4. Найдите функцию "function elements:AddKeybind" 
5. После её завершения (перед "return elements") добавьте код из ЧАСТИ 3
6. Сохраните и закоммитьте изменения на GitHub

Теперь AddTextbox будет доступен в библиотеке!
]]
