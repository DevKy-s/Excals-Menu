-- ExcalMenu LocalScript (CPU Friendly, ESP, Backtracking, Aimbot, Backtrack ESP & Shot, Team Filter, Resizable, Debugged, Hitbox Expander/Hider)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local espObjects = {}
local espActive = false
local orbitActive = false
local orbitConnection = nil
local ORBIT_RADIUS = 15
local ORBIT_HEIGHT = 2
local ORBIT_SPEED = 2
local aimbotNormalActive = false
local aimbotTeamCheckActive = false
local rightMouseDown = false
local currentTarget = nil
local mouseMoved = false
local flyActive = false
local flyConnection = nil
local flySpeedValue = 30

-- Hitbox variables
local hitboxExpanderActive = false
local hitboxMultiplier = 2
local hitboxTransparency = 0.7
local originalHitboxSizes = {}

-- Backtracking variables & settings
local backtrackActive = false
local backtrackInterval = 0.2
local backtrackHistory = {}
local backtrackConnection = nil
local backtrackEspActive = false
local backtrackShotTarget = nil
local backtrackTargetTeamMode = "All"

local function setButtonActive(button, isActive)
    if isActive then
        button.BackgroundColor3 = Color3.fromRGB(120, 80, 210)
        button.TextColor3 = Color3.fromRGB(220, 220, 255)
    else
        button.BackgroundColor3 = Color3.fromRGB(60, 30, 120)
        button.TextColor3 = Color3.fromRGB(180, 180, 220)
    end
end

local function makeFuturisticButton(btn)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    local s = Instance.new("UIStroke")
    s.Thickness = 1.5
    s.Color = Color3.fromRGB(0, 200, 255)
    s.Parent = btn
end

