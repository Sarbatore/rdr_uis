local countDownContainer = DatabindingAddDataContainerFromPath("", "MPCountdown")
local durationData = DatabindingAddDataString(countDownContainer, "Timer", 0)
local showTimerData = DatabindingAddDataBool(countDownContainer, "showTimer", false)

LIB.COUNTDOWN = {}
exports("COUNTDOWN", function()
    return LIB.COUNTDOWN
end)

--- Start the countdown
---@param from number
---@param to number
---@param onUpdateCallback function
---@param onFinishCallback function
LIB.COUNTDOWN.Start = function(from, to, onUpdateCallback, onFinishCallback)
    DatabindingWriteDataString(durationData, from)
    DatabindingWriteDataBool(showTimerData, true)

    local step = from > to and -1 or 1

    for remainingTime = from, to, step do
        DatabindingWriteDataString(durationData, remainingTime)
        if onUpdateCallback then
            onUpdateCallback(remainingTime)
        end

        Citizen.Wait(1000)
    end

    DatabindingWriteDataBool(showTimerData, false)

    if onFinishCallback then
        onFinishCallback()
    end
end
exports("StartCountDown", LIB.COUNTDOWN.Start)