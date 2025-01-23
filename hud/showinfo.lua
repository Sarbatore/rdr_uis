--@todo: Finish this file

LIB.SHOWINFO = {}
exports("SHOWINFO", function() 
    return LIB.SHOWINFO
end)

LIB.SHOWINFO.Show = function(visible)
    RequestUiappTransitionByHash(`Map`, `show_info`)
end

LIB.SHOWINFO.Hide = function()
    RequestUiappTransitionByHash(`Map`, `hide_info`)
end