-- Lua Hub V4 by Lua Hotel
-- Advanced Multi-Game Script Hub - FINAL UPDATE

-- Load Rayfield Library FIRST
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Get user info
local userName = game.Players.LocalPlayer.Name
local userKey = "nomorekey"

-- Executor Detection
local function getExecutor()
    local executors = {
        ["Xeno"] = identifyexecutor and identifyexecutor():lower():find("xeno"),
        ["Solara"] = identifyexecutor and identifyexecutor():lower():find("solara"),
        ["Volcano"] = identifyexecutor and identifyexecutor():lower():find("volcano"),
        ["Delta"] = identifyexecutor and identifyexecutor():lower():find("delta"),
        ["Synapse X"] = syn and true,
        ["Script-Ware"] = SCRIPT_WARE_LOADED and true,
        ["KRNL"] = KRNL_LOADED and true,
        ["Fluxus"] = fluxus and true,
        ["Arceus X"] = arceus and true
    }
    
    for name, detected in pairs(executors) do
        if detected then
            return name
        end
    end
    
    if identifyexecutor then
        return identifyexecutor()
    end
    
    return "Unknown Executor"
end

local currentExecutor = getExecutor()

-- Create Main Window with Key System
local Window = Rayfield:CreateWindow({
    Name = "Lua Hub V4 | " .. currentExecutor,
    LoadingTitle = "Lua Hub V4 Loading...",
    LoadingSubtitle = "by Lua Hotel - FINAL UPDATE",
    Theme = "Serenity",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "LuaHubV4",
        FileName = "LuaHubV4Config"
    },
    Discord = {
        Enabled = true,
        Invite = "aPFGJRWAQR",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Lua Hub V4 | Key System",
        Subtitle = "Use the key: nomorekey",
        Note = "Key: nomorekey",
        FileName = "LuaHubV4Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"nomorekey"}
    }
})

-- Show Introduction Notification
Rayfield:Notify({
    Title = "Lua Hub V4 - FINAL UPDATE",
    Content = "25+ Premium Features! Welcome " .. userName,
    Duration = 5,
    Image = 4483362458,
    Actions = {
        Ignore = {
            Name = "Let's Go!",
            Callback = function()
                print("User acknowledged introduction")
            end
        },
    },
})

-- Executor Warning for Xeno/Solara
if currentExecutor:lower():find("xeno") or currentExecutor:lower():find("solara") then
    Rayfield:Notify({
        Title = "Executor Warning",
        Content = "Some scripts may not work properly on " .. currentExecutor,
        Duration = 6,
        Image = 4483362458,
    })
end

-- Variables for custom scripts
local flyEnabled = false
local vflyEnabled = false
local betterBypass = false
local noclipEnabled = false
local followEnabled = false
local espEnabled = false
local autoFarmEnabled = false
local antiAfkEnabled = false
local aimbotEnabled = false
local aimbotTarget = nil
local aimbotHighlight = nil
local targetPlayer = ""
local flySpeed = 50
local vflySpeed = 100
local walkSpeed = 16
local jumpPower = 50
local followDistance = 3
local followType = "Behind"
local fovValue = 70
local flyHeight = 0
local flyBobbing = 0
local flyConnection
local vflyConnection
local flyBodyVelocity
local flyBodyGyro

-- ============================================
-- HOME TAB
-- ============================================
local HomeTab = Window:CreateTab("Home", "home")
local HomeSection = HomeTab:CreateSection("User Information")

HomeTab:CreateParagraph({
    Title = "Welcome to Lua Hub V4!",
    Content = "The FINAL UPDATE with 25+ premium features! This is the last major feature update. Future updates will focus on new game scripts."
})

HomeTab:CreateLabel("Username: " .. userName)
HomeTab:CreateLabel("User ID: " .. game.Players.LocalPlayer.UserId)
HomeTab:CreateLabel("Executor: " .. currentExecutor)
HomeTab:CreateLabel("Your Key: " .. userKey)

local LinksSection = HomeTab:CreateSection("Important Links")

HomeTab:CreateButton({
    Name = "Join Discord Server",
    Callback = function()
        Rayfield:Notify({
            Title = "Discord",
            Content = "Opening Discord invite...",
            Duration = 2,
        })
        setclipboard("https://discord.gg/TQtNedMsVV")
        Rayfield:Notify({
            Title = "Copied!",
            Content = "Discord link copied to clipboard!",
            Duration = 3,
        })
    end,
})

HomeTab:CreateButton({
    Name = "Get New Key",
    Callback = function()
        setclipboard("https://luahotel.vercel.app")
        Rayfield:Notify({
            Title = "Website",
            Content = "Link copied! Visit: luahotel.vercel.app",
            Duration = 3,
        })
    end,
})

-- ============================================
-- GENERAL TAB
-- ============================================
local GeneralTab = Window:CreateTab("General", "home")
local GeneralSection = GeneralTab:CreateSection("Universal Scripts")

GeneralTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Script",
            Content = "Loading Infinite Yield...",
            Duration = 3,
        })
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end,
})

GeneralTab:CreateButton({
    Name = "Dex Explorer",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Script",
            Content = "Loading Dex Explorer...",
            Duration = 3,
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BigBoyTimme/New.Loadstring.Scripts/refs/heads/main/Dex.Explorer"))()
    end,
})

GeneralTab:CreateButton({
    Name = "AquaMatrix",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Script",
            Content = "Loading AquaMatrix...",
            Duration = 3,
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploitFin/AquaMatrix/refs/heads/AquaMatrix/AquaMatrix"))()
    end,
})

-- ============================================
-- JJS TAB
-- ============================================
local JJSTab = Window:CreateTab("JJS", "sword")
local JJSSection = JJSTab:CreateSection("Jujutsu Shenanigans Scripts")

