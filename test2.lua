--// LongDrive

--[[
Key System shit!
This script is not meant to be cracked or whatever.
people can just print(key)
it's just so my server revives :)
]]

-- This is to be IGNORED
_G.config = {
    farming = {
        SuperFarm = false, -- Causes ServerJumps ect.

        Enabled = false, -- Simple Arrest Farm
        Arrested = 0,
    },
    cookiefarming = {
        Enabled = false
    },
    atmfarming = {
        Enabled = false
    }
} 

local Key = "LongDrive-1912-2311-5522-6769"

-- Core

local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/FMFAU/Roblox/refs/heads/main/Libraries/NotificationLibraryV2"))()
local UiLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/FMFAU/Roblox/refs/heads/main/Libraries/OpenCoreUI"))()


--Save Loader-->
local activated = nil
local theme = "Dark"

if isfolder("LongDrive") and isfile("LongDrive/Key") then
    if readfile("LongDrive/Key") == Key then
        activated = true
        print("Key Saved")

        NotificationLibrary:Notify({
            Title = "Loaded Save",
            Text = "Key was loaded from File",
            Type = "Success",
            Duration = 3
        })

        if isfile("LongDrive/UiTheme") then
            theme = readfile("LongDrive/UiTheme")
        end
    else
        return
    end
else
    makefolder("LongDrive")
end
-----------------<

--File Checker-->
local function CheckFiles()
    local FolderFound = isfolder("LongDrive")
    local KeyFound = false
    local ThemeFound = false

    if FolderFound == false then
        makefolder("LongDrive")
    end

    if isfile("LongDrive/Key") and readfile("LongDrive/Key") == Key then
        KeyFound = false
    end
    if isfile("LongDrive/Key") and readfile("LongDrive/Key") == "Dark" or "Light" then
        ThemeFound = false
    end

    return KeyFound, ThemeFound
end
----------------<

--Key System-->
if not activated then
    NotificationLibrary:Input({
        Title = "Enter the Key",
        Text = "Enter the key from the discord server.",
        Type = "Info",
        PlaceholderText = "Key",
        OnConfirm = function(value)
            if value == Key then
                activated = true

                NotificationLibrary:Notify({
                    Title = "Authenticated",
                    Text = "Key accepted!",
                    Type = "Success",
                    Duration = 3
                })

                writefile("LongDrive/Key", Key)
            else
                NotificationLibrary:Notify({
                    Title = "Error",
                    Text = "Key Failed!",
                    Type = "Error",
                    Duration = 3
                })
            end
        end
    })

    NotificationLibrary:Confirm({
        Title = "Copy Discord Invite?",
        Text = "The key is in the discord server.",
        YesText = "Copy",
        NoText = "Cancel",
        OnYes = function()
            setclipboard("https://discord.gg/dZCdGY4N3b")
            NotificationLibrary:Notify({
                Title = "Copied",
                Text = "Discord Invite Copied",
                Type = "Success",
                Duration = 3
            })
        end,
        OnNo = function()
            NotificationLibrary:Notify({
                Title = "Cancelled",
                Text = "Understood",
                Type = "Error",
                Duration = 3
            })
        end
    })

    return
end
    
-------------<

--UI-->
local Window = UiLibrary:CreateWindow({
	Title = "LongDrive",
	Subtitle = "Driving Empire Script",
	Theme = theme,
	Size = UDim2.new(0, 450, 0, 300)
})
------<

--Tabs-->
local HomeTab = Window:CreateTab({
	Name = "Home",
	Icon = "11433532654" --rbxasset://11433532654 | House Icon
})
local FarmingTab = Window:CreateTab({
	Name = "Farming",
	Icon = "11963373658" -- rbxassetid://11963373658 | Money Icon
})
--------<

--Home Tab-->
local Home_CreditSection = HomeTab:CreateSection("Credits")
Home_CreditSection:AddLabel({
	Text = "Ui Libary : DIZZY"
})
Home_CreditSection:AddLabel({
	Text = "Notification Library : DIZZY"
})
Home_CreditSection:AddLabel({
	Text = "This Script : DIZZY"
})
Home_CreditSection:AddButton({
	Name = "Join Discord",
	Callback = function()
        setclipboard("https://discord.gg/dZCdGY4N3b")
        NotificationLibrary:Notify({
            Title = "Copied",
            Text = "Discord Invite Copied",
            Type = "Success",
            Duration = 3
        })
	end
})

