-- Miner's Haven: ULTIMATE FINAL FIX
local player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

print("FINAL FIX: Monitoring Cash and Remotes...")

-- Function para mangita sa saktong Remotes
local function getRemote(name)
    for _, v in pairs(RS:GetDescendants()) do
        if v:IsA("RemoteEvent") and v.Name:lower():find(name:lower()) then
            return v
        end
    end
    return nil
end

while task.wait(1) do
    pcall(function()
        local stats = player:FindFirstChild("leaderstats") or player:FindFirstChild("Data")
        if not stats then return end
        
        local cash = stats.Cash.Value
        local cashStr = tostring(cash):lower()

        -- 1. AUTO LOAD LAYOUT (L)
        if tonumber(cash) <= 1000 then
            local layoutRemote = getRemote("Layout")
            if layoutRemote then
                print("Final Fix: Loading Layout...")
                layoutRemote:FireServer("Load", 1)
                layoutRemote:FireServer("Load", "1")
            end
            task.wait(3)
        end

        -- 2. AUTO REBIRTH (C)
        if cashStr:find("e") then
            local rebirthRemote = getRemote("Rebirth")
            if rebirthRemote then
                print("Final Fix: Rebirthing...")
                rebirthRemote:FireServer()
            end
            task.wait(1)
        end
    end)
end