JJSTab:CreateButton({
    Name = "Jujutsuer",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Script",
            Content = "Loading Jujutsuer...",
            Duration = 3,
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sigmaboijjk123/jjs/refs/heads/main/Jujutsuer.lua"))()
    end,
})

JJSTab:CreateButton({
    Name = "Spotlight",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Script",
            Content = "Loading Spotlight...",
            Duration = 3,
        })
        loadstring(game:HttpGet('https://raw.githubusercontent.com/NotEnoughJack/localplayerscripts1/refs/heads/main/script'))()
    end,
})

JJSTab:CreateButton({
    Name = "Autobuilder",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Script",
            Content = "Loading Autobuilder...",
            Duration = 3,
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PhNSecret/JJSAutobuilder/refs/heads/main/luau.lua"))()
    end,
})

-- ============================================
-- TSB TAB
-- ============================================
local TSBTab = Window:CreateTab("TSB", "zap")
local TSBSection = TSBTab:CreateSection("The Strongest Battlegrounds Scripts")

TSBTab:CreateButton({
    Name = "SORGUI",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Script",
            Content = "Loading SORGUI...",
            Duration = 3,
        })
        loadstring(game:HttpGet("https://pastebin.com/raw/U3scYPvW"))()
    end,
})

-- ============================================
-- BLOX FRUITS TAB
-- ============================================
local BloxFruitsTab = Window:CreateTab("Blox Fruits", "apple")
local BloxFruitsSection = BloxFruitsTab:CreateSection("Blox Fruits Scripts")

BloxFruitsTab:CreateButton({
    Name = "BT Project",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Script",
            Content = "Loading BT Project...",
            Duration = 3,
        })
        loadstring(game:HttpGet('https://raw.githubusercontent.com/OxyCoder32/prueba-script/refs/heads/main/BTProject'))()
    end,
})

-- ============================================
-- PIANO TAB
-- ============================================
local PianoTab = Window:CreateTab("Piano", "music")
local PianoSection = PianoTab:CreateSection("Virtual Piano Scripts")

PianoTab:CreateButton({
    Name = "Talentless",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Script",
            Content = "Loading Talentless...",
            Duration = 3,
        })
        pcall(function()
            loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/hellohellohell012321/TALENTLESS@main/TALENTLESS", true))()
        end)
    end,
})

-- ============================================
-- LUA HUB TAB (Custom Scripts)
-- ============================================
local LuaHubTab = Window:CreateTab("Lua Hub", "star")
local LuaHubSection = LuaHubTab:CreateSection("Premium Lua Hub Features")

-- Advanced Fly Bypass with Teleport System
LuaHubTab:CreateToggle({
    Name = "Fly Bypass (Advanced)",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(Value)
        flyEnabled = Value
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        if flyEnabled then
            Rayfield:Notify({
                Title = "Fly Enabled",
                Content = "Use WASD + Camera to fly smoothly",
                Duration = 3,
            })
            
            flyBodyVelocity = Instance.new("BodyVelocity")
            flyBodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
            flyBodyVelocity.Parent = humanoidRootPart
            
            flyBodyGyro = Instance.new("BodyGyro")
            flyBodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            flyBodyGyro.P = 9e4
            flyBodyGyro.Parent = humanoidRootPart
            
            flyHeight = humanoidRootPart.Position.Y
            
            flyConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
                if not flyEnabled then return end
                
                local camera = workspace.CurrentCamera
                local moveDirection = Vector3.new(0, 0, 0)
                local currentSpeed = flySpeed
                
                if betterBypass then
                    currentSpeed = math.min(flySpeed, 80)
                    if humanoidRootPart.Position.Y > flyHeight + 150 then
                        flyHeight = humanoidRootPart.Position.Y - 150
                    end
                end
                
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                    moveDirection = moveDirection + camera.CFrame.LookVector
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                    moveDirection = moveDirection - camera.CFrame.LookVector
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                    moveDirection = moveDirection - camera.CFrame.RightVector
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                    moveDirection = moveDirection + camera.CFrame.RightVector
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                    if not betterBypass or humanoidRootPart.Position.Y < flyHeight + 150 then
                        moveDirection = moveDirection + Vector3.new(0, 1, 0)
                    end
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                    moveDirection = moveDirection - Vector3.new(0, 1, 0)
                end
                
                flyBobbing = flyBobbing + delta * 3
                local bobbingOffset = math.sin(flyBobbing) * 0.5
                
                if moveDirection.Magnitude > 0 then
                    local targetVelocity = moveDirection.Unit * currentSpeed
                    flyBodyVelocity.Velocity = targetVelocity + Vector3.new(0, bobbingOffset, 0)
                else
                    flyBodyVelocity.Velocity = Vector3.new(0, bobbingOffset * 2, 0)
                end
                
                flyBodyGyro.CFrame = camera.CFrame
                
                if moveDirection.Magnitude > 0 then
                    local newPos = humanoidRootPart.Position + (moveDirection.Unit * currentSpeed * delta)
                    humanoidRootPart.CFrame = CFrame.new(newPos)
                end
            end)
        else
            Rayfield:Notify({
                Title = "Fly Disabled",
                Content = "Fly mode deactivated",
                Duration = 2,
            })
            
            if flyConnection then
                flyConnection:Disconnect()
            end
            
            if flyBodyVelocity then flyBodyVelocity:Destroy() end
            if flyBodyGyro then flyBodyGyro:Destroy() end
        end
    end,
})

LuaHubTab:CreateToggle({
    Name = "Better Bypass (BUGGY)",
    CurrentValue = false,
    Flag = "BetterBypass",
    Callback = function(Value)
        betterBypass = Value
        if Value then
            Rayfield:Notify({
                Title = "Better Bypass ON",
                Content = "Height & Speed limited for better detection bypass",
                Duration = 3,
            })
        else
            Rayfield:Notify({
                Title = "Better Bypass OFF",
                Content = "Full speed & height restored",
                Duration = 2,
            })
        end
    end,
})

