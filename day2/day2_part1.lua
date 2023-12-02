io.input("day2_input.txt")

-- Returns a table representing a draw from the bag, given a string
-- such as "3 blue, 4 red": { blue = 3, red = 4 }
local function drawFromStr(drawStr)
    local t = {}
    for n, color in drawStr:gmatch("(%d+) (%a+)") do
        t[color] = tonumber(n)
    end
    return t
end

local load = {
    red = 12,
    green = 13,
    blue = 14
}

-- Checks if a draw is possible by comparing it with `load`
local function isDrawPossible(draw)
    for color, num in pairs(draw) do
        if num > load[color] then
            return false
        end
    end
    return true
end

-- Parse input
local games = {}
for line in io.lines() do
    local game = {}  -- Each line is a game
    local drawStrs = line:sub(9)  -- "X blue, Y red, etc"
    for drawStr in drawStrs:gmatch("[^;]+") do
        local draw = drawFromStr(drawStr)
        game[#game+1] = draw
    end
    games[#games+1] = game
end

-- Check which games are possible
local possibleIDSum = 0
for gameNr, game in ipairs(games) do
    local possible = true
    for _, draw in ipairs(game) do
        if not isDrawPossible(draw) then
            possible = false
        end
    end
    if possible then
        possibleIDSum = possibleIDSum + gameNr
    end
end

print("Sum of IDs: " .. possibleIDSum)
