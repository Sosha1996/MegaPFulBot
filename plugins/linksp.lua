--[[
################################
#                              #
#         Link Support         #
#                              #
#                              #
#    by @Dragon_Born "Arian"   #
#                              #
#                              #
#    Modified by GPMod Team    #
#	                       #
#                              #
#     Update: 7 June 2016      #
#                              #
#                              #
#           @GPMod             #
#                              #
################################
]]

do

function run(msg, matches)
    local data = load_data(_config.moderation.data)
      local group_link = data[tostring(1028208576)]['settings']['set_link']
       if not group_link then
      return 'برای اولین بار ابتدا باید newlink/ را تایپ کنید'
       end
         local text = "لینک گروه پشتیبانی پاورفول:\n\n"..group_link.."\n\n@GPMod"
            return text
end

return {
  patterns = {
    "^[!/]([Ll]inksp)$"
  },
  run = run
}

end
