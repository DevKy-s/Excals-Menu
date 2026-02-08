-- ================== KEY SYSTEM ==================

local REAL_KEY = "Jf78sh21nujlaefs@mf.*/af?822f"
local SITE_URL = "https://excal-menu.netlify.app"

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local unlocked = false

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "KeySystem"
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0,0)
frame.Position = UDim2.fromScale(0.5,0.5)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.BackgroundColor3 = Color3.fromRGB(10,10,15)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,18)

-- Stroke (neon)
local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(160,70,255)
stroke.Thickness = 2
stroke.Transparency = 0.2

-- Open animation
TweenService:Create(
    frame,
    TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Size = UDim2.fromScale(0.36,0.28)}
):Play()

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(1,0.22)
title.BackgroundTransparency = 1
title.Text = "KEY REQUIRED"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(200,140,255)

-- TextBox
local box = Instance.new("TextBox", frame)
box.Size = UDim2.fromScale(0.85,0.22)
box.Position = UDim2.fromScale(0.075,0.32)
box.PlaceholderText = "Enter key..."
box.Text = ""
box.ClearTextOnFocus = false
box.Font = Enum.Font.Gotham
box.TextScaled = true
box.BackgroundColor3 = Color3.fromRGB(22,22,34)
box.TextColor3 = Color3.fromRGB(255,255,255)
box.BorderSizePixel = 0
Instance.new("UICorner", box).CornerRadius = UDim.new(0,12)

-- Verify button
local verify = Instance.new("TextButton", frame)
verify.Size = UDim2.fromScale(0.5,0.18)
verify.Position = UDim2.fromScale(0.25,0.6)
verify.Text = "VERIFY"
verify.Font = Enum.Font.GothamBold
verify.TextScaled = true
verify.BackgroundColor3 = Color3.fromRGB(140,80,220)
verify.TextColor3 = Color3.fromRGB(255,255,255)
verify.BorderSizePixel = 0
Instance.new("UICorner", verify).CornerRadius = UDim.new(0,14)

-- Get Key button
local getkey = Instance.new("TextButton", frame)
getkey.Size = UDim2.fromScale(0.5,0.14)
getkey.Position = UDim2.fromScale(0.25,0.8)
getkey.Text = "GET KEY"
getkey.Font = Enum.Font.Gotham
getkey.TextScaled = true
getkey.BackgroundColor3 = Color3.fromRGB(35,35,55)
getkey.TextColor3 = Color3.fromRGB(200,170,255)
getkey.BorderSizePixel = 0
Instance.new("UICorner", getkey).CornerRadius = UDim.new(0,12)

getkey.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(SITE_URL)
        getkey.Text = "LINK COPIED"
        task.wait(1)
        getkey.Text = "GET KEY"
    end
end)

-- VERIFY LOGIC (KOD KİLİDİ BURADA)
verify.MouseButton1Click:Connect(function()
    if box.Text == REAL_KEY then
        unlocked = true

        TweenService:Create(
            frame,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {Size = UDim2.fromScale(0,0)}
        ):Play()

        task.wait(0.4)
        gui:Destroy()

       -- EXCAL ENHANCED SCRIPT - PART 1
-- Enhanced RGB Effects, Fixed Hitbox Expander, and Improved Weapon Mods
-- Merge this with Part 2 to get the complete script

local REAL_KEY = "Jf78sh21nujlaefs@mf.*/af?822f"
local SITE_URL = "https://excal-menu.netlify.app"

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer

-- ============================================================================
-- KEY SYSTEM UI
-- ============================================================================

local gui = Instance.new("ScreenGui")
gui.Name = "NeonKeyUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.fromScale(0, 0)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 18)

local stroke1 = Instance.new("UIStroke", frame)
stroke1.Color = Color3.fromRGB(170, 90, 255)
stroke1.Thickness = 2
stroke1.Transparency = 0.4

local stroke2 = Instance.new("UIStroke", frame)
stroke2.Color = Color3.fromRGB(120, 40, 255)
stroke2.Thickness = 6
stroke2.Transparency = 0.85

TweenService:Create(
    frame,
    TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Size = UDim2.fromScale(0.38, 0.32)}
):Play()

task.spawn(function()
    while frame.Parent do
        TweenService:Create(stroke2, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {Transparency = 0.6}):Play()
        task.wait(1.2)
        TweenService:Create(stroke2, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {Transparency = 0.9}):Play()
        task.wait(1.2)
    end
end)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(1, 0.2)
title.BackgroundTransparency = 1
title.Text = "NEON ACCESS"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(210, 160, 255)

local box = Instance.new("TextBox", frame)
box.Size = UDim2.fromScale(0.85, 0.2)
box.Position = UDim2.fromScale(0.075, 0.28)
box.PlaceholderText = "Enter key..."
box.Text = ""
box.ClearTextOnFocus = false
box.Font = Enum.Font.Gotham
box.TextScaled = true
box.BackgroundColor3 = Color3.fromRGB(22, 22, 34)
box.TextColor3 = Color3.fromRGB(255,255,255)
box.BorderSizePixel = 0
Instance.new("UICorner", box).CornerRadius = UDim.new(0, 12)

local verify = Instance.new("TextButton", frame)
verify.Size = UDim2.fromScale(0.5, 0.18)
verify.Position = UDim2.fromScale(0.25, 0.52)
verify.Text = "VERIFY"
verify.Font = Enum.Font.GothamBold
verify.TextScaled = true
verify.BackgroundColor3 = Color3.fromRGB(140, 80, 220)
verify.TextColor3 = Color3.fromRGB(255,255,255)
verify.BorderSizePixel = 0
Instance.new("UICorner", verify).CornerRadius = UDim.new(0, 14)

local getkey = Instance.new("TextButton", frame)
getkey.Size = UDim2.fromScale(0.5, 0.14)
getkey.Position = UDim2.fromScale(0.25, 0.74)
getkey.Text = "GET KEY"
getkey.Font = Enum.Font.Gotham
getkey.TextScaled = true
getkey.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
getkey.TextColor3 = Color3.fromRGB(200, 170, 255)
getkey.BorderSizePixel = 0
Instance.new("UICorner", getkey).CornerRadius = UDim.new(0, 12)

getkey.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(SITE_URL)
        getkey.Text = "LINK COPIED"
        task.wait(1)
        getkey.Text = "GET KEY"
    else
        warn("Clipboard not supported.")
    end
end)

verify.MouseButton1Click:Connect(function()
    if box.Text == REAL_KEY then
        TweenService:Create(frame, TweenInfo.new(0.4), {Size = UDim2.fromScale(0,0)}):Play()
        task.wait(0.4)
        gui:Destroy()
        print("Key verified. Script loaded.")
    else
        verify.Text = "INVALID KEY"
        verify.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
        task.wait(0.8)
        verify.Text = "VERIFY"
        verify.BackgroundColor3 = Color3.fromRGB(140, 80, 220)
        box.Text = ""
    end
end)

-- ============================================================================
-- MAIN SCRIPT VARIABLES
-- ============================================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- ESP Variables
local espObjects = {}
local espActive = false

-- Orbit Variables
local orbitActive = false
local orbitConnection = nil
local ORBIT_RADIUS = 15
local ORBIT_HEIGHT = 2
local ORBIT_SPEED = 2

-- Aimbot Variables
local aimbotNormalActive = false
local aimbotTeamCheckActive = false
local rightMouseDown = false
local currentTarget = nil
local mouseMoved = false

-- Fly Variables
local flyActive = false
local flyConnection = nil
local flySpeedValue = 30

-- Hitbox Expander Variables
local hitboxExpanderActive = false
local hitboxMultiplier = 2
local hitboxTransparency = 0.7
local originalHitboxSizes = {}
local hitboxUpdateConnection = nil
local expandedHitboxes = {}

-- Backtrack Variables
local backtrackActive = false
local backtrackInterval = 0.2
local backtrackHistory = {}
local backtrackConnection = nil
local backtrackEspActive = false
local backtrackShotTarget = nil
local backtrackTargetTeamMode = "All"

-- Weapon Modifications Variables
local infiniteAmmoActive = false
local fastReloadActive = false
local fastFireRateActive = false
local alwaysAutoActive = false
local noSpreadActive = false
local noRecoilActive = false
local weaponConnections = {}

-- ============================================================================
-- ENHANCED RGB ANIMATION SYSTEM
-- ============================================================================

local function createEnhancedRGB(button)
    -- Remove any existing RGB elements
    local existingGradient = button:FindFirstChild("RGBGradient")
    if existingGradient then existingGradient:Destroy() end
    
    local existingGlow = button:FindFirstChild("RGBGlow")
    if existingGlow then existingGlow:Destroy() end
    
    -- Create gradient for color cycling
    local gradient = Instance.new("UIGradient")
    gradient.Name = "RGBGradient"
    gradient.Parent = button
    
    -- Ensure stroke exists
    local stroke = button:FindFirstChild("UIStroke")
    if not stroke then
        stroke = Instance.new("UIStroke")
        stroke.Thickness = 2
        stroke.Parent = button
    end
    
    -- Create glow effect
    local glow = Instance.new("ImageLabel")
    glow.Name = "RGBGlow"
    glow.Size = UDim2.new(1, 30, 1, 30)
    glow.Position = UDim2.new(0.5, 0, 0.5, 0)
    glow.AnchorPoint = Vector2.new(0.5, 0.5)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    glow.ImageTransparency = 0.6
    glow.ZIndex = button.ZIndex - 1
    glow.Parent = button
    
    -- Animation loop
    task.spawn(function()
        local hue = math.random(0, 100) / 100
        local rotation = 0
        local pulseTime = 0
        
        while button.Parent and button:FindFirstChild("RGBActive") do
            -- Smooth hue transition
            hue = (hue + 0.004) % 1
            rotation = (rotation + 2) % 360
            pulseTime = pulseTime + 0.05
            
            -- Create vibrant rainbow colors
            local color1 = Color3.fromHSV(hue, 0.95, 1)
            local color2 = Color3.fromHSV((hue + 0.2) % 1, 0.95, 1)
            local color3 = Color3.fromHSV((hue + 0.5) % 1, 0.95, 1)
            local color4 = Color3.fromHSV((hue + 0.8) % 1, 0.95, 1)
            
            -- Update gradient with 4 colors
            gradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, color1),
                ColorSequenceKeypoint.new(0.25, color2),
                ColorSequenceKeypoint.new(0.5, color3),
                ColorSequenceKeypoint.new(0.75, color4),
                ColorSequenceKeypoint.new(1, color1)
            })
            
            gradient.Rotation = rotation
            
            -- Animate stroke
            if stroke then
                stroke.Color = color1
                local pulseFactor = 0.3 + math.abs(math.sin(pulseTime * 2)) * 0.4
                stroke.Thickness = 1.5 + pulseFactor
                stroke.Transparency = 0.2
            end
            
            -- Animate glow
            if glow then
                glow.ImageColor3 = color1
                local glowPulse = 0.5 + math.abs(math.sin(pulseTime * 1.5)) * 0.3
                glow.ImageTransparency = glowPulse
                glow.Size = UDim2.new(1, 25 + math.sin(pulseTime) * 5, 1, 25 + math.sin(pulseTime) * 5)
            end
            
            task.wait(0.016) -- 60 FPS
        end
        
        -- Cleanup when deactivated
        gradient:Destroy()
        if glow then glow:Destroy() end
    end)
