io.input("day1_input.txt")

local matchtodigit = {
    one = 1,
    two = 2,
    three = 3,
    four = 4,
    five = 5,
    six = 6,
    seven = 7,
    eight = 8,
    nine = 9
}
for i = 1, 9 do
    matchtodigit[tostring(i)] = i
end
local patterns = {}
for k,_ in pairs(matchtodigit) do
    patterns[#patterns+1] = k
end

local calibrationsum = 0
for line in io.lines() do
    local digits = {}  -- Will contain the digits found in a line
    -- Look through the whole line one step at a time
    local pos = 1
    while pos <= #line do
        for _, pattern in ipairs(patterns) do
            local substr = line:sub(pos, pos+#pattern-1)
            if substr == pattern then
                local digit = matchtodigit[substr]
                digits[#digits+1] = digit
            end
        end
        pos = pos + 1
    end
    -- digits should now contain all digits from the line
    -- extract the first and last one
    calibrationsum = calibrationsum + tonumber(digits[1] .. digits[#digits])
end
print("Calibration sum:", calibrationsum)
