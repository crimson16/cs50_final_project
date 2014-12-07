
size_table = () ->
    height = String($("#sidebar").height() - 10) + "px"
    d3.select("#info").style("height", height)



$(document).ready(() ->
    size_table()
    
    )

$(window).resize(() ->
    size_table()

    )