LuaHubTab:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 500},
    Increment = 5,
    Suffix = " Speed",
    CurrentValue = 50,
    Flag = "FlySpeed",
    Callback = function(Value)
        flySpeed = Value
    end,
})

-- Fly Keybind
LuaHubTab:CreateKeybind({
    Name = "Fly Keybind",
    CurrentKeybind = "",
    HoldToInteract = false,
    Flag = "FlyKeybind",
    Callback = function(Keybind)
        flyEnabled = not flyEnabled
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        if flyEnabled then
            Rayfield:Notify({
                Title = "Fly Enabled",
                Content = "Use WASD + Camera to fly smoothly",
                Duration = 3,
            })
            
            flyBodyVelocity = Instance.new("BodyVelocity")
            flyBodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
            flyBodyVelocity.Parent = humanoidRootPart
            
            flyBodyGyro = Instance.new("BodyGyro")
            flyBodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            flyBodyGyro.P = 9e4
            flyBodyGyro.Parent = humanoidRootPart
            
            flyHeight = humanoidRootPart.Position.Y
            
            flyConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
                if not flyEnabled then return end
                
                local camera = workspace.CurrentCamera
                local moveDirection = Vector3.new(0, 0, 0)
                local currentSpeed = flySpeed
                
                if betterBypass then
                    currentSpeed = math.min(flySpeed, 80)
                    if humanoidRootPart.Position.Y > flyHeight + 150 then
                        flyHeight = humanoidRootPart.Position.Y - 150
                    end
                end
                
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                    moveDirection = moveDirection + camera.CFrame.LookVector
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                    moveDirection = moveDirection - camera.CFrame.LookVector
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                    moveDirection = moveDirection - camera.CFrame.RightVector
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                    moveDirection = moveDirection + camera.CFrame.RightVector
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                    if not betterBypass or humanoidRootPart.Position.Y < flyHeight + 150 then
                        moveDirection = moveDirection + Vector3.new(0, 1, 0)
                    end
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                    moveDirection = moveDirection - Vector3.new(0, 1, 0)
                end
                
                flyBobbing = flyBobbing + delta * 3
                local bobbingOffset = math.sin(flyBobbing) * 0.5
                
                if moveDirection.Magnitude > 0 then
                    local targetVelocity = moveDirection.Unit * currentSpeed
                    flyBodyVelocity.Velocity = targetVelocity + Vector3.new(0, bobbingOffset, 0)
                else
                    flyBodyVelocity.Velocity = Vector3.new(0, bobbingOffset * 2, 0)
                end
                
                flyBodyGyro.CFrame = camera.CFrame
                
                if moveDirection.Magnitude > 0 then
                    local newPos = humanoidRootPart.Position + (moveDirection.Unit * currentSpeed * delta)
                    humanoidRootPart.CFrame = CFrame.new(newPos)
                end
            end)
        else
            Rayfield:Notify({
                Title = "Fly Disabled",
                Content = "Fly mode deactivated",
                Duration = 2,
            })
            
            if flyConnection then
                flyConnection:Disconnect()
            end
            
            if flyBodyVelocity then flyBodyVelocity:Destroy() end
            if flyBodyGyro then flyBodyGyro:Destroy() end
        end
    end,
})

-- Vehicle Fly (VFly)
local VehicleSection = LuaHubTab:CreateSection("Lua Hub Simple")

LuaHubTab:CreateToggle({
    Name = "Vehicle Fly (VFly)",
    CurrentValue = false,
    Flag = "VFlyToggle",
    Callback = function(Value)
        vflyEnabled = Value
        
        if vflyEnabled then
            Rayfield:Notify({
                Title = "VFly Enabled",
                Content = "Fly with your vehicle using WASD!",
                Duration = 3,
            })
            
            vflyConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not vflyEnabled then return end
                
                local player = game.Players.LocalPlayer
                local character = player.Character
                if not character then return end
                
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if not humanoid or not humanoid.SeatPart then return end
                
                local vehicle = humanoid.SeatPart.Parent
                local vehiclePart = vehicle:FindFirstChild("VehicleSeat") or humanoid.SeatPart
                
                if vehiclePart then
                    local camera = workspace.CurrentCamera
                    local moveDirection = Vector3.new(0, 0, 0)
                    
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                        moveDirection = moveDirection + camera.CFrame.LookVector
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                        moveDirection = moveDirection - camera.CFrame.LookVector
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                        moveDirection = moveDirection - camera.CFrame.RightVector
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                        moveDirection = moveDirection + camera.CFrame.RightVector
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                        moveDirection = moveDirection + Vector3.new(0, 1, 0)
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                        moveDirection = moveDirection - Vector3.new(0, 1, 0)
                    end
                    
                    if moveDirection.Magnitude > 0 then
                        vehiclePart.CFrame = vehiclePart.CFrame + (moveDirection.Unit * vflySpeed * 0.016)
                    end
                end
            end)
        else
            Rayfield:Notify({
                Title = "VFly Disabled",
                Content = "Vehicle fly deactivated",
                Duration = 2,
            })
            
            if vflyConnection then
                vflyConnection:Disconnect()
            end
        end
    end,
})

LuaHubTab:CreateSlider({
    Name = "VFly Speed",
    Range = {10, 500},
    Increment = 10,
    Suffix = " Speed",
    CurrentValue = 100,
    Flag = "VFlySpeed",
    Callback = function(Value)
        vflySpeed = Value
    end,
})

