path = require 'path'
url = require 'url'
fs = require 'fs'

module.exports = (root, handlers) ->
    root = path.join process.cwd(), root
    (req, callback) ->
        if req.method == 'GET'
            pathname = url.parse(req.url).pathname
            console.log pathname, req.url
            if pathname[pathname.length-1] == '/'
                pathname += 'index.html'
            filepath = path.join(root, pathname)
            ext = path.extname(filepath).slice(1)
            handler = handlers[ext]
            handler ?= (data, callback) ->
                callback("text/plain", data)
            fs.readFile filepath, 'utf8', (err, data) ->
                if err then callback("text/plain", err)
                else handler(data, callback)
        else
            callback("text/plain", "Not Found")
