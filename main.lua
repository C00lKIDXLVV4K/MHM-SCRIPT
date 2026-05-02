-- Miner's Haven: THE STRICT FIX
local player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

print("STRICT FIX: Active and Scanning...")

-- Mas detalyado nga pagpangita sa Remote
local function findRemote(name)
    for _, v in pairs(RS:GetDescendants()) do
        if v:IsA("RemoteEvent") and v.Name:find(name) then
            return v
        end
    end
end

while task.wait(1) do
    pcall(function()
        local stats = player:FindFirstChild("leaderstats") or player:FindFirstChild("Data")
        local cash = stats.Cash.Value
        
        -- KUNG BAG-ONG REBIRTH ($50)
        if tonumber(cash) <= 1000 then
            local layoutRemote = findRemote("Layout")
            if layoutRemote then
                -- Suwayan nato ang tulo ka format kay basin sensitive ang game
                layoutRemote:FireServer("Load", "Slot 1") 
                layoutRemote:FireServer("Load", 1)
                layoutRemote:FireServer("Load", "1")
                print("Strict Fix: Command Sent to Layout!")
            end
            task.wait(5) -- Mas taas nga pahuway para dili ma-kick
        end

        -- KUNG REBIRTH TIME NA
        if tostring(cash):lower():find("e") then
            local rebirthRemote = findRemote("Rebirth")
            if rebirthRemote then
                rebirthRemote:FireServer()
                print("Strict Fix: Command Sent to Rebirth!")
            end
            task.wait(1)
        end
    end)
end
