# OpenResty docker

```
# docker build -t openresty .
# docekr run -it -d -p 8888:80 --name lua_api -h lua_api -v "$PWD/lua":/opt/lua openresty
# curl 127.0.0.1:8888/api/v1/hello
Hello, World!
```

## Example
```
lua
├── headers.lua
├── hello.lua
└── json.lua

```

## How to add new file
Add new file to `lua/newfile.lua`

__Example.__
```
-- lua/newfile.lua
for i=1,10 do
    ngx.say(i)
end
```

__See result__
```
$ curl 127.0.0.1:8888/api/v1/newfile
```

## Documents for OpenResty
https://github.com/openresty/lua-nginx-module