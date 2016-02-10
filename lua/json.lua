local cjson = require 'cjson.safe'
local user = { name = 'Alpaca', age = 6 }
ngx.say(cjson.encode(user))

