#!/usr/bin/lua

function ltrim(s)
  return s:match'^%s*(.*)'
end

function calc(total)
	if total < 1000 then
		tstr = string.format("%.2f", total)
		tfm = " K"
	else
		if total < 1000000 then
			tstr = string.format("%.2f", total/1000)
			tfm = " MB"
		else
			tstr = string.format("%.2f", total/1000000)
			tfm = " GB"
		end
	end
	str = tstr .. tfm
	return ltrim(str)
end

aamt = arg[1]
uamt = arg[2]
amt = aamt - uamt
amts = calc(amt)
tfile = io.open("/tmp/amtleft", "w")
tfile:write(amts, "\n")
tfile:close()