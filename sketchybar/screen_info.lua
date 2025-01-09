local screenInfo = {}

function screenInfo.getDisplays()
    local command = "system_profiler SPDisplaysDataType"
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()

    local displays = {}
    for display in result:gmatch("Resolution:%s*(%d+%s*x%s*%d+)") do
        table.insert(displays, display)
    end

    return displays
end

function screenInfo.checkNotchForDisplays()
    local displays = screenInfo.getDisplays()
    local notchInfo = {}

    for i, display in ipairs(displays) do
        local width, height = string.match(display, "(%d+)%s*x%s*(%d+)")

        notchInfo[i] = (width == "3024" and height == "1964") 
    end

    return notchInfo
end

function screenInfo.getNotchStatusForDisplay(displayIndex)
    local notchInfo = screenInfo.checkNotchForDisplays()
    return notchInfo[displayIndex] or false 
end

return screenInfo
