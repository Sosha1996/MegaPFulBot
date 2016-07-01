--[[
#####################################
#                                   #
#             Broadcast             #
#                                   #
#                                   #
#   by @TeleSeed  "TeleSeed Team"   #
#                                   #
#                                   #
#      Modified by GPMod Team       #
#	                            #
#                                   #
#        Update: 7 June 2016        #
#                                   #
#                                   #
#              @GPMod               #
#                                   #
#####################################
]]

local function run(msg, matches)
	if matches[1] == 'bc' and is_admin1(msg) then
		local response = matches[3]
		--send_large_msg("chat#id"..matches[2], response)
		send_large_msg("channel#id"..matches[2], response)
	end
	if matches[1] == 'broadcast' then
		if is_sudo(msg) then -- Only sudo !
			local data = load_data(_config.moderation.data)
			local groups = 'groups'
			local response = matches[2]
			for k,v in pairs(data[tostring(groups)]) do
				chat_id =  v
				local chat = 'chat#id'..chat_id
				local channel = 'channel#id'..chat_id
				send_large_msg(chat,"اطلاعیه:\n"..response.."\n\n@GPMod Team")
				send_large_msg(channel,"اطلاعیه:\n".. response.."\n\n@GPMod Team")
			end
		end
	end
end
return {
	description = "Example: /broadcast Mega AntiSpamBot Open Source Shod...! ",
  patterns = {
	"^[!/](broadcast) +(.+)$",
	"^[!/](bc) (%d+) (.*)$"
  },
  run = run
}
