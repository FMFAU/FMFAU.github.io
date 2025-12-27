queue_on_teleport([[
    loadstring(game:HttpGet("https://fmfau.vercel.app/test.lua"))()

    local _tp = game:GetService("TeleportService")
    local _player = game.Players.LocalPlayer
    local _place = game.PlaceId

    local _char = _player.Character or _player.CharacterAdded:Wait()
    local _hrp = _char:WaitForChild("HumanoidRootPart")

    local _folders = {
        workspace.Game.LiveOpsPersistent.Christmas2025.Spawners.PresentHunt,
        workspace.Game.LiveOpsPersistent.Christmas2025.Spawners.ElfHunt
    }

    task.spawn(function()
        local a = Instance.new("ScreenGui", _player:WaitForChild("PlayerGui"))

        local t = Instance.new("TextLabel", a)
        t.AnchorPoint = Vector2.new(0.5, 0.5)
        t.Position = UDim2.new(0.5, 0, 0.2, 0)
        t.Size = UDim2.new(0, 200, 0, 50)
        t.TextColor3 = Color3.new(0,0,0)
        t.BackgroundTransparency = 1
        t.TextScaled = false
        t.TextSize = 25

        while task.wait() do
            local cashLabel = _player.PlayerGui.Christmas2025UI.Christmas2025.Holder.MainHolder.Topbar.Tab2.Money.items.cash
            local cashText = cashLabel and cashLabel.Text or "0"
            t.Text = "Auto Farmer Running...\nCurrent Cookies\n\n" .. cashText
        end
    end)

    local function teleportToParts(duration)
        local start = tick()
        while tick() - start < duration do
            for _, folder in pairs(_folders) do
                for _, part in pairs(folder:GetDescendants()) do
                    if part:IsA("Part") then
                        part.CanCollide = false
                        part.Anchored = false
                        _hrp.CFrame = part.CFrame * CFrame.new(0, 3, 0)
                        task.wait(0.2)
                    end
                end
            end
        end
    end

    teleportToParts(70)

    _tp:Teleport(_place, _player)
]])