-- WalkSpeed
LuaHubTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 500},
    Increment = 1,
    Suffix = " Speed",
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(Value)
        walkSpeed = Value
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = Value
            end
        end
    end,
})

-- Jump Power
LuaHubTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 500},
    Increment = 10,
    Suffix = " Power",
    CurrentValue = 50,
    Flag = "JumpPower",
    Callback = function(Value)
        jumpPower = Value
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = Value
                Rayfield:Notify({
                    Title = "Jump Power Changed",
                    Content = "Jump power set to " .. Value,
                    Duration = 2,
                })
            end
        end
    end,
})

-- NoClip with Advanced Bypass
local noclipConnection
local bypassParts = {}

LuaHubTab:CreateToggle({
    Name = "NoClip (Advanced Bypass)",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        noclipEnabled = Value
        
        if noclipEnabled then
            Rayfield:Notify({
                Title = "NoClip Enabled",
                Content = "Walk through walls with advanced bypass!",
                Duration = 2,
            })
            
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    bypassParts[part] = part.CanCollide
                end
            end
            
            noclipConnection = game:GetService("RunService").Stepped:Connect(function()
                if not noclipEnabled then return end
                local char = game.Players.LocalPlayer.Character
                if char then
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                            if part:IsA("BasePart") and part.Name == "HumanoidRootPart" then
                                part.Velocity = Vector3.new(0, 0, 0)
                                part.RotVelocity = Vector3.new(0, 0, 0)
                            end
                        end
                    end
                    
                    local humanoid = char:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:ChangeState(11)
                    end
                end
            end)
        else
            Rayfield:Notify({
                Title = "NoClip Disabled",
                Content = "NoClip deactivated",
                Duration = 2,
            })
            
            if noclipConnection then
                noclipConnection:Disconnect()
            end
            
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character then
                for part, canCollide in pairs(bypassParts) do
                    if part and part.Parent then
                        part.CanCollide = canCollide
                    end
                end
                bypassParts = {}
            end
        end
    end,
})

-- FOV Changer
LuaHubTab:CreateSlider({
    Name = "FOV Changer",
    Range = {70, 120},
    Increment = 1,
    Suffix = " FOV",
    CurrentValue = 70,
    Flag = "FOV",
    Callback = function(Value)
        fovValue = Value
        workspace.CurrentCamera.FieldOfView = Value
    end,
})

-- ESP Players
local espConnections = {}
LuaHubTab:CreateToggle({
    Name = "Player ESP",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        espEnabled = Value
        
        if espEnabled then
            Rayfield:Notify({
                Title = "ESP Enabled",
                Content = "Players now visible through walls",
                Duration = 2,
            })
            
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    local function addESP(char)
                        if not char then return end
                        
                        local highlight = Instance.new("Highlight")
                        highlight.Adornee = char
                        highlight.FillColor = Color3.fromRGB(30, 100, 255)
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.FillTransparency = 0.5
                        highlight.OutlineTransparency = 0
                        highlight.Parent = char
                        
                        table.insert(espConnections, highlight)
                    end
                    
                    if player.Character then
                        addESP(player.Character)
                    end
                    
                    player.CharacterAdded:Connect(function(char)
                        if espEnabled then
                            addESP(char)
                        end
                    end)
                end
            end
        else
            Rayfield:Notify({
                Title = "ESP Disabled",
                Content = "ESP deactivated",
                Duration = 2,
            })
            
            for _, highlight in pairs(espConnections) do
                if highlight then
                    highlight:Destroy()
                end
            end
            espConnections = {}
        end
    end,
})

-- Anti-AFK
LuaHubTab:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Flag = "AntiAFK",
    Callback = function(Value)
        antiAfkEnabled = Value
        
        if antiAfkEnabled then
            Rayfield:Notify({
                Title = "Anti-AFK Enabled",
                Content = "You won't be kicked for inactivity",
                Duration = 2,
            })
            
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                if antiAfkEnabled then
                    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                    wait(1)
                    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                end
            end)
        else
            Rayfield:Notify({
                Title = "Anti-AFK Disabled",
                Content = "Anti-AFK deactivated",
                Duration = 2,
            })
        end
    end,
})

-- Infinite Jump
local infiniteJumpEnabled = false
local infJumpConnection

LuaHubTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfJump",
    Callback = function(Value)
        infiniteJumpEnabled = Value
        
        if infiniteJumpEnabled then
            Rayfield:Notify({
                Title = "Infinite Jump ON",
                Content = "Jump as many times as you want!",
                Duration = 2,
            })
            
            infJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
                if infiniteJumpEnabled then
                    local character = game.Players.LocalPlayer.Character
                    if character then
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    end
                end
            end)
        else
            Rayfield:Notify({
                Title = "Infinite Jump OFF",
                Content = "Infinite Jump deactivated",
                Duration = 2,
            })
            
            if infJumpConnection then
                infJumpConnection:Disconnect()
            end
        end
    end,
})

-- Sky TP
LuaHubTab:CreateButton({
    Name = "Sky TP (Teleport to Sky)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        local currentPos = humanoidRootPart.CFrame
        humanoidRootPart.CFrame = currentPos + Vector3.new(0, 500, 0)
        
        Rayfield:Notify({
            Title = "Sky TP",
            Content = "Teleported 500 studs up!",
            Duration = 2,
        })
    end,
})

