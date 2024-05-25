function table_inherit(tbl, base)
	for k, v in pairs(base) do
		if (tbl[k] == nil) then
            if (k ~= "_construct") then
                tbl[k] = v
            end
        end
	end
	return tbl
end