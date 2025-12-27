local _tp = game:GetService("TeleportService")
local _player = game.Players.LocalPlayer
local _place = game.PlaceId

queue_on_teleport([[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FMFAU/FMFAU.github.io/refs/heads/main/test.lua"))()

    local _tp = game:GetService("TeleportService")
    local _player = game.Players.LocalPlayer
    local _place = game.PlaceId

    local _char = _player.Character or _player.CharacterAdded:Wait()
    local _hrp = _char:WaitForChild("HumanoidRootPart")

    local _folders = {
        workspace.Game.LiveOpsPersistent.Christmas2025.Spawners.PresentHunt,
        workspace.Game.LiveOpsPersistent.Christmas2025.Spawners.ElfHunt
    }

    task.wait(12)

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

    task.wait(4)
    _tp:Teleport(_place, _player)
]])

_tp:Teleport(_place, _player)
