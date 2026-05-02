-- Miner's Haven: THE NUCLEAR AUTO-SCRIPT
local player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

print("NUCLEAR VERSION: Searching for remotes...")

-- Auto-detect Remotes (Pangitaon ang naay 'Rebirth' o 'Layout' sa ngalan)
local rebirthRemote = RS:FindFirstChild("Rebirth") or RS:FindFirstChild("RebirthRemote")
local layoutRemote = RS:FindFirstChild("Layouts") or RS:FindFirstChild("LayoutRemote")

-- Fallback search (Kung nausab gyud ang ngalan)
if not rebirthRemote or not layoutRemote then
    for _, v in pairs(RS:GetDescendants()) do
        if v:IsA("RemoteEvent") then
            if v.Name:find("Rebirth") then rebirthRemote = v end
            if v.Name:find("Layout") then layoutRemote = v end
        end
    end
end

while task.wait(1) do
    pcall(function()
        local stats = player:FindFirstChild("leaderstats") or player:FindFirstChild("Data")
        local cash = stats.Cash.Value
        
        -- FORCE LOAD (Kung bag-ong rebirth)
        if tonumber(cash) <= 1000 then
            print("Nuclear: Attempting to Load Layout...")
            if layoutRemote then
                layoutRemote:FireServer("Load", 1)
                layoutRemote:FireServer("Load", "1")
            end
        end

        -- FORCE REBIRTH (Testing mode: set to 10 para ma-test dayon)
        if tostring(cash):find("e") or tonumber(cash) > 1e10 then
            print("Nuclear: Attempting to Rebirth...")
            if rebirthRemote then
                rebirthRemote:FireServer()
            end
        end
    end)
end
