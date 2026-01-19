function elements:AddSlider(Config: Slider)
	Config = Config or {};
	Config.Name = Config.Name or "Slider";
	Config.Type = Config.Type or "";
	Config.Default = Config.Default or 50;
	Config.Min = Config.Min or 0;
	Config.Max = Config.Max or 100;
	Config.Round = Config.Round or 0;
	Config.Decimals = Config.Decimals or Config.Round; -- Support both Round and Decimals
	Config.Risky = Config.Risky or false;
	Config.Option = Config.Option or false;
	Config.Callback = Config.Callback or function(number) end;
	Config.Flag = Config.Flag or nil;

	local Slider = Instance.new("Frame")
	local Slider_Name = Instance.new("TextLabel")
	local ValueFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local OptionButton = Instance.new("ImageButton")
	local boxli = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local ValueText = Instance.new("TextLabel")

	if SearchAPI then
		SearchAPI.Memory(Config.Name);
	end;

	Slider.Name = Fatality:RandomString()
	Slider.Parent = Parent
	Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Slider.BackgroundTransparency = 1.000
	Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Slider.BorderSizePixel = 0
	Slider.Size = UDim2.new(1, -25, 0, 17)
	Slider.ZIndex = ZIndex + 1

	Fatality:AddDragBlacklist(Slider);

	Slider_Name.Name = Fatality:RandomString()
	Slider_Name.Parent = Slider
	Slider_Name.AnchorPoint = Vector2.new(0, 0.5)
	Slider_Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Slider_Name.BackgroundTransparency = 1.000
	Slider_Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Slider_Name.BorderSizePixel = 0
	Slider_Name.Position = UDim2.new(0, 0, 0.5, 0)
	Slider_Name.Size = UDim2.new(1, 0, 0.800000012, 0)
	Slider_Name.ZIndex = ZIndex + 2
	Slider_Name.FontFace = Fatality.FontSemiBold
	Slider_Name.Text = Config.Name
	Slider_Name.TextColor3 = (Config.Risky and Color3.fromRGB(255, 160, 92)) or Color3.fromRGB(255, 255, 255)
	Slider_Name.TextSize = 13.000
	Slider_Name.TextTransparency = 0.200
	Slider_Name.TextXAlignment = Enum.TextXAlignment.Left

	ValueFrame.Name = Fatality:RandomString()
	ValueFrame.Parent = Slider
	ValueFrame.AnchorPoint = Vector2.new(1, 0.5)
	ValueFrame.BackgroundColor3 = Fatality.Colors.Black
	ValueFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ValueFrame.BorderSizePixel = 0
	ValueFrame.Position = UDim2.new(1, -3, 0.5, 0)
	ValueFrame.Size = UDim2.new(0, 85, 0.600000024, 0)
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
	OptionButton.Visible = Config.Option;
	OptionButton.ZIndex = ZIndex + 1;

	boxli.Name = Fatality:RandomString()
	boxli.Parent = ValueFrame
	boxli.BackgroundColor3 = Fatality.Colors.Main
	boxli.BorderColor3 = Color3.fromRGB(0, 0, 0)
	boxli.BorderSizePixel = 0
	boxli.Size = UDim2.new((Config.Default - Config.Min) / (Config.Max - Config.Min), 0, 1, 0)
	boxli.ZIndex = ZIndex + 3

	UICorner_2.CornerRadius = UDim.new(0, 2)
	UICorner_2.Parent = boxli

	ValueText.Name = Fatality:RandomString()
	ValueText.Parent = ValueFrame
	ValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ValueText.BackgroundTransparency = 1.000
	ValueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ValueText.BorderSizePixel = 0
	ValueText.Size = UDim2.new(1, 0, 1, 0)
	ValueText.ZIndex = ZIndex + 4
	ValueText.FontFace = Fatality.FontSemiBold
	ValueText.Text = string.format('%s%s',tostring(Config.Default),tostring(Config.Type));
	ValueText.TextColor3 = Color3.fromRGB(255, 255, 255)
	ValueText.TextSize = 9.000
	ValueText.TextStrokeTransparency = 0.850;
	ValueText.TextTransparency = 0;

	local OpcToggle = function(value)
		if value then
			Fatality:CreateAnimation(boxli,0.45,{
				BackgroundTransparency = 0,
			})

			Fatality:CreateAnimation(OptionButton,0.45,{
				ImageTransparency = (Config.Option and 0.600) or 1
			})

			Fatality:CreateAnimation(ValueFrame,0.45,{
				BackgroundTransparency = 0,
			})

			Fatality:CreateAnimation(Slider_Name,0.45,{
				TextTransparency = 0.200
			})

			Fatality:CreateAnimation(ValueText,0.45,{
				TextStrokeTransparency = 0.850,
				TextTransparency = 0;
			})
		else
			Fatality:CreateAnimation(ValueText,0.45,{
				TextStrokeTransparency = 1,
				TextTransparency = 1;
			})

			Fatality:CreateAnimation(Slider_Name,0.45,{
				TextTransparency = 1
			})

			Fatality:CreateAnimation(ValueFrame,0.45,{
				BackgroundTransparency = 1,
			})

			Fatality:CreateAnimation(boxli,0.45,{
				BackgroundTransparency = 1,
			})

			Fatality:CreateAnimation(OptionButton,0.45,{
				ImageTransparency = 1
			})
		end;
	end;

	OpcToggle(Event:GetAttribute('V'))

	local IsHold = false;

	-- Helper function for proper decimal rounding
	local function roundToDecimal(num, decimals)
		local mult = 10^(decimals or 0)
		return math.floor(num * mult + 0.5) / mult
	end

	local function update(Input)
		local SizeScale = math.clamp((((Input.Position.X) - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X), 0, 1);
		local Main = ((Config.Max - Config.Min) * SizeScale) + Config.Min;
		
		-- Use proper rounding with decimals support
		local decimals = Config.Decimals or Config.Round or 0
		local Value = roundToDecimal(Main, decimals)
		
		-- Clamp to ensure within bounds after rounding
		Value = math.clamp(Value, Config.Min, Config.Max)
		
		local normalized = (Value - Config.Min) / (Config.Max - Config.Min);

		TweenService:Create(boxli , TweenInfo.new(0.2),{
			Size = UDim2.new(normalized, 0, 1, 0)
		}):Play();

		Config.Default = Value;
		
		-- Format text display based on decimal places
		if decimals > 0 then
			ValueText.Text = string.format('%.'..decimals..'f%s', Value, Config.Type);
		else
			ValueText.Text = string.format('%d%s', Value, Config.Type);
		end

		Config.Callback(Value)
	end;

	do
		ValueFrame.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				IsHold = true
				update(Input)
			end
		end)

		ValueFrame.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				if UserInputService.TouchEnabled then
					if not Fatality:IsMouseOverFrame(ValueFrame) then
						IsHold = false
					end;
				else
					IsHold = false
				end;
			end
		end)

		UserInputService.InputChanged:Connect(function(Input)
			if IsHold then
				if (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch)  then
					if UserInputService.TouchEnabled then
						if not Fatality:IsMouseOverFrame(ValueFrame) then
							IsHold = false
						else
							update(Input)
						end;
					else
						update(Input)
					end;
				end;
			end;
		end);
	end;

	local Respons = Fatality:CreateResponse({
		Rename = function(new_name)
			Slider_Name.Text = new_name
		end,
		GetValue = function()
			return Config.Default;
		end,
		Signal = Event.Event:Connect(OpcToggle),
		SetValue = function(v)
			-- Round the input value as well
			local decimals = Config.Decimals or Config.Round or 0
			v = roundToDecimal(v, decimals)
			v = math.clamp(v, Config.Min, Config.Max)
			
			local IsSame = v == Config.Default;

			Config.Default = v;

			TweenService:Create(boxli , TweenInfo.new(0.2),{
				Size = UDim2.new((Config.Default - Config.Min) / (Config.Max - Config.Min), 0, 1, 0)
			}):Play();

			Config.Default = v;
			
			-- Format text display
			if decimals > 0 then
				ValueText.Text = string.format('%.'..decimals..'f%s', v, Config.Type);
			else
				ValueText.Text = string.format('%d%s', v, Config.Type);
			end

			if not IsSame then
				Config.Callback(v);
			end;
		end,
		Flag = Config.Flag and Config.Flag.."Slider",
		Option = (Config.Option and Fatality:CreateOption(OptionButton)) or nil;
	});

	if Config.Flag then
		Fatality.WindowFlags[FatalWindow][Config.Flag.."Slider"] = Respons;
	end;

	return Respons;
end;
