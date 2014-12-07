
size_table = () ->
    height = String($("#sidebar").height() - 25) + "px"
    d3.select("#table_space").style("height", height)



$(document).ready(() ->
    size_table()
    )

$(window).resize(() ->
    size_table()

    )