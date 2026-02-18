-- Universal Exploit Configuration
-- This file contains all configurable settings

local Config = {
    -- Basic Information
    Version = "3.0.0",
    Author = "Mika",
    ReleaseDate = "2024",
    
    -- UI Settings
    UI = {
        Theme = "Cyber",
        AccentColor = Color3.fromRGB(0, 170, 255),
        BackgroundColor = Color3.fromRGB(15, 15, 20),
        SecondaryColor = Color3.fromRGB(30, 30, 40),
        TextColor = Color3.fromRGB(255, 255, 255),
        SubtextColor = Color3.fromRGB(180, 180, 200),
        
        -- Window Settings
        WindowSize = UDim2.new(0, 550, 0, 650),
        WindowPosition = UDim2.new(0.5, -275, 0.5, -325),
        CornerRadius = 16,
        
        -- Animation Settings
        AnimationSpeed = 0.3,
        EasingStyle = Enum.EasingStyle.Quad,
        EasingDirection = Enum.EasingDirection.Out,
        
        -- Transparency Levels
        BackgroundTransparency = 0.15,
        CardTransparency = 0.3,
        ButtonTransparency = 0.2,
        GlassEffectTransparency = 0.7
    },
    
    -- Keybind Settings
    Keybinds = {
        ToggleUI = Enum.KeyCode.RightControl,
        FlyToggle = Enum.KeyCode.F,
        NoclipToggle = Enum.KeyCode.N,
        SpeedToggle = Enum.KeyCode.V,
        ESPToggle = Enum.KeyCode.E,
        AimlockToggle = Enum.KeyCode.Q
    },
    
    -- Feature Defaults
    Features = {
        Fly = {
            Enabled = false,
            Speed = 50,
            Height = 5
        },
        
        Noclip = {
            Enabled = false
        },
        
        Speed = {
            Enabled = false,
            WalkSpeed = 16,
            MaxSpeed = 100
        },
        
        Jump = {
            Enabled = false,
            JumpPower = 50,
            MaxJumpPower = 200
        },
        
        ESP = {
            Enabled = false,
            BoxColor = Color3.fromRGB(255, 0, 0),
            NameColor = Color3.fromRGB(255, 255, 255),
            DistanceColor = Color3.fromRGB(0, 255, 0),
            MaxDistance = 500
        },
        
        Aimlock = {
            Enabled = false,
            Smoothness = 0.5,
            FOV = 100,
            TargetPart = "Head"
        },
        
        GodMode = {
            Enabled = false
        },
        
        AntiAfk = {
            Enabled = true
        }
    },
    
    -- Performance Settings
    Performance = {
        UpdateRate = 60, -- FPS for UI updates
        MemoryLimit = 500, -- MB
        EnableOptimizations = true,
        ReduceParticles = false,
        LimitESPUpdates = true
    },
    
    -- Compatibility Settings
    Compatibility = {
        SupportedExecutors = {
            "Synapse X",
            "KRNL",
            "ScriptWare",
            "Fluxus",
            "Electron",
            "Comet",
            "Oxygen U",
            "Delta"
        },
        
        RobloxVersions = {
            "All"
        },
        
        GameTypes = {
            "All"
        }
    },
    
    -- Security Settings
    Security = {
        AntiKick = true,
        AntiBan = false,
        ObfuscateCalls = true,
        RandomizeNames = true,
        UseProxies = false
    },
    
    -- Script Settings
    Scripts = {
        AutoSave = true,
        MaxHistory = 10,
        DefaultScript = "print('Hello from Universal Exploit!')",
        TrustedSources = {
            "pastebin.com/raw",
            "github.com/raw",
            "rentry.co/raw"
        }
    },
    
    -- Teleport Settings
    Teleport = {
        SafeTeleport = true,
        CheckGround = true,
        OffsetHeight = 5,
        Cooldown = 1
    },
    
    -- World Settings
    World = {
        Gravity = 196.2,
        Time = 12,
        Fog = 0,
        Ambient = Color3.fromRGB(100, 100, 100)
    },
    
    -- Save Settings
    Save = {
        Enabled = true,
        FileName = "UniversalExploit_Settings.json",
        AutoSaveInterval = 60, -- seconds
        BackupCount = 3
    }
}

