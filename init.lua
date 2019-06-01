minetest.register_chatcommand("colortag", {
  params = "number1 number2 number3",
  privs = {default = true},
  description = "Change color of player tags",

  func = function(name, param)
		local found, _, number1, number2, number3 = param:find("^(%d+)%s+(%d+)%s+(%d+)$")
		if found == nil then
			minetest.chat_send_player(name, "invalid usage: " .. param.." Missing number(s).")
			return
		end
    local numberone = tonumber(number1)
    local numbertwo = tonumber(number2)
    local numberthree = tonumber(number3)
  	    if number1 == nil or number2 == nil or number3 == nil then
          return false, "Be sure to enter all three numbers."
        end
    	if numberone > 255 or numberone < 1 then
        return false, "Number 1 must be between 1 and 255."
   	end
      if numbertwo > 255 or numbertwo < 1 then
        return false, "Number 2 must be between 1 and 255."
    	end
      if numberthree > 255 or numberthree < 1 then
       return false, "Number 3 must be between 1 and 255."
  end
  local player = minetest.get_player_by_name(name)
  player:set_nametag_attributes({color = {a = 255, r = numberone, g = numbertwo, b = numberthree}})
  minetest.chat_send_player(name, "Color changed.")
end
})
