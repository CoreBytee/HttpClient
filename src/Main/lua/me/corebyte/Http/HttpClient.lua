local Http = {}

local Request = require("coro-http").request
local Json = require("json")

function Http.Request(Method, Url, Headers, Data, Options)
    if Headers == nil then
        Headers = {}
    end
    if Headers["User-Agent"] == nil then
        Headers["User-Agent"] = string.format(
            "CoreBytee/HttpClien@%s (%s)",
            TypeWriter.LoadedPackages["HttpClient"].Package.Version,
            "https://github.com/CoreBytee/HttpClient"
        )
    end
    
    local RequestHeaders = {}
    for HeaderKey, HeaderValue in pairs(Headers) do
        table.insert(
            RequestHeaders,
            {
                HeaderKey, HeaderValue
            }
        )
    end

    if type(Data) == "table" then
        Data = Json.encode(Data)
    end
    
    local Response, ResponseData = Request(Method, Url, RequestHeaders, Data, Options)

    local ResponseHeaders = {}
    for _, Header in pairs(Response) do
        if type(Header) == "table" then
            ResponseHeaders[Header[1]] = Header[2]
        end
    end

    local Success, ParsedResponseData = pcall(Json.decode, ResponseData)
    if type(ParsedResponseData) == "table" then
        ResponseData = ParsedResponseData
    end

    return {
        Headers = ResponseHeaders,
        Code = Response.code,
        Reason = Response.reason,
        Version = Response.version,
        KeepAlive = Response.KeepAlive,
        Data = ResponseData
    }
end

return Http