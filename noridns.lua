local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2zu/OPEN-SOURCE-UI-ROBLOX/refs/heads/main/X2ZU%20UI%20ROBLOX%20OPEN%20SOURCE/DummyUi-leak-by-x2zu/fetching-main/Tools/Framework.luau"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local catNet = ReplicatedStorage:WaitForChild("CatNet", 9e9):WaitForChild("Cat", 9e9)
local remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)

local expMultiplier = 3400
local dupeMultiplier = 4500
local selectedCashValue = 10
local selectedCoinValue = 0.5

local Window = Library:Window({
    Title = "Nori Developed",
    Desc = "Game : Diesel n Steel",
    Icon = 130331778002232,
    Theme = "Dark",
    Config = {
        Keybind = Enum.KeyCode.LeftControl,
        Size = UDim2.new(0, 450, 0, 325)
    },
    CloseUIButton = {
        Enabled = true,
        Text = "Nori"
    }
})

local MainTab = Window:Tab({Title = "Main", Icon = "house"})
local ShopTab = Window:Tab({Title = "Shop", Icon = "shopping-cart"})
local MiscTab = Window:Tab({Title = "Misc", Icon = "settings"})
local RoleTab = Window:Tab({Title = "Roles", Icon = "users"})
local MusicTab = Window:Tab({Title = "Music", Icon = "music"})
local BoostTab = Window:Tab({Title = "Boost", Icon = "zap"})
local TpTab = Window:Tab({Title = "TP", Icon = "map-pin"})
local TrollTab = Window:Tab({Title = "Troll", Icon = "smile"})

