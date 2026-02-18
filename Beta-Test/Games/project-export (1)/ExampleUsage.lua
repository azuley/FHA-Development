-- Universal Exploit - Example Usage
-- This file shows how to use the exploit features

print("=========================================")
print("Universal Exploit - Example Usage")
print("Version: 3.0.0")
print("=========================================")

-- First, load the exploit
print("\n1️⃣ LOADING THE EXPLOIT")
print("   ======================")

-- Method 1: Direct load
print("\nMethod 1: Direct Load")
print("   Copy the contents of UniversalExploit.lua")
print("   Paste into your executor")
print("   Execute")

-- Method 2: Using Loader
print("\nMethod 2: Using Loader")
print("   Execute Loader.lua")
print("   Follow on-screen instructions")
print("   Or wait for auto-load")

-- Method 3: Auto-execute
print("\nMethod 3: Auto-execute")
print("   Place UniversalExploit.lua in auto-execute folder")
print("   It loads automatically when executor starts")

-- Basic usage
print("\n\n2️⃣ BASIC USAGE")
print("   =============")
print("   Press RightControl to toggle UI")
print("   Use mouse to navigate tabs")
print("   Click buttons to toggle features")
print("   Use sliders to adjust values")

-- Feature examples
print("\n\n3️⃣ FEATURE EXAMPLES")
print("   =================")

-- Fly example
print("\n🕊️  FLY SYSTEM")
print([[   local Config = require(Config.lua)
   Config.Features.Fly.Enabled = true
   Config.Features.Fly.Speed = 50
   Config.Features.Fly.Height = 5
   
   -- Or use the UI:
   -- 1. Go to Home tab
   -- 2. Click "Fly" button
   -- 3. Adjust speed with slider
   -- 4. Press F to toggle]])

-- ESP example
print("\n👁️  ESP SYSTEM")
print([[   Config.Features.ESP.Enabled = true
   Config.Features.ESP.BoxColor = Color3.fromRGB(255, 0, 0)
   Config.Features.ESP.NameColor = Color3.fromRGB(255, 255, 255)
   Config.Features.ESP.MaxDistance = 500
   
   -- Or use the UI:
   -- 1. Go to Visual tab
   -- 2. Enable "ESP" toggle
   -- 3. Customize colors
   -- 4. Adjust distance]])

-- Script execution example
print("\n📜 SCRIPT EXECUTION")
print([[   -- Example script to print player names
   for _, player in pairs(game:GetService("Players"):GetPlayers()) do
       print("Player:", player.Name)
   end
   
   -- Using the built-in executor:
   -- 1. Go to Scripts tab
   -- 2. Paste your script
   -- 3. Click "Execute"
   -- 4. View output in console]])

-- Advanced usage
print("\n\n4️⃣ ADVANCED USAGE")
print("   ================")

-- Custom themes
print("\n🎨 CUSTOM THEMES")
print([[   -- Change theme programmatically
   Config:ApplyTheme("Neon")
   
   -- Or create custom theme
   Config.Themes["Custom"] = {
       AccentColor = Color3.fromRGB(255, 100, 100),
       BackgroundColor = Color3.fromRGB(20, 10, 10),
       SecondaryColor = Color3.fromRGB(40, 20, 20)
   }
   Config:ApplyTheme("Custom")]])

-- Custom keybinds
print("\n⌨️  CUSTOM KEYBINDS")
print([[   -- Change keybinds
   Config.Keybinds.ToggleUI = Enum.KeyCode.Insert
   Config.Keybinds.FlyToggle = Enum.KeyCode.G
   Config.Keybinds.NoclipToggle = Enum.KeyCode.H
   
   -- Save settings
   Config:SaveToFile()]])

-- Script library
print("\n📚 SCRIPT LIBRARY")
print([[   -- Pre-made scripts included:
   -- 1. Infinite Yield
   -- 2. Dex Explorer
   -- 3. Simple Spy
   -- 4. Remote Spy
   -- 5. Chat Logger
   -- 6. Speed Hack
   -- 7. Jump Hack
   -- 8. Noclip Script
   
   -- Access via Scripts tab → Library]])

-- Integration with other scripts
print("\n\n5️⃣ INTEGRATION")
print("   =============")

-- Loading exploit from another script
print("\n📦 LOADING FROM ANOTHER SCRIPT")
print([[   -- Method 1: Using loadstring
   local exploitCode = readfile("UniversalExploit.lua")
   local exploit = loadstring(exploitCode)()
   
   -- Method 2: Using Loader functions
   local Loader = loadstring(readfile("Loader.lua"))()
   Loader.Load()
   
   -- Method 3: Direct require (if in same environment)
   -- local Exploit = require(game:GetService("ReplicatedStorage").UniversalExploit)]])

-- Extending functionality
print("\n🔧 EXTENDING FUNCTIONALITY")
print([[   -- Add custom feature
   local function CustomFeature()
       print("Custom feature activated!")
       -- Your code here
   end
   
   -- Hook into exploit
   game:GetService("RunService").Heartbeat:Connect(function()
       if Config.Features.Fly.Enabled then
           -- Custom fly logic
       end
   end)]])

-- Troubleshooting
print("\n\n6️⃣ TROUBLESHOOTING")
print("   ================")

print("\n❌ UI NOT SHOWING")
print("   1. Check if executor supports UI")
print("   2. Press RightControl")
print("   3. Check CoreGui for UniversalExploitUI")
print("   4. Try re-executing")

print("\n❌ FEATURES NOT WORKING")
print("   1. Check game compatibility")
print("   2. Verify executor permissions")
print("   3. Check for anti-cheat")
print("   4. Try different executor")

print("\n❌ ERRORS OR CRASHES")
print("   1. Check console for errors")
print("   2. Disable other scripts")
print("   3. Clear executor cache")
print("   4. Update executor")

-- Performance tips
print("\n\n7️⃣ PERFORMANCE TIPS")
print("   ==================")

print("\n💡 OPTIMIZATION")
print("   • Disable unused features")
print("   • Lower ESP distance")
print("   • Reduce update rate")
print("   • Close other programs")

print("\n💡 MEMORY MANAGEMENT")
print("   • Restart Roblox periodically")
print("   • Clear executor memory")
print("   • Use lighter themes")
print("   • Disable animations")

-- Best practices
print("\n\n8️⃣ BEST PRACTICES")
print("   =================")

print("\n🔒 SAFETY")
print("   • Use on alt accounts")
print("   • Don't be obvious")
print("   • Avoid competitive games")
print("   • Monitor for warnings")

print("\n🎮 GAMEPLAY")
print("   • Use features sparingly")
print("   • Respect other players")
print("   • Don't ruin the game")
print("   • Have fun responsibly")

-- Final notes
print("\n\n=========================================")
print("🎉 EXAMPLES COMPLETE")
print("=========================================")
print("\n💡 Quick Start:")
print("   1. Execute Loader.lua")
print("   2. Press RightControl")
print("   3. Explore features")
print("   4. Customize settings")
print("\n📚 Documentation:")
print("   • README.md - Basic info")
print("   • SUMMARY.md - Feature list")
print("   • VERIFICATION.md - Safety info")
print("\n🆘 Support:")
print("   • Check troubleshooting section")
print("   • Review documentation")
print("   • Ask community")
print("=========================================")

-- Return success
return true