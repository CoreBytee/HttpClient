print("Hello world, this is Http Client!")

local Response, Body = Import("me.corebyte.Http").Request(
    "GET",
    "http://localhost:6126/ping"
)

p(Response)
p(Body)