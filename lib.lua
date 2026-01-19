-- Вот как должен выглядеть раздел с типами в начале файла:

-- Export Types --
export type Window = {
	Name: string,
	Keybind: string | Enum.KeyCode,
	Scale: UDim2,
	Expire: string
}

export type Loader = {
	Name: string,
	Duration: number,
	Scale: number
}

export type Menu = {
	Name: string,
	Icon: string,
	AutoFill: boolean
}

export type Section = {
	Name: string,
	Position: string,
	Height: number,
}

-- ... другие типы ...

export type Keybind = {
	Name: string,
	Default: string | Enum.KeyCode,
	Callback: (string) -> any,
	Flag: string | nil,
	Option: boolean,
}

-- ДОБАВЬТЕ ПРЯМО СЮДА ↓↓↓
export type Textbox = {
	Name: string,
	Default: string,
	Placeholder: string,
	Callback: (string) -> any,
	Option: boolean,
	Flag: string | nil,
	ClearOnFocus: boolean,
}
-- ↑↑↑ ДО СЮДА

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
	AddTextbox: (self,Config: Textbox) -> {  -- ← И ЭТУ СТРОКУ ТОЖЕ
		Option: Elements	
	},
}

--[[
ПРОВЕРЬТЕ:
1. Все фигурные скобки {} закрыты
2. Все запятые на месте
3. Нет лишних символов
4. export type Textbox добавлен ПОСЛЕ export type Keybind
5. В export type Elements добавлена строка AddTextbox
]]