-- FullBright
local fullBrightEnabled = false
LuaHubTab:CreateToggle({
    Name = "FullBright",
    CurrentValue = false,
    Flag = "FullBright",
    Callback = function(Value)
        fullBrightEnabled = Value
        
        if fullBrightEnabled then
            Rayfield:Notify({
                Title = "FullBright ON",
                Content = "Maximum brightness enabled",
                Duration = 2,
            })
            
            game:GetService("Lighting").Brightness = 2
            game:GetService("Lighting").ClockTime = 14
            game:GetService("Lighting").FogEnd = 100000
            game:GetService("Lighting").GlobalShadows = false
            game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        else
            Rayfield:Notify({
                Title = "FullBright OFF",
                Content = "Lighting restored to normal",
                Duration = 2,
            })
            
            game:GetService("Lighting").Brightness = 1
            game:GetService("Lighting").ClockTime = 12
            game:GetService("Lighting").FogEnd = 100000
            game:GetService("Lighting").GlobalShadows = true
        end
    end,
})

-- Remove Textures (FPS Boost)
LuaHubTab:CreateButton({
    Name = "Remove Textures (FPS Boost)",
    Callback = function()
        Rayfield:Notify({
            Title = "Removing Textures",
            Content = "This may improve FPS significantly",
            Duration = 3,
        })
        
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Decal") or obj:IsA("Texture") then
                obj:Destroy()
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                obj.Enabled = false
            elseif obj:IsA("MeshPart") then
                obj.TextureID = ""
            end
        end
        
        Rayfield:Notify({
            Title = "Textures Removed",
            Content = "FPS should be improved now!",
            Duration = 2,
        })
    end,
})

-- PVP Section
local PVPSection = LuaHubTab:CreateSection("PVP Features")

-- Aimbot
local aimbotConnection
local mouse = game.Players.LocalPlayer:GetMouse()

LuaHubTab:CreateKeybind({
    Name = "Aimbot (Right Click to Target)",
    CurrentKeybind = "V",
    HoldToInteract = false,
    Flag = "AimbotKeybind",
    Callback = function(Keybind)
        aimbotEnabled = not aimbotEnabled
        
        if aimbotEnabled then
            Rayfield:Notify({
                Title = "Aimbot Enabled",
                Content = "Right click on a player to lock on!",
                Duration = 3,
            })
            
            mouse.Button2Down:Connect(function()
                if not aimbotEnabled then return end
                
                local target = mouse.Target
                if target and target.Parent then
                    local humanoid = target.Parent:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        aimbotTarget = target.Parent
                        
                        -- Remove old highlight
                        if aimbotHighlight then
                            aimbotHighlight:Destroy()
                        end
                        
                        -- Create green highlight for locked target
                        aimbotHighlight = Instance.new("Highlight")
                        aimbotHighlight.Adornee = aimbotTarget
                        aimbotHighlight.FillColor = Color3.fromRGB(0, 255, 0)
                        aimbotHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        aimbotHighlight.FillTransparency = 0.5
                        aimbotHighlight.OutlineTransparency = 0
                        aimbotHighlight.Parent = aimbotTarget
                        
                        Rayfield:Notify({
                            Title = "Target Locked",
                            Content = "Locked onto: " .. aimbotTarget.Name,
                            Duration = 2,
                        })
                    end
                end
            end)
            
            aimbotConnection = game:GetService("RunService").RenderStepped:Connect(function()
                if not aimbotEnabled or not aimbotTarget then return end
                
                local player = game.Players.LocalPlayer
                local character = player.Character
                if not character then return end
                
                local targetHrp = aimbotTarget:FindFirstChild("HumanoidRootPart")
                local hrp = character:FindFirstChild("HumanoidRootPart")
                
                if targetHrp and hrp then
                    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, targetHrp.Position)
                    hrp.CFrame = CFrame.new(hrp.Position, Vector3.new(targetHrp.Position.X, hrp.Position.Y, targetHrp.Position.Z))
                else
                    -- Target lost, remove highlight
                    if aimbotHighlight then
                        aimbotHighlight:Destroy()
                        aimbotHighlight = nil
                    end
                    aimbotTarget = nil
                end
            end)
        else
            Rayfield:Notify({
                Title = "Aimbot Disabled",
                Content = "Aimbot deactivated",
                Duration = 2,
            })
            
            if aimbotConnection then
                aimbotConnection:Disconnect()
            end
            if aimbotHighlight then
                aimbotHighlight:Destroy()
                aimbotHighlight = nil
            end
            aimbotTarget = nil
        end
    end,
})

-- Auto Farm
local autoFarmConnection

LuaHubTab:CreateToggle({
    Name = "Auto Farm (Battleground Games)",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(Value)
        autoFarmEnabled = Value
        
        if autoFarmEnabled then
            Rayfield:Notify({
                Title = "Auto Farm ON",
                Content = "Farming nearest player!",
                Duration = 3,
            })
            
            autoFarmConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not autoFarmEnabled then return end
                
                local player = game.Players.LocalPlayer
                local character = player.Character
                if not character then return end
                
                local hrp = character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                
                local nearestPlayer = nil
                local nearestDistance = math.huge
                
                for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                    if otherPlayer ~= player and otherPlayer.Character then
                        local otherHrp = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if otherHrp then
                            local distance = (hrp.Position - otherHrp.Position).Magnitude
                            if distance < nearestDistance then
                                nearestDistance = distance
                                nearestPlayer = otherPlayer
                            end
                        end
                    end
                end
                
                if nearestPlayer and nearestPlayer.Character then
                    local targetHrp = nearestPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if targetHrp then
                        local targetPos = targetHrp.Position
                        local distance = (hrp.Position - targetPos).Magnitude
                        
                        if distance > 6 then
                            local direction = (targetPos - hrp.Position).Unit
                            hrp.CFrame = hrp.CFrame + (direction * 0.5)
                        end
                        
                        if distance > 4 and distance < 6 then
                            mouse1press()
                            wait(0.1)
                            mouse1release()
                            
                            for i = 1, 4 do
                                local key = Enum.KeyCode["Key" .. i]
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, game)
                                wait(0.1)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, key, false, game)
                                wait(0.3)
                            end
                        end
                    end
                end
            end)
        else
            Rayfield:Notify({
                Title = "Auto Farm OFF",
                Content = "Auto farm deactivated",
                Duration = 2,
            })
            
            if autoFarmConnection then
                autoFarmConnection:Disconnect()
            end
        end
    end,
})