do
    MainTab:Section({Title = "EXP"})
    local isRunning = false
    local expLoop
    MainTab:Toggle({
        Title = "Auto EXP",
        Desc = "Automatically gain experience points",
        Value = false,
        Callback = function(state)
            isRunning = state
            if state then
                local Remote = remotes:WaitForChild("UnloadPassenger", 9e9)
                local Passengers = workspace:WaitForChild("Passengers", 9e9)
                local Jeepney = workspace:WaitForChild("Jeepnies", 9e9):WaitForChild(LocalPlayer.Name, 9e9)
                local Seat = Jeepney:WaitForChild("Body", 9e9):WaitForChild("FunctionalStuff", 9e9):WaitForChild("Seats", 9e9):GetChildren()[14]
                local SpawnPoints = workspace:WaitForChild("Map", 9e9):WaitForChild("Misc", 9e9):WaitForChild("PassengerSpawnPoints", 9e9)
                local function getRandomSpawnPoint()
                    local folder = SpawnPoints:GetChildren()
                    local randomFolder = folder[math.random(1, #folder)]
                    local points = randomFolder:GetChildren()
                    return points[math.random(1, #points)]
                end
                expLoop = task.spawn(function()
                    while isRunning do
                        for i = 1, expMultiplier do
                            pcall(function()
                                local Passenger = Passengers:GetChildren()
                                if #Passenger > 0 then
                                    local args = { [1] = { ["Password"] = 826272728262, ["Passenger"] = Passenger[math.random(1, #Passenger)], ["Jeepney"] = Jeepney, ["Seat"] = Seat, ["Destination"] = getRandomSpawnPoint() } }
                                    Remote:FireServer(unpack(args))
                                end
                            end)
                        end
                        task.wait(0.5)
                    end
                end)
            else
                if expLoop then task.cancel(expLoop) end
            end
        end
    })

    MainTab:Section({Title = "Km"})
    local isAutoKmActive = false
    local autoKmLoop = nil
    MainTab:Toggle({
        Title = "Auto Km",
        Desc = "Automatic Gain Km While in Jeep",
        Value = false,
        Callback = function(state)
            isAutoKmActive = state
            if state then
                autoKmLoop = task.spawn(function()
                    while isAutoKmActive do
                        pcall(function()
                            local player = game.Players.LocalPlayer
                            local char = player.Character
                            if char then
                                local hum = char:FindFirstChild("Humanoid")
                                if hum and hum.SeatPart then
                                    local car = hum.SeatPart.Parent
                                    if car and car:FindFirstChild("Body") then
                                        local body = car.Body
                                        if body:FindFirstChild("#Weight") then body.PrimaryPart = body["#Weight"] end
                                        local carPrimaryPart = car.PrimaryPart or (body and body["#Weight"])
                                        if carPrimaryPart then
                                            local location1 = Vector3.new(-589929299282829, 74, -2940)
                                            local location2 = Vector3.new(-2827827282682, 74, 3171)
                                            while isAutoKmActive do
                                                repeat
                                                    if not isAutoKmActive then break end
                                                    task.wait()
                                                    carPrimaryPart.Velocity = carPrimaryPart.CFrame.LookVector * 5000
                                                    car:PivotTo(CFrame.new(carPrimaryPart.Position, location1))
                                                until (char.PrimaryPart.Position - location1).Magnitude < 50 or not isAutoKmActive
                                                if not isAutoKmActive then break end
                                                carPrimaryPart.Velocity = Vector3.new(0,0,0)
                                                task.wait(1)
                                                repeat
                                                    if not isAutoKmActive then break end
                                                    task.wait()
                                                    carPrimaryPart.Velocity = carPrimaryPart.CFrame.LookVector * 5000
                                                    car:PivotTo(CFrame.new(carPrimaryPart.Position, location2))
                                                until (char.PrimaryPart.Position - location2).Magnitude < 50 or not isAutoKmActive
                                                if not isAutoKmActive then break end
                                                carPrimaryPart.Velocity = Vector3.new(0,0,0)
                                                task.wait(1)
                                            end
                                        end
                                    end
                                end
                            end
                        end)
                    end
                end)
            else
                if autoKmLoop then task.cancel(autoKmLoop); autoKmLoop = nil end
                pcall(function()
                    local player = game.Players.LocalPlayer
                    local char = player.Character
                    if char then
                        local hum = char:FindFirstChild("Humanoid")
                        if hum and hum.SeatPart then
                            local car = hum.SeatPart.Parent
                            if car and car:FindFirstChild("Body") then
                                local body = car.Body
                                if body:FindFirstChild("#Weight") then
                                    local carPrimaryPart = body["#Weight"]
                                    carPrimaryPart.Velocity = Vector3.new(0,0,0)
                                end
                            end
                        end
                    end
                end)
            end
        end
    })

    MainTab:Section({Title = "Duper"})
    local DupeScreenGui = Instance.new("ScreenGui")
    DupeScreenGui.Name = "DupeGUI"
    DupeScreenGui.Parent = CoreGui
    DupeScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    DupeScreenGui.Enabled = false

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = DupeScreenGui
    MainFrame.BackgroundTransparency = 0.15
    MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainFrame.Position = UDim2.new(0.5, -120, 0.5, -65)
    MainFrame.Size = UDim2.new(0, 240, 0, 130)
    MainFrame.BorderSizePixel = 0
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 15)
    MainCorner.Parent = MainFrame
    local MainGradient = Instance.new("UIGradient")
    MainGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(230,230,255))}
    MainGradient.Rotation = 45
    MainGradient.Parent = MainFrame
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Parent = MainFrame
    UIStroke.Thickness = 1.5
    UIStroke.Transparency = 0
    UIStroke.Color = Color3.fromRGB(255, 255, 255)
    local BorderGradient = Instance.new("UIGradient")
    BorderGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(230,230,255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255,255,255))}
    BorderGradient.Parent = UIStroke
    task.spawn(function() while MainFrame.Parent do BorderGradient.Rotation = BorderGradient.Rotation + 1 task.wait(0.02) end end)

    local Title = Instance.new("TextLabel")
    Title.Parent = MainFrame
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 0, 0.05, 0)
    Title.Size = UDim2.new(1, 0, 0.25, 0)
    Title.Font = Enum.Font.FredokaOne
    Title.Text = "Nori Dupe Cash"
    Title.TextColor3 = Color3.fromRGB(0, 0, 0)
    Title.TextSize = 20
    Title.ZIndex = 2
    local TitleStroke = Instance.new("UIStroke")
    TitleStroke.Parent = Title
    TitleStroke.Thickness = 2
    TitleStroke.Color = Color3.fromRGB(255, 255, 255)

    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Parent = MainFrame
    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Position = UDim2.new(0.075, 0, 0.45, 0)
    ToggleButton.Size = UDim2.new(0.85, 0, 0.45, 0)
    ToggleButton.AutoButtonColor = false
    ToggleButton.Text = ""
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 12)
    ButtonCorner.Parent = ToggleButton
    local ButtonMainGradient = Instance.new("UIGradient")
    ButtonMainGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(200,200,200)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(150,150,150))}
    ButtonMainGradient.Rotation = 90
    ButtonMainGradient.Parent = ToggleButton
    local ButtonStroke = Instance.new("UIStroke")
    ButtonStroke.Parent = ToggleButton
    ButtonStroke.Color = Color3.fromRGB(255, 255, 255)
    ButtonStroke.Thickness = 1.5
    ButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    local ButtonBorderGradient = Instance.new("UIGradient")
    ButtonBorderGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(230,230,255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255,255,255))}
    ButtonBorderGradient.Parent = ButtonStroke
    task.spawn(function() while ToggleButton.Parent do ButtonBorderGradient.Rotation = ButtonBorderGradient.Rotation - 1 task.wait(0.02) end end)

    local ButtonLabel = Instance.new("TextLabel")
    ButtonLabel.Parent = ToggleButton
    ButtonLabel.BackgroundTransparency = 1
    ButtonLabel.Size = UDim2.new(1, 0, 1, 0)
    ButtonLabel.Font = Enum.Font.FredokaOne
    ButtonLabel.Text = "OFF"
    ButtonLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    ButtonLabel.TextSize = 24
    ButtonLabel.ZIndex = 2
    local LabelStroke = Instance.new("UIStroke")
    LabelStroke.Parent = ButtonLabel
    LabelStroke.Thickness = 2
    LabelStroke.Color = Color3.fromRGB(255, 255, 255)
    local LabelGradient = Instance.new("UIGradient")
    LabelGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(230,230,255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255,255,255))}
    LabelGradient.Parent = ButtonLabel
    task.spawn(function() local t = 0 while ButtonLabel.Parent do t = t + 0.02 if t > 1 then t = -1 end LabelGradient.Offset = Vector2.new(t, 0) task.wait(0.03) end end)

    local dupeArgs = { [1] = { [1] = { [1] = "3", [2] = "RecieveCash", [3] = { ["Value"] = 100, ["Main"] = true, ["Password"] = 649686508 } } } }
    local dupeThreads = {}
    local dupeEnabled = false
    local function startDupe()
        dupeEnabled = true
        for i = 1, dupeMultiplier do
            local thread = task.spawn(function() while dupeEnabled do pcall(function() catNet:FireServer(unpack(dupeArgs)) end) task.wait(0.25) end end)
            table.insert(dupeThreads, thread)
        end
    end
    local function stopDupe()
        dupeEnabled = false
        for _, thread in ipairs(dupeThreads) do task.cancel(thread) end
        dupeThreads = {}
    end
    local toggled = false
    local db = false
    ToggleButton.MouseButton1Click:Connect(function()
        if db then return end
        db = true
        toggled = not toggled
        if toggled then
            ButtonLabel.Text = "ON"
            ButtonMainGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(100,255,100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(50,200,50))}
            startDupe()
        else
            ButtonLabel.Text = "OFF"
            ButtonMainGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(200,200,200)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(150,150,150))}
            stopDupe()
        end
        task.wait(0.2)
        db = false
    end)

    local dragging, dragInput, dragStart, startPos
    local function update(input)
        local delta = input.Position - dragStart
        local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        TweenService:Create(MainFrame, TweenInfo.new(0.1), {Position = targetPos}):Play()
    end
    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then update(input) end
    end)

    MainTab:Toggle({
        Title = "Dupe Cash",
        Desc = "Open and Close The Dupe Cash GUI",
        Value = false,
        Callback = function(state) DupeScreenGui.Enabled = state end
    })

    MainTab:Section({Title = "Deduct"})
    local deductValue = 0
    MainTab:Textbox({
        Title = "Removing Value",
        Desc = "Enter amount to deduct",
        Placeholder = "0",
        Value = "0",
        ClearTextOnFocus = false,
        Callback = function(value) local num = tonumber(value); if num then deductValue = num end end
    })
    MainTab:Button({
        Title = "Remove Exp",
        Desc = "Remove EXP from player",
        Callback = function()
            local args = { [1] = { [1] = { [1] = "3", [2] = "DeductExp", [3] = { ["Value"] = deductValue, ["Password"] = 157913333 } } } }
            catNet:FireServer(unpack(args))
        end
    })
    MainTab:Button({
        Title = "Remove Cash",
        Desc = "Remove Cash from player",
        Callback = function()
            local args = { [1] = { [1] = { [1] = "3", [2] = "DeductCash", [3] = { ["Value"] = deductValue, ["Password"] = 157913333 } } } }
            catNet:FireServer(unpack(args))
        end
    })

    MainTab:Section({Title = "Reset"})
    MainTab:Button({
        Title = "Reset Cash",
        Desc = "Reset Cash To 0",
        Callback = function()
            local args = { [1] = { [1] = { [1] = "3", [2] = "RecieveOnHoldCash", [3] = { ["Password"] = 649686508, ["Value"] = 100000000000 } } } }
            catNet:FireServer(unpack(args))
        end
    })

    MainTab:Section({Title = "Parts"})
    local selectedPartsJeep = "Sarao Custombuilt Model 2_#1"
    local partsJeepBaseName = "Sarao Custombuilt Model 2"
    local jeepIndexNumber = "1"
    local partsJeepOptions = { "Sarao Custombuilt Model 2", "DF Devera Long Model", "Morales 10 Seater", "Milwaukee Motor Sport 11 Seater" }
    MainTab:Dropdown({
        Title = "Select Jeep",
        Desc = "Choose which jeep to max out parts",
        List = partsJeepOptions,
        Value = "Sarao Custombuilt Model 2",
        Callback = function(value) partsJeepBaseName = value; selectedPartsJeep = value .. "_#" .. jeepIndexNumber end
    })
    MainTab:Textbox({
        Title = "Jeep Index Number",
        Desc = "Enter the jeep index number (e.g., 1, 2, 3)",
        Placeholder = "1",
        Value = "1",
        ClearTextOnFocus = false,
        Callback = function(value) local num = tonumber(value); if num then jeepIndexNumber = tostring(num); selectedPartsJeep = partsJeepBaseName .. "_#" .. jeepIndexNumber end end
    })
    MainTab:Button({
        Title = "Max All Jeep Parts",
        Desc = "Unlock All Parts Without Deduct",
        Callback = function()
            local getDataStoreArgs = {}
            remotes:WaitForChild("GetDataStore", 9e9):InvokeServer(unpack(getDataStoreArgs))
            task.wait(0.01)
            local args = { [1] = { [1] = { [1] = "3", [2] = "CloseCustomize", [3] = {
                ["Password"] = 136919215,
                ["NewOwnedParts"] = { ["BA - 05"] = 100, ["BA - 01"] = 100, ["BA - 03"] = 100, ["4-Speed Manual"] = 100, ["6-Speed Manual"] = 100, ["5-Speed Manual"] = 100, ["C - 04"] = 100, ["B - 04"] = 100, ["4HK1 Twin Turbo"] = 100, ["4JJ1"] = 100, ["4HK1 Single Turbo"] = 100, ["4JK1"] = 100, ["4HE1 Single Turbo"] = 100, ["4-Speed Manual (High Ratio)"] = 100, ["T - 01 (F)"] = 100, ["EO - 01"] = 100, ["T - 05 (R)"] = 100, ["T - 03 (R)"] = 100, ["EO - 05"] = 100, ["BA - 02"] = 100, ["B - 02"] = 100, ["BA - 04"] = 100, ["T - 02 (F)"] = 100, ["T - 04 (R)"] = 100, ["T - 04 (F)"] = 100, ["R - 01"] = 100, ["T - 02 (R)"] = 100, ["T - 03 (F)"] = 100, ["B - 03"] = 100, ["BF - 01"] = 100, ["T - 05 (F)"] = 100, ["4HF1 Twin Turbo"] = 100, ["TO - 05"] = 100, ["CL - 01"] = 100, ["TO - 01"] = 100, ["B - 05"] = 100, ["T - 01 (R)"] = 100, ["CL - 02"] = 100, ["BF - 02"] = 100, ["4BE1"] = 100, ["4BC2"] = 100, ["B - 01"] = 100, ["R - 02"] = 100, ["D - 01"] = 100, ["C - 01"] = 100, ["C - 02"] = 100, ["C - 03"] = 100, ["EO - 02"] = 100, ["EO - 03"] = 100, ["EO - 04"] = 100, ["TO - 02"] = 100, ["TO - 03"] = 100, ["TO - 04"] = 100 },
                ["NewEquippedParts"] = { ["Clutch"] = "CL - 02", ["Brake"] = "B - 05", ["Differential"] = "D - 01", ["Engine"] = "4HK1 Twin Turbo", ["Transmission"] = "4-Speed Manual (High Ratio)", ["Coolant"] = "C - 04", ["BrakeFluid"] = "BF - 02", ["RearTires"] = "T - 03 (R)", ["TransmissionOil"] = "TO - 05", ["Battery"] = "BA - 05", ["Radiator"] = "R - 02", ["EngineOil"] = "EO - 05", ["FrontTires"] = "T - 03 (F)" },
                ["JeepneyName"] = selectedPartsJeep,
                ["NewPartsStatus"] = { ["FrontTiresHealth"] = 100, ["DifferentialHealth"] = 100, ["ClutchHealth"] = 100, ["TransmissionHealth"] = 100, ["RadiatorHealth"] = 100, ["CoolantLevel"] = 100, ["BrakeHealth"] = 100, ["EngineHealth"] = 100, ["RearTiresHealth"] = 100, ["BrakeFluid"] = 100, ["TransmissionOil"] = 100, ["EngineOil"] = 100, ["BatteryHealth"] = 100 }
            } } } }
            catNet:FireServer(unpack(args))
        end
    })

    MainTab:Section({Title = "Auto Farm"})
    local autoFarmRunning = false
    local autoFarmLoop = nil
    local selectedAutoJeep = "DF Devera Long Model_#1"
    local autoJeepOptions = { "High", "Hard", "Medium", "Small" }
    local autoHideNotifLoop = nil
    local autoCashEnabled = false

    local function hideNotifications()
        local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        local react = PlayerGui:FindFirstChild("ReactContainer")
        if react then
            local notifs = react:FindFirstChild("Notifications")
            if notifs then notifs.Visible = false end
        end
    end

    local function startHideNotif()
        if autoHideNotifLoop then return end
        autoHideNotifLoop = task.spawn(function() while autoFarmRunning do hideNotifications() task.wait(0.01) end end)
    end

    MainTab:Dropdown({
        Title = "Select Difficulty",
        Desc = "Select which amount gain",
        List = autoJeepOptions,
        Value = "Hard",
        Callback = function(value)
            if value == "High" then selectedAutoJeep = "Milwaukee Motor Sport 11 Seater_#1"
            elseif value == "Hard" then selectedAutoJeep = "DF Devera Long Model_#1"
            elseif value == "Medium" then selectedAutoJeep = "Morales 10 Seater_#1"
            elseif value == "Small" then selectedAutoJeep = "Sarao Custombuilt Model 2_#1" end
        end
    })

    MainTab:Toggle({
        Title = "Auto Cash",
        Desc = "",
        Value = false,
        Callback = function(state)
            if autoCashEnabled and not state then
                if Library.Items and Library.Items["Auto Cash"] then Library.Items["Auto Cash"]:SetState(true) end
                return
            end
            if state and not autoCashEnabled then
                autoCashEnabled = true
                autoFarmRunning = true
                startHideNotif()
                autoFarmLoop = task.spawn(function()
                    while autoFarmRunning do
                        local success, err = pcall(function()
                            local jeepName = selectedAutoJeep:gsub("_#1", "")
                            local buyArgs = { [1] = { [1] = { [1] = "3", [2] = "BuyJeepney", [3] = { ["JeepneyName"] = jeepName, ["Password"] = 800584595 } } } }
                            catNet:FireServer(unpack(buyArgs))
                            task.wait(0.01)
                            remotes:WaitForChild("GetDataStore", 9e9):InvokeServer()
                            task.wait(0.01)
                            local unlockArgs = { [1] = { [1] = { [1] = "3", [2] = "CloseCustomize", [3] = {
                                ["Password"] = 332271450,
                                ["NewOwnedParts"] = { ["BA - 05"] = 100, ["BA - 01"] = 100, ["BA - 03"] = 100, ["4-Speed Manual"] = 100, ["6-Speed Manual"] = 100, ["5-Speed Manual"] = 100, ["C - 04"] = 100, ["B - 04"] = 100, ["EO - 03"] = 100, ["4JJ1"] = 100, ["4HK1 Single Turbo"] = 100, ["4JK1"] = 100, ["4HE1 Single Turbo"] = 100, ["4-Speed Manual (High Ratio)"] = 100, ["T - 01 (F)"] = 100, ["EO - 01"] = 100, ["T - 05 (R)"] = 100, ["T - 03 (R)"] = 100, ["EO - 05"] = 100, ["T - 04 (R)"] = 100, ["T - 02 (R)"] = 100, ["R - 02"] = 100, ["TO - 05"] = 100, ["TO - 04"] = 100, ["TO - 03"] = 100, ["BA - 02"] = 100, ["EO - 04"] = 100, ["B - 02"] = 100, ["C - 02"] = 100, ["BA - 04"] = 100, ["T - 02 (F)"] = 100, ["EO - 02"] = 100, ["T - 04 (F)"] = 100, ["R - 01"] = 100, ["TO - 02"] = 100, ["T - 03 (F)"] = 100, ["B - 03"] = 100, ["BF - 01"] = 100, ["T - 05 (F)"] = 100, ["TO - 01"] = 100, ["B - 05"] = 100, ["CL - 01"] = 100, ["4BC2"] = 100, ["CL - 02"] = 100, ["T - 01 (R)"] = 100, ["BF - 02"] = 100, ["C - 03"] = 100, ["4BE1"] = 100, ["4HK1 Twin Turbo"] = 100, ["B - 01"] = 100, ["4HF1 Twin Turbo"] = 100, ["D - 01"] = 100, ["C - 01"] = 100 },
                                ["NewEquippedParts"] = { ["Clutch"] = "CL - 01", ["Brake"] = "B - 01", ["Differential"] = "D - 01", ["Engine"] = "4HK1 Twin Turbo", ["Transmission"] = "4-Speed Manual (High Ratio)", ["Coolant"] = "C - 01", ["BrakeFluid"] = "BF - 01", ["RearTires"] = "T - 01 (R)", ["TransmissionOil"] = "TO - 01", ["Battery"] = "BA - 01", ["Radiator"] = "R - 01", ["EngineOil"] = "EO - 01", ["FrontTires"] = "T - 01 (F)" },
                                ["JeepneyName"] = selectedAutoJeep,
                                ["NewPartsStatus"] = { ["FrontTiresHealth"] = 100, ["DifferentialHealth"] = 100, ["ClutchHealth"] = 100, ["TransmissionHealth"] = 100, ["RadiatorHealth"] = 100, ["CoolantLevel"] = 100, ["BrakeHealth"] = 100, ["EngineHealth"] = 100, ["RearTiresHealth"] = 100, ["BrakeFluid"] = 100, ["TransmissionOil"] = 100, ["EngineOil"] = 100, ["BatteryHealth"] = 100 }
                            } } } }
                            catNet:FireServer(unpack(unlockArgs))
                            task.wait(0.01)
                            local spawnArgs = { [1] = { ["Garage"] = workspace:WaitForChild("Map", 9e9):WaitForChild("Misc", 9e9):WaitForChild("Garages", 9e9):WaitForChild("606 Matungao st., Matungao, Bulakan, Bulacan", 9e9), ["Password"] = 643531260, ["JeepneyName"] = selectedAutoJeep, ["Route"] = "Balagtas - Bulakan" } }
                            remotes:WaitForChild("SpawnJeepney", 9e9):FireServer(unpack(spawnArgs))
                            task.wait(0.01)
                            local sellArgs = { [1] = { ["Index"] = selectedAutoJeep } }
                            remotes:WaitForChild("SellJeepney", 9e9):FireServer(unpack(sellArgs))
                            task.wait(0.001)
                        end)
                        if not success and autoFarmRunning then warn("Auto Cash error: " .. tostring(err)) task.wait(0.001) end
                    end
                end)
            end
        end
    })