end

local function setButtonActive(button, isActive)
    if isActive then
        -- Add RGB animation marker
        if not button:FindFirstChild("RGBActive") then
            local marker = Instance.new("BoolValue")
            marker.Name = "RGBActive"
            marker.Parent = button
            createEnhancedRGB(button)
        end
        
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.GothamBold
    else
        -- Remove RGB animation
        local marker = button:FindFirstChild("RGBActive")
        if marker then marker:Destroy() end
        
        local gradient = button:FindFirstChild("RGBGradient")
        if gradient then gradient:Destroy() end
        
        local glow = button:FindFirstChild("RGBGlow")
        if glow then glow:Destroy() end
        
        -- Reset to default appearance
        button.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        button.TextColor3 = Color3.fromRGB(180, 180, 200)
        button.Font = Enum.Font.GothamBold
        
        local stroke = button:FindFirstChild("UIStroke")
        if stroke then
            stroke.Color = Color3.fromRGB(80, 80, 120)
            stroke.Thickness = 1.5
            stroke.Transparency = 0.5
        end
    end
end

-- ============================================================================
-- IMPROVED HITBOX EXPANDER SYSTEM
-- ============================================================================

local function expandHitbox(character)
    if not character or not hitboxExpanderActive then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    -- Store original size if not already stored
    if not originalHitboxSizes[character] then
        originalHitboxSizes[character] = hrp.Size
    end
    
    -- Create or update expanded hitbox tracking
    if not expandedHitboxes[character] then
        expandedHitboxes[character] = {
            active = true,
            originalSize = hrp.Size
        }
    end
    
    -- Apply hitbox expansion
    hrp.Size = originalHitboxSizes[character] * hitboxMultiplier
    hrp.Transparency = hitboxTransparency
    hrp.CanCollide = false
    hrp.Massless = true
    
    -- Visual marker for debugging (optional)
    if not hrp:FindFirstChild("HitboxMarker") then
        local marker = Instance.new("BoolValue")
        marker.Name = "HitboxMarker"
        marker.Parent = hrp
    end
    
    expandedHitboxes[character].active = true
end

local function restoreHitbox(character)
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp and originalHitboxSizes[character] then
        hrp.Size = originalHitboxSizes[character]
        hrp.Transparency = 1
        hrp.CanCollide = false
        
        local marker = hrp:FindFirstChild("HitboxMarker")
        if marker then marker:Destroy() end
    end
    
    if expandedHitboxes[character] then
        expandedHitboxes[character].active = false
    end
end

local function updateAllHitboxes()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            if hitboxExpanderActive then
                expandHitbox(p.Character)
            else
                restoreHitbox(p.Character)
            end
        end
    end
end

local function startHitboxMonitoring()
    if hitboxUpdateConnection then
        hitboxUpdateConnection:Disconnect()
    end
    
    hitboxUpdateConnection = RunService.Heartbeat:Connect(function()
        if not hitboxExpanderActive then return end
        
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if hrp and originalHitboxSizes[p.Character] then
                    local expectedSize = originalHitboxSizes[p.Character] * hitboxMultiplier
                    
                    -- Check if hitbox was reset by the game and reapply
                    if (hrp.Size - expectedSize).Magnitude > 0.1 then
                        expandHitbox(p.Character)
                    end
                    
                    -- Maintain transparency
                    if math.abs(hrp.Transparency - hitboxTransparency) > 0.01 then
                        hrp.Transparency = hitboxTransparency
                    end
                    
                    -- Maintain massless state
                    if not hrp.Massless then
                        hrp.Massless = true
                    end
                end
            end
        end
    end)
end

local function stopHitboxMonitoring()
    if hitboxUpdateConnection then
        hitboxUpdateConnection:Disconnect()
        hitboxUpdateConnection = nil
    end
end

-- ============================================================================
-- IMPROVED WEAPON MODIFICATION SYSTEM
-- ============================================================================

local function cleanupWeaponConnections()
    for _, connection in pairs(weaponConnections) do
        if connection then
            connection:Disconnect()
        end
    end
    weaponConnections = {}
end

local function modifyTool(tool, modType)
    if not tool or not tool:IsA("Tool") then return end
    
    -- Find weapon configuration objects
    local config = tool:FindFirstChild("Configuration") or tool
    local handle = tool:FindFirstChild("Handle")
    
    if modType == "ammo" and infiniteAmmoActive then
        -- Set ammo attributes
        if tool:GetAttribute("Ammo") ~= nil then
            tool:SetAttribute("Ammo", 9999)
        end
        if tool:GetAttribute("CurrentAmmo") ~= nil then
            tool:SetAttribute("CurrentAmmo", 9999)
        end
        if tool:GetAttribute("MaxAmmo") ~= nil then
            tool:SetAttribute("MaxAmmo", 9999)
        end
        if tool:GetAttribute("MagazineSize") ~= nil then
            tool:SetAttribute("MagazineSize", 9999)
        end
        if tool:GetAttribute("StoredAmmo") ~= nil then
            tool:SetAttribute("StoredAmmo", 9999)
        end
        
        -- Find and modify ammo values in descendants
        for _, obj in pairs(tool:GetDescendants()) do
            if obj:IsA("IntValue") or obj:IsA("NumberValue") then
                local name = string.lower(obj.Name)
                if name:find("ammo") or name:find("magazine") or name:find("clip") or name:find("mag") then
                    obj.Value = 9999
                end
            end
        end
        
    elseif modType == "reload" and fastReloadActive then
        if tool:GetAttribute("ReloadTime") ~= nil then
            tool:SetAttribute("ReloadTime", 0.01)
        end
        if tool:GetAttribute("ReloadSpeed") ~= nil then
            tool:SetAttribute("ReloadSpeed", 100)
        end
        
        for _, obj in pairs(tool:GetDescendants()) do
            if obj:IsA("NumberValue") then
                local name = string.lower(obj.Name)
                if name:find("reload") then
                    obj.Value = 0.01
                end
            end
        end
        
    elseif modType == "firerate" and fastFireRateActive then
        if tool:GetAttribute("FireRate") ~= nil then
            tool:SetAttribute("FireRate", 0.001)
        end
        if tool:GetAttribute("FireDelay") ~= nil then
            tool:SetAttribute("FireDelay", 0.001)
        end
        if tool:GetAttribute("Cooldown") ~= nil then
            tool:SetAttribute("Cooldown", 0.001)
        end
        if tool:GetAttribute("RPM") ~= nil then
            tool:SetAttribute("RPM", 9999)
        end
        
        for _, obj in pairs(tool:GetDescendants()) do
            if obj:IsA("NumberValue") then
                local name = string.lower(obj.Name)
                if name:find("firerate") or name:find("cooldown") or name:find("delay") or name:find("rpm") then
                    if name:find("rpm") then
                        obj.Value = 9999
                    else
                        obj.Value = 0.001
                    end
                end
            end
        end
        
    elseif modType == "auto" and alwaysAutoActive then
        if tool:GetAttribute("Auto") ~= nil then
            tool:SetAttribute("Auto", true)
        end
        if tool:GetAttribute("Automatic") ~= nil then
            tool:SetAttribute("Automatic", true)
        end
        if tool:GetAttribute("FullAuto") ~= nil then
            tool:SetAttribute("FullAuto", true)
        end
        
        for _, obj in pairs(tool:GetDescendants()) do
            if obj:IsA("BoolValue") then
                local name = string.lower(obj.Name)
                if name:find("auto") or name:find("automatic") then
                    obj.Value = true
                end
            end
        end
        
    elseif modType == "spread" and noSpreadActive then
        if tool:GetAttribute("Spread") ~= nil then
            tool:SetAttribute("Spread", 0)
        end
        if tool:GetAttribute("Accuracy") ~= nil then
            tool:SetAttribute("Accuracy", 100)
        end
        if tool:GetAttribute("Inaccuracy") ~= nil then
            tool:SetAttribute("Inaccuracy", 0)
        end
        
        for _, obj in pairs(tool:GetDescendants()) do
            if obj:IsA("NumberValue") then
                local name = string.lower(obj.Name)
                if name:find("spread") or name:find("inaccuracy") then
                    obj.Value = 0
                elseif name:find("accuracy") then
                    obj.Value = 100
                end
            end
        end
        
    elseif modType == "recoil" and noRecoilActive then
        if tool:GetAttribute("Recoil") ~= nil then
            tool:SetAttribute("Recoil", 0)
        end
        if tool:GetAttribute("RecoilControl") ~= nil then
            tool:SetAttribute("RecoilControl", 100)
        end
        if tool:GetAttribute("Kickback") ~= nil then
            tool:SetAttribute("Kickback", 0)
        end
        
        for _, obj in pairs(tool:GetDescendants()) do
            if obj:IsA("NumberValue") then
                local name = string.lower(obj.Name)
                if name:find("recoil") or name:find("kickback") or name:find("kick") then
                    obj.Value = 0
                end
            end
        end
    end
end

