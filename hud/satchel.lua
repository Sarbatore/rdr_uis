--@todo: Finish this file

LIB.SATCHEL = {}
exports("SATCHEL", function()
    return LIB.SATCHEL
end)

LIB.SATCHEL.Open = function()
    LaunchUiappByHash(`satchel`)
end
exports("OpenSatchel", LIB.SATCHEL.Open)

LIB.SATCHEL.Close = function()
    CloseUiappByHash(`satchel`)
end
exports("CloseSatchel", LIB.SATCHEL.Close)