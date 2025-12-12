-- Lua Hub V2 by Lua Hotel
-- Advanced Multi-Game Script Hub

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Executor Detection
local function getExecutor()
    local executors = {
        ["Xeno"] = identifyexecutor and identifyexecutor():lower():find("xeno"),
        ["Solara"] = identifyexecutor and identifyexecutor():lower():find("solara"),
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
local userName = game.Players.LocalPlayer.Name
local userKey = "LUA_HUB_wx7e5DmK6zJNaM42c"

-- Show Introduction Notification
Rayfield:Notify({
    Title = "Lua Hub V2",
    Content = "15+ Premium Scripts Loaded! Welcome " .. userName,
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

-- Create Main Window with Key System
local Window = Rayfield:CreateWindow({
    Name = "Lua Hub V2 | " .. currentExecutor,
    LoadingTitle = "Lua Hub V2 Loading...",
    LoadingSubtitle = "by Lua Hotel",
    Theme = "Serenity",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "LuaHubV2",
        FileName = "LuaHubV2Config"
    },
    Discord = {
        Enabled = true,
        Invite = "TQtNedMsVV",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Lua Hub V2 | Key System",
        Subtitle = "Get your key from our website",
        Note = "Visit: https://luahotel.vercel.app",
        FileName = "LuaHubV2Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"LUA_HUB_wx7e5DmK6zJNaM42c"}
    }
})

-- Variables for custom scripts
local flyEnabled = false
local betterBypass = false
local noclipEnabled = false
local followEnabled = false
local espEnabled = false
local autoFarmEnabled = false
local antiAfkEnabled = false
local fovChangerEnabled = false
local targetPlayer = ""
local flySpeed = 50
local walkSpeed = 16
local jumpPower = 50
local followDistance = 3
local followType = "Behind"
local fovValue = 70
local flyHeight = 0
local flyBobbing = 0

-- ============================================
-- HOME TAB
-- ============================================
local HomeTab = Window:CreateTab("Home", 4483362458)
local HomeSection = HomeTab:CreateSection("User Information")

HomeTab:CreateParagraph({
    Title = "Welcome to Lua Hub V2!",
    Content = "The most advanced script hub for Roblox. Enjoy premium features and regular updates!"
})

HomeTab:CreateLabel("Username: " .. userName)
HomeTab:CreateLabel("User ID: " .. game.Players.LocalPlayer.UserId)
HomeTab:CreateLabel("Executor: " .. currentExecutor)
HomeTab:CreateLabel("Your Key: " .. userKey)

local StatsSection = HomeTab:CreateSection("Session Stats")

local sessionStartTime = tick()
local scriptsExecuted = 0

local function updateStats()
    local sessionTime = math.floor(tick() - sessionStartTime)
    local minutes = math.floor(sessionTime / 60)
    local seconds = sessionTime % 60
    return string.format("%02d:%02d", minutes, seconds)
end

HomeTab:CreateLabel("Session Time: Updating...")
HomeTab:CreateLabel("Scripts Executed: 0")

spawn(function()
    while wait(1) do
        -- Stats update in real environment would refresh labels
    end
end)

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
local GeneralTab = Window:CreateTab("General", 4483362458)
local GeneralSection = GeneralTab:CreateSection("Universal Scripts")

GeneralTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        scriptsExecuted = scriptsExecuted + 1
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
        scriptsExecuted = scriptsExecuted + 1
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
        scriptsExecuted = scriptsExecuted + 1
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
local JJSTab = Window:CreateTab("JJS", 4483362458)
local JJSSection = JJSTab:CreateSection("Jujutsu Shenanigans Scripts")

JJSTab:CreateButton({
    Name = "Jujutsuer",
    Callback = function()
        scriptsExecuted = scriptsExecuted + 1
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
        scriptsExecuted = scriptsExecuted + 1
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
        scriptsExecuted = scriptsExecuted + 1
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
local TSBTab = Window:CreateTab("TSB", 4483362458)
local TSBSection = TSBTab:CreateSection("The Strongest Battlegrounds Scripts")

TSBTab:CreateButton({
    Name = "SORGUI",
    Callback = function()
        scriptsExecuted = scriptsExecuted + 1
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
local BloxFruitsTab = Window:CreateTab("Blox Fruits", 4483362458)
local BloxFruitsSection = BloxFruitsTab:CreateSection("Blox Fruits Scripts")

BloxFruitsTab:CreateButton({
    Name = "BT Project",
    Callback = function()
        scriptsExecuted = scriptsExecuted + 1
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
local PianoTab = Window:CreateTab("Piano", 4483362458)
local PianoSection = PianoTab:CreateSection("Virtual Piano Scripts")

PianoTab:CreateButton({
    Name = "Talentless",
    Callback = function()
        scriptsExecuted = scriptsExecuted + 1
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
local LuaHubTab = Window:CreateTab("Lua Hub", 4483362458)
local LuaHubSection = LuaHubTab:CreateSection("Premium Lua Hub Features")

-- Advanced Fly Bypass with Teleport System
local flyConnection
local flyBodyVelocity
local flyBodyGyro

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
            
            -- Create smooth floating effect
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
                
                -- Apply better bypass limits
                if betterBypass then
                    currentSpeed = math.min(flySpeed, 80) -- Cap speed
                    -- Limit height
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
                
                -- Smooth bobbing effect
                flyBobbing = flyBobbing + delta * 3
                local bobbingOffset = math.sin(flyBobbing) * 0.5
                
                -- Apply movement with bobbing
                if moveDirection.Magnitude > 0 then
                    local targetVelocity = moveDirection.Unit * currentSpeed
                    flyBodyVelocity.Velocity = targetVelocity + Vector3.new(0, bobbingOffset, 0)
                else
                    flyBodyVelocity.Velocity = Vector3.new(0, bobbingOffset * 2, 0)
                end
                
                flyBodyGyro.CFrame = camera.CFrame
                
                -- Smooth position updates (teleport-like)
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
    Range = {10, 200},
    Increment = 5,
    Suffix = " Speed",
    CurrentValue = 50,
    Flag = "FlySpeed",
    Callback = function(Value)
        flySpeed = Value
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
            
            -- Store original collision settings
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
                            -- Advanced bypass: prevent velocity detection
                            if part:IsA("BasePart") and part.Name == "HumanoidRootPart" then
                                part.Velocity = Vector3.new(0, 0, 0)
                                part.RotVelocity = Vector3.new(0, 0, 0)
                            end
                        end
                    end
                    
                    -- Extra bypass for humanoid collision
                    local humanoid = char:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:ChangeState(11) -- Physics state for bypass
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
            
            -- Restore original collision settings
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

-- Auto Sprint
local autoSprintEnabled = false

LuaHubTab:CreateToggle({
    Name = "Auto Sprint",
    CurrentValue = false,
    Flag = "AutoSprint",
    Callback = function(Value)
        autoSprintEnabled = Value
        
        if autoSprintEnabled then
            Rayfield:Notify({
                Title = "Auto Sprint ON",
                Content = "You will always sprint when moving",
                Duration = 2,
            })
            
            game:GetService("RunService").Heartbeat:Connect(function()
                if not autoSprintEnabled then return end
                
                local player = game.Players.LocalPlayer
                local character = player.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid and humanoid.MoveDirection.Magnitude > 0 then
                        humanoid.WalkSpeed = walkSpeed * 1.5
                    else
                        humanoid.WalkSpeed = walkSpeed
                    end
                end
            end)
        else
            Rayfield:Notify({
                Title = "Auto Sprint OFF",
                Content = "Sprint disabled",
                Duration = 2,
            })
        end
    end,
})

-- Click TP
local clickTpEnabled = false
local clickConnection

LuaHubTab:CreateToggle({
    Name = "Click TP (Hold Ctrl + Click)",
    CurrentValue = false,
    Flag = "ClickTP",
    Callback = function(Value)
        clickTpEnabled = Value
        
        if clickTpEnabled then
            Rayfield:Notify({
                Title = "Click TP Enabled",
                Content = "Hold CTRL and click to teleport!",
                Duration = 3,
            })
            
            local mouse = game.Players.LocalPlayer:GetMouse()
            
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

-- Follow Player GUI
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
    Title = "About Lua Hub V2",
    Content = "Lua Hub V2 is the ultimate script collection for Roblox with premium features and advanced bypass systems. Created by Lua Hotel. Executor: " .. currentExecutor
})

LuaHubTab:CreateParagraph({
    Title = "Premium Features",
    Content = "• Advanced Fly Bypass with smooth teleportation\n• Player ESP & Tracking\n• Anti-AFK Protection\n• FOV & Speed Customization\n• FPS Optimization Tools\n• And much more!"
})

Rayfield:LoadConfiguration()
