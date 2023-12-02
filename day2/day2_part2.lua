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

-- Find power of each game
local powerSum = 0
for _, game in ipairs(games) do
    local reds = {}
    local greens = {}
    local blues = {}
    for _, draw in ipairs(game) do
        reds[#reds+1] = draw.red
        greens[#greens+1] = draw.green
        blues[#blues+1] = draw.blue
    end
    local maxRed = math.max(table.unpack(reds))
    local maxGreen = math.max(table.unpack(greens))
    local maxBlue = math.max(table.unpack(blues))
    local power = maxRed*maxGreen*maxBlue
    powerSum = powerSum + power
end

print("Sum of powers: " .. powerSum)
