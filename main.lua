-- C00LKIDXLVV4K SCRIPTAASS

-- Miner's Haven Mod: FULL AUTO (GitHub Version)
local player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

local layoutSlot = 1 
local rebirthReq = 1e1500 

print("Auto-Script is running via GitHub!")

while task.wait(2) do
    pcall(function()
        local stats = player:FindFirstChild("leaderstats") or player:FindFirstChild("Data")
        if not stats then return end
        
        local cash = stats.Cash.Value
        
        -- AUTO REBIRTH
        if tostring(cash):find("e") or tonumber(cash) >= rebirthReq then
            if RS:FindFirstChild("Rebirth") then
                RS.Rebirth:FireServer()
                RS.Rebirth:FireServer(rebirthReq)
            end
        end
        
        -- AUTO LAYOUT
        if tonumber(cash) < 1000 then
            if RS:FindFirstChild("Layouts") then
                RS.Layouts:FireServer("Load", tostring(layoutSlot))
                RS.Layouts:FireServer("Load", layoutSlot)
            end
            task.wait(3)
        end
    end)
end