-- Kill Aura
local killAuraEnabled = false
local killAuraConnection
local killAuraRange = 15

LuaHubTab:CreateSlider({
    Name = "Kill Aura Range",
    Range = {5, 30},
    Increment = 1,
    Suffix = " studs",
    CurrentValue = 15,
    Flag = "KillAuraRange",
    Callback = function(Value)
        killAuraRange = Value
    end,
})

LuaHubTab:CreateToggle({
    Name = "Kill Aura",
    CurrentValue = false,
    Flag = "KillAura",
    Callback = function(Value)
        killAuraEnabled = Value
        
        if killAuraEnabled then
            Rayfield:Notify({
                Title = "Kill Aura ON",
                Content = "Attacking all nearby players!",
                Duration = 2,
            })
            
            killAuraConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not killAuraEnabled then return end
                
                local player = game.Players.LocalPlayer
                local character = player.Character
                if not character then return end
                
                local hrp = character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                
                for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                    if otherPlayer ~= player and otherPlayer.Character then
                        local otherHrp = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if otherHrp then
                            local distance = (hrp.Position - otherHrp.Position).Magnitude
                            if distance <= killAuraRange then
                                mouse1press()
                                wait(0.05)
                                mouse1release()
                            end
                        end
                    end
                end
            end)
        else
            Rayfield:Notify({
                Title = "Kill Aura OFF",
                Content = "Kill aura deactivated",
                Duration = 2,
            })
            
            if killAuraConnection then
                killAuraConnection:Disconnect()
            end
        end
    end,
})

-- Hitbox Expander
local hitboxSize = 10
local hitboxEnabled = false
local hitboxConnection

LuaHubTab:CreateSlider({
    Name = "Hitbox Size",
    Range = {5, 50},
    Increment = 1,
    Suffix = " studs",
    CurrentValue = 10,
    Flag = "HitboxSize",
    Callback = function(Value)
        hitboxSize = Value
    end,
})

LuaHubTab:CreateToggle({
    Name = "Hitbox Expander",
    CurrentValue = false,
    Flag = "HitboxExpander",
    Callback = function(Value)
        hitboxEnabled = Value
        
        if hitboxEnabled then
            Rayfield:Notify({
                Title = "Hitbox Expander ON",
                Content = "Player hitboxes expanded to " .. hitboxSize .. " studs",
                Duration = 2,
            })
            
            hitboxConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not hitboxEnabled then return end
                
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player ~= game.Players.LocalPlayer and player.Character then
                        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                            hrp.Transparency = 0.8
                            hrp.CanCollide = false
                        end
                    end
                end
            end)
        else
            Rayfield:Notify({
                Title = "Hitbox Expander OFF",
                Content = "Hitboxes restored to normal",
                Duration = 2,
            })
            
            if hitboxConnection then
                hitboxConnection:Disconnect()
            end
            
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character then
                    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Size = Vector3.new(2, 2, 1)
                        hrp.Transparency = 1
                    end
                end
            end
        end
    end,
})

-- TP to Player
local tpPlayerName = ""

LuaHubTab:CreateInput({
    Name = "TP to Player Name",
    PlaceholderText = "Enter username...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        tpPlayerName = Text
    end,
})

LuaHubTab:CreateButton({
    Name = "Teleport to Player",
    Callback = function()
        if tpPlayerName == "" then
            Rayfield:Notify({
                Title = "Error",
                Content = "Please enter a player name!",
                Duration = 2,
            })
            return
        end
        
        local target = game.Players:FindFirstChild(tpPlayerName)
        if not target then
            Rayfield:Notify({
                Title = "Error",
                Content = "Player '" .. tpPlayerName .. "' not found!",
                Duration = 2,
            })
            return
        end
        
        local targetChar = target.Character
        local playerChar = game.Players.LocalPlayer.Character
        
        if targetChar and playerChar then
            local targetHrp = targetChar:FindFirstChild("HumanoidRootPart")
            local hrp = playerChar:FindFirstChild("HumanoidRootPart")
            
            if targetHrp and hrp then
                hrp.CFrame = targetHrp.CFrame * CFrame.new(0, 0, 3)
                Rayfield:Notify({
                    Title = "Teleported!",
                    Content = "Teleported to " .. tpPlayerName,
                    Duration = 2,
                })
            end
        end
    end,
})

-- Click TP
local clickTpEnabled = false
local clickConnection
local isMobile = game:GetService("UserInputService").TouchEnabled

LuaHubTab:CreateToggle({
    Name = isMobile and "Click/Tap TP" or "Click TP (Hold Ctrl + Click)",
    CurrentValue = false,
    Flag = "ClickTP",
    Callback = function(Value)
        clickTpEnabled = Value
        
        if clickTpEnabled then
            if isMobile then
                Rayfield:Notify({
                    Title = "Click TP Enabled",
                    Content = "Tap anywhere to teleport!",
                    Duration = 3,
                })
            else
                Rayfield:Notify({
                    Title = "Click TP Enabled",
                    Content = "Hold CTRL and click to teleport!",
                    Duration = 3,
                })
            end
            
            if isMobile then
                -- Mobile: Simple tap to TP
                clickConnection = mouse.Button1Down:Connect(function()
                    if not clickTpEnabled then return end
                    
                    local player = game.Players.LocalPlayer
                    local character = player.Character
                    if character then
                        local hrp = character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = CFrame.new(mouse.Hit.Position)
                            Rayfield:Notify({
                                Title = "Teleported",
                                Content = "Teleported to tap position",
                                Duration = 1,
                            })
                        end
                    end
                end)
            else
                -- PC: Ctrl + Click to TP
                clickConnection = mouse.Button1Down:Connect(function()
                    if not clickTpEnabled then return end
                    
                    local isCtrlHeld = game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) or 
                                       game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.RightControl)
                    
                    if isCtrlHeld then
                        local player = game.Players.LocalPlayer
                        local character = player.Character
                        if character then
                            local hrp = character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                hrp.CFrame = CFrame.new(mouse.Hit.Position)
                                Rayfield:Notify({
                                    Title = "Teleported",
                                    Content = "Teleported to cursor position",
                                    Duration = 1,
                                })
                            end
                        end
                    end
                end)
            end
        else
            Rayfield:Notify({
                Title = "Click TP Disabled",
                Content = "Click teleport deactivated",
                Duration = 2,
            })
            
            if clickConnection then
                clickConnection:Disconnect()
            end
        end
    end,
})

