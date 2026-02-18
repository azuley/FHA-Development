-- Universal Exploit Loader
-- Carrega automaticamente o exploit principal

print("========================================")
print("Universal Exploit Loader v2.1.0")
print("Created by Mika")
print("========================================")

-- Detectar executor
print("\n[INFO] Detecting executor...")

local executorName = "Unknown"
local executorVersion = "Unknown"
local isSupported = false

-- Synapse X
if syn then
    executorName = "Synapse X"
    if syn.request then
        executorVersion = "v3"
    else
        executorVersion = "v2"
    end
    isSupported = true
    
-- KRNL
elseif KRNL_LOADED then
    executorName = "KRNL"
    executorVersion = "Latest"
    isSupported = true
    
-- Script-Ware
elseif PROTOSMASHER_LOADED then
    executorName = "ProtoSmasher"
    executorVersion = "Latest"
    isSupported = true
    
-- Other executors with identifyexecutor
elseif identifyexecutor then
    executorName = identifyexecutor() or "Unknown"
    executorVersion = "Latest"
    isSupported = true
    
-- Other executors with getexecutorname
elseif getexecutorname then
    executorName = getexecutorname() or "Unknown"
    executorVersion = "Latest"
    isSupported = true
    
-- Fallback detection
elseif debug and debug.getupvalue then
    executorName = "Script-Ware/Other"
    executorVersion = "Unknown"
    isSupported = true
else
    executorName = "Unknown/Unsupported"
    isSupported = false
end

print("  Executor: " .. executorName .. " (" .. executorVersion .. ")")
print("  Supported: " .. tostring(isSupported))

-- Verificar ambiente Roblox
print("\n[INFO] Checking Roblox environment...")

local environmentOK = true
local requiredServices = {
    "Players",
    "RunService",
    "UserInputService",
    "TweenService",
    "CoreGui",
    "TeleportService",
    "HttpService"
}

for _, serviceName in ipairs(requiredServices) do
    local success, service = pcall(function()
        return game:GetService(serviceName)
    end)
    
    if success then
        print("  ✅ " .. serviceName)
    else
        print("  ❌ " .. serviceName)
        environmentOK = false
    end
end

-- Verificar jogador local
print("\n[INFO] Checking local player...")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local playerOK = false

if LocalPlayer then
    print("  ✅ Player: " .. LocalPlayer.Name)
    print("  ✅ UserId: " .. tostring(LocalPlayer.UserId))
    playerOK = true
else
    print("  ❌ No local player found")
    environmentOK = false
end

-- Verificar se o exploit principal existe
print("\n[INFO] Looking for main exploit file...")

local exploitCode = nil
local exploitSource = nil

