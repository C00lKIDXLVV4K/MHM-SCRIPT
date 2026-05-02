-- Miner's Haven: FAST AUTO REBIRTH LOOP
local player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

local layoutSlot = 1
local rebirthReq = 1e500 -- Target nimo

print("Advanced Auto-Script is running via GitHub!")

while task.wait(0.5) do -- Mas paspas nga check (0.5 sec)
    pcall(function()
        local stats = player:FindFirstChild("leaderstats") or player:FindFirstChild("Data")
        if not stats then return end
        
        local cash = stats.Cash.Value

        -- 1. AUTOMATIC LOADOUT (Kung wala pay kwarta o bag-ong rebirth)
        if tonumber(cash) < 1000 then
            if RS:FindFirstChild("Layouts") then
                RS.Layouts.FireServer("Load", tostring(layoutSlot))
                RS.Layouts.FireServer("Load", layoutSlot)
                print("Layout Slot 1 Loaded.")
                task.wait(3) -- Wait kadiyot para maka-flow ang ore
            end
        end

        -- 2. DETECT KUNG KA-REBIRTH NA (Lapas sa target o naay 'e' condition)
        local canRebirth = false
        if tonumber(cash) >= rebirthReq then
            canRebirth = true
        elseif tostring(cash):find("e") then
            local exponent = tonumber(tostring(cash):split("e")[2])
            if exponent and exponent >= 500 then
                canRebirth = true
            end
        end

        -- 3. REBIRTH SEQUENCE (Settings Rebirth)
        if canRebirth then
            print("Money detected! Clicking Rebirth...")
            if RS:FindFirstChild("Rebirth") then
                -- Gi-duplicate ang remote para segurado mo-toplok sa server
                RS.Rebirth:FireServer() 
                RS.Rebirth:FireServer(rebirthReq)
            end
            task.wait(1) -- Pause kadiyot para dili ma-spam ang remote
        end
    end)
end
