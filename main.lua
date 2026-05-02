-- Miner's Haven: ULTIMATE FAST LOOP (Based on Video Logic)
local player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

local layoutSlot = 1
local targetExponent = 300 -- Tungod kay $1e301 na imong kwarta

print("Ultimate Auto-Script is running via GitHub!")

-- Function para sa Rebirth Sequence
local function doRebirth()
    print("Rebirthing...")
    if RS:FindFirstChild("Rebirth") then
        RS.Rebirth:FireServer()
        RS.Rebirth:FireServer(1e50) -- Trigger server call
    end
end

-- Function para sa Load Layout
local function loadLayout()
    print("Loading Layout Slot "..tostring(layoutSlot))
    if RS:FindFirstChild("Layouts") then
        RS.Layouts.FireServer("Load", tostring(layoutSlot))
        RS.Layouts.FireServer("Load", layoutSlot)
    end
end

while task.wait(0.1) do -- Paspas nga loop
    pcall(function()
        local stats = player:FindFirstChild("leaderstats") or player:FindFirstChild("Data")
        if not stats then return end
        
        local cash = stats.Cash.Value
        local cashStr = tostring(cash):lower() -- Himoong small letter para dali ma-detect
        
        -- 1. KUNG BAG-ONG REBIRTH (Gamay cash), LOAD LAYOUT DAYON
        if tonumber(cash) < 1000 then
            loadLayout()
            task.wait(2) -- Wait kadiyot para sa ores
        end

        -- 2. CHECK KUNG LAPAS NA SA TARGET EXPONENT
        if cashStr:find("e") then
            local exp = tonumber(cashStr:split("e")[2])
            if exp and exp >= targetExponent then
                doRebirth()
                task.wait(1)
            end
        end
    end)
end
