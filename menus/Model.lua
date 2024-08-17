MENU = {}
MENU.__index = MENU

setmetatable(MENU, {
  __call = function (cls, ...)
    return cls._construct(...)
  end,
})

function MENU._construct()
  local self = setmetatable({}, MENU)

  self._data = {}
  
  return self
end

function MENU:Open()

end

function MENU:Close()

end

function MENU:SetHeader()
    
end

function MENU:SetSubHeader()
    
end

function MENU:SetFooter()
    
end

function MENU:SetFooterColor()
    
end