end

do
    ShopTab:Section({Title = "Jeepney Shop"})
    ShopTab:Button({ Title = "Sarao Custombuilt", Desc = "Buy Sarao Custombuilt Jeepney", Callback = function()
        local args = { [1] = { [1] = { [1] = "3", [2] = "BuyJeepney", [3] = { ["JeepneyName"] = "Sarao Custombuilt Model 2", ["Password"] = 157913333 } } } }
        catNet:FireServer(unpack(args))
    end })
    ShopTab:Button({ Title = "DF Devera Long", Desc = "Buy DF Devera Long Model", Callback = function()
        local args = { [1] = { [1] = { [1] = "3", [2] = "BuyJeepney", [3] = { ["JeepneyName"] = "DF Devera Long Model", ["Password"] = 157913333 } } } }
        catNet:FireServer(unpack(args))
    end })
    ShopTab:Button({ Title = "Morales 10 Seater", Desc = "Buy Morales 10 Seater", Callback = function()
        local args = { [1] = { [1] = { [1] = "3", [2] = "BuyJeepney", [3] = { ["JeepneyName"] = "Morales 10 Seater", ["Password"] = 157913333 } } } }
        catNet:FireServer(unpack(args))
    end })
    ShopTab:Button({ Title = "Milwaukee 11 Seater", Desc = "Buy Milwaukee Motor Sport", Callback = function()
        local args = { [1] = { [1] = { [1] = "3", [2] = "BuyJeepney", [3] = { ["JeepneyName"] = "Milwaukee Motor Sport 11 Seater", ["Password"] = 157913333 } } } }
        catNet:FireServer(unpack(args))
    end })

    ShopTab:Section({Title = "Tools"})
    local function buyTool(toolName)
        local args = { [1] = { ["Password"] = 520430635, ["ToolName"] = toolName } }
        remotes:WaitForChild("BuyTool", 9e9):InvokeServer(unpack(args))
    end
    ShopTab:Button({ Title = "Diesel Can", Desc = "Buy Diesel Can", Callback = function() buyTool("Diesel can") end })
    ShopTab:Button({ Title = "Wrench", Desc = "Buy Wrench", Callback = function() buyTool("Wrench") end })
    ShopTab:Button({ Title = "Baseball Bat", Desc = "Buy Baseball Bat", Callback = function() buyTool("Baseball bat") end })
    ShopTab:Button({ Title = "Metal Pipe", Desc = "Buy Metal Pipe", Callback = function() buyTool("Metal pipe") end })
    ShopTab:Button({ Title = "Hammer", Desc = "Buy Hammer", Callback = function() buyTool("Hammer") end })
    ShopTab:Button({ Title = "Coolant Can", Desc = "Buy Coolant Can", Callback = function() buyTool("coolant can") end })

    ShopTab:Section({Title = "Food"})
    local function buyFood(foodName)
        local args = { [1] = { ["Password"] = 520430635, ["FoodName"] = foodName } }
        remotes:WaitForChild("BuyFood", 9e9):InvokeServer(unpack(args))
    end
    ShopTab:Button({ Title = "Hotdog", Desc = "Buy Hotdog", Callback = function() buyFood("Hotdog") end })
    ShopTab:Button({ Title = "Water", Desc = "Buy Water", Callback = function() buyFood("Water") end })
    ShopTab:Button({ Title = "Fried Chicken", Desc = "Buy Fried Chicken", Callback = function() buyFood("Fried Chicken") end })
    ShopTab:Button({ Title = "Bloxy Cola", Desc = "Buy Bloxy Cola", Callback = function() buyFood("Bloxy Cola") end })
    ShopTab:Button({ Title = "Betamax", Desc = "Buy Betamax", Callback = function() buyFood("Betamax") end })
    ShopTab:Button({ Title = "Quek Quek", Desc = "Buy Quek Quek", Callback = function() buyFood("Quek Quek") end })
    ShopTab:Button({ Title = "Isaw", Desc = "Buy Isaw", Callback = function() buyFood("Isaw") end })
