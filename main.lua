-- Miner's Haven: FINAL ADJUSTED LOOP
local player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

print("SCRIPT START: Checking Layouts (L) and Settings (C) Remotes...")

-- Function para sa Force Load
local function forceLoad()
    -- Sa Miner's Haven, kasagaran naa ni sa 'Layouts' o 'LayoutsFolder'
    local layoutRemote = RS:FindFirstChild("Layouts") or RS:FindFirstChild("LayoutRemote")
    if layoutRemote then
        print("Nuclear: Loading Layout Slot 1...")
        layoutRemote:FireServer("Load", 1) 
        layoutRemote:FireServer("Load", "1")
    else
        print("Error: Dili makita ang Layout Remote (L)!")
    end
end

-- Function para sa Rebirth
local function forceRebirth()
    local rebirthRemote = RS:FindFirstChild("Rebirth") or RS:FindFirstChild("RebirthRemote")
    if rebirthRemote then
        print("Nuclear: Rebirthing via Settings (C) Logic...")
        rebirthRemote:FireServer()
    else
        print("Error: Dili makita ang Rebirth Remote (C)!")
    end
end

while task.wait(1) do
    pcall(function()
        local stats = player:FindFirstChild("leaderstats") or player:FindFirstChild("Data")
        if not stats then return end
        
        local cash = stats.Cash.Value
        
        -- Logic: Kung $50 (bag-ong rebirth), load dayon layout
        if tonumber(cash) <= 1000 then
            forceLoad()
            task.wait(3) -- Hatag time para mo-load ang base
        end

        -- Logic: Kung ang kwarta naay 'e' (scientific notation), rebirth na
        if tostring(cash):lower():find("e") then
            forceRebirth()
            task.wait(1)
        end
    end)
end