local Home_UiConfigSection = HomeTab:CreateSection("UI Config")
Home_UiConfigSection:AddToggle({
	Name = "Dark Theme",
	Default = true,
	Callback = function(value)
        CheckFiles()

        if value == true and theme == "Dark" then  writefile("LongDrive/UiTheme", "Dark") return end

		if value then
            writefile("LongDrive/UiTheme", "Dark")

            NotificationLibrary:Notify({
                Title = "Ui Configured",
                Text = "Dark Theme Enabled: Restart script to apply",
                Type = "Success",
                Duration = 3
            })
        else
            writefile("LongDrive/UiTheme", "Light")

            NotificationLibrary:Notify({
                Title = "Ui Configured",
                Text = "Light Theme Enabled: Restart script to apply",
                Type = "Success",
                Duration = 3
            })
        end
	end
})
------------<

--Farming Tab-->
local Farming_CashSection = FarmingTab:CreateSection("Arrest Farm")
local ArrestedLabel = Farming_CashSection:AddLabel({
	Text = "Total Arrested: "..tonumber(_G.config.farming.Arrested)
})
task.spawn(function()
    while task.wait(0.1) do
        ArrestedLabel:Set("Total Arrested: : "..tonumber(_G.config.farming.Arrested))
    end
end)

Farming_CashSection:AddToggle({
    Name = "Super Farm (Serverhops)",
    Default = _G.config.farming.SuperFarm,
    Callback = function(value)
        _G.config.farming.SuperFarm = value
    end
})
Farming_CashSection:AddToggle({
    Name = "Arrest Farm",
    Default = _G.config.farming.Enabled,
    Callback = function(value)
        if _G.config.cookiefarming.Enabled == true then
            NotificationLibrary:Notify({
                Title = "Error",
                Text = "Disable Other Farms to use this Farming method",
                Type = "Error",
                Duration = 3
            })
            return
        else
            _G.config.farming.Enabled = value
        end
    end
})

local ATMfarmStatus = "Not Enabled"

local Farming_ATMSection = FarmingTab:CreateSection("ATM Farm")
local ATMStatusLabel = Farming_ATMSection:AddLabel({
    Text = "Status "..ATMfarmStatus
})
task.spawn(function()
    while task.wait(0.1) do
        ATMStatusLabel:Set("Status: "..ATMfarmStatus)
    end
end)


Farming_ATMSection:AddToggle({
    Name = "ATM Farm",
    Default = _G.config.atmfarming.Enabled,
    Callback = function(value)
        if _G.config.farming.Enabled or _G.config.cookiefarming.Enabled == true then
            NotificationLibrary:Notify({
                Title = "Error",
                Text = "Disable Other Farms to use this Farming method",
                Type = "Error",
                Duration = 3
            })
            return
        else
            _G.config.atmfarming.Enabled = value
        end
    end
})

local Farming_CookieSection = FarmingTab:CreateSection("Cookie Farm")
Farming_CookieSection:AddToggle({
    Name = "Cookie Farm",
    Default = _G.config.cookiefarming.Enabled,
    Callback = function(value)
        if _G.config.farming.Enabled or _G.config.atmfarming.Enabled == true then
            NotificationLibrary:Notify({
                Title = "Error",
                Text = "Disable Other Farms to use this Farming method",
                Type = "Error",
                Duration = 3
            })
            return
        else
            _G.config.cookiefarming.Enabled = value
        end
    end
})
---------------<

-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

local Remotes = ReplicatedStorage:WaitForChild("Remotes")

--Cookie Farm-->
task.spawn(function()
    while true do
        if _G.config.cookiefarming.Enabled then
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")

            if hrp then
                for _, v in pairs(Workspace.Game.LiveOpsPersistent.Christmas2025.Spawners.PresentHunt:GetDescendants()) do
                    if v:IsA("Model") and v.Name:find("Present") then
                        local pp = v.PrimaryPart or v:FindFirstChildWhichIsA("BasePart")
                        if pp then
                            v.PrimaryPart = pp
                            pp.Anchored = false
                            v:SetPrimaryPartCFrame(hrp.CFrame * CFrame.new(0, 0, -3))
                        end
                    elseif v:IsA("BasePart") and v.Name:find("Present") then
                        v.Anchored = false
                        v.CFrame = hrp.CFrame * CFrame.new(0, 0, -3)
                    end
                end
            end
        end
        task.wait(0.3)
    end
end)
---------------<