end

do
    MiscTab:Section({Title = "CPC Application"})
    MiscTab:Button({ Title = "Apply Guiguinto - Bulakan", Desc = "Apply for CPC on Guiguinto route", Callback = function()
        local args = { [1] = { ["Route"] = "Guiguinto - Bulakan" } }
        remotes:WaitForChild("ApplyForCPC", 9e9):FireServer(unpack(args))
    end })
    MiscTab:Button({ Title = "Apply Balagtas - Bulakan", Desc = "Apply for CPC on Balagtas route", Callback = function()
        local args = { [1] = { ["Route"] = "Balagtas - Bulakan" } }
        remotes:WaitForChild("ApplyForCPC", 9e9):FireServer(unpack(args))
    end })
    MiscTab:Button({ Title = "Apply Malolos - Bulakan", Desc = "Apply for CPC on Malolos route", Callback = function()
        local args = { [1] = { ["Route"] = "Malolos - Bulakan" } }
        remotes:WaitForChild("ApplyForCPC", 9e9):FireServer(unpack(args))
    end })

    MiscTab:Section({Title = "Remover"})
    MiscTab:Button({ Title = "Remove Jeepnies Exist", Desc = "Remove all jeepnies except yours", Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local jeepnies = workspace:FindFirstChild("Jeepnies")
        if jeepnies then
            for _, v in pairs(jeepnies:GetChildren()) do
                if v.Name ~= player.Name then v:Destroy() end
            end
        end
    end })
    MiscTab:Button({ Title = "Remove Vehicles Exist", Desc = "Remove all AI vehicles", Callback = function()
        local aiVehicles = workspace:FindFirstChild("AiVehicles")
        if aiVehicles then
            for _, v in pairs(aiVehicles:GetChildren()) do v:Destroy() end
        end
    end })

    MiscTab:Section({Title = "Mess"})
    local hideNotifActive = false
    local hideNotifLoop = nil
    MiscTab:Toggle({
        Title = "Hide Notif",
        Desc = "Hide notifications from screen when enabled",
        Value = false,
        Callback = function(state)
            hideNotifActive = state
            if state then
                local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
                local function hideNotifications2()
                    local react = PlayerGui:FindFirstChild("ReactContainer")
                    if react then
                        local notifs = react:FindFirstChild("Notifications")
                        if notifs then notifs.Visible = false end
                    end
                end
                PlayerGui.ChildAdded:Connect(function(child)
                    if child.Name == "ReactContainer" and hideNotifActive then
                        task.delay(0.1, function()
                            local react = PlayerGui:FindFirstChild("ReactContainer")
                            if react and hideNotifActive then
                                local notifs = react:FindFirstChild("Notifications")
                                if notifs then notifs.Visible = false end
                            end
                        end)
                    end
                end)
                if PlayerGui:FindFirstChild("ReactContainer") then
                    local react = PlayerGui.ReactContainer
                    react.ChildAdded:Connect(function(child)
                        if child.Name == "Notifications" and hideNotifActive then
                            task.delay(0.05, function()
                                if child and child.Parent and hideNotifActive then child.Visible = false end
                            end)
                        end
                    end)
                end
                hideNotifLoop = task.spawn(function()
                    while hideNotifActive do
                        hideNotifications2()
                        task.wait(2)
                    end
                end)
            else
                if hideNotifLoop then task.cancel(hideNotifLoop); hideNotifLoop = nil end
                local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
                local react = PlayerGui:FindFirstChild("ReactContainer")
                if react then
                    local notifs = react:FindFirstChild("Notifications")
                    if notifs then notifs.Visible = true end
                end
                for _, child in pairs(PlayerGui:GetDescendants()) do
                    if child.Name == "Notifications" and child:IsA("Frame") then child.Visible = true end
                end
            end
        end
    })
    MiscTab:Button({ Title = "Get Licence", Desc = "Pass the exam and get licence", Callback = function()
        local args = { [1] = { [1] = { [1] = "3", [2] = "PassedTheExam", [3] = { ["Password"] = 157913333 } } } }
        catNet:FireServer(unpack(args))
    end })
    MiscTab:Button({ Title = "Complete Tutorial", Desc = "Complete the tutorial", Callback = function()
        local args = { [1] = { [1] = { [1] = "3", [2] = "CompletedTutorial", [3] = { ["Password"] = 157913333 } } } }
        catNet:FireServer(unpack(args))
    end })
    MiscTab:Button({ Title = "Register Jeep", Desc = "Register your jeepney", Callback = function()
        remotes:WaitForChild("RegisterJeepney", 9e9):FireServer()
    end })
    MiscTab:Button({ Title = "Max Fuel", Desc = "Set your jeep fuel to maximum", Callback = function()
        local args = { [1] = { [1] = { [1] = "3", [2] = "RecieveFuel", [3] = { ["Amount"] = 100, ["JeepneyValues"] = workspace:WaitForChild("Jeepnies", 9e9):WaitForChild(game.Players.LocalPlayer.Name, 9e9):WaitForChild("JeepneyValues", 9e9), ["Password"] = 157913333 } } } }
        catNet:FireServer(unpack(args))
    end })
    MiscTab:Button({ Title = "Repair Engine", Desc = "Repair your jeep engine using wrench", Callback = function()
        local player = game.Players.LocalPlayer
        local args = { [1] = { ["Character"] = workspace:WaitForChild(player.Name, 9e9), ["Jeepney"] = workspace:WaitForChild("Jeepnies", 9e9):WaitForChild(player.Name, 9e9) } }
        remotes:WaitForChild("WrenchRepair", 9e9):FireServer(unpack(args))
    end })

    MiscTab:Section({Title = "Server"})
    MiscTab:Button({ Title = "Server Hop", Desc = "Hop to a different server", Callback = function()
        local placeId = game.PlaceId
        local jobId = game.JobId
        local x = {}
        for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?limit=100"))) do
            if type(v) == "table" then
                for _, v2 in pairs(v) do
                    if type(v2) == "table" and v2.playing ~= nil and v2.id ~= jobId then
                        table.insert(x, v2.id)
                    end
                end
            end
        end
        if #x > 0 then
            game:GetService("TeleportService"):TeleportToPlaceInstance(placeId, x[math.random(1, #x)], game.Players.LocalPlayer)
        end
    end })
    MiscTab:Button({ Title = "Rejoin", Desc = "Rejoin the current server", Callback = function()
        local placeId = game.PlaceId
        local jobId = game.JobId
        game:GetService("TeleportService"):TeleportToPlaceInstance(placeId, jobId, game.Players.LocalPlayer)
    end })

    MiscTab:Section({Title = "Jeep Selling"})
    local selectedSellJeep = "Sarao Custombuilt Model 2_#1"
    local sellJeepOptions = { "Sarao Custombuilt Model 2", "DF Devera Long Model", "Morales 10 Seater", "Milwaukee Motor Sport 11 Seater" }
    MiscTab:Dropdown({ Title = "Select Jeep to Sell", Desc = "Choose which jeep to sell", List = sellJeepOptions, Value = "Sarao Custombuilt Model 2", Callback = function(value)
        if value == "Sarao Custombuilt Model 2" then selectedSellJeep = "Sarao Custombuilt Model 2_#1"
        elseif value == "DF Devera Long Model" then selectedSellJeep = "DF Devera Long Model_#1"
        elseif value == "Morales 10 Seater" then selectedSellJeep = "Morales 10 Seater_#1"
        elseif value == "Milwaukee Motor Sport 11 Seater" then selectedSellJeep = "Milwaukee Motor Sport 11 Seater_#1" end
    end })
    MiscTab:Button({ Title = "Sell Jeep", Desc = "Sell the selected jeep", Callback = function()
        local args = { [1] = { [1] = { [1] = "3", [2] = "SellJeepney", [3] = { ["Index"] = selectedSellJeep, ["Password"] = 157913333 } } } }
        catNet:FireServer(unpack(args))
    end })

    MiscTab:Section({Title = "Bark"})
    local barkOptions = { "BULAKAN", "BALAGTAS", "MALOLOS", "GUIGUINTO", "MARAMI PA", "ISA PA", "Kinsehan", "Waluhan", "Magkabilaan po yan", "Pakiusad nalang po sa Kaliwa", "Pakiusad nalang po sa kanan" }
    local selectedBarkMessage = "Pakiusad nalang po sa kanan"
    MiscTab:Dropdown({ Title = "Bark Message", Desc = "Choose your bark message", List = barkOptions, Value = "Pakiusad nalang po sa kanan", Callback = function(value) selectedBarkMessage = value end })
    MiscTab:Button({ Title = "Bark", Desc = "Send bark message to players", Callback = function()
        local args = { [1] = { ["Password"] = 412543273, ["VoiceOver"] = selectedBarkMessage } }
        remotes:WaitForChild("Bark", 9e9):FireServer(unpack(args))
    end })
end

do
    local function spawnRole(roleName)
        local args = { [1] = { [1] = { [1] = "3", [2] = "SpawnCharacter", [3] = { ["Password"] = 157913333, ["Role"] = roleName } } } }
        catNet:FireServer(unpack(args))
    end

    RoleTab:Section({Title = "Law Enforcement"})
    RoleTab:Button({ Title = "Police", Desc = "Spawn as Police", Callback = function() spawnRole("Police") end })
    RoleTab:Button({ Title = "Fire Enforcement", Desc = "Spawn as Fire Enforcement", Callback = function() spawnRole("Fire Enforcement") end })

    RoleTab:Section({Title = "Transportation"})
    RoleTab:Button({ Title = "Driver", Desc = "Spawn as Driver", Callback = function() spawnRole("Driver") end })
    RoleTab:Button({ Title = "Conductor", Desc = "Spawn as Conductor", Callback = function() spawnRole("Conductor") end })
    RoleTab:Button({ Title = "Barker", Desc = "Spawn as Barker", Callback = function() spawnRole("Barker") end })
    RoleTab:Button({ Title = "Operator", Desc = "Spawn as Operator", Callback = function() spawnRole("Operator") end })

    RoleTab:Section({Title = "Management"})
    RoleTab:Button({ Title = "Owner", Desc = "Spawn as Owner", Callback = function() spawnRole("Owner") end })
    RoleTab:Button({ Title = "Co Owner", Desc = "Spawn as Co Owner", Callback = function() spawnRole("Co Owner") end })
    RoleTab:Button({ Title = "Manager", Desc = "Spawn as Manager", Callback = function() spawnRole("Manager") end })

    RoleTab:Section({Title = "Civilians"})
    RoleTab:Button({ Title = "Player", Desc = "Spawn as Player", Callback = function() spawnRole("Player") end })
    RoleTab:Button({ Title = "Civilian", Desc = "Spawn as Civilian", Callback = function() spawnRole("Civilian") end })
    RoleTab:Button({ Title = "Passenger", Desc = "Spawn as Passenger", Callback = function() spawnRole("Passenger") end })
    RoleTab:Button({ Title = "VIP", Desc = "Spawn as VIP", Callback = function() spawnRole("VIP") end })
end

do
    local MusicController = { currentSound = nil, volume = 0.5, loop = false, isPaused = false }
    function MusicController:Play(assetId)
        if self.currentSound then pcall(function() self.currentSound:Stop(); self.currentSound:Destroy() end) end
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. assetId
        sound.Volume = self.volume
        sound.Looped = self.loop
        sound.Parent = game:GetService("SoundService")
        sound:Play()
        self.currentSound = sound
        self.isPaused = false
    end
    function MusicController:Stop()
        if self.currentSound then pcall(function() self.currentSound:Stop(); self.currentSound:Destroy() end); self.currentSound = nil; self.isPaused = false end
    end

    MusicTab:Section({Title = "Music Player"})
    local customMusicId = ""
    local customMusicVolume = 0.5
    MusicTab:Textbox({ Title = "Music ID", Desc = "Enter a Roblox audio asset ID", Placeholder = "Enter ID here...", Value = "", ClearTextOnFocus = false, Callback = function(value) customMusicId = value end })
    MusicTab:Slider({ Title = "Custom Music Volume", Min = 0, Max = 1, Rounding = 2, Value = 0.5, Callback = function(value) customMusicVolume = value end })
    MusicTab:Button({ Title = "Play Custom Music", Desc = "Play music from the entered ID", Callback = function()
        if customMusicId and customMusicId ~= "" then
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://" .. customMusicId
            sound.Volume = customMusicVolume
            sound.Parent = game:GetService("SoundService")
            sound:Play()
            if MusicController.currentSound then pcall(function() MusicController.currentSound:Stop(); MusicController.currentSound:Destroy() end) end
            MusicController.currentSound = sound
            MusicController.volume = customMusicVolume
        end
    end })

    MusicTab:Section({Title = "Playlist"})
    local songs = {
        {Id = 101998287760411, Name = "Pahintulot - Unknown Artist"}, {Id = 113228606989893, Name = "Palaisipan - Loonie"},
        {Id = 91093214600377, Name = "Pamangulo - Loonie"}, {Id = 94020244189041, Name = "Panaginip - Unknown Artist"},
        {Id = 103186131289010, Name = "Party 4 U (Cover) - Unknown Artist"}, {Id = 115245691174726, Name = "Pasko Sa Pinas - Yeng Constantino"},
        {Id = 72274749745781, Name = "Pagsamo - Arthur Nery"}, {Id = 140617637775358, Name = "Purple Hail - Akala"},
        {Id = 107764405399357, Name = "Purple Hail - Kwento"}, {Id = 127491860913950, Name = "Purple Hail - Para"},
        {Id = 86793099693274, Name = "Puff Me Up - SUPAFLY"}, {Id = 86700413156316, Name = "Randomantic - TJ Monterde (Cover)"},
        {Id = 99019663546064, Name = "Rebound - Silent Sanctuary"}, {Id = 111330689779749, Name = "Rock That Body (Budots) - Unknown Artist"},
        {Id = 112590536755182, Name = "Sabi Ko Na Barbie Eh (Budots) - Unknown Artist"}, {Id = 77165853903435, Name = "Sakin Ka Pa Rin Hahalik - Nateman"},
        {Id = 78487275982635, Name = "Salamin Salamin - Eric"}, {Id = 137700948886903, Name = "Nosi Ba Lasi - Sampaguita"},
        {Id = 137209803817738, Name = "Siguro - Yeng Constantino"}, {Id = 106174792478284, Name = "Love Attack - Small Axe"},
        {Id = 78426236518475, Name = "Streets (Para Sa Streets) - Hev Abi"}, {Id = 120200330391730, Name = "Thank You for the Love - ABS-CBN 2015"},
        {Id = 129046939580756, Name = "The Woman Who Can't Be Moved - Unknown Artist"}, {Id = 133513122565592, Name = "Til They Take My Heart Away - Gigi De Lana"},
        {Id = 121930167781964, Name = "Titibo-Tibo - Moira Dela Torre"}, {Id = 138013123641752, Name = "Tingin - Cup of Joe"},
        {Id = 133257180884988, Name = "Torete - Moonstar88"}, {Id = 104348021759246, Name = "Two Times (Budots) - Unknown Artist"},
        {Id = 75880122752181, Name = "Umaasa - Unknown Artist"}, {Id = 81426811249394, Name = "Undressed - Sombr (Covered)"},
        {Id = 109046857444579, Name = "Urong Sulong - Alisson Shore"}, {Id = 105897803731104, Name = "Wala Na Pag-ibig - Drei"},
        {Id = 105849669299967, Name = "Walang Pag-ibig - Kievry"}, {Id = 137585819014180, Name = "Yellow - Coldplay (Live)"},
    }
    local songNames = {} for _, song in ipairs(songs) do table.insert(songNames, song.Name) end
    local selectedSongId = songs[1].Id
    MusicTab:Slider({ Title = "Volume", Min = 0, Max = 1, Rounding = 2, Value = 0.5, Callback = function(value) MusicController.volume = value; if MusicController.currentSound then MusicController.currentSound.Volume = value end end })
    MusicTab:Dropdown({ Title = "Select Song", Desc = "Choose a song to play", List = songNames, Value = songNames[1], Callback = function(value) for _, song in ipairs(songs) do if song.Name == value then selectedSongId = song.Id break end end end })
    MusicTab:Button({ Title = "Play Selected Song", Desc = "Play the selected song", Callback = function() MusicController:Play(selectedSongId) end })
    MusicTab:Button({ Title = "Stop Music", Desc = "Stop music", Callback = function() MusicController:Stop() end })
end

do
    BoostTab:Section({Title = "Speed"})
    local velocityEnabled = false
    local velocityMult = 0.01572
    local maxSpeed = 140
    local customSpeedValue = 0.01572
    local customMaxSpeed = 140
    local currentSeat = nil
    local gasHeld = false
    local brakeHeld = false
    local wHeld = false
    local sHeld = false
    local gasButton = nil
    local brakeButton = nil
    local fastBreakEnabled = false

    BoostTab:Textbox({ Title = "Type Speed", Desc = "Enter speed value (Default: 0.01572)", Placeholder = "0.01572", Value = "0.01572", ClearTextOnFocus = false, Callback = function(value) local num = tonumber(value); if num then customSpeedValue = num; velocityMult = num end end })
    BoostTab:Textbox({ Title = "Max Speed", Desc = "Enter maximum speed limit (Default: 140)", Placeholder = "140", Value = "140", ClearTextOnFocus = false, Callback = function(value) local num = tonumber(value); if num then customMaxSpeed = num; maxSpeed = num end end })
    BoostTab:Button({ Title = "Apply Speed Settings", Desc = "Apply Value", Callback = function() velocityMult = customSpeedValue; maxSpeed = customMaxSpeed end })
    BoostTab:Toggle({ Title = "Jeep Speed", Desc = "Boost your jeep speed when holding Gas or W", Value = false, Callback = function(state) velocityEnabled = state end })
    BoostTab:Toggle({ Title = "Fast Break", Desc = "When holding S or Brake, instantly stop the jeep", Value = false, Callback = function(state) fastBreakEnabled = state end })

    local function setupSeat()
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function()
            local seat = humanoid.SeatPart
            if seat and seat:IsA("BasePart") then currentSeat = seat else currentSeat = nil end
        end)
        local seat = humanoid.SeatPart
        if seat and seat:IsA("BasePart") then currentSeat = seat end
    end
    setupSeat()
    LocalPlayer.CharacterAdded:Connect(setupSeat)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.W then wHeld = true end
        if input.KeyCode == Enum.KeyCode.S then sHeld = true end
    end)
    UserInputService.InputEnded:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.W then wHeld = false end
        if input.KeyCode == Enum.KeyCode.S then sHeld = false end
    end)

    task.spawn(function()
        repeat task.wait(0.5) until LocalPlayer:FindFirstChild("PlayerGui")
        local playerGui = LocalPlayer.PlayerGui
        local success, buttonsFolder = pcall(function() return playerGui:WaitForChild("A-Chassis Interface"):WaitForChild("Buttons") end)
        if success and buttonsFolder then
            gasButton = buttonsFolder:FindFirstChild("Gas")
            brakeButton = buttonsFolder:FindFirstChild("Brake")
            if gasButton then
                gasButton.MouseButton1Down:Connect(function() gasHeld = true end)
                gasButton.MouseButton1Up:Connect(function() gasHeld = false end)
                gasButton.TouchStarted:Connect(function() gasHeld = true end)
                gasButton.TouchEnded:Connect(function() gasHeld = false end)
            end
            if brakeButton then
                brakeButton.MouseButton1Down:Connect(function() brakeHeld = true end)
                brakeButton.MouseButton1Up:Connect(function() brakeHeld = false end)
                brakeButton.TouchStarted:Connect(function() brakeHeld = true end)
                brakeButton.TouchEnded:Connect(function() brakeHeld = false end)
            end
        end
    end)

    RunService.Heartbeat:Connect(function(dt)
        if not velocityEnabled or not currentSeat then return end
        local vel = currentSeat.AssemblyLinearVelocity
        local speed = vel.Magnitude
        if (gasHeld or wHeld) and not brakeHeld and speed < maxSpeed then
            local mult = 1 + (velocityMult * (dt * 60))
            currentSeat.AssemblyLinearVelocity = Vector3.new(vel.X * mult, vel.Y, vel.Z * mult)
        end
    end)

    RunService.Heartbeat:Connect(function()
        if not fastBreakEnabled then return end
        local brakeActive = brakeHeld or sHeld
        if brakeActive then
            local character = LocalPlayer.Character
            if character then
                local hum = character:FindFirstChild("Humanoid")
                if hum and hum.SeatPart then
                    local car = hum.SeatPart.Parent
                    if car and car:FindFirstChild("Body") then
                        local body = car.Body
                        if body:FindFirstChild("#Weight") then
                            local jeepName = LocalPlayer.Name
                            local jeepnies = workspace:FindFirstChild("Jeepnies")
                            if jeepnies then
                                local jeep = jeepnies:FindFirstChild(jeepName)
                                if jeep then
                                    local controls = jeep:FindFirstChild("Controls")
                                    if controls then
                                        local limbsRE = controls:FindFirstChild("LimbsRE")
                                        if limbsRE then limbsRE:FireServer("Light", "Brake", true) end
                                    end
                                end
                            end
                            local carPrimaryPart = body["#Weight"]
                            carPrimaryPart.Velocity = Vector3.new(0, carPrimaryPart.Velocity.Y, 0)
                            carPrimaryPart.RotVelocity = Vector3.new(0, 0, 0)
                            currentSeat.Velocity = Vector3.new(0, currentSeat.Velocity.Y, 0)
                        end
                    end
                end
            end
        end
    end)