-- Loading Screen Function
local function createLoadingScreen()
    local loadingGui = Instance.new("ScreenGui")
    loadingGui.Name = "ExcalLoadingScreen"
    loadingGui.ResetOnSpawn = false
    loadingGui.IgnoreGuiInset = true
    loadingGui.DisplayOrder = 999
    loadingGui.Parent = player:WaitForChild("PlayerGui")
    
    -- Background
    local background = Instance.new("Frame")
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    background.BorderSizePixel = 0
    background.Parent = loadingGui
    
    -- Animated Grid Pattern
    local gridPattern = Instance.new("Frame")
    gridPattern.Size = UDim2.new(1, 0, 1, 0)
    gridPattern.BackgroundTransparency = 1
    gridPattern.Parent = background
    
    -- Create grid lines
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
    
    -- Player Info Card (Top Right)
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
    
    -- Player Avatar (Circle)
    local avatarFrame = Instance.new("Frame")
    avatarFrame.Size = UDim2.new(0, 60, 0, 60)
    avatarFrame.Position = UDim2.new(0, 10, 0.5, -30)
    avatarFrame.BackgroundColor3 = Color3.fromRGB(100, 50, 200)
    avatarFrame.Parent = playerCard
    
    local avatarCorner = Instance.new("UICorner")
    avatarCorner.CornerRadius = UDim.new(1, 0)
    avatarCorner.Parent = avatarFrame
    
    -- Player Avatar Image
    local avatarImage = Instance.new("ImageLabel")
    avatarImage.Size = UDim2.new(1, -6, 1, -6)
    avatarImage.Position = UDim2.new(0, 3, 0, 3)
    avatarImage.BackgroundTransparency = 1
    avatarImage.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    avatarImage.Parent = avatarFrame
    
    local avatarImageCorner = Instance.new("UICorner")
    avatarImageCorner.CornerRadius = UDim.new(1, 0)
    avatarImageCorner.Parent = avatarImage
    
    -- Player Name
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
    
    -- Player Display Name
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
    
    -- Center Container
    local centerContainer = Instance.new("Frame")
    centerContainer.Size = UDim2.new(0, 600, 0, 400)
    centerContainer.Position = UDim2.new(0.5, -300, 0.5, -200)
    centerContainer.BackgroundTransparency = 1
    centerContainer.Parent = background
    
    -- EXCAL Logo (Big Text)
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
    
    -- Gradient effect on EXCAL
    local excalGradient = Instance.new("UIGradient")
    excalGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 100, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 200, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 50, 200))
    }
    excalGradient.Parent = excalLogo
    
    -- Tagline
    local tagline = Instance.new("TextLabel")
    tagline.Text = "Making Cheating Fun Again"
    tagline.Size = UDim2.new(1, 0, 0, 40)
    tagline.Position = UDim2.new(0, 0, 0, 130)
    tagline.BackgroundTransparency = 1
    tagline.TextColor3 = Color3.fromRGB(180, 180, 220)
    tagline.Font = Enum.Font.GothamSemibold
    tagline.TextSize = 24
    tagline.Parent = centerContainer
    
    -- Loading Text
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
    
    -- Loading Circle Container
    local loadingCircleContainer = Instance.new("Frame")
    loadingCircleContainer.Size = UDim2.new(0, 150, 0, 150)
    loadingCircleContainer.Position = UDim2.new(0.5, -75, 0, 240)
    loadingCircleContainer.BackgroundTransparency = 1
    loadingCircleContainer.Parent = centerContainer
    
    -- Loading Circle (Rotating)
    local loadingCircle = Instance.new("ImageLabel")
    loadingCircle.Size = UDim2.new(1, 0, 1, 0)
    loadingCircle.BackgroundTransparency = 1
    loadingCircle.Image = "rbxasset://textures/ui/LoadingCircle.png"
    loadingCircle.ImageColor3 = Color3.fromRGB(100, 50, 200)
    loadingCircle.Parent = loadingCircleContainer
    
    -- Percentage Text
    local percentageText = Instance.new("TextLabel")
    percentageText.Text = "0%"
    percentageText.Size = UDim2.new(1, 0, 1, 0)
    percentageText.BackgroundTransparency = 1
    percentageText.TextColor3 = Color3.fromRGB(255, 255, 255)
    percentageText.Font = Enum.Font.GothamBold
    percentageText.TextSize = 40
    percentageText.Parent = loadingCircleContainer
    
    -- Ping Display
    local pingLabel = Instance.new("TextLabel")
    pingLabel.Text = "🌐 Initializing..."
    pingLabel.Size = UDim2.new(0, 150, 0, 30)
    pingLabel.Position = UDim2.new(0, 50, 1, -80)
    pingLabel.BackgroundTransparency = 1
    pingLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
    pingLabel.Font = Enum.Font.Gotham
    pingLabel.TextSize = 16
    pingLabel.Parent = background
    
    -- Bottom Tip
    local tipLabel = Instance.new("TextLabel")
    tipLabel.Text = "💡 Tip: Press [INSERT] to toggle menu"
    tipLabel.Size = UDim2.new(1, 0, 0, 30)
    tipLabel.Position = UDim2.new(0, 0, 1, -100)
    tipLabel.BackgroundTransparency = 1
    tipLabel.TextColor3 = Color3.fromRGB(200, 200, 100)
    tipLabel.Font = Enum.Font.Gotham
    tipLabel.TextSize = 16
    tipLabel.Parent = background
    
    -- Version Text
    local versionLabel = Instance.new("TextLabel")
    versionLabel.Text = "Version 2.0.0 | Build #2416"
    versionLabel.Size = UDim2.new(0, 300, 0, 20)
    versionLabel.Position = UDim2.new(0.5, -150, 1, -30)
    versionLabel.BackgroundTransparency = 1
    versionLabel.TextColor3 = Color3.fromRGB(100, 100, 120)
    versionLabel.Font = Enum.Font.Gotham
    versionLabel.TextSize = 12
    versionLabel.Parent = background
    
    -- Animate loading circle rotation
    spawn(function()
        while loadingCircle.Parent do
            loadingCircle.Rotation = loadingCircle.Rotation + 5
            wait(0.03)
        end
    end)
    
    -- Simulate loading progress
    spawn(function()
        local loadingStages = {
            {text = "▶ Syncing Environment Variables...", duration = 0.3},
            {text = "▶ Loading Core Modules...", duration = 0.4},
            {text = "▶ Initializing ESP System...", duration = 0.3},
            {text = "▶ Configuring Aimbot...", duration = 0.3},
            {text = "▶ Setting up Hitbox Expander...", duration = 0.3},
            {text = "▶ Loading Backtrack System...", duration = 0.4},
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
        
        -- Update ping
        pingLabel.Text = "🌐 " .. math.random(15, 45) .. "ms"
        
        wait(0.5)
        
        -- Fade out animation
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

-- Hitbox Expander Functions
local function expandHitbox(character)
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        if not originalHitboxSizes[character] then
            originalHitboxSizes[character] = hrp.Size
        end
        hrp.Size = originalHitboxSizes[character] * hitboxMultiplier
        hrp.Transparency = hitboxTransparency
        hrp.CanCollide = false
        hrp.Material = Enum.Material.ForceField
    end
end

local function restoreHitbox(character)
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp and originalHitboxSizes[character] then
        hrp.Size = originalHitboxSizes[character]
        hrp.Transparency = 1
        hrp.CanCollide = false
        originalHitboxSizes[character] = nil
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
    
    -- Title Text
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
    
    -- Subtitle
    local subtitleLabel = Instance.new("TextLabel")
    subtitleLabel.Text = "Press [INSERT] to toggle menu"
    subtitleLabel.Size = UDim2.new(1, -30, 0, 15)
    subtitleLabel.Position = UDim2.new(0, 15, 0, 28)
    subtitleLabel.BackgroundTransparency = 1
    subtitleLabel.TextColor3 = Color3.fromRGB(120, 120, 140)
    subtitleLabel.Font = Enum.Font.Gotham
    subtitleLabel.TextSize = 11
    subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    subtitleLabel.Parent = titleBar
    
    -- Close Button
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
    
    -- Player tab content
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
    applyFlyButton.Text = "Apply Fly"
    applyFlyButton.Font = Enum.Font.GothamBold
    applyFlyButton.TextSize = 14
    applyFlyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
    applyFlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    applyFlyButton.AutoButtonColor = false
    applyFlyButton.Parent = playerContent
    
    local applyFlyCorner = Instance.new("UICorner")
    applyFlyCorner.CornerRadius = UDim.new(0, 6)
    applyFlyCorner.Parent = applyFlyButton
    
    -- Misc tab content
    local miscContent = Instance.new("ScrollingFrame")
    miscContent.Size = UDim2.new(1, 0, 1, 0)
    miscContent.CanvasSize = UDim2.new(0, 0, 0, 1200)
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
        
        buttonY = buttonY + 40
        return btn
    end
    
    local espActivateButton = addMiscButton("Toggle ESP")
    local aimbotNormalButton = addMiscButton("TeamCheck Aimbot")
    local aimbotTeamCheckButton = addMiscButton("Aimbot")
    local orbitButton = addMiscButton("Orbit Nearby Parts")
    
    -- Hitbox Expander Section
    local hitboxExpanderButton = addMiscButton("Toggle Hitbox Expander")
    
    -- Hitbox Size Multiplier
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
    
    -- Hitbox Transparency
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
    
    -- Button hover effects
    local function addButtonHover(btn, activeColor, inactiveColor)
        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = activeColor or Color3.fromRGB(0, 170, 240)}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = inactiveColor or Color3.fromRGB(30, 30, 45)}):Play()
        end)
    end
    
    for _, btn in pairs({espActivateButton, aimbotNormalButton, aimbotTeamCheckButton, orbitButton, hitboxExpanderButton, backtrackButton, backtrackEspButton, backtrackShotButton, teamCheckButton}) do
        addButtonHover(btn)
    end
    
    addButtonHover(applySpeedButton, Color3.fromRGB(0, 170, 240), Color3.fromRGB(0, 150, 220))
    addButtonHover(applyFlyButton, Color3.fromRGB(0, 170, 240), Color3.fromRGB(0, 150, 220))
    
    -- Hitbox Expander Button Handler
    hitboxExpanderButton.MouseButton1Click:Connect(function()
        hitboxExpanderActive = not hitboxExpanderActive
        hitboxExpanderButton.BackgroundColor3 = hitboxExpanderActive and Color3.fromRGB(0, 150, 220) or Color3.fromRGB(30, 30, 45)
        updateAllHitboxes()
    end)
    
    -- Hitbox Size Input Handler
    hitboxSizeInput.FocusLost:Connect(function(enterPressed)
        local size = tonumber(hitboxSizeInput.Text)
        if size and size > 0 and size <= 10 then
            hitboxMultiplier = size
            if hitboxExpanderActive then
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= player and p.Character then
                        restoreHitbox(p.Character)
                    end
                end
                updateAllHitboxes()
            end
        else
            hitboxSizeInput.Text = tostring(hitboxMultiplier)
        end
    end)
    
    -- Hitbox Transparency Input Handler
    hitboxTransparencyInput.FocusLost:Connect(function(enterPressed)
        local transparency = tonumber(hitboxTransparencyInput.Text)
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
            hitboxTransparencyInput.Text = tostring(hitboxTransparency)
        end
    end)
    
    -- Monitor new players
    Players.PlayerAdded:Connect(function(p)
        p.CharacterAdded:Connect(function(char)
            wait(0.5)
            if hitboxExpanderActive then
                expandHitbox(char)
            end
        end)
    end)
    
    -- Monitor existing players
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
    
    -- TeamCheck toggle for target selection
    local teamModes = {"All","Enemy","Ally"}
    teamCheckButton.MouseButton1Click:Connect(function()
        local i = table.find(teamModes, backtrackTargetTeamMode)
        local nextMode = teamModes[(i % #teamModes) + 1]
        backtrackTargetTeamMode = nextMode
        teamCheckButton.Text = "Backtrack Target: " .. nextMode
        updateBacktrackTargetList()
    end)
    
    local function updateBacktrackTargetList()
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
                        updateBacktrackTargetList()
                    end)
                    xOffset = xOffset + 105
                end
            end
        end
        targetList.CanvasSize = UDim2.new(0, xOffset, 0, 40)
    end
    
    updateBacktrackTargetList()
    Players.PlayerAdded:Connect(function() updateBacktrackTargetList() end)
    Players.PlayerRemoving:Connect(function() updateBacktrackTargetList() end)
    
    -- ESP Functions
    local function removeChams(character)
        if not character then return end
        if espObjects[character] then
            for _, box in pairs(espObjects[character]) do
                if box and box.Parent then box:Destroy() end
            end
            espObjects[character] = nil
        end
    end
    
    local function createOrUpdateChams(character)
        if not character then return end
        if not espObjects[character] then espObjects[character] = {} end
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                local color = Color3.fromRGB(128, 0, 128)
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local camera = workspace.CurrentCamera
                    local origin = camera.CFrame.Position
                    local direction = (part.Position - origin)
                    local raycastParams = RaycastParams.new()
                    raycastParams.FilterDescendantsInstances = {player.Character}
                    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                    local raycastResult = workspace:Raycast(origin, direction, raycastParams)
                    if raycastResult and raycastResult.Instance == part then
                        color = Color3.fromRGB(0, 255, 0)
                    end
                end
                if not espObjects[character][part] then
                    local box = Instance.new("BoxHandleAdornment")
                    box.Adornee = part
                    box.AlwaysOnTop = true
                    box.ZIndex = 10
                    box.Size = part.Size
                    box.Transparency = 0.6
                    box.Color3 = color
                    box.Parent = part
                    espObjects[character][part] = box
                else
                    espObjects[character][part].Color3 = color
                end
            end
        end
    end
    
    local function updateAllESP()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChildOfClass("Humanoid") and p.Character.Humanoid.Health > 0 then
                if espActive then
                    createOrUpdateChams(p.Character)
                else
                    removeChams(p.Character)
                end
            else
                if p.Character then removeChams(p.Character) end
            end
        end
    end
    
    espActivateButton.MouseButton1Click:Connect(function()
        espActive = not espActive
        espActivateButton.BackgroundColor3 = espActive and Color3.fromRGB(0, 150, 220) or Color3.fromRGB(30, 30, 45)
        updateAllESP()
    end)
    
    -- Orbit feature
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
    
    orbitButton.MouseButton1Click:Connect(function()
        orbitActive = not orbitActive
        orbitButton.BackgroundColor3 = orbitActive and Color3.fromRGB(0, 150, 220) or Color3.fromRGB(30, 30, 45)
        if orbitActive then startOrbit() else stopOrbit() end
    end)
    
    -- Backtracking feature
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
    
    backtrackButton.MouseButton1Click:Connect(function()
        backtrackActive = not backtrackActive
        backtrackButton.BackgroundColor3 = backtrackActive and Color3.fromRGB(0, 150, 220) or Color3.fromRGB(30, 30, 45)
        if backtrackActive or backtrackEspActive then
            startBacktrack()
        else
            stopBacktrack()
        end
    end)
    
    backtrackInput.FocusLost:Connect(function(enterPressed)
        local ms = tonumber(backtrackInput.Text)
        if ms and ms > 0 then
            backtrackInterval = ms / 1000
            if backtrackConnection then
                stopBacktrack()
                startBacktrack()
            end
        end
    end)
    
    backtrackEspButton.MouseButton1Click:Connect(function()
        backtrackEspActive = not backtrackEspActive
        backtrackEspButton.BackgroundColor3 = backtrackEspActive and Color3.fromRGB(0, 150, 220) or Color3.fromRGB(30, 30, 45)
        if backtrackActive or backtrackEspActive then
            startBacktrack()
        else
            stopBacktrack()
        end
    end)
    
    RunService.RenderStepped:Connect(function()
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
    
    -- Backtrack Shot
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
    
    backtrackShotButton.MouseButton1Click:Connect(function()
        if backtrackShotTarget then
            onBacktrackShot(backtrackShotTarget)
        end
    end)
    
    -- Aimbot logic
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
                    if newTarget then currentTarget = newTarget mouseMoved = false end
                end
            else
                aimAtTarget(currentTarget)
            end
        else currentTarget = nil end
    end)
    
    aimbotNormalButton.MouseButton1Click:Connect(function()
        aimbotNormalActive = not aimbotNormalActive
        if aimbotNormalActive then aimbotTeamCheckActive = false end
        aimbotNormalButton.BackgroundColor3 = aimbotNormalActive and Color3.fromRGB(0, 150, 220) or Color3.fromRGB(30, 30, 45)
        aimbotTeamCheckButton.BackgroundColor3 = aimbotTeamCheckActive and Color3.fromRGB(0, 150, 220) or Color3.fromRGB(30, 30, 45)
    end)
    
    aimbotTeamCheckButton.MouseButton1Click:Connect(function()
        aimbotTeamCheckActive = not aimbotTeamCheckActive
        if aimbotTeamCheckActive then aimbotNormalActive = false end
        aimbotTeamCheckButton.BackgroundColor3 = aimbotTeamCheckActive and Color3.fromRGB(0, 150, 220) or Color3.fromRGB(30, 30, 45)
        aimbotNormalButton.BackgroundColor3 = aimbotNormalActive and Color3.fromRGB(0, 150, 220) or Color3.fromRGB(30, 30, 45)
    end)
    
    -- Input
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType == Enum.UserInputType.MouseButton2 then rightMouseDown = true end
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
        if input.UserInputType == Enum.UserInputType.MouseButton2 then rightMouseDown = false currentTarget = nil end
    end)
    
    -- Tab switching
    local playerButton = Instance.new("TextButton")
    playerButton.Size = UDim2.new(1, 0, 0, 40)
    playerButton.Position = UDim2.new(0, 0, 0, 0)
    playerButton.Text = "PLAYER"
    playerButton.Font = Enum.Font.GothamBold
    playerButton.TextSize = 13
    playerButton.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
    playerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    playerButton.AutoButtonColor = false
    playerButton.Parent = sideMenu
    
    local miscButton = Instance.new("TextButton")
    miscButton.Size = UDim2.new(1, 0, 0, 40)
    miscButton.Position = UDim2.new(0, 0, 0, 45)
    miscButton.Text = "MISC"
    miscButton.Font = Enum.Font.GothamBold
    miscButton.TextSize = 13
    miscButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    miscButton.TextColor3 = Color3.fromRGB(180, 180, 200)
    miscButton.AutoButtonColor = false
    miscButton.Parent = sideMenu
    
    playerButton.MouseButton1Click:Connect(function()
        playerContent.Visible = true
        miscContent.Visible = false
        playerButton.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
        playerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        miscButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        miscButton.TextColor3 = Color3.fromRGB(180, 180, 200)
    end)
    
    miscButton.MouseButton1Click:Connect(function()
        playerContent.Visible = false
        miscContent.Visible = true
        miscButton.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
        miscButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        playerButton.TextColor3 = Color3.fromRGB(180, 180, 200)
    end)
    
    applySpeedButton.MouseButton1Click:Connect(function()
        local speed = tonumber(speedInput.Text)
        if speed and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = speed
        end
    end)
    
    applyFlyButton.MouseButton1Click:Connect(function()
        local speed = tonumber(flyInput.Text) or 30
        flySpeedValue = speed
        flyActive = not flyActive
        applyFlyButton.BackgroundColor3 = flyActive and Color3.fromRGB(0, 170, 240) or Color3.fromRGB(0, 150, 220)
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
    
    return screenGui
end

-- Initialize with loading screen
createLoadingScreen()
wait(4)
local myGui = createMenu()