-- Follow Player
local FollowSection = LuaHubTab:CreateSection("Follow Player System")

LuaHubTab:CreateInput({
    Name = "Target Player Name",
    PlaceholderText = "Enter username...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        targetPlayer = Text
        Rayfield:Notify({
            Title = "Target Set",
            Content = "Target player: " .. Text,
            Duration = 2,
        })
    end,
})

LuaHubTab:CreateDropdown({
    Name = "Follow Type",
    Options = {"Behind", "Front", "Random"},
    CurrentOption = {"Behind"},
    MultipleOptions = false,
    Flag = "FollowType",
    Callback = function(Option)
        followType = Option[1]
        Rayfield:Notify({
            Title = "Follow Type Changed",
            Content = "Set to: " .. Option[1],
            Duration = 2,
        })
    end,
})

LuaHubTab:CreateSlider({
    Name = "Follow Distance",
    Range = {1, 20},
    Increment = 1,
    Suffix = " studs",
    CurrentValue = 3,
    Flag = "FollowDistance",
    Callback = function(Value)
        followDistance = Value
    end,
})

local followConnection
local followKeybind = LuaHubTab:CreateKeybind({
    Name = "Follow Player Keybind",
    CurrentKeybind = "F",
    HoldToInteract = false,
    Flag = "FollowKeybind",
    Callback = function(Keybind)
        followEnabled = not followEnabled
        
        if followEnabled then
            if targetPlayer == "" then
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Please enter a target player name first!",
                    Duration = 3,
                })
                followEnabled = false
                return
            end
            
            local target = game.Players:FindFirstChild(targetPlayer)
            if not target then
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Player '" .. targetPlayer .. "' not found!",
                    Duration = 3,
                })
                followEnabled = false
                return
            end
            
            Rayfield:Notify({
                Title = "Following Player",
                Content = "Following " .. targetPlayer .. " (" .. followType .. ")",
                Duration = 2,
            })
            
            followConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not followEnabled then return end
                
                local player = game.Players.LocalPlayer
                local character = player.Character
                local targetChar = target.Character
                
                if character and targetChar then
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    local targetHrp = targetChar:FindFirstChild("HumanoidRootPart")
                    
                    if hrp and targetHrp then
                        local offset
                        
                        if followType == "Behind" then
                            offset = targetHrp.CFrame * CFrame.new(0, 0, followDistance)
                        elseif followType == "Front" then
                            offset = targetHrp.CFrame * CFrame.new(0, 0, -followDistance)
                        elseif followType == "Random" then
                            local randomX = math.random(-followDistance, followDistance)
                            local randomZ = math.random(-followDistance, followDistance)
                            offset = targetHrp.CFrame * CFrame.new(randomX, 0, randomZ)
                        end
                        
                        hrp.CFrame = offset
                    end
                end
            end)
        else
            Rayfield:Notify({
                Title = "Follow Disabled",
                Content = "Stopped following player",
                Duration = 2,
            })
            
            if followConnection then
                followConnection:Disconnect()
            end
        end
    end,
})

LuaHubTab:CreateToggle({
    Name = "Follow Player (Toggle)",
    CurrentValue = false,
    Flag = "FollowToggle",
    Callback = function(Value)
        followEnabled = Value
        
        if followEnabled then
            if targetPlayer == "" then
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Please enter a target player name first!",
                    Duration = 3,
                })
                followEnabled = false
                return
            end
            
            local target = game.Players:FindFirstChild(targetPlayer)
            if not target then
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Player '" .. targetPlayer .. "' not found!",
                    Duration = 3,
                })
                followEnabled = false
                return
            end
            
            Rayfield:Notify({
                Title = "Following Player",
                Content = "Following " .. targetPlayer .. " (" .. followType .. ")",
                Duration = 2,
            })
            
            followConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not followEnabled then return end
                
                local player = game.Players.LocalPlayer
                local character = player.Character
                local targetChar = target.Character
                
                if character and targetChar then
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    local targetHrp = targetChar:FindFirstChild("HumanoidRootPart")
                    
                    if hrp and targetHrp then
                        local offset
                        
                        if followType == "Behind" then
                            offset = targetHrp.CFrame * CFrame.new(0, 0, followDistance)
                        elseif followType == "Front" then
                            offset = targetHrp.CFrame * CFrame.new(0, 0, -followDistance)
                        elseif followType == "Random" then
                            local randomX = math.random(-followDistance, followDistance)
                            local randomZ = math.random(-followDistance, followDistance)
                            offset = targetHrp.CFrame * CFrame.new(randomX, 0, randomZ)
                        end
                        
                        hrp.CFrame = offset
                    end
                end
            end)
        else
            Rayfield:Notify({
                Title = "Follow Disabled",
                Content = "Stopped following player",
                Duration = 2,
            })
            
            if followConnection then
                followConnection:Disconnect()
            end
        end
    end,
})