local function startWeaponModifications()
    cleanupWeaponConnections()
    
    -- Monitor character tools
    local function monitorCharacter(character)
        if not character then return end
        
        -- Modify existing tools
        for _, obj in pairs(character:GetChildren()) do
            if obj:IsA("Tool") then
                if infiniteAmmoActive then modifyTool(obj, "ammo") end
                if fastReloadActive then modifyTool(obj, "reload") end
                if fastFireRateActive then modifyTool(obj, "firerate") end
                if alwaysAutoActive then modifyTool(obj, "auto") end
                if noSpreadActive then modifyTool(obj, "spread") end
                if noRecoilActive then modifyTool(obj, "recoil") end
            end
        end
        
        -- Monitor for new tools being equipped
        local childAddedConn = character.ChildAdded:Connect(function(obj)
            if obj:IsA("Tool") then
                task.wait(0.1)
                if infiniteAmmoActive then modifyTool(obj, "ammo") end
                if fastReloadActive then modifyTool(obj, "reload") end
                if fastFireRateActive then modifyTool(obj, "firerate") end
                if alwaysAutoActive then modifyTool(obj, "auto") end
                if noSpreadActive then modifyTool(obj, "spread") end
                if noRecoilActive then modifyTool(obj, "recoil") end
            end
        end)
        table.insert(weaponConnections, childAddedConn)
    end
    
    if player.Character then
        monitorCharacter(player.Character)
    end
    
    local charAddedConn = player.CharacterAdded:Connect(function(character)
        task.wait(0.5)
        monitorCharacter(character)
    end)
    table.insert(weaponConnections, charAddedConn)
    
    -- Continuous monitoring loop for persistent modifications
    local monitorLoop = RunService.Heartbeat:Connect(function()
        if player.Character then
            for _, obj in pairs(player.Character:GetChildren()) do
                if obj:IsA("Tool") then
                    if infiniteAmmoActive then modifyTool(obj, "ammo") end
                    if fastReloadActive then modifyTool(obj, "reload") end
                    if fastFireRateActive then modifyTool(obj, "firerate") end
                    if alwaysAutoActive then modifyTool(obj, "auto") end
                    if noSpreadActive then modifyTool(obj, "spread") end
                    if noRecoilActive then modifyTool(obj, "recoil") end
                end
            end
        end
    end)
    table.insert(weaponConnections, monitorLoop)
end

-- ============================================================================
-- CONTINUE TO PART 2 FOR LOADING SCREEN AND MENU CREATION
-- ============================================================================

print("✓ Part 1 loaded: Enhanced RGB, Hitbox Expander, and Weapon Systems initialized")

-- EXCAL ENHANCED SCRIPT - PART 2
-- Loading Screen and Menu Creation
-- This continues from Part 1

-- ============================================================================
-- LOADING SCREEN
-- ============================================================================

