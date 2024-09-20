local Lowest = "playing"

local HTTPService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

local function checkForCakeQueen()
    local cakeQueen = workspace.Enemies:FindFirstChild("Cake Queen") or game.ReplicatedStorage:FindFirstChild("Cake Queen")
    if cakeQueen then
        return true
    else
        return false
    end
end

local success, servers = pcall(function()
    return HTTPService:JSONDecode(game:HttpGet(
        "https://games.roblox.com/v1/games/" .. tostring(game.PlaceId) .. "/servers/Public?sortOrder=Asc&limit=100"
    )).data
end)

if not success then return end

local server = servers[1]

for i, svr in pairs(servers) do
    if svr[Lowest] < server[Lowest] then
        server = svr
    end
end

TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id)

wait(3)

if checkForCakeQueen() then
    print("co bigmom, stop")
else
    print("k co bigmom, hop")
end