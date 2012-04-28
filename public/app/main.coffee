window.onload = () ->
    view.width = 800
    view.height = 600
    context = view.getContext '2d'
    console.log "I'm ready", context

    last = null
    pen = 'up'

    view.onmouseup = (event) ->
        last = null
        pen = 'up'

    view.onmousedown = (event) ->
        pen = 'down'

    view.onmousemove = (event) ->
        x = event.offsetX
        y = event.offsetY

        return if pen == 'up'

        context.beginPath()
        context.moveTo(last.x, last.y) if last
        context.lineTo(x, y)
        context.stroke()

        last = {x, y}