end

do
    local function teleportTo(targetPosition)
        local player = LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        local targetCFrame = CFrame.new(targetPosition)
        if humanoid and humanoid.SeatPart then
            local jeepFolder = workspace:FindFirstChild("Jeepnies")
            local jeep = jeepFolder and jeepFolder:FindFirstChild(player.Name)
            if jeep then
                local root = jeep.PrimaryPart or jeep:FindFirstChildWhichIsA("BasePart")
                if root then jeep:SetPrimaryPartCFrame(targetCFrame) return end
            end
        end
        char:PivotTo(targetCFrame)
    end

    TpTab:Section({Title = "Terminals"})
    TpTab:Button({ Title = "Bulakan Terminal", Desc = "Bulakan - Balagtas", Callback = function() teleportTo(Vector3.new(-626, 16, -3202)) end })
    TpTab:Button({ Title = "Balagtas Terminal", Desc = "Balagtas - Bulakan", Callback = function() teleportTo(Vector3.new(-3922, 17, 3156)) end })
    TpTab:Button({ Title = "Malolos Terminal", Desc = "Malolos - Bulakan", Callback = function() teleportTo(Vector3.new(17606, 16, -1195)) end })
    TpTab:Button({ Title = "Guiguinto Terminal", Desc = "Guiguinto - Bulakan", Callback = function() teleportTo(Vector3.new(1060, 16, 3167)) end })

    TpTab:Section({Title = "Drop Off"})
    TpTab:Button({ Title = "Drop point Bulakan - Guiguinto", Desc = "Bulakan to Guiguinto drop point", Callback = function() teleportTo(Vector3.new(1049.858, 14.004, 3246.740)) end })
    TpTab:Button({ Title = "Drop point Guiguinto - Bulakan", Desc = "Guiguinto to Bulakan drop point", Callback = function() teleportTo(Vector3.new(-1545, 13, -3470)) end })
    TpTab:Button({ Title = "Drop point Bulakan - Malolos", Desc = "Bulakan to Malolos drop point", Callback = function() teleportTo(Vector3.new(17793, 13, -1080)) end })
    TpTab:Button({ Title = "Drop point Bulakan - Balagtas", Desc = "Bulakan to Balagtas drop point", Callback = function() teleportTo(Vector3.new(-3802, 13, 3357)) end })
    TpTab:Button({ Title = "Drop point Balagtas - Bulakan", Desc = "Balagtas to Bulakan drop point", Callback = function() teleportTo(Vector3.new(-1512, 13, -3471)) end })

    TpTab:Section({Title = "Locations"})
    TpTab:Button({ Title = "Talyer", Desc = "Teleport to Talyer", Callback = function() teleportTo(Vector3.new(-430.981, 12.701, 620.724)) end })
    TpTab:Button({ Title = "Police Station", Desc = "Teleport to Police Station", Callback = function() teleportTo(Vector3.new(1240.597, 12.863, 3211.784)) end })
    TpTab:Button({ Title = "Malolos", Desc = "Teleport to Malolos", Callback = function() teleportTo(Vector3.new(17796, 13, -1104)) end })
    TpTab:Button({ Title = "Balagtas", Desc = "Teleport to Balagtas", Callback = function() teleportTo(Vector3.new(-3879, 14, 3482)) end })
    TpTab:Button({ Title = "Guiguinto", Desc = "Teleport to Guiguinto", Callback = function() teleportTo(Vector3.new(822, 13, 3290)) end })
    TpTab:Button({ Title = "Junk Shop", Desc = "Teleport to Junk Shop", Callback = function() teleportTo(Vector3.new(-467, 13, 772)) end })
    TpTab:Button({ Title = "Bulakan", Desc = "Teleport to Bulakan", Callback = function() teleportTo(Vector3.new(-1455, 13, -3438)) end })