-- Theme Presets
Config.Themes = {
    Cyber = {
        AccentColor = Color3.fromRGB(0, 170, 255),
        BackgroundColor = Color3.fromRGB(15, 15, 20),
        SecondaryColor = Color3.fromRGB(30, 30, 40)
    },
    
    Neon = {
        AccentColor = Color3.fromRGB(255, 0, 255),
        BackgroundColor = Color3.fromRGB(10, 10, 15),
        SecondaryColor = Color3.fromRGB(40, 20, 50)
    },
    
    Fire = {
        AccentColor = Color3.fromRGB(255, 100, 0),
        BackgroundColor = Color3.fromRGB(20, 10, 5),
        SecondaryColor = Color3.fromRGB(50, 25, 10)
    },
    
    Nature = {
        AccentColor = Color3.fromRGB(0, 200, 100),
        BackgroundColor = Color3.fromRGB(10, 20, 15),
        SecondaryColor = Color3.fromRGB(20, 40, 30)
    },
    
    Ice = {
        AccentColor = Color3.fromRGB(0, 200, 255),
        BackgroundColor = Color3.fromRGB(10, 15, 20),
        SecondaryColor = Color3.fromRGB(20, 30, 40)
    },
    
    Gold = {
        AccentColor = Color3.fromRGB(255, 215, 0),
        BackgroundColor = Color3.fromRGB(20, 15, 5),
        SecondaryColor = Color3.fromRGB(40, 30, 10)
    }
}

-- Function to apply theme
function Config:ApplyTheme(themeName)
    local theme = self.Themes[themeName]
    if theme then
        self.UI.Theme = themeName
        self.UI.AccentColor = theme.AccentColor
        self.UI.BackgroundColor = theme.BackgroundColor
        self.UI.SecondaryColor = theme.SecondaryColor
        return true
    end
    return false
end

-- Function to save settings
function Config:SaveToFile()
    if not self.Save.Enabled then return false end
    
    local data = {
        Version = self.Version,
        UI = {
            Theme = self.UI.Theme
        },
        Keybinds = {},
        Features = {}
    }
    
    -- Convert Color3 to table
    local function color3ToTable(color)
        return {R = color.R, G = color.G, B = color.B}
    end
    
    -- Save keybinds
    for key, value in pairs(self.Keybinds) do
        data.Keybinds[key] = tostring(value)
    end
    
    -- Save feature states
    for feature, settings in pairs(self.Features) do
        data.Features[feature] = {}
        for key, value in pairs(settings) do
            if typeof(value) == "Color3" then
                data.Features[feature][key] = color3ToTable(value)
            else
                data.Features[feature][key] = value
            end
        end
    end
    
    -- Convert to JSON
    local json = game:GetService("HttpService"):JSONEncode(data)
    
    -- Save to file
    if writefile then
        writefile(self.Save.FileName, json)
        return true
    end
    
    return false
end

-- Function to load settings
function Config:LoadFromFile()
    if not self.Save.Enabled then return false end
    
    if readfile and isfile(self.Save.FileName) then
        local success, data = pcall(function()
            local json = readfile(self.Save.FileName)
            return game:GetService("HttpService"):JSONDecode(json)
        end)
        
        if success and data then
            -- Load theme
            if data.UI and data.UI.Theme then
                self:ApplyTheme(data.UI.Theme)
            end
            
            -- Load keybinds
            if data.Keybinds then
                for key, value in pairs(data.Keybinds) do
                    self.Keybinds[key] = Enum.KeyCode[value]
                end
            end
            
            -- Load features
            if data.Features then
                for feature, settings in pairs(data.Features) do
                    if self.Features[feature] then
                        for key, value in pairs(settings) do
                            if type(value) == "table" and value.R then
                                -- Convert table to Color3
                                self.Features[feature][key] = Color3.new(value.R, value.G, value.B)
                            else
                                self.Features[feature][key] = value
                            end
                        end
                    end
                end
            end
            
            return true
        end
    end
    
    return