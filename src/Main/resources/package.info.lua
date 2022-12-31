-- See https://github.com/Dot-lua/TypeWriter/wiki/package.info.lua-format for more info

return { InfoVersion = 1, -- Dont touch this

    ID = "HttpClient", -- A unique id 
    Name = "HttpClient",
    Description = "A typewriter HttpClient",
    Version = "1.0.1",

    Author = {
        Developers = {
            "CoreByte"
        },
        Contributors = {}
    },

    Dependencies = {
        Luvit = {
            "creationix/coro-http",
            "luvit/json"
        },
        Git = {},
        Dua = {}
    },

    Contact = {
        Website = "https://cubic-inc.ga",
        Source = "https://github.com/Dot-lua/TypeWriter/",
        Socials = {}
    },

    Entrypoints = {
        Main = "me.corebyte.Http.Hello"
    }

}