-- Método 1: Arquivo local
if readfile and isfile and isfile("UniversalExploit.lua") then
    exploitCode = readfile("UniversalExploit.lua")
    exploitSource = "Local file"
    print("  ✅ Found: UniversalExploit.lua (" .. #exploitCode .. " characters)")
    
-- Método 2: URL (fallback)
elseif syn and syn.request then
    print("  ℹ️ Local file not found, trying GitHub...")
    
    local url = "https://raw.githubusercontent.com/example/UniversalExploit/main/UniversalExploit.lua"
    local success, response = pcall(function()
        return syn.request({
            Url = url,
            Method = "GET"
        })
    end)
    
    if success and response and response.Body then
        exploitCode = response.Body
        exploitSource = "GitHub"
        print("  ✅ Downloaded from GitHub (" .. #exploitCode .. " characters)")
    else
        print("  ❌ Failed to download from GitHub")
    end
else
    print("  ❌ No exploit file found")
end

-- Carregar exploit
print("\n[INFO] Loading exploit...")

if exploitCode and environmentOK and playerOK and isSupported then
    print("  Status: READY TO LOAD")
    print("  Source: " .. exploitSource)
    
    -- Perguntar ao usuário
    print("\n[PROMPT] Load Universal Exploit?")
    print("  Type 'YES' to continue or anything else to cancel")
    print("  Auto-continue in 5 seconds...")
    
    -- Auto-continue após 5 segundos
    local autoContinue = true
    local userInput = ""
    
    -- Tentar obter input (nem todos os executors suportam)
    if rconsoleprint and rconsoleinput then
        rconsoleprint("\n>>> ")
        userInput = rconsoleinput()
        autoContinue = false
    elseif writefile and readfile then
        -- Método alternativo usando arquivo temporário
        writefile("loader_input.txt", "WAITING")
        print("  Check loader_input.txt and type 'YES'")
        
        local startTime = tick()
        while tick() - startTime < 5 do
            if isfile("loader_input.txt") then
                local content = readfile("loader_input.txt")
                if content == "YES" then
                    userInput = "YES"
                    autoContinue = false
                    break
                end
            end
            wait(0.1)
        end
        
        -- Limpar arquivo temporário
        if isfile("loader_input.txt") then
            delfile("loader_input.txt")
        end
    end
    
    -- Decidir se carrega
    local shouldLoad = false
    
    if userInput:upper() == "YES" then
        shouldLoad = true
        print("  User confirmed: YES")
    elseif autoContinue then
        shouldLoad = true
        print("  Auto-continuing...")
    else
        shouldLoad = false
        print("  Cancelled by user")
    end
    
    if shouldLoad then
        print("\n[LOADING] Executing exploit...")
        
        -- Executar o exploit
        local exploitFunc, err = loadstring(exploitCode)
        
        if exploitFunc then
            local success, result = pcall(exploitFunc)
            
            if success then
                print("\n✅ EXPLOIT LOADED SUCCESSFULLY!")
                print("========================================")
                print("CONTROLS:")
                print("  • RightControl: Toggle GUI")
                print("  • W/A/S/D: Fly movement")
                print("  • Space: Fly up / Infinite jump")
                print("  • Shift: Fly down")
                print("\nFEATURES:")
                print("  • Fly system")
                print("  • Noclip")
                print("  • Speed hack")
                print("  • Jump power")
                print("  • ESP")
                print("  • Teleport")
                print("  • Anti-AFK")
                print("\nEnjoy!")
                print("========================================")
                
                -- Salvar log
                if writefile then
                    local logData = {
                        timestamp = os.date("%Y-%m-%d %H:%M:%S"),
                        executor = executorName,
                        player = LocalPlayer.Name,
                        userId = LocalPlayer.UserId,
                        success = true
                    }
                    
                    local logText = "Exploit Load Log:\n"
                    for key, value in pairs(logData) do
                        logText = logText .. key .. ": " .. tostring(value) .. "\n"
                    end
                    
                    writefile("UniversalExploit_LoadLog.txt", logText)
                end
                
                return result
            else
                print("\n❌ ERROR EXECUTING EXPLOIT:")
                print("  " .. tostring(result))
                print("\nTROUBLESHOOTING:")
                print("  1. Try re-injecting your executor")
                print("  2. Make sure you're in a game")
                print("  3. Try a different executor")
                print("  4. Check for script errors above")
                
                return false
            end
        else
            print("\n❌ ERROR LOADING EXPLOIT:")
            print("  " .. tostring(err))
            print("\nTROUBLESHOOTING:")
            print("  1. The exploit file might be corrupted")
            print("  2. Try downloading again")
            print("  3. Check file permissions")
            
            return false
        end
    else
        print("\n[INFO] Load cancelled")
        return false
    end
else
    print("\n❌ CANNOT LOAD EXPLOIT")
    print("  Issues found:")
    
    if not environmentOK then
        print("    • Roblox environment incomplete")
    end
    
    if not playerOK then
        print("    • No local player found")
    end
    
    if not isSupported then
        print("    • Executor not supported")
    end
    
    if not exploitCode then
        print("    • Exploit file not found")
    end
    
    print("\nREQUIREMENTS:")
    print("  1. Be in a Roblox game (not menu)")
    print("  2. Have UniversalExploit.lua in same folder")
    print("  3. Use supported executor (Synapse, KRNL, etc.)")
    print("  4. Have proper permissions")
    
    return false
end

print("\n========================================")
print("Loader finished at: " .. os.date("%H:%M:%S"))
print("========================================")

-- Retornar informações
return {
    Success = false,
    Executor = executorName,
    EnvironmentOK = environmentOK,
    PlayerOK = playerOK,
    ExploitFound = exploitCode ~= nil,
    Timestamp = os.time()
}