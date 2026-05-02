-- Miner's Haven: DEBUGGED ULTRA LOOP
local player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

local layoutSlot = 1
local targetExponent = 300 

print("DEBUG VERSION: Script is starting...")

-- Function para sa Rebirth
local function doRebirth()
    print("Attempting Rebirth Remote...")
    local rebirthRemote = RS:FindFirstChild("Rebirth") or RS:FindFirstChild("RebirthRemote") -- Check alternative names
    if rebirthRemote then
        rebirthRemote:FireServer()
        rebirthRemote:FireServer(1e50)
    else
        print("Error: Rebirth Remote not found!")
    end
end

-- Function para sa Load Layout
local function loadLayout()
    print("Attempting Layout Load...")
    local layoutRemote = RS:FindFirstChild("Layouts") or RS:FindFirstChild("LayoutRemote")
    if layoutRemote then
        layoutRemote:FireServer("Load", tostring(layoutSlot))
        layoutRemote:FireServer("Load", layoutSlot)
    else
        print("Error: Layout Remote not found!")
    end
end

while task.wait(0.5) do
    pcall(function()
        local stats = player:FindFirstChild("leaderstats") or player:FindFirstChild("Data")
        if not stats then return end
        
        local cash = stats.Cash.Value
        local cashStr = tostring(cash):lower()
        
        -- Trigger Load Layout kung $50 pa ang kwarta
        if tonumber(cash) < 1000 then
            loadLayout()
            task.wait(3) 
        end

        -- Trigger Rebirth kung lapas na sa target exponent
        if cashStr:find("e") then
            local exp = tonumber(cashStr:split("e")[2])
            if exp and exp >= targetExponent then
                doRebirth()
                task.wait(1)
            end
        end
    end)
end
