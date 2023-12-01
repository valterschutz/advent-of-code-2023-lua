io.input("day1_input.txt")

local calibrationsum = 0
for line in io.lines() do
    local firstDigit = line:match("%d")
    local lastDigit = line:match("(%d)[^%d]*$")
    calibrationsum = calibrationsum + tonumber(firstDigit .. lastDigit)
end
print(calibrationsum)