-- Update WalkSpeed and JumpPower continuously
game:GetService("RunService").Heartbeat:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if walkSpeed ~= 16 then
                humanoid.WalkSpeed = walkSpeed
            end
            if jumpPower ~= 50 then
                humanoid.JumpPower = jumpPower
            end
        end
    end
end)

-- Info Section
local InfoSection = LuaHubTab:CreateSection("Information")
LuaHubTab:CreateParagraph({
    Title = "About Lua Hub V4 - FINAL UPDATE",
    Content = "This is the final major feature update for Lua Hub. Future updates will focus on adding new game scripts and improving existing features. Thank you for using Lua Hub!"
})

LuaHubTab:CreateParagraph({
    Title = "New in V4",
    Content = "• Vehicle Fly (VFly)\n• Increased fly speed to 500\n• Volcano & Delta executor support\n• Mobile-friendly Click TP\n• Green highlight for aimbot target\n• Gravity Modifier\n• Script to lag your game for no reason at all\n• Respawn Button"
})

-- Additional V4 Features
local ExtraSection = LuaHubTab:CreateSection("Extra V4 Features")

-- Gravity Modifier
local normalGravity = workspace.Gravity

LuaHubTab:CreateSlider({
    Name = "Gravity Modifier",
    Range = {0, 196},
    Increment = 10,
    Suffix = " Gravity",
    CurrentValue = 196,
    Flag = "Gravity",
    Callback = function(Value)
        workspace.Gravity = Value
        Rayfield:Notify({
            Title = "Gravity Changed",
            Content = "Gravity set to " .. Value,
            Duration = 2,
        })
    end,
})

-- failed auto collect script so now it is ported to lua hub as a game lagger
local autoCollectEnabled = false
local autoCollectConnection

LuaHubTab:CreateToggle({
    Name = "Lag Game",
    CurrentValue = false,
    Flag = "AutoCollect",
    Callback = function(Value)
        autoCollectEnabled = Value
        
        if autoCollectEnabled then
            Rayfield:Notify({
                Title = "Game Lag ON",
                Content = "Lagging your game.",
                Duration = 2,
            })
            
            autoCollectConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not autoCollectEnabled then return end
                
                local player = game.Players.LocalPlayer
                local character = player.Character
                if not character then return end
                
                local hrp = character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                
                for _, item in pairs(workspace:GetDescendants()) do
                    if item:IsA("BasePart") and (item.Name:lower():find("coin") or item.Name:lower():find("item") or item.Name:lower():find("pickup")) then
                        if (item.Position - hrp.Position).Magnitude < 100 then
                            item.CFrame = hrp.CFrame
                        end
                    end
                end
            end)
        else
            Rayfield:Notify({
                Title = "Game Lag OFF",
                Content = "Stopped lagging your game.",
                Duration = 2,
            })
            
            if autoCollectConnection then
                autoCollectConnection:Disconnect()
            end
        end
    end,
})

-- Respawn Button
LuaHubTab:CreateButton({
    Name = "Respawn Character",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            character:BreakJoints()
            Rayfield:Notify({
                Title = "Respawning",
                Content = "Character will respawn shortly",
                Duration = 2,
            })
        end
    end,
})

-- Freeze Character
local characterFrozen = false

LuaHubTab:CreateToggle({
    Name = "Freeze Character",
    CurrentValue = false,
    Flag = "FreezeChar",
    Callback = function(Value)
        characterFrozen = Value
        local player = game.Players.LocalPlayer
        local character = player.Character
        
        if character then
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if hrp then
                if characterFrozen then
                    hrp.Anchored = true
                    Rayfield:Notify({
                        Title = "Character Frozen",
                        Content = "Character position locked",
                        Duration = 2,
                    })
                else
                    hrp.Anchored = false
                    Rayfield:Notify({
                        Title = "Character Unfrozen",
                        Content = "Character can move again",
                        Duration = 2,
                    })
                end
            end
        end
    end,
})

-- ============================================
-- CONFIG TAB
-- ============================================
local ConfigTab = Window:CreateTab("Config", "settings")
local ConfigSection = ConfigTab:CreateSection("Hub Configuration")

ConfigTab:CreateButton({
    Name = "Unload Lua Hub V4",
    Callback = function()
        Rayfield:Notify({
            Title = "Unloading...",
            Content = "Lua Hub V4 is closing. Thank you for using!",
            Duration = 2,
        })
        wait(1)
        Rayfield:Destroy()
    end,
})

local ThemeSection = ConfigTab:CreateSection("Theme Settings")

ConfigTab:CreateDropdown({
    Name = "Select Theme",
    Options = {"Serenity", "Amethyst", "Ocean"},
    CurrentOption = {"Serenity"},
    MultipleOptions = false,
    Flag = "ThemeSelect",
    Callback = function(Option)
        Rayfield:Notify({
            Title = "Theme Changed",
            Content = "Theme set to: " .. Option[1] .. " (Restart required)",
            Duration = 3,
        })
    end,
})

ConfigTab:CreateParagraph({
    Title = "Note",
    Content = "Theme changes require a restart of Lua Hub V3 to take full effect."
})

local ConfigManagement = ConfigTab:CreateSection("Configuration")

ConfigTab:CreateButton({
    Name = "Save Configuration",
    Callback = function()
        Rayfield:Notify({
            Title = "Saved",
            Content = "Configuration saved successfully!",
            Duration = 2,
        })
    end,
})

ConfigTab:CreateButton({
    Name = "Load Configuration",
    Callback = function()
        Rayfield:Notify({
            Title = "Loaded",
            Content = "Configuration loaded successfully!",
            Duration = 2,
        })
    end,
})

Rayfield:LoadConfiguration()
