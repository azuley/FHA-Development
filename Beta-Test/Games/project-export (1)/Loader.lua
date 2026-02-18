-- Universal Exploit Loader
-- Easy loading script for the exploit

print("=========================================")
print("Universal Exploit Loader")
print("Version: 3.0.0")
print("=========================================")

-- Check environment
if not game then
    warn("❌ This script must be executed in Roblox!")
    return
end

-- Function to load exploit
local function loadExploit()
    print("\n🔧 Loading Universal Exploit...")
    
    -- Check if exploit already loaded
    if game:GetService("CoreGui"):FindFirstChild("UniversalExploitUI") then
        print("   ⚠️  Exploit already loaded!")
        print("   💡 Press RightControl to toggle UI")
        return true
    end
    
    -- Try to load from different sources
    local sources = {
        {"UniversalExploit.lua", "Local file"},
        {"https://raw.githubusercontent.com/MikaVirus/UniversalExploit/main/UniversalExploit.lua", "GitHub"},
        {"rbxassetid://0", "Roblox Asset (placeholder)"}
    }
    
    local exploitCode = nil
    local sourceName = ""
    
    for _, source in ipairs(sources) do
        local path, name = source[1], source[2]
        print("   🔍 Trying source: " .. name)
        
        if path == "UniversalExploit.lua" then
            -- Try local file
            if readfile and pcall(function()
                exploitCode = readfile("UniversalExploit.lua")
            end) then
                sourceName = name
                break
            end
        elseif path:find("http") then
            -- Try HTTP request
            if syn and syn.request then
                local response = syn.request({
                    Url = path,
                    Method = "GET"
                })
                
                if response.Success and response.Body then
                    exploitCode = response.Body
                    sourceName = name
                    break
                end
            end
        end
    end
    
    if not exploitCode then
        print("\n❌ Failed to load exploit code!")
        print("💡 Make sure UniversalExploit.lua is in the workspace")
        return false
    end
    
    print("   ✅ Source: " .. sourceName)
    print("   📏 Code size: " .. #exploitCode .. " characters")
    
    -- Execute the exploit
    print("\n⚡ Executing exploit...")
    local success, result = pcall(function()
        return loadstring(exploitCode)()
    end)
    
    if success then
        print("   ✅ Exploit loaded successfully!")
        print("   🎮 UI should appear on screen")
        print("   🔑 Press RightControl to toggle")
        
        -- Additional setup
        task.wait(1)
        print("\n✨ Exploit Features:")
        print("   • Fly System")
        print("   • Noclip Mode")
        print("   • ESP & Chams")
        print("   • Aimlock")
        print("   • Speed/Jump Modifiers")
        print("   • God Mode")
        print("   • Anti-AFK")
        print("   • Script Executor")
        print("   • Player Teleport")
        print("   • World Modifiers")
        
        return true
    else
        print("\n❌ Failed to execute exploit!")
        print("   Error: " .. tostring(result))
        return false
    end
end

-- Function to unload exploit
local function unloadExploit()
    print("\n🗑️  Unloading exploit...")
    
    local screenGui = game:GetService("CoreGui"):FindFirstChild("UniversalExploitUI")
    if screenGui then
        screenGui:Destroy()
        print("   ✅ Exploit unloaded successfully!")
        return true
    else
        print("   ⚠️  No exploit found to unload")
        return false
    end
end

-- Function to check exploit status
local function checkStatus()
    print("\n📊 Exploit Status:")
    
    local screenGui = game:GetService("CoreGui"):FindFirstChild("UniversalExploitUI")
    if screenGui then
        print("   ✅ Exploit is loaded")
        print("   🎮 UI: " .. (screenGui.MainContainer.Visible and "Visible" or "Hidden"))
        
        -- Count features
        local featureCount = 0
        local children = screenGui:GetDescendants()
        for _, child in ipairs(children) do
            if child:IsA("TextButton") and child.Name:find("Button") then
                featureCount = featureCount + 1
            end
        end
        
        print("   🔧 Features available: " .. featureCount)
        return true
    else
        print("   ❌ Exploit is not loaded")
        return false
    end
end

-- Main menu
local function showMenu()
    print("\n=========================================")
    print("📱 UNIVERSAL EXPLOIT LOADER MENU")
    print("=========================================")
    print("1️⃣  Load Exploit")
    print("2️⃣  Unload Exploit")
    print("3️⃣  Check Status")
    print("4️⃣  Run Test")
    print("5️⃣  Exit")
    print("=========================================")
    
    if rconsoleprint and rconsoleinput then
        -- Executor console support
        rconsoleprint("\nSelect option (1-5): ")
        local input = rconsoleinput()
        
        if input == "1" then
            loadExploit()
        elseif input == "2" then
            unloadExploit()
        elseif input == "3" then
            checkStatus()
        elseif input == "4" then
            -- Run test script
            if readfile and readfile("TestExploit.lua") then
                loadstring(readfile("TestExploit.lua"))()
            else
                print("TestExploit.lua not found!")
            end
        elseif input == "5" then
            print("Goodbye!")
            return
        else
            print("Invalid option!")
        end
        
        -- Return to menu
        task.wait(2)
        showMenu()
    else
        -- Auto-load if no console input
        print("\n⏳ Auto-loading exploit in 3 seconds...")
        for i = 3, 1, -1 do
            print("   " .. i .. "...")
            task.wait(1)
        end
        
        loadExploit()
        
        print("\n=========================================")
        print("💡 TIPS:")
        print("   • Press RightControl to toggle UI")
        print("   • Start with Home tab features")
        print("   • Use Scripts tab for custom scripts")
        print("   • Change themes in Settings tab")
        print("=========================================")
    end
end

-- Start the loader
showMenu()

-- Return loader functions for external use
return {
    Load = loadExploit,
    Unload = unloadExploit,
    Status = checkStatus,
    Version = "3.0.0",
    Author = "Mika"
}