local function createLoadingScreen()
    local loadingGui = Instance.new("ScreenGui")
    loadingGui.Name = "ExcalLoadingScreen"
    loadingGui.ResetOnSpawn = false
    loadingGui.IgnoreGuiInset = true
    loadingGui.DisplayOrder = 999
    loadingGui.Parent = player:WaitForChild("PlayerGui")
    
    local background = Instance.new("Frame")
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    background.BorderSizePixel = 0
    background.Parent = loadingGui
    
    -- Grid pattern background
    local gridPattern = Instance.new("Frame")
    gridPattern.Size = UDim2.new(1, 0, 1, 0)
    gridPattern.BackgroundTransparency = 1
    gridPattern.Parent = background
    
    for i = 1, 20 do
        local line = Instance.new("Frame")
        line.Size = UDim2.new(0, 2, 1, 0)
        line.Position = UDim2.new(i/20, 0, 0, 0)
        line.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
        line.BorderSizePixel = 0
        line.BackgroundTransparency = 0.8
        line.Parent = gridPattern
    end
    
    for i = 1, 15 do
        local line = Instance.new("Frame")
        line.Size = UDim2.new(1, 0, 0, 2)
        line.Position = UDim2.new(0, 0, i/15, 0)
        line.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
        line.BorderSizePixel = 0
        line.BackgroundTransparency = 0.8
        line.Parent = gridPattern
    end
    
    -- Player card
    local playerCard = Instance.new("Frame")
    playerCard.Size = UDim2.new(0, 300, 0, 80)
    playerCard.Position = UDim2.new(1, -350, 0, 80)
    playerCard.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
    playerCard.BorderSizePixel = 0
    playerCard.Parent = background
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 12)
    cardCorner.Parent = playerCard
    
    local cardStroke = Instance.new("UIStroke")
    cardStroke.Color = Color3.fromRGB(100, 50, 200)
    cardStroke.Thickness = 2
    cardStroke.Parent = playerCard
    
    local avatarFrame = Instance.new("Frame")
    avatarFrame.Size = UDim2.new(0, 60, 0, 60)
    avatarFrame.Position = UDim2.new(0, 10, 0.5, -30)
    avatarFrame.BackgroundColor3 = Color3.fromRGB(100, 50, 200)
    avatarFrame.Parent = playerCard
    
    local avatarCorner = Instance.new("UICorner")
    avatarCorner.CornerRadius = UDim.new(1, 0)
    avatarCorner.Parent = avatarFrame
    
    local avatarImage = Instance.new("ImageLabel")
    avatarImage.Size = UDim2.new(1, -6, 1, -6)
    avatarImage.Position = UDim2.new(0, 3, 0, 3)
    avatarImage.BackgroundTransparency = 1
    avatarImage.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    avatarImage.Parent = avatarFrame
    
    local avatarImageCorner = Instance.new("UICorner")
    avatarImageCorner.CornerRadius = UDim.new(1, 0)
    avatarImageCorner.Parent = avatarImage
    
    local playerNameLabel = Instance.new("TextLabel")
    playerNameLabel.Text = player.Name
    playerNameLabel.Size = UDim2.new(0, 210, 0, 30)
    playerNameLabel.Position = UDim2.new(0, 80, 0, 15)
    playerNameLabel.BackgroundTransparency = 1
    playerNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    playerNameLabel.Font = Enum.Font.GothamBold
    playerNameLabel.TextSize = 18
    playerNameLabel.TextXAlignment = Enum.TextXAlignment.Left
    playerNameLabel.Parent = playerCard
    
    local displayNameLabel = Instance.new("TextLabel")
    displayNameLabel.Text = "@" .. player.DisplayName
    displayNameLabel.Size = UDim2.new(0, 210, 0, 20)
    displayNameLabel.Position = UDim2.new(0, 80, 0, 40)
    displayNameLabel.BackgroundTransparency = 1
    displayNameLabel.TextColor3 = Color3.fromRGB(150, 150, 200)
    displayNameLabel.Font = Enum.Font.Gotham
    displayNameLabel.TextSize = 14
    displayNameLabel.TextXAlignment = Enum.TextXAlignment.Left
    displayNameLabel.Parent = playerCard
    
    -- Center container
    local centerContainer = Instance.new("Frame")
    centerContainer.Size = UDim2.new(0, 600, 0, 400)
    centerContainer.Position = UDim2.new(0.5, -300, 0.5, -200)
    centerContainer.BackgroundTransparency = 1
    centerContainer.Parent = background
    
    local excalLogo = Instance.new("TextLabel")
    excalLogo.Text = "EXCAL"
    excalLogo.Size = UDim2.new(1, 0, 0, 120)
    excalLogo.Position = UDim2.new(0, 0, 0, 0)
    excalLogo.BackgroundTransparency = 1
    excalLogo.TextColor3 = Color3.fromRGB(0, 200, 255)
    excalLogo.Font = Enum.Font.GothamBold
    excalLogo.TextSize = 100
    excalLogo.TextStrokeTransparency = 0
    excalLogo.TextStrokeColor3 = Color3.fromRGB(100, 0, 200)
    excalLogo.Parent = centerContainer
    
    local excalGradient = Instance.new("UIGradient")
    excalGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 100, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 200, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 50, 200))
    }
    excalGradient.Parent = excalLogo
    
    local tagline = Instance.new("TextLabel")
    tagline.Text = "Making Cheating Fun Again"
    tagline.Size = UDim2.new(1, 0, 0, 40)
    tagline.Position = UDim2.new(0, 0, 0, 130)
    tagline.BackgroundTransparency = 1
    tagline.TextColor3 = Color3.fromRGB(180, 180, 220)
    tagline.Font = Enum.Font.GothamSemibold
    tagline.TextSize = 24
    tagline.Parent = centerContainer
    
    local loadingText = Instance.new("TextLabel")
    loadingText.Text = "▶ Syncing Environment Variables..."
    loadingText.Size = UDim2.new(1, 0, 0, 30)
    loadingText.Position = UDim2.new(0, 0, 0, 200)
    loadingText.BackgroundTransparency = 1
    loadingText.TextColor3 = Color3.fromRGB(200, 200, 255)
    loadingText.Font = Enum.Font.Gotham
    loadingText.TextSize = 18
    loadingText.TextXAlignment = Enum.TextXAlignment.Left
    loadingText.Parent = centerContainer
    
    local loadingCircleContainer = Instance.new("Frame")
    loadingCircleContainer.Size = UDim2.new(0, 150, 0, 150)
    loadingCircleContainer.Position = UDim2.new(0.5, -75, 0, 240)
    loadingCircleContainer.BackgroundTransparency = 1
    loadingCircleContainer.Parent = centerContainer
    
    local loadingCircle = Instance.new("ImageLabel")
    loadingCircle.Size = UDim2.new(1, 0, 1, 0)
    loadingCircle.BackgroundTransparency = 1
    loadingCircle.Image = "rbxasset://textures/ui/LoadingCircle.png"
    loadingCircle.ImageColor3 = Color3.fromRGB(100, 50, 200)
    loadingCircle.Parent = loadingCircleContainer
    
    local percentageText = Instance.new("TextLabel")
    percentageText.Text = "0%"
    percentageText.Size = UDim2.new(1, 0, 1, 0)
    percentageText.BackgroundTransparency = 1
    percentageText.TextColor3 = Color3.fromRGB(255, 255, 255)
    percentageText.Font = Enum.Font.GothamBold
    percentageText.TextSize = 40
    percentageText.Parent = loadingCircleContainer
    
    local pingLabel = Instance.new("TextLabel")
    pingLabel.Text = "🌐 Initializing..."
    pingLabel.Size = UDim2.new(0, 150, 0, 30)
    pingLabel.Position = UDim2.new(0, 50, 1, -80)
    pingLabel.BackgroundTransparency = 1
    pingLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
    pingLabel.Font = Enum.Font.Gotham
    pingLabel.TextSize = 16
    pingLabel.Parent = background
    
    local tipLabel = Instance.new("TextLabel")
    tipLabel.Text = "💡 Tip: Press [INSERT] to toggle menu"
    tipLabel.Size = UDim2.new(1, 0, 0, 30)
    tipLabel.Position = UDim2.new(0, 0, 1, -100)
    tipLabel.BackgroundTransparency = 1
    tipLabel.TextColor3 = Color3.fromRGB(200, 200, 100)
    tipLabel.Font = Enum.Font.Gotham
    tipLabel.TextSize = 16
    tipLabel.Parent = background
    
    local versionLabel = Instance.new("TextLabel")
    versionLabel.Text = "Version 2.1.0 | Build #2500 | Enhanced RGB + Improved Systems"
    versionLabel.Size = UDim2.new(0, 500, 0, 20)
    versionLabel.Position = UDim2.new(0.5, -250, 1, -30)
    versionLabel.BackgroundTransparency = 1
    versionLabel.TextColor3 = Color3.fromRGB(100, 100, 120)
    versionLabel.Font = Enum.Font.Gotham
    versionLabel.TextSize = 12
    versionLabel.Parent = background
    
    -- Spinning loading circle
    spawn(function()
        while loadingCircle.Parent do
            loadingCircle.Rotation = loadingCircle.Rotation + 5
            wait(0.03)
        end
    end)
    
    -- Loading stages
    spawn(function()
        local loadingStages = {
            {text = "▶ Syncing Environment Variables...", duration = 0.3},
            {text = "▶ Loading Core Modules...", duration = 0.4},
            {text = "▶ Initializing ESP System...", duration = 0.3},
            {text = "▶ Configuring Aimbot...", duration = 0.3},
            {text = "▶ Setting up Enhanced Hitbox Expander...", duration = 0.3},
            {text = "▶ Loading Weapon Modifications...", duration = 0.4},
            {text = "▶ Initializing Enhanced RGB System...", duration = 0.3},
            {text = "▶ Loading Backtrack System...", duration = 0.3},
            {text = "▶ Finalizing UI Components...", duration = 0.3},
            {text = "✓ Ready!", duration = 0.2}
        }
        
        local totalStages = #loadingStages
        local currentProgress = 0
        
        for i, stage in ipairs(loadingStages) do
            loadingText.Text = stage.text
            
            local targetProgress = math.floor((i / totalStages) * 100)
            
            while currentProgress < targetProgress do
                currentProgress = currentProgress + math.random(1, 3)
                if currentProgress > targetProgress then
                    currentProgress = targetProgress
                end
                percentageText.Text = currentProgress .. "%"
                wait(0.05)
            end
            
            wait(stage.duration)
        end
        
        pingLabel.Text = "🌐 " .. math.random(15, 45) .. "ms"
        
        wait(0.5)
        
        -- Fade out
        local fadeOut = TweenService:Create(background, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1})
        fadeOut:Play()
        
        for _, child in pairs(background:GetDescendants()) do
            if child:IsA("TextLabel") or child:IsA("ImageLabel") or child:IsA("Frame") then
                if child:IsA("TextLabel") then
                    TweenService:Create(child, TweenInfo.new(0.5), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
                elseif child:IsA("ImageLabel") then
                    TweenService:Create(child, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
                elseif child:IsA("Frame") and child ~= background then
                    TweenService:Create(child, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
                end
            end
        end
        
        fadeOut.Completed:Wait()
        loadingGui:Destroy()
    end)
    
    return loadingGui
end

-- ============================================================================
-- OPTIMIZED ESP SYSTEM
-- ============================================================================

local espCache = {}
local espUpdateRate = 0.1 -- Update every 0.1 seconds instead of every frame
local lastEspUpdate = 0

local function removeChams(character)
    if not character then return end
    if espObjects[character] then
        for _, box in pairs(espObjects[character]) do
            if box and box.Parent then 
                box:Destroy() 
            end
        end
        espObjects[character] = nil
    end
    espCache[character] = nil
end

local function createOrUpdateChams(character)
    if not character then return end
    
    -- Initialize cache for this character if needed
    if not espCache[character] then
        espCache[character] = {
            lastUpdate = 0,
            parts = {}
        }
    end
    
    if not espObjects[character] then 
        espObjects[character] = {} 
    end
    
    -- Only create ESP for important parts (optimization)
    local importantParts = {
        "Head",
        "Torso",
        "HumanoidRootPart",
        "Left Arm",
        "Right Arm",
        "Left Leg",
        "Right Leg",
        -- R15 parts
        "UpperTorso",
        "LowerTorso",
        "LeftUpperArm",
        "RightUpperArm",
        "LeftLowerArm",
        "RightLowerArm",
        "LeftUpperLeg",
        "RightUpperLeg",
        "LeftLowerLeg",
        "RightLowerLeg"
    }
    
    -- Cache character parts to avoid repeated FindFirstChild calls
    if not espCache[character].parts or #espCache[character].parts == 0 then
        for _, partName in ipairs(importantParts) do
            local part = character:FindFirstChild(partName)
            if part and part:IsA("BasePart") then
                table.insert(espCache[character].parts, part)
            end
        end
    end
    
    -- Batch color calculation
    local camera = workspace.CurrentCamera
    local cameraPos = camera.CFrame.Position
    
    for _, part in ipairs(espCache[character].parts) do
        if part and part.Parent then
            local color = Color3.fromRGB(255, 0, 0) -- Default red (not visible)
            
            -- Visibility check (optimized)
            local direction = (part.Position - cameraPos)
            local distance = direction.Magnitude
            
            -- Only do raycast if within reasonable distance (optimization)
            if distance < 500 then
                local raycastParams = RaycastParams.new()
                raycastParams.FilterDescendantsInstances = {player.Character, character}
                raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                raycastParams.IgnoreWater = true
                
                local raycastResult = workspace:Raycast(cameraPos, direction, raycastParams)
                
                if not raycastResult then
                    color = Color3.fromRGB(0, 255, 0) -- Green if visible
                else
                    -- Check if hit the character itself
                    if raycastResult.Instance and raycastResult.Instance:IsDescendantOf(character) then
                        color = Color3.fromRGB(0, 255, 0)
                    end
                end
            end
            
            -- Create or update box
            if not espObjects[character][part] then
                local box = Instance.new("BoxHandleAdornment")
                box.Adornee = part
                box.AlwaysOnTop = true
                box.ZIndex = 10
                box.Size = part.Size
                box.Transparency = 0.5 -- Slightly more transparent for performance
                box.Color3 = color
                box.Parent = part
                espObjects[character][part] = box
            else
                -- Only update color if it changed (optimization)
                if espObjects[character][part].Color3 ~= color then
                    espObjects[character][part].Color3 = color
                end
            end
        end
    end
end

local function updateAllESP()
    local currentTime = tick()
    
    -- Rate limiting - only update at specified rate
    if currentTime - lastEspUpdate < espUpdateRate then
        return
    end
    lastEspUpdate = currentTime
    
    -- Batch process all players
    local activePlayers = {}
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChildOfClass("Humanoid") then
            local humanoid = p.Character:FindFirstChildOfClass("Humanoid")
            if humanoid.Health > 0 then
                table.insert(activePlayers, p)
            end
        end
    end
    
    -- Update ESP for active players
    for _, p in ipairs(activePlayers) do
        if espActive then
            createOrUpdateChams(p.Character)
        else
            removeChams(p.Character)
        end
    end
    
    -- Clean up ESP for players who left or died
    for character, _ in pairs(espObjects) do
        local stillActive = false
        for _, p in ipairs(activePlayers) do
            if p.Character == character then
                stillActive = true
                break
            end
        end
        
        if not stillActive or not espActive then
            removeChams(character)
        end
    end
end

-- Optimized ESP update loop
local espConnection
local function startESP()
    if espConnection then espConnection:Disconnect() end
    
    espConnection = RunService.Heartbeat:Connect(function()
        if espActive then
            updateAllESP()
        end
    end)
end

-- Start ESP system
startESP()

-- Clean up on character death/respawn
player.CharacterAdded:Connect(function()
    task.wait(0.5)
    espCache = {}
    if espActive then
        updateAllESP()
    end
end)

-- Clean up when players leave
Players.PlayerRemoving:Connect(function(p)
    if p.Character then
        removeChams(p.Character)
    end
end)

-- ============================================================================
-- ORBIT SYSTEM
-- ============================================================================

local function startOrbit()
    if orbitConnection then orbitConnection:Disconnect() end
    orbitConnection = RunService.Heartbeat:Connect(function()
        if not orbitActive or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
        
        local hrp = player.Character.HumanoidRootPart
        local center = hrp.Position
        local parts = {}
        
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and (obj.Position - center).Magnitude <= ORBIT_RADIUS then
                table.insert(parts, obj)
            end
        end
        
        local angle = tick() * ORBIT_SPEED
        for i, part in ipairs(parts) do
            local offset = CFrame.new(math.cos(angle + i) * ORBIT_RADIUS, ORBIT_HEIGHT, math.sin(angle + i) * ORBIT_RADIUS)
            part.CFrame = CFrame.new(center) * offset
        end
    end)
end

local function stopOrbit()
    if orbitConnection then orbitConnection:Disconnect() orbitConnection = nil end
end

-- ============================================================================
-- BACKTRACK SYSTEM
-- ============================================================================

local function startBacktrack()
    if backtrackConnection then backtrackConnection:Disconnect() end
    backtrackConnection = RunService.Heartbeat:Connect(function()
        if not backtrackActive and not backtrackEspActive then return end
        
        local now = tick()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = p.Character.HumanoidRootPart
                if not backtrackHistory[p] then backtrackHistory[p] = {} end
                
                table.insert(backtrackHistory[p], {pos = hrp.Position, time = now})
                
                -- Keep only last 1.5 seconds of history
                while #backtrackHistory[p] > 0 and now - backtrackHistory[p][1].time > 1.5 do
                    table.remove(backtrackHistory[p], 1)
                end
            end
        end
    end)
end

local function stopBacktrack()
    if backtrackConnection then backtrackConnection:Disconnect() end
    backtrackConnection = nil
end

local function getBacktrackShotPosition(target)
    if target and backtrackHistory[target] then
        local now = tick()
        for i = #backtrackHistory[target], 1, -1 do
            local data = backtrackHistory[target][i]
            if now - data.time >= backtrackInterval then
                return data.pos
            end
        end
        if #backtrackHistory[target] > 0 then
            return backtrackHistory[target][1].pos
        end
    end
    return nil
end

local function onBacktrackShot(target)
    local shotPos = getBacktrackShotPosition(target)
    if shotPos then
        local tracer = Instance.new("Part")
        tracer.Anchored = true
        tracer.CanCollide = false
        tracer.Size = Vector3.new(0.2, 0.2, 0.2)
        tracer.Color = Color3.fromRGB(255, 0, 0)
        tracer.Material = Enum.Material.Neon
        tracer.Position = shotPos
        tracer.Parent = workspace
        game:GetService("Debris"):AddItem(tracer, 0.3)
    end
end

-- Backtrack ESP visualization
RunService.RenderStepped:Connect(function()
    -- Clean up old ghosts
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character then
            for _, child in pairs(p.Character:GetChildren()) do
                if child.Name == "BacktrackESP_Ghost" then child:Destroy() end
            end
        end
    end
    
    if backtrackEspActive then
        local now = tick()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and backtrackHistory[p] and p.Character then
                local ghostPos = nil
                
                for i = #backtrackHistory[p], 1, -1 do
                    local data = backtrackHistory[p][i]
                    if now - data.time >= backtrackInterval then
                        ghostPos = data.pos
                        break
                    end
                end
                
                if not ghostPos and #backtrackHistory[p] > 0 then
                    ghostPos = backtrackHistory[p][1].pos
                end
                
                if ghostPos then
                    local marker = Instance.new("Part")
                    marker.Name = "BacktrackESP_Ghost"
                    marker.Shape = Enum.PartType.Ball
                    marker.Size = Vector3.new(0.7, 0.7, 0.7)
                    marker.Anchored = true
                    marker.CanCollide = false
                    marker.Color = Color3.fromRGB(255, 220, 0)
                    marker.Material = Enum.Material.Neon
                    marker.Transparency = 0.5
                    marker.Position = ghostPos
                    marker.Parent = p.Character
                end
            end
        end
    end
end)

-- ============================================================================
-- AIMBOT SYSTEM
-- ============================================================================

UserInputService.InputChanged:Connect(function(input, gp)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        mouseMoved = true
        currentTarget = nil
    end
end)

local function getClosestTarget(teamCheck)
    local closestTarget = nil
    local shortestDistance = math.huge
    local camera = workspace.CurrentCamera
    local mouse = player:GetMouse()
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("Head")
           and p.Character:FindFirstChildOfClass("Humanoid")
           and p.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
            
            if (teamCheck and p.Team == player.Team) or (not teamCheck and p.Team ~= player.Team) then
                local screenPos, onScreen = camera:WorldToViewportPoint(p.Character.Head.Position)
                if onScreen then
                    local distance = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude
                    if distance < shortestDistance and distance < 150 then
                        shortestDistance = distance
                        closestTarget = p
                    end
                end
            end
        end
    end
    return closestTarget
end

local function aimAtTarget(target)
    if not target or not target.Character then return end
    local head = target.Character:FindFirstChild("Head")
    if not head then return end
    local camera = workspace.CurrentCamera
    camera.CFrame = CFrame.new(camera.CFrame.Position, head.Position)
end

RunService.RenderStepped:Connect(function()
    if rightMouseDown and (aimbotNormalActive or aimbotTeamCheckActive) then
        if currentTarget == nil then
            if mouseMoved then
                local teamCheck = aimbotTeamCheckActive
                local newTarget = getClosestTarget(teamCheck)
                if newTarget then 
                    currentTarget = newTarget 
                    mouseMoved = false 
                end
            end
        else
            aimAtTarget(currentTarget)
        end
    else 
        currentTarget = nil 
    end
end)

-- ============================================================================
-- CONTINUE TO PART 3 FOR MENU CREATION
-- ============================================================================

print("✓ Part 2 loaded: Loading Screen, ESP, Orbit, Backtrack, and Aimbot systems initialized")

-- EXCAL ENHANCED SCRIPT - PART 3
-- Menu Creation and Button Connections
-- This continues from Part 2

-- ============================================================================
-- MENU CREATION FUNCTION
-- ============================================================================

local function createMenu()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ExcalMenu"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 600, 0, 400)
    mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui
    
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 10)
    uiCorner.Parent = mainFrame
    
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 2
    uiStroke.Color = Color3.fromRGB(0, 180, 255)
    uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uiStroke.Parent = mainFrame
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 50)
    titleBar.Position = UDim2.new(0, 0, 0, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 10)
    titleCorner.Parent = titleBar
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Text = "EXCAL.XYZ"
    titleLabel.Size = UDim2.new(0, 200, 1, 0)
    titleLabel.Position = UDim2.new(0, 15, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 18
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar
    
    local subtitleLabel = Instance.new("TextLabel")
    subtitleLabel.Text = "Press [INSERT] to toggle menu | Enhanced RGB Edition"
    subtitleLabel.Size = UDim2.new(1, -30, 0, 15)
    subtitleLabel.Position = UDim2.new(0, 15, 0, 28)
    subtitleLabel.BackgroundTransparency = 1
    subtitleLabel.TextColor3 = Color3.fromRGB(120, 120, 140)
    subtitleLabel.Font = Enum.Font.Gotham
    subtitleLabel.TextSize = 11
    subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    subtitleLabel.Parent = titleBar
    
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -40, 0, 10)
    closeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    closeButton.Text = "×"
    closeButton.TextColor3 = Color3.fromRGB(200, 200, 220)
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 20
    closeButton.Parent = titleBar
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 6)
    closeCorner.Parent = closeButton
    
    closeButton.MouseButton1Click:Connect(function()
        screenGui.Enabled = false
    end)
    
    -- Side Menu
    local sideMenu = Instance.new("Frame")
    sideMenu.Size = UDim2.new(0, 150, 1, -50)
    sideMenu.Position = UDim2.new(0, 0, 0, 50)
    sideMenu.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    sideMenu.BorderSizePixel = 0
    sideMenu.Parent = mainFrame
    
    -- Content Frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, -150, 1, -50)
    contentFrame.Position = UDim2.new(0, 150, 0, 50)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainFrame
    
    -- ========================================================================
    -- PLAYER CONTENT FRAME
    -- ========================================================================
    
    local playerContent = Instance.new("Frame")
    playerContent.Size = UDim2.new(1, 0, 1, 0)
    playerContent.BackgroundTransparency = 1
    playerContent.Visible = true
    playerContent.Parent = contentFrame
    
    local speedLabel = Instance.new("TextLabel")
    speedLabel.Text = "Walk Speed:"
    speedLabel.Size = UDim2.new(1, -20, 0, 25)
    speedLabel.Position = UDim2.new(0, 10, 0, 10)
    speedLabel.BackgroundTransparency = 1
    speedLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    speedLabel.Font = Enum.Font.GothamSemibold
    speedLabel.TextSize = 14
    speedLabel.TextXAlignment = Enum.TextXAlignment.Left
    speedLabel.Parent = playerContent
    
    local speedInput = Instance.new("TextBox")
    speedInput.Size = UDim2.new(1, -20, 0, 30)
    speedInput.Position = UDim2.new(0, 10, 0, 40)
    speedInput.PlaceholderText = "16 (default)"
    speedInput.Text = "16"
    speedInput.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    speedInput.TextColor3 = Color3.fromRGB(200, 200, 220)
    speedInput.ClearTextOnFocus = false
    speedInput.Font = Enum.Font.Gotham
    speedInput.TextSize = 14
    speedInput.Parent = playerContent
    
    local speedCorner = Instance.new("UICorner")
    speedCorner.CornerRadius = UDim.new(0, 6)
    speedCorner.Parent = speedInput
    
    local applySpeedButton = Instance.new("TextButton")
    applySpeedButton.Size = UDim2.new(1, -20, 0, 35)
    applySpeedButton.Position = UDim2.new(0, 10, 0, 75)
    applySpeedButton.Text = "Apply Speed"
    applySpeedButton.Font = Enum.Font.GothamBold
    applySpeedButton.TextSize = 14
    applySpeedButton.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
    applySpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    applySpeedButton.AutoButtonColor = false
    applySpeedButton.Parent = playerContent
    
    local applySpeedCorner = Instance.new("UICorner")
    applySpeedCorner.CornerRadius = UDim.new(0, 6)
    applySpeedCorner.Parent = applySpeedButton
    
    local flyLabel = Instance.new("TextLabel")
    flyLabel.Text = "Fly Speed:"
    flyLabel.Size = UDim2.new(1, -20, 0, 25)
    flyLabel.Position = UDim2.new(0, 10, 0, 120)
    flyLabel.BackgroundTransparency = 1
    flyLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    flyLabel.Font = Enum.Font.GothamSemibold
    flyLabel.TextSize = 14
    flyLabel.TextXAlignment = Enum.TextXAlignment.Left
    flyLabel.Parent = playerContent
    
    local flyInput = Instance.new("TextBox")
    flyInput.Size = UDim2.new(1, -20, 0, 30)
    flyInput.Position = UDim2.new(0, 10, 0, 150)
    flyInput.PlaceholderText = "30"
    flyInput.Text = "30"
    flyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    flyInput.TextColor3 = Color3.fromRGB(200, 200, 220)
    flyInput.ClearTextOnFocus = false
    flyInput.Font = Enum.Font.Gotham
    flyInput.TextSize = 14
    flyInput.Parent = playerContent
    
    local flyCorner = Instance.new("UICorner")
    flyCorner.CornerRadius = UDim.new(0, 6)
    flyCorner.Parent = flyInput
    
    local applyFlyButton = Instance.new("TextButton")
    applyFlyButton.Size = UDim2.new(1, -20, 0, 35)
    applyFlyButton.Position = UDim2.new(0, 10, 0, 185)
    applyFlyButton.Text = "Toggle Fly"
    applyFlyButton.Font = Enum.Font.GothamBold
    applyFlyButton.TextSize = 14
    applyFlyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
    applyFlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    applyFlyButton.AutoButtonColor = false
    applyFlyButton.Parent = playerContent
    
    local applyFlyCorner = Instance.new("UICorner")
    applyFlyCorner.CornerRadius = UDim.new(0, 6)
    applyFlyCorner.Parent = applyFlyButton
    
    -- ========================================================================
    -- WEAPON CONTENT FRAME
    -- ========================================================================
    
    local weaponContent = Instance.new("ScrollingFrame")
    weaponContent.Size = UDim2.new(1, 0, 1, 0)
    weaponContent.CanvasSize = UDim2.new(0, 0, 0, 500)
    weaponContent.ScrollBarThickness = 5
    weaponContent.BackgroundTransparency = 1
    weaponContent.Visible = false
    weaponContent.Parent = contentFrame
    
    local weaponButtonY = 10
    local function addWeaponButton(txt)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -20, 0, 40)
        btn.Position = UDim2.new(0, 10, 0, weaponButtonY)
        btn.Text = txt
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        btn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        btn.TextColor3 = Color3.fromRGB(180, 180, 200)
        btn.AutoButtonColor = false
        btn.Parent = weaponContent
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = btn
        
        local stroke = Instance.new("UIStroke")
        stroke.Thickness = 1.5
        stroke.Color = Color3.fromRGB(80, 80, 120)
        stroke.Transparency = 0.5
        stroke.Parent = btn
        
        weaponButtonY = weaponButtonY + 50
        return btn
    end
    
    local infiniteAmmoButton = addWeaponButton("Infinite Ammo")
    local fastReloadButton = addWeaponButton("Fast Reload")
    local fastFireRateButton = addWeaponButton("Fast Fire Rate")
    local alwaysAutoButton = addWeaponButton("Always Auto")
    local noSpreadButton = addWeaponButton("No Spread")
    local noRecoilButton = addWeaponButton("No Recoil")
    
    local weaponInfoLabel = Instance.new("TextLabel")
    weaponInfoLabel.Text = "⚠️ Weapon mods work on most FPS games\nResults may vary by game\nToggle features ON to activate"
    weaponInfoLabel.Size = UDim2.new(1, -20, 0, 80)
    weaponInfoLabel.Position = UDim2.new(0, 10, 0, weaponButtonY)
    weaponInfoLabel.BackgroundColor3 = Color3.fromRGB(40, 30, 60)
    weaponInfoLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    weaponInfoLabel.Font = Enum.Font.Gotham
    weaponInfoLabel.TextSize = 12
    weaponInfoLabel.TextWrapped = true
    weaponInfoLabel.TextYAlignment = Enum.TextYAlignment.Top
    weaponInfoLabel.Parent = weaponContent
    
    local weaponInfoCorner = Instance.new("UICorner")
    weaponInfoCorner.CornerRadius = UDim.new(0, 8)
    weaponInfoCorner.Parent = weaponInfoLabel
    
    -- ========================================================================
    -- MISC CONTENT FRAME
    -- ========================================================================
    
    local miscContent = Instance.new("ScrollingFrame")
    miscContent.Size = UDim2.new(1, 0, 1, 0)
    miscContent.CanvasSize = UDim2.new(0, 0, 0, 800)
    miscContent.ScrollBarThickness = 5
    miscContent.BackgroundTransparency = 1
    miscContent.Visible = false
    miscContent.Parent = contentFrame
    
    local buttonY = 10
    local function addMiscButton(txt)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -20, 0, 35)
        btn.Position = UDim2.new(0, 10, 0, buttonY)
        btn.Text = txt
        btn.Font = Enum.Font.GothamSemibold
        btn.TextSize = 13
        btn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        btn.TextColor3 = Color3.fromRGB(180, 180, 200)
        btn.AutoButtonColor = false
        btn.Parent = miscContent
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = btn
        
        local stroke = Instance.new("UIStroke")
        stroke.Thickness = 1.5
        stroke.Color = Color3.fromRGB(80, 80, 120)
        stroke.Transparency = 0.5
        stroke.Parent = btn
        
        buttonY = buttonY + 40
        return btn
    end
    
    local espActivateButton = addMiscButton("Toggle ESP")
    local aimbotTeamCheckButton = addMiscButton("Aimbot (No Team Check)")
    local aimbotNormalButton = addMiscButton("Aimbot (Team Check)")
    local orbitButton = addMiscButton("Orbit Nearby Parts")
    
    -- Hitbox Expander Section
    local hitboxExpanderButton = addMiscButton("Toggle Hitbox Expander")
    
    local hitboxSizeLabel = Instance.new("TextLabel")
    hitboxSizeLabel.Text = "Hitbox Size (Multiplier):"
    hitboxSizeLabel.Size = UDim2.new(1, -20, 0, 25)
    hitboxSizeLabel.Position = UDim2.new(0, 10, 0, buttonY)
    hitboxSizeLabel.BackgroundTransparency = 1
    hitboxSizeLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    hitboxSizeLabel.Font = Enum.Font.GothamSemibold
    hitboxSizeLabel.TextSize = 13
    hitboxSizeLabel.TextXAlignment = Enum.TextXAlignment.Left
    hitboxSizeLabel.Parent = miscContent
    buttonY = buttonY + 30
    
    local hitboxSizeInput = Instance.new("TextBox")
    hitboxSizeInput.Size = UDim2.new(1, -20, 0, 30)
    hitboxSizeInput.Position = UDim2.new(0, 10, 0, buttonY)
    hitboxSizeInput.PlaceholderText = "2 (1x to 10x)"
    hitboxSizeInput.Text = "2"
    hitboxSizeInput.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    hitboxSizeInput.TextColor3 = Color3.fromRGB(200, 200, 220)
    hitboxSizeInput.ClearTextOnFocus = false
    hitboxSizeInput.Font = Enum.Font.Gotham
    hitboxSizeInput.TextSize = 13
    hitboxSizeInput.Parent = miscContent
    
    local hitboxSizeCorner = Instance.new("UICorner")
    hitboxSizeCorner.CornerRadius = UDim.new(0, 6)
    hitboxSizeCorner.Parent = hitboxSizeInput
    buttonY = buttonY + 35
    
    local hitboxTransparencyLabel = Instance.new("TextLabel")
    hitboxTransparencyLabel.Text = "Hitbox Transparency:"
    hitboxTransparencyLabel.Size = UDim2.new(1, -20, 0, 25)
    hitboxTransparencyLabel.Position = UDim2.new(0, 10, 0, buttonY)
    hitboxTransparencyLabel.BackgroundTransparency = 1
    hitboxTransparencyLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    hitboxTransparencyLabel.Font = Enum.Font.GothamSemibold
    hitboxTransparencyLabel.TextSize = 13
    hitboxTransparencyLabel.TextXAlignment = Enum.TextXAlignment.Left
    hitboxTransparencyLabel.Parent = miscContent
    buttonY = buttonY + 30
    
    local hitboxTransparencyInput = Instance.new("TextBox")
    hitboxTransparencyInput.Size = UDim2.new(1, -20, 0, 30)
    hitboxTransparencyInput.Position = UDim2.new(0, 10, 0, buttonY)
    hitboxTransparencyInput.PlaceholderText = "0.7 (0 to 1)"
    hitboxTransparencyInput.Text = "0.7"
    hitboxTransparencyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    hitboxTransparencyInput.TextColor3 = Color3.fromRGB(200, 200, 220)
    hitboxTransparencyInput.ClearTextOnFocus = false
    hitboxTransparencyInput.Font = Enum.Font.Gotham
    hitboxTransparencyInput.TextSize = 13
    hitboxTransparencyInput.Parent = miscContent
    
    local hitboxTransCorner = Instance.new("UICorner")
    hitboxTransCorner.CornerRadius = UDim.new(0, 6)
    hitboxTransCorner.Parent = hitboxTransparencyInput
    buttonY = buttonY + 35
    
    -- Backtrack Section
    local backtrackButton = addMiscButton("Toggle Backtrack")
    local backtrackEspButton = addMiscButton("Toggle Backtrack ESP")
    local backtrackShotButton = addMiscButton("Backtrack Shot")
    local teamCheckButton = addMiscButton("Backtrack Target: All")
    
    local backtrackLabel = Instance.new("TextLabel")
    backtrackLabel.Text = "Backtrack ms:"
    backtrackLabel.Size = UDim2.new(1, -20, 0, 25)
    backtrackLabel.Position = UDim2.new(0, 10, 0, buttonY)
    backtrackLabel.BackgroundTransparency = 1
    backtrackLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    backtrackLabel.Font = Enum.Font.GothamSemibold
    backtrackLabel.TextSize = 13
    backtrackLabel.TextXAlignment = Enum.TextXAlignment.Left
    backtrackLabel.Parent = miscContent
    buttonY = buttonY + 30
    
    local backtrackInput = Instance.new("TextBox")
    backtrackInput.Size = UDim2.new(1, -20, 0, 30)
    backtrackInput.Position = UDim2.new(0, 10, 0, buttonY)
    backtrackInput.PlaceholderText = "200"
    backtrackInput.Text = tostring(backtrackInterval * 1000)
    backtrackInput.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    backtrackInput.TextColor3 = Color3.fromRGB(200, 200, 220)
    backtrackInput.ClearTextOnFocus = false
    backtrackInput.Font = Enum.Font.Gotham
    backtrackInput.TextSize = 13
    backtrackInput.Parent = miscContent
    
    local backtrackCorner = Instance.new("UICorner")
    backtrackCorner.CornerRadius = UDim.new(0, 6)
    backtrackCorner.Parent = backtrackInput
    buttonY = buttonY + 35
    
    local backtrackDropdown = Instance.new("Frame")
    backtrackDropdown.Size = UDim2.new(1, -20, 0, 60)
    backtrackDropdown.Position = UDim2.new(0, 10, 0, buttonY)
    backtrackDropdown.BackgroundTransparency = 1
    backtrackDropdown.Parent = miscContent
    buttonY = buttonY + 65
    
    local dropdownLabel = Instance.new("TextLabel")
    dropdownLabel.Text = "Select Backtrack Target:"
    dropdownLabel.Size = UDim2.new(1, 0, 0, 20)
    dropdownLabel.BackgroundTransparency = 1
    dropdownLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    dropdownLabel.Font = Enum.Font.GothamSemibold
    dropdownLabel.TextSize = 13
    dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
    dropdownLabel.Parent = backtrackDropdown
    
    local targetList = Instance.new("ScrollingFrame")
    targetList.Size = UDim2.new(1, 0, 0, 40)
    targetList.Position = UDim2.new(0, 0, 0, 20)
    targetList.BackgroundTransparency = 1
    targetList.ScrollBarThickness = 5
    targetList.CanvasSize = UDim2.new(0, 0, 0, 40)
    targetList.Parent = backtrackDropdown
    
    -- ========================================================================
    -- HOVER EFFECTS
    -- ========================================================================
    
    local function addButtonHover(btn)
        btn.MouseEnter:Connect(function()
            if not btn:FindFirstChild("RGBActive") then
                TweenService:Create(btn, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(50, 50, 75)
                }):Play()
                local stroke = btn:FindFirstChild("UIStroke")
                if stroke then
                    TweenService:Create(stroke, TweenInfo.new(0.2), {
                        Color = Color3.fromRGB(120, 120, 180),
                        Transparency = 0.3
                    }):Play()
                end
            end
        end)
        
        btn.MouseLeave:Connect(function()
            if not btn:FindFirstChild("RGBActive") then
                TweenService:Create(btn, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(30, 30, 45)
                }):Play()
                local stroke = btn:FindFirstChild("UIStroke")
                if stroke then
                    TweenService:Create(stroke, TweenInfo.new(0.2), {
                        Color = Color3.fromRGB(80, 80, 120),
                        Transparency = 0.5
                    }):Play()
                end
            end
        end)
    end
    
    -- Add hover effects to all buttons
    for _, btn in pairs({infiniteAmmoButton, fastReloadButton, fastFireRateButton, 
                         alwaysAutoButton, noSpreadButton, noRecoilButton}) do
        addButtonHover(btn)
    end
    
    for _, btn in pairs({espActivateButton, aimbotNormalButton, aimbotTeamCheckButton, orbitButton, 
                         hitboxExpanderButton, backtrackButton, backtrackEspButton, backtrackShotButton, 
                         teamCheckButton}) do
        addButtonHover(btn)
    end
    
    applySpeedButton.MouseEnter:Connect(function()
        TweenService:Create(applySpeedButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(0, 170, 240)
        }):Play()
    end)
    applySpeedButton.MouseLeave:Connect(function()
        TweenService:Create(applySpeedButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(0, 150, 220)
        }):Play()
    end)
    
    applyFlyButton.MouseEnter:Connect(function()
        TweenService:Create(applyFlyButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(0, 170, 240)
        }):Play()
    end)
    applyFlyButton.MouseLeave:Connect(function()
        TweenService:Create(applyFlyButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(0, 150, 220)
        }):Play()
    end)
    
    -- ========================================================================
    -- CONTINUE TO PART 4 FOR BUTTON CONNECTIONS
    -- ========================================================================
    
    return screenGui, {
        -- Player buttons
        applySpeedButton = applySpeedButton,
        speedInput = speedInput,
        applyFlyButton = applyFlyButton,
        flyInput = flyInput,
        -- Weapon buttons
        infiniteAmmoButton = infiniteAmmoButton,
        fastReloadButton = fastReloadButton,
        fastFireRateButton = fastFireRateButton,
        alwaysAutoButton = alwaysAutoButton,
        noSpreadButton = noSpreadButton,
        noRecoilButton = noRecoilButton,
        -- Misc buttons
        espActivateButton = espActivateButton,
        aimbotNormalButton = aimbotNormalButton,
        aimbotTeamCheckButton = aimbotTeamCheckButton,
        orbitButton = orbitButton,
        hitboxExpanderButton = hitboxExpanderButton,
        hitboxSizeInput = hitboxSizeInput,
        hitboxTransparencyInput = hitboxTransparencyInput,
        backtrackButton = backtrackButton,
        backtrackEspButton = backtrackEspButton,
        backtrackShotButton = backtrackShotButton,
        teamCheckButton = teamCheckButton,
        backtrackInput = backtrackInput,
        targetList = targetList,
        -- Tabs
        playerButton = nil, -- Will be created in Part 4
        weaponButton = nil,
        miscButton = nil,
        playerContent = playerContent,
        weaponContent = weaponContent,
        miscContent = miscContent,
        sideMenu = sideMenu
    }