end

do
    TrollTab:Section({Title = "Jeep Flinger"})
    local flingTargetName = ""
    TrollTab:Textbox({ Title = "Target Player", Desc = "Enter the player name to fling their jeep", Placeholder = "Username", Value = "", ClearTextOnFocus = false, Callback = function(value) flingTargetName = value end })
    TrollTab:Button({ Title = "Fling Jeep", Desc = "Launch the target player's jeep", Callback = function()
        if flingTargetName == "" then return end
        local target = Players:FindFirstChild(flingTargetName)
        if not target then return end
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local lp = LocalPlayer
            local char = lp.Character
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local oldPos = hrp.CFrame
                local velocity = Instance.new("BodyVelocity")
                velocity.Velocity = Vector3.new(0, 5000, 0)
                velocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                velocity.Parent = hrp
                local angular = Instance.new("BodyAngularVelocity")
                angular.AngularVelocity = Vector3.new(0, 5000, 0)
                angular.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                angular.Parent = hrp
                for i = 1, 20 do
                    if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        hrp.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3, 0)
                    end
                    task.wait(0.01)
                end
                velocity:Destroy()
                angular:Destroy()
                hrp.CFrame = oldPos
                hrp.Velocity = Vector3.new(0, 0, 0)
                hrp.RotVelocity = Vector3.new(0, 0, 0)
            end
        end
    end })

    TrollTab:Section({Title = "Jeep Breathing"})
    local breathingActive = false
    local breathingLoop = nil
    local breathingArgs = { ["Fuel"] = 49.93502950764896, ["RPM"] = 0, ["DifferentialHealth"] = 99.99882781420766, ["SteerC"] = 0, ["TransmissionHealth"] = 99.37959134382187, ["Throttle"] = 0.05, ["Mileage"] = 5, ["BatteryHealth"] = 99.9995, ["Gear"] = 0, ["DeductedExp"] = 0, ["Crashed"] = true, ["OilPressure"] = 21.75937747796297, ["FrontTiresHealth"] = 99.9994527327599, ["BrakeFluid"] = 99.99992500000002, ["TransmissionOil"] = 99.99626049976072, ["IsOn"] = false, ["ClutchHealth"] = 99.99998950000003, ["Brake"] = 0, ["RadiatorHealth"] = 99.99998868312831, ["CoolantLevel"] = 99.99888999999965, ["BrakeHealth"] = 99.99987500000002, ["RearTiresHealth"] = 99.9994527327599, ["EngineHealth"] = 99.98528651746355, ["EngineTemp"] = 46.295844052814054, ["Speed"] = 0.004640357103198767, ["EngineOil"] = 99.99626049976072, ["SteerT"] = 0, ["Password"] = 157913333 }
    TrollTab:Toggle({ Title = "Jeep Breathing", Desc = "Start it Automatic Jeep Breathing", Value = false, Callback = function(state)
        breathingActive = state
        if state then
            local player = LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local jeepnies = workspace:WaitForChild("Jeepnies", 9e9)
            local vehicle = jeepnies:WaitForChild(character.Name, 9e9)
            breathingLoop = task.spawn(function() while breathingActive do pcall(function() vehicle:WaitForChild("EngineRE", 9e9):FireServer(breathingArgs) end) task.wait(0) end end)
        else
            if breathingLoop then task.cancel(breathingLoop); breathingLoop = nil end
        end
    end })
end

pcall(function()
    local spyKeywords = { "Block remote", "Clear logs", "Copy code", "Get result", "Ignore remote", "Unblock all remotes", "Remote Spy" }
    local function ScanUI(obj)
        local detected = false
        for _, v in pairs(obj:GetDescendants()) do
            if v:IsA("TextButton") or v:IsA("TextLabel") then
                for _, keyword in pairs(spyKeywords) do
                    if string.find(string.lower(v.Text), string.lower(keyword)) then detected = true break end
                end
            end
            if detected then break end
        end
        if detected then task.wait(0.5); obj:Destroy(); LocalPlayer:Kick("anti skid") end
    end
    for _, child in pairs(CoreGui:GetChildren()) do ScanUI(child) end
    CoreGui.ChildAdded:Connect(function(child) ScanUI(child) end)
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
getgenv().Repeat = 11500
mt.__namecall = function(roar, ...)
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if roar.Name == "UnloadPassenger" then
            for i = 1, getgenv().Repeat do old(roar, ...) end
            return
        end
    end
    return old(roar, ...)
end
setreadonly(mt, true)

Window:Notify({
    Title = "nori developed",
    Desc = "All features loaded successfully!",
    Time = 2
})
