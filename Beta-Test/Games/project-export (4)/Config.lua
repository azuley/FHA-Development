-- Universal Exploit Configuration
-- Auto-generated settings file

local Config = {
    -- UI Settings
    UIPosition = UDim2.new(0.5, -250, 0.5, -200),
    UISize = UDim2.new(0, 500, 0, 400),
    UIVisible = true,
    UITheme = "Dark",
    
    -- Keybinds
    ToggleKey = "RightControl",
    FlyKeyW = "W",
    FlyKeyA = "A",
    FlyKeyS = "S",
    FlyKeyD = "D",
    FlyKeyUp = "Space",
    FlyKeyDown = "LeftShift",
    
    -- Features
    FlySpeed = 50,
    WalkSpeed = 16,
    JumpPower = 50,
    
    -- Toggles
    FlyEnabled = false,
    NoclipEnabled = false,
    SpeedEnabled = false,
    JumpPowerEnabled = false,
    InfiniteJumpEnabled = false,
    ESPEnabled = false,
    AimlockEnabled = false,
    GodModeEnabled = false,
    AntiAfkEnabled = false,
    FullbrightEnabled = false,
    ChamsEnabled = false,
    
    -- ESP Settings
    ESPColor = Color3.fromRGB(255, 50, 50),
    ESPFillTransparency = 0.5,
    ESPOutlineColor = Color3.fromRGB(255, 255, 255),
    ESPOutlineTransparency = 0,
    
    -- Teleport Locations
    TeleportLocations = {
        {"Spawn", Vector3.new(0, 5, 0)},
        {"High Point", Vector3.new(0, 100, 0)},
        {"Far Away", Vector3.new(1000, 50, 1000)},
        {"Underground", Vector3.new(0, -100, 0)}
    },
    
    -- Player ESP List
    ESPPlayers = {},
    
    -- Misc
    AutoSave = true,
    Notifications = true,
    SoundEffects = true,
    
    -- Performance
    UpdateRate = 60, -- Hz
    ESPUpdateRate = 10, -- Hz
    
    -- Security
    UseAntiBan = false,
    RandomizeValues = false,
    
    -- Version
    Version = "2.1.0",
    LastUpdated = os.time()
}

-- Configuration Manager
local ConfigManager = {}

function ConfigManager:Save()
    if not Config.AutoSave then return end
    
    local serialized = {
        UIPosition = {Config.UIPosition.X.Scale, Config.UIPosition.X.Offset, 
                     Config.UIPosition.Y.Scale, Config.UIPosition.Y.Offset},
        UISize = {Config.UISize.X.Scale, Config.UISize.X.Offset,
                  Config.UISize.Y.Scale, Config.UISize.Y.Offset},
        UIVisible = Config.UIVisible,
        UITheme = Config.UITheme,
        
        ToggleKey = Config.ToggleKey,
        FlySpeed = Config.FlySpeed,
        WalkSpeed = Config.WalkSpeed,
        JumpPower = Config.JumpPower,
        
        FlyEnabled = Config.FlyEnabled,
        NoclipEnabled = Config.NoclipEnabled,
        SpeedEnabled = Config.SpeedEnabled,
        JumpPowerEnabled = Config.JumpPowerEnabled,
        InfiniteJumpEnabled = Config.InfiniteJumpEnabled,
        ESPEnabled = Config.ESPEnabled,
        AntiAfkEnabled = Config.AntiAfkEnabled,
        
        AutoSave = Config.AutoSave,
        Notifications = Config.Notifications,
        SoundEffects = Config.SoundEffects,
        
        Version = Config.Version,
        LastUpdated = Config.LastUpdated
    }
    
    -- Tentar salvar usando diferentes métodos
    local success, err = pcall(function()
        if writefile then
            writefile("UniversalExploit_Config.json", game:GetService("HttpService"):JSONEncode(serialized))
            return true
        elseif syn and syn.writefile then
            syn.writefile("UniversalExploit_Config.json", game:GetService("HttpService"):JSONEncode(serialized))
            return true
        else
            -- Salvar na memória
            getgenv().UniversalExploitConfig = serialized
            return true
        end
    end)
    
    if success then
        if Config.Notifications then
            print("✅ Configurações salvas!")
        end
        return true
    else
        warn("❌ Erro ao salvar configurações:", err)
        return false
    end
end