end

print("✓ Part 3 loaded: Menu UI created, ready for button connections")

-- EXCAL ENHANCED SCRIPT - PART 4 (FINAL)
-- Button Connections, Tab Navigation, and Initialization
-- This continues from Part 3 and completes the script

-- ============================================================================
-- BUTTON CONNECTIONS AND FUNCTIONALITY
-- ============================================================================

local function connectButtons(gui, elements)
    
    -- ========================================================================
    -- WEAPON BUTTON CONNECTIONS
    -- ========================================================================
    
    elements.infiniteAmmoButton.MouseButton1Click:Connect(function()
        infiniteAmmoActive = not infiniteAmmoActive
        setButtonActive(elements.infiniteAmmoButton, infiniteAmmoActive)
        
        if infiniteAmmoActive then
            startWeaponModifications()
        end
    end)
    
    elements.fastReloadButton.MouseButton1Click:Connect(function()
        fastReloadActive = not fastReloadActive
        setButtonActive(elements.fastReloadButton, fastReloadActive)
        
        if fastReloadActive then
            startWeaponModifications()
        end
    end)
    
    elements.fastFireRateButton.MouseButton1Click:Connect(function()
        fastFireRateActive = not fastFireRateActive
        setButtonActive(elements.fastFireRateButton, fastFireRateActive)
        
        if fastFireRateActive then
            startWeaponModifications()
        end
    end)
    
    elements.alwaysAutoButton.MouseButton1Click:Connect(function()
        alwaysAutoActive = not alwaysAutoActive
        setButtonActive(elements.alwaysAutoButton, alwaysAutoActive)
        
        if alwaysAutoActive then
            startWeaponModifications()
        end
    end)
    
    elements.noSpreadButton.MouseButton1Click:Connect(function()
        noSpreadActive = not noSpreadActive
        setButtonActive(elements.noSpreadButton, noSpreadActive)
        
        if noSpreadActive then
            startWeaponModifications()
        end
    end)
    
    elements.noRecoilButton.MouseButton1Click:Connect(function()
        noRecoilActive = not noRecoilActive
        setButtonActive(elements.noRecoilButton, noRecoilActive)
        
        if noRecoilActive then
            startWeaponModifications()
        end
    end)
    
    -- ========================================================================
    -- MISC BUTTON CONNECTIONS
    -- ========================================================================
    
    elements.espActivateButton.MouseButton1Click:Connect(function()
        espActive = not espActive
        setButtonActive(elements.espActivateButton, espActive)
        updateAllESP()
    end)
    
    elements.aimbotNormalButton.MouseButton1Click:Connect(function()
        aimbotNormalActive = not aimbotNormalActive
        if aimbotNormalActive then aimbotTeamCheckActive = false end
        setButtonActive(elements.aimbotNormalButton, aimbotNormalActive)
        setButtonActive(elements.aimbotTeamCheckButton, aimbotTeamCheckActive)
    end)
    
    elements.aimbotTeamCheckButton.MouseButton1Click:Connect(function()
        aimbotTeamCheckActive = not aimbotTeamCheckActive
        if aimbotTeamCheckActive then aimbotNormalActive = false end
        setButtonActive(elements.aimbotTeamCheckButton, aimbotTeamCheckActive)
        setButtonActive(elements.aimbotNormalButton, aimbotNormalActive)
    end)
    
    elements.orbitButton.MouseButton1Click:Connect(function()
        orbitActive = not orbitActive
        setButtonActive(elements.orbitButton, orbitActive)
        if orbitActive then startOrbit() else stopOrbit() end
    end)
    
    -- Hitbox Expander
    elements.hitboxExpanderButton.MouseButton1Click:Connect(function()
        hitboxExpanderActive = not hitboxExpanderActive
        setButtonActive(elements.hitboxExpanderButton, hitboxExpanderActive)
        
        if hitboxExpanderActive then
            startHitboxMonitoring()
            updateAllHitboxes()
        else
            stopHitboxMonitoring()
            updateAllHitboxes()
        end
    end)
    
    elements.hitboxSizeInput.FocusLost:Connect(function(enterPressed)
        local size = tonumber(elements.hitboxSizeInput.Text)
        if size and size > 0 and size <= 10 then
            hitboxMultiplier = size
            if hitboxExpanderActive then
                -- Restore all first
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= player and p.Character then
                        restoreHitbox(p.Character)
                    end
                end
                -- Then reapply with new size
                updateAllHitboxes()
            end
        else
            elements.hitboxSizeInput.Text = tostring(hitboxMultiplier)
        end
    end)
    
    elements.hitboxTransparencyInput.FocusLost:Connect(function(enterPressed)
        local transparency = tonumber(elements.hitboxTransparencyInput.Text)
        if transparency and transparency >= 0 and transparency <= 1 then
            hitboxTransparency = transparency
            if hitboxExpanderActive then
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= player and p.Character then
                        local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                        if hrp and originalHitboxSizes[p.Character] then
                            hrp.Transparency = hitboxTransparency
                        end
                    end
                end
            end
        else
            elements.hitboxTransparencyInput.Text = tostring(hitboxTransparency)
        end
    end)
    
    -- Backtrack
    elements.backtrackButton.MouseButton1Click:Connect(function()
        backtrackActive = not backtrackActive
        setButtonActive(elements.backtrackButton, backtrackActive)
        if backtrackActive or backtrackEspActive then
            startBacktrack()
        else
            stopBacktrack()
        end
    end)
    
    elements.backtrackInput.FocusLost:Connect(function(enterPressed)
        local ms = tonumber(elements.backtrackInput.Text)
        if ms and ms > 0 then
            backtrackInterval = ms / 1000
            if backtrackConnection then
                stopBacktrack()
                startBacktrack()
            end
        end
    end)
    
    elements.backtrackEspButton.MouseButton1Click:Connect(function()
        backtrackEspActive = not backtrackEspActive
        setButtonActive(elements.backtrackEspButton, backtrackEspActive)
        if backtrackActive or backtrackEspActive then
            startBacktrack()
        else
            stopBacktrack()
        end
    end)
    
    elements.backtrackShotButton.MouseButton1Click:Connect(function()
        if backtrackShotTarget then
            onBacktrackShot(backtrackShotTarget)
        end
    end)
    
    -- Backtrack target mode
    local teamModes = {"All","Enemy","Ally"}
    elements.teamCheckButton.MouseButton1Click:Connect(function()
        local i = table.find(teamModes, backtrackTargetTeamMode)
        local nextMode = teamModes[(i % #teamModes) + 1]
        backtrackTargetTeamMode = nextMode
        elements.teamCheckButton.Text = "Backtrack Target: " .. nextMode
        updateBacktrackTargetList(elements.targetList)
    end)
    
    -- ========================================================================
    -- PLAYER BUTTON CONNECTIONS
    -- ========================================================================
    
    elements.applySpeedButton.MouseButton1Click:Connect(function()
        local speed = tonumber(elements.speedInput.Text)
        if speed and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = speed
        end
    end)
    
    elements.applyFlyButton.MouseButton1Click:Connect(function()
        local speed = tonumber(elements.flyInput.Text) or 30
        flySpeedValue = speed
        flyActive = not flyActive
        setButtonActive(elements.applyFlyButton, flyActive)
        
        if flyActive then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if hrp and humanoid then
                if flyConnection then flyConnection:Disconnect() end
                flyConnection = RunService.Heartbeat:Connect(function()
                    if not flyActive then return end
                    local moveDir = Vector3.new()
                    local camCF = workspace.CurrentCamera.CFrame
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCF.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCF.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCF.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCF.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0, 1, 0) end
                    hrp.Velocity = moveDir.Magnitude > 0 and moveDir.Unit * speed or Vector3.new(0,0,0)
                    humanoid.PlatformStand = true
                end)
            end
        else
            if flyConnection then flyConnection:Disconnect() flyConnection = nil end
            local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then humanoid.PlatformStand = false end
        end
    end)
end

-- ============================================================================
-- BACKTRACK TARGET LIST UPDATE
-- ============================================================================

local function updateBacktrackTargetList(targetList)
    targetList:ClearAllChildren()
    local xOffset = 0
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player then
            local show = false
            if backtrackTargetTeamMode == "All" then show = true
            elseif backtrackTargetTeamMode == "Enemy" then show = p.Team ~= player.Team
            elseif backtrackTargetTeamMode == "Ally" then show = p.Team == player.Team
            end
            if show then
                local btn = Instance.new("TextButton")
                btn.Text = p.Name
                btn.Size = UDim2.new(0, 100, 1, 0)
                btn.Position = UDim2.new(0, xOffset, 0, 0)
                btn.BackgroundColor3 = (backtrackShotTarget == p) and Color3.fromRGB(0, 150, 220) or Color3.fromRGB(30, 30, 45)
                btn.TextColor3 = Color3.fromRGB(200,200,220)
                btn.Font = Enum.Font.GothamSemibold
                btn.TextSize = 12
                btn.Parent = targetList
                
                local btnCorner = Instance.new("UICorner")
                btnCorner.CornerRadius = UDim.new(0, 6)
                btnCorner.Parent = btn
                
                btn.MouseButton1Click:Connect(function()
                    backtrackShotTarget = p
                    updateBacktrackTargetList(targetList)
                end)
                xOffset = xOffset + 105
            end
        end
    end
    targetList.CanvasSize = UDim2.new(0, xOffset, 0, 40)
end

-- ============================================================================
-- TAB NAVIGATION
-- ============================================================================

local function setupTabNavigation(elements)
    local playerButton = Instance.new("TextButton")
    playerButton.Size = UDim2.new(1, 0, 0, 40)
    playerButton.Position = UDim2.new(0, 0, 0, 0)
    playerButton.Text = "PLAYER"
    playerButton.Font = Enum.Font.GothamBold
    playerButton.TextSize = 13
    playerButton.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
    playerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    playerButton.AutoButtonColor = false
    playerButton.Parent = elements.sideMenu
    
    local weaponButton = Instance.new("TextButton")
    weaponButton.Size = UDim2.new(1, 0, 0, 40)
    weaponButton.Position = UDim2.new(0, 0, 0, 45)
    weaponButton.Text = "WEAPON"
    weaponButton.Font = Enum.Font.GothamBold
    weaponButton.TextSize = 13
    weaponButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    weaponButton.TextColor3 = Color3.fromRGB(180, 180, 200)
    weaponButton.AutoButtonColor = false
    weaponButton.Parent = elements.sideMenu
    
    local miscButton = Instance.new("TextButton")
    miscButton.Size = UDim2.new(1, 0, 0, 40)
    miscButton.Position = UDim2.new(0, 0, 0, 90)
    miscButton.Text = "MISC"
    miscButton.Font = Enum.Font.GothamBold
    miscButton.TextSize = 13
    miscButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    miscButton.TextColor3 = Color3.fromRGB(180, 180, 200)
    miscButton.AutoButtonColor = false
    miscButton.Parent = elements.sideMenu
    
    playerButton.MouseButton1Click:Connect(function()
        elements.playerContent.Visible = true
        elements.weaponContent.Visible = false
        elements.miscContent.Visible = false
        playerButton.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
        playerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        weaponButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        weaponButton.TextColor3 = Color3.fromRGB(180, 180, 200)
        miscButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        miscButton.TextColor3 = Color3.fromRGB(180, 180, 200)
    end)
    
    weaponButton.MouseButton1Click:Connect(function()
        elements.playerContent.Visible = false
        elements.weaponContent.Visible = true
        elements.miscContent.Visible = false
        weaponButton.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
        weaponButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        playerButton.TextColor3 = Color3.fromRGB(180, 180, 200)
        miscButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        miscButton.TextColor3 = Color3.fromRGB(180, 180, 200)
    end)
    
    miscButton.MouseButton1Click:Connect(function()
        elements.playerContent.Visible = false
        elements.weaponContent.Visible = false
        elements.miscContent.Visible = true
        miscButton.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
        miscButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        playerButton.TextColor3 = Color3.fromRGB(180, 180, 200)
        weaponButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        weaponButton.TextColor3 = Color3.fromRGB(180, 180, 200)
    end)
end

-- ============================================================================
-- INPUT HANDLING (KEYBINDS)
-- ============================================================================

local function setupInputHandling(screenGui)
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.UserInputType == Enum.UserInputType.MouseButton2 then 
            rightMouseDown = true 
        end
        
        if input.KeyCode == Enum.KeyCode.Insert then 
            screenGui.Enabled = not screenGui.Enabled
        elseif input.KeyCode == Enum.KeyCode.M then 
            screenGui.Enabled = not screenGui.Enabled
        elseif input.KeyCode == Enum.KeyCode.X then 
            screenGui.Enabled = false
        elseif input.KeyCode == Enum.KeyCode.C then 
            screenGui.Enabled = not screenGui.Enabled
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType == Enum.UserInputType.MouseButton2 then 
            rightMouseDown = false 
            currentTarget = nil 
        end
    end)
