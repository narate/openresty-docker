local cjson = require 'cjson.safe'
local headers = ngx.req.get_headers()
ngx.say(cjson.encode(headers))