function ConfigManager:Load()
    local loadedConfig = nil
    
    -- Tentar carregar usando diferentes métodos
    local success, err = pcall(function()
        if readfile and isfile and isfile("UniversalExploit_Config.json") then
            local data = readfile("UniversalExploit_Config.json")
            loadedConfig = game:GetService("HttpService"):JSONDecode(data)
            return true
        elseif syn and syn.readfile then
            local data = syn.readfile("UniversalExploit_Config.json")
            loadedConfig = game:GetService("HttpService"):JSONDecode(data)
            return true
        elseif getgenv().UniversalExploitConfig then
            loadedConfig = getgenv().UniversalExploitConfig
            return true
        else
            return false
        end
    end)
    
    if success and loadedConfig then
        -- Aplicar configurações carregadas
        if loadedConfig.UIPosition then
            Config.UIPosition = UDim2.new(
                loadedConfig.UIPosition[1], loadedConfig.UIPosition[2],
                loadedConfig.UIPosition[3], loadedConfig.UIPosition[4]
            )
        end
        
        if loadedConfig.UISize then
            Config.UISize = UDim2.new(
                loadedConfig.UISize[1], loadedConfig.UISize[2],
                loadedConfig.UISize[3], loadedConfig.UISize[4]
            )
        end
        
        -- Aplicar outras configurações
        Config.UIVisible = loadedConfig.UIVisible or Config.UIVisible
        Config.UITheme = loadedConfig.UITheme or Config.UITheme
        Config.ToggleKey = loadedConfig.ToggleKey or Config.ToggleKey
        Config.FlySpeed = loadedConfig.FlySpeed or Config.FlySpeed
        Config.WalkSpeed = loadedConfig.WalkSpeed or Config.WalkSpeed
        Config.JumpPower = loadedConfig.JumpPower or Config.JumpPower
        
        Config.FlyEnabled = loadedConfig.FlyEnabled or Config.FlyEnabled
        Config.NoclipEnabled = loadedConfig.NoclipEnabled or Config.NoclipEnabled
        Config.SpeedEnabled = loadedConfig.SpeedEnabled or Config.SpeedEnabled
        Config.JumpPowerEnabled = loadedConfig.JumpPowerEnabled or Config.JumpPowerEnabled
        Config.InfiniteJumpEnabled = loadedConfig.InfiniteJumpEnabled or Config.InfiniteJumpEnabled
        Config.ESPEnabled = loadedConfig.ESPEnabled or Config.ESPEnabled
        Config.AntiAfkEnabled = loadedConfig.AntiAfkEnabled or Config.AntiAfkEnabled
        
        Config.AutoSave = loadedConfig.AutoSave or Config.AutoSave
        Config.Notifications = loadedConfig.Notifications or Config.Notifications
        Config.SoundEffects = loadedConfig.SoundEffects or Config.SoundEffects
        
        if Config.Notifications then
            print("✅ Configurações carregadas!")
        end
        
        return true
    else
        if Config.Notifications then
            print("ℹ️ Nenhuma configuração salva encontrada. Usando padrões.")
        end
        return false
    end
end

function ConfigManager:Reset()
    -- Reset para padrões
    Config = {
        UIPosition = UDim2.new(0.5, -250, 0.5, -200),
        UISize = UDim2.new(0, 500, 0, 400),
        UIVisible = true,
        UITheme = "Dark",
        
        ToggleKey = "RightControl",
        FlySpeed = 50,
        WalkSpeed = 16,
        JumpPower = 50,
        
        FlyEnabled = false,
        NoclipEnabled = false,
        SpeedEnabled = false,
        JumpPowerEnabled = false,
        InfiniteJumpEnabled = false,
        ESPEnabled = false,
        AntiAfkEnabled = false,
        
        AutoSave = true,
        Notifications = true,
        SoundEffects = true,
        
        Version = "2.1.0",
        LastUpdated = os.time()
    }
    
    self:Save()
    
    if Config.Notifications then
        print("✅ Configurações resetadas para padrão!")
    end
    
    return true
end

function ConfigManager:Get(key)
    return Config[key]
end

function ConfigManager:Set(key, value)
    Config[key] = value
    
    if Config.AutoSave then
        self:Save()
    end
    
    return true
end

function ConfigManager:GetAll()
    return Config
end

function ConfigManager:Export()
    return game:GetService("HttpService"):JSONEncode(Config)
end

function ConfigManager:Import(jsonString)
    local success, data = pcall(function()
        return game:GetService("HttpService"):JSONDecode(jsonString)
    end)
    
    if success and data then
        for key, value in pairs(data) do
            Config[key] = value
        end
        
        self:Save()
        
        if Config.Notifications then
            print("✅ Configurações importadas!")
        end
        
        return true
    else
        warn("❌ Erro ao importar configurações!")
        return false
    end
end

-- Auto-load on require
ConfigManager:Load()

-- Auto-save on game close
game:BindToClose(function()
    if Config.AutoSave then
        ConfigManager:Save()
    end
end)

-- Expose to global
getgenv().UniversalExploitConfig = Config
getgenv().ConfigManager = ConfigManager

return ConfigManager