end

-- ============================================================================
-- PLAYER EVENT HANDLERS
-- ============================================================================

local function setupPlayerEventHandlers()
    -- Handle new players joining
    Players.PlayerAdded:Connect(function(p)
        p.CharacterAdded:Connect(function(char)
            wait(0.5)
            if hitboxExpanderActive then
                expandHitbox(char)
            end
        end)
        
        -- Update backtrack target list when players join/leave
        task.wait(0.1)
        if _G.ExcalTargetList then
            updateBacktrackTargetList(_G.ExcalTargetList)
        end
    end)
    
    -- Handle existing players respawning
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player then
            p.CharacterAdded:Connect(function(char)
                wait(0.5)
                if hitboxExpanderActive then
                    expandHitbox(char)
                end
            end)
        end
    end
    
    -- Update target list when players leave
    Players.PlayerRemoving:Connect(function()
        task.wait(0.1)
        if _G.ExcalTargetList then
            updateBacktrackTargetList(_G.ExcalTargetList)
        end
    end)
end

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

local function initialize()
    print("🚀 Excal Enhanced Script - Initializing...")
    
    -- Create loading screen
    createLoadingScreen()
    wait(4) -- Loading screen duration
    
    -- Create menu and get elements
    local screenGui, elements = createMenu()
    
    -- Store target list globally for event handlers
    _G.ExcalTargetList = elements.targetList
    
    -- Setup tab navigation
    setupTabNavigation(elements)
    
    -- Connect all buttons
    connectButtons(screenGui, elements)
    
    -- Initialize backtrack target list
    updateBacktrackTargetList(elements.targetList)
    
    -- Setup input handling
    setupInputHandling(screenGui)
    
    -- Setup player event handlers
    setupPlayerEventHandlers()
    
    print("✅ Excal Enhanced Script Loaded Successfully!")
    print("📋 Features:")
    print("   • Enhanced RGB Effects on active buttons")
    print("   • Optimized ESP (10 FPS update rate, parts caching)")
    print("   • Fixed Hitbox Expander with persistent monitoring")
    print("   • Improved Weapon Modifications (all 6 features)")
    print("   • ESP with visibility detection")
    print("   • Aimbot with team check options")
    print("   • Backtrack system with ESP visualization")
    print("   • Orbit nearby parts")
    print("   • Fly mode")
    print("   • Custom walk speed")
    print("")
    print("⌨️ Keybinds:")
    print("   • INSERT/M/C - Toggle menu")
    print("   • X - Hide menu")
    print("   • Right Mouse - Activate aimbot (when enabled)")
    print("")
    print("🎨 RGB Status: Active on all toggled features!")
    print("⚡ Performance: ESP optimized for 10 FPS with caching")
end

-- Run initialization
initialize()



    else
        verify.Text = "INVALID KEY"
        verify.BackgroundColor3 = Color3.fromRGB(200,60,60)
        task.wait(0.8)
        verify.Text = "VERIFY"
        verify.BackgroundColor3 = Color3.fromRGB(140,80,220)
        box.Text = ""
    end
end)

-- GÜVENLİK: KEY OLMADAN KOD ÇALIŞMASIN
while not unlocked do
    task.wait()
end
