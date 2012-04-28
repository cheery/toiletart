appjs = require 'appjs'
staticRouter = require './router'
coffee = require 'coffee-script'

app = appjs.init()

app.on "route", staticRouter 'public/'
    html: (data, callback) ->
        callback('text/html', data)
    js: (data, callback) ->
        callback('text/javascript', data)
    coffee: (data, callback) ->
        data = coffee.compile(data)
        callback('text/javascript', data)

app.on "window_ready", () ->
    window.show()

window = app.createWindow
    width: 800
    height: 600
    resizable: false
    entryPoint: "appjs://node/"
