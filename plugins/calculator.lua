--[[
################################
#                              #
#          Calculator          #
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

-- Function reference: http://mathjs.org/docs/reference/functions/categorical.html

local function mathjs(exp)
  local url = 'http://api.mathjs.org/v1/'
  url = url..'?expr='..URL.escape(exp)
  local b,c = http.request(url)
  local text = nil
  if c == 200 then
    text = 'نتیجه: '..b
  
  elseif c == 400 then
    text = b
  else
    text = 'خطای غیر منتظره\n'
      ..'Is api.mathjs.org up?'
  end
  return text
end

local function run(msg, matches)
  return mathjs(matches[1])
end

return {
  description = "Calculate math expressions with mathjs API",
  usage = "!calc [expression]: evaluates the expression and sends the result.",
  patterns = {
	"^[!/][Cc]alc (.*)$"
  },
  run = run
}