--ATM Farm-->
task.spawn(function()
    local total_robbed = 0
    local default_gravity = 198.2
    local unsafe_atms = {}
    local security_positions = {}
    local last_security_update = 0
    local should_have_gravity = true
    
    local ATM_SECURITY_RANGE = 180
    local SCAN_SECURITY_RANGE = 220
    local EMERGENCY_RANGE = 140
    local UPDATE_INTERVAL = 0.1
    
    local function get_wanted_time_remaining()
        local gui = LocalPlayer.PlayerGui
        local hud = gui and gui:FindFirstChild("MainHUD")
        if not hud then return end
        
        local notification = hud:FindFirstChild("Notification")
        if not notification then return end
        
        local notification_frame = notification:FindFirstChild("Notification")
        if not notification_frame then return end
        
        local title = notification_frame:FindFirstChild("Title")
        if not title then return end
        
        local minutes, seconds = title.Text:match("(%d+):(%d+)")
        if minutes then 
            return tonumber(minutes) * 60 + tonumber(seconds) 
        end
    end
    
    -- Gravity control loop
    task.spawn(function()
        while true do
            if _G.config.atmfarming.Enabled then
                Workspace.Gravity = should_have_gravity and default_gravity or 0
            else
                Workspace.Gravity = default_gravity
            end
            task.wait(0.1)
        end
    end)
    
    -- Drop off teleporter loop
    task.spawn(function()
        while true do
            if _G.config.atmfarming.Enabled then
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                
                if hrp then
                    local remaining_time = get_wanted_time_remaining()
                    
                    if remaining_time and remaining_time > 300 then -- 5 minutes = 300 seconds
                        ATMfarmStatus = "Dropping Off"
                        should_have_gravity = true
                        hrp.Anchored = false
                        hrp.CFrame = CFrame.new(-2545.02, 20, 4029.86)
                    end
                end
            end
            task.wait(1)
        end
    end)
    
    local function get_character_root(character)
        return character and character:FindFirstChild("HumanoidRootPart")
    end
    
    local function refresh_security_positions()
        if tick() - last_security_update < UPDATE_INTERVAL then return end
        last_security_update = tick()
        table.clear(security_positions)
        for _, other_player in pairs(Players:GetPlayers()) do
            if other_player ~= LocalPlayer and other_player.Team and other_player.Team.Name == "Security" then
                local root = get_character_root(other_player.Character)
                if root then
                    table.insert(security_positions, root.Position)
                end
            end
        end
    end
    
    local function check_security_nearby(position, radius)
        refresh_security_positions()
        for _, security_pos in pairs(security_positions) do
            if (security_pos - position).Magnitude <= radius then
                return true, security_pos
            end
        end
        return false, nil
    end
    
    local function emergency_escape(root)
        if not root then return end
        local safe_height = 2200
        local current_pos = root.Position
        root.Anchored = true
        root.CFrame = CFrame.new(current_pos.X, safe_height, current_pos.Z)
        task.wait(0.1)
        root.Anchored = false
    end
    
    local function disable_collision(model)
        for _, part in pairs(model:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
    
    local function check_atm_safe(atm)
        local atm_id = atm:GetDebugId()
        if unsafe_atms[atm_id] then return false end
        
        local atm_position = atm:GetPivot().Position
        local has_security = check_security_nearby(atm_position, ATM_SECURITY_RANGE)
        if has_security then
            unsafe_atms[atm_id] = true
            return false
        end
        
        local atm_part = atm:FindFirstChild("ATM")
        if atm_part then
            local impact = atm_part:FindFirstChild("ImpactAttachment")
            if impact then
                local shard = impact:FindFirstChild("Shard")
                if shard and shard.Enabled then
                    unsafe_atms[atm_id] = true
                    return false
                end
            end
        end
        return true
    end
    
    local function teleport_character(root, target_cframe, duration)
        local start_cframe = root.CFrame
        local start_time = tick()
        root.Anchored = true
        
        while _G.config.atmfarming.Enabled and tick() - start_time < duration do
            local has_security = check_security_nearby(root.Position, EMERGENCY_RANGE)
            if has_security then
                emergency_escape(root)
                return true
            end
            local progress = (tick() - start_time) / duration
            root.CFrame = start_cframe:Lerp(target_cframe, progress)
            RunService.Heartbeat:Wait()
        end
        
        root.CFrame = target_cframe
        root.Anchored = false
        return false
    end
    
    local search_locations = {}
    do
        local heights = {1200, 1400, 1600, 1800}
        local distances = {0, 1000, 2000, 3000, 4000}
        for _, height in pairs(heights) do
            for _, distance in pairs(distances) do
                table.insert(search_locations, Vector3.new(distance, height, distance))
                table.insert(search_locations, Vector3.new(-distance, height, -distance))
                table.insert(search_locations, Vector3.new(distance, height, -distance))
                table.insert(search_locations, Vector3.new(-distance, height, distance))
            end
        end
    end
    
    local function search_for_atm(root)
        for _, location in pairs(search_locations) do
            if not _G.config.atmfarming.Enabled then return end
            
            local has_security = check_security_nearby(root.Position, EMERGENCY_RANGE)
            if has_security then
                emergency_escape(root)
                task.wait(2)
                return nil
            end
            
            local location_safe = check_security_nearby(location, SCAN_SECURITY_RANGE)
            if not location_safe then
                local escaped = teleport_character(root, CFrame.new(location), 0.5)
                if escaped then
                    task.wait(2)
                    return nil
                end
                task.wait(0.2)
                
                local spawners = workspace.Game.Jobs.CriminalATMSpawners:GetChildren()
                for _, spawner in pairs(spawners) do
                    if spawner.Name == "CriminalATMSpawner" then
                        local atm = spawner:FindFirstChild("CriminalATM")
                        if atm and atm:IsA("Model") and check_atm_safe(atm) then
                            return atm
                        end
                    end
                end
            end
        end
    end
    
    while true do
        if _G.config.atmfarming.Enabled then
            ATMfarmStatus = "Running"
            
            local character = LocalPlayer.Character
            if not character then
                task.wait(1)
                continue
            end
            
            local root = get_character_root(character)
            if not root then
                task.wait(1)
                continue
            end
            
            ATMfarmStatus = "Scanning"
            should_have_gravity = false
            local target_atm = search_for_atm(root)
            
            if target_atm and _G.config.atmfarming.Enabled then
                if not check_atm_safe(target_atm) then
                    ATMfarmStatus = "Evading"
                    emergency_escape(root)
                    task.wait(1)
                    continue
                end
                
                disable_collision(target_atm)
                ATMfarmStatus = "Moving"
                local escaped = teleport_character(root, target_atm:GetPivot() * CFrame.new(0, 3, -2), 0.4)
                
                if escaped then
                    task.wait(1)
                    continue
                end
                
                local prompt = target_atm:FindFirstChildWhichIsA("ProximityPrompt", true)
                if prompt then
                    ATMfarmStatus = "Active"
                    should_have_gravity = true

                    for iteration = 1, 65 do
                        local has_security = check_security_nearby(root.Position, EMERGENCY_RANGE)
                        if has_security then
                            ATMfarmStatus = "Evading"
                            should_have_gravity = false
                            emergency_escape(root)
                            task.wait(2)
                            break
                        end
                        
                        if not check_atm_safe(target_atm) or not _G.config.atmfarming.Enabled then 
                            break 
                        end
                        pcall(function() 
                            prompt:InputHoldBegin() 
                        end)
                        task.wait(0.12)
                    end
                    pcall(function() 
                        prompt:InputHoldEnd() 
                    end)
                end
                
                if not check_atm_safe(target_atm) then
                    ATMfarmStatus = "Evading"
                    should_have_gravity = false
                    emergency_escape(root)
                    task.wait(1)
                    continue
                end
                
                total_robbed = total_robbed + 1
                ATMfarmStatus = "Completed: " .. total_robbed
            end
        else
            ATMfarmStatus = "Not Enabled"
            should_have_gravity = true
        end
        task.wait(0.3)
    end
end)
------------<

--Arrest Farm
task.spawn(function()
    local function ChangeTeam(name)
        Remotes:WaitForChild("RequestEndJobSession"):FireServer("jobPad")
        task.wait(0.3)
        if name == "Outlaw" then name = "Criminal" end
        Remotes:WaitForChild("RequestStartJobSession"):FireServer(name,"jobPad")
        task.wait(0.5)
    end

    local function GetBounty(text)
        local num = text:match("%$(%d+)")
        return num and tonumber(num) or 0
    end

    local function FindTarget()
        local best = 0
        local target = nil

        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Team and plr.Team.Name == "Outlaw" then
                local char = Workspace:FindFirstChild(plr.Name)
                if char and char:FindFirstChild("Head") then
                    local bb = char.Head:FindFirstChild("CharacterBillboard")
                    if bb then
                        for _, v in pairs(bb:GetDescendants()) do
                            if v:IsA("TextLabel") and v.Text:find("%$") then
                                local amt = GetBounty(v.Text)
                                if amt > best then
                                    best = amt
                                    target = plr
                                end
                            end
                        end
                    end
                end
            end
        end

        return target, best
    end

    if isfile("LongDrive/Arrests") then
        local saved = tonumber(readfile("LongDrive/Arrests"))
        if saved then _G.config.farming.Arrested = saved end
    end

    local noOutlawTimer = 0
    local wasEnabled = false

    if _G.AutoEnableSuperFarm then
        _G.config.farming.SuperFarm = true
        _G.config.farming.Enabled = true
        _G.AutoEnableSuperFarm = nil
    end

    local positions = {}
    local c1 = Vector3.new(-729, 384, 3112)
    local c2 = Vector3.new(-248, 42, -1732)
    local r = 1500
    local d = 120
    
    for x = -r, r, d do
        for z = -r, r, d do
            for y = 0, 700, 140 do
                table.insert(positions, c1 + Vector3.new(x, y, z))
                table.insert(positions, c2 + Vector3.new(x, y, z))
            end
        end
    end
    
    for x = -6000, 6000, 400 do
        for z = -6000, 6000, 400 do
            for y = 100, 800, 300 do
                local p = Vector3.new(x, y, z)
                if (p - c1).Magnitude > r and (p - c2).Magnitude > r then
                    table.insert(positions, p)
                end
            end
        end
    end
    
    while true do
        task.wait(0.1)
        
        if not _G.config.farming.Enabled then
            if wasEnabled then
                Remotes:WaitForChild("RequestEndJobSession"):FireServer("jobPad")
                wasEnabled = false
            end
            task.wait(1)
            continue
        end
        
        if not wasEnabled then
            task.wait(1)
            ChangeTeam("Security")
            task.wait(2)
            wasEnabled = true
        end

        local count = 0
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Team and plr.Team.Name == "Outlaw" then
                count = count + 1
            end
        end
        
        if count == 0 then
            if _G.config.farming.SuperFarm then
                noOutlawTimer = noOutlawTimer + 0.1
                
                if noOutlawTimer >= 10 then
                    writefile("LongDrive/Arrests", tostring(_G.config.farming.Arrested))
                    
                    queue_on_teleport([[
                        repeat task.wait() until game:IsLoaded()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/FMFAU/FMFAU.github.io/refs/heads/main/test2.lua"))()
                        task.wait(0.003)
                        _G.config.farming.Enabled = true
                        _G.config.farming.SuperFarm = true
                    ]])
                    
                    NotificationLibrary:Notify({
                        Title = "Server Hopping",
                        Text = "No outlaws, switching servers...",
                        Type = "Info",
                        Duration = 3
                    })
                    
                    task.wait(1)
                    
                    pcall(function()
                        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
                    end)
                    break
                end
            else
                task.wait(2)
            end
            continue
        else
            noOutlawTimer = 0
        end

        local target, bounty = FindTarget()
        
        if (not target or bounty == 0) and count > 0 then
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            if hrp then
                for i, pos in pairs(positions) do
                    if not _G.config.farming.Enabled then break end
                    
                    hrp.CFrame = CFrame.new(pos)
                    
                    for j = 1, 3 do
                        task.wait()
                        target, bounty = FindTarget()
                        if target and bounty > 0 then break end
                    end
                    
                    if target and bounty > 0 then break end
                end
            end
        end
        
        if target and bounty > 0 then
            local char = Workspace:FindFirstChild(target.Name)
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            if char and char:FindFirstChild("HumanoidRootPart") and hrp then
                local old = bounty
                local start = tick()
                
                while _G.config.farming.Enabled and tick() - start < 2 do
                    local t = char:FindFirstChild("HumanoidRootPart")
                    if not t then break end
                    hrp.CFrame = t.CFrame * CFrame.new(0, 5, 0)
                    task.wait()
                end
                
                task.wait(0.2)
                local _, new = FindTarget()
                
                if new < old or new == 0 then
                    _G.config.farming.Arrested = _G.config.farming.Arrested + 1
                    writefile("LongDrive/Arrests", tostring(_G.config.farming.Arrested))
                    
                    NotificationLibrary:Notify({
                        Title = "Arrest Complete",
                        Text = "Total: " .. _G.config.farming.Arrested,
                        Type = "Success",
                        Duration = 2
                    })
                end
            end
        else
            task.wait(_G.config.farming.SuperFarm and 1 or 2)
        end
    end
end)
