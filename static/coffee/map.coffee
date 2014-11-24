# Based on Mike Bostocks Let’s Make a Map http://bost.ocks.org/mike/map/

MakeMap = () ->

    map_width = 960
    map_height = 1160
    projection = d3.geo.albersUsa()
        .scale(1.1 * map_width)
        .translate([map_width / 2, map_height / 2.02]);
    path = d3.geo.path()
        .projection(projection);



    svg = null
    wrapper_g = null
    states_g = null
    states_borders_g = null
    districts_g = null
    district_borders_g = null
    tracts_g = null
    tract_borders_g = null
    member_boxes = null
    legend = null
    tip = null

    map_file = null
    # load_map()

    # load_map = () ->
    svg = d3.select("body").append("svg")
        .attr("width", map_width)
        .attr("height", map_height)

    svg.append("rect")
        .attr("class", "background")
        .attr("width", map_width)
        .attr("height", map_height)
        # .on("click", reset_zoom)

    # wrapper_g = svg.append("g")

    d3.json("/static/data/shapefiles/us_map_fips_topo.json", (error, map_file) ->

        if error 
            return console.error(error)
        
        svg.append("path")
            .datum(topojson.feature(map_file, map_file.objects.us_map_geo))
            .attr("d", d3.geo.path().projection(d3.geo.mercator()))
            
            # draw_map()
        console.log("el fin")

            )



    draw_map = () ->

        states = topojson.feature(uk, uk.objects.subunits)
        land_g = wrapper_g.append("g")
            .attr("id", "districts")
            .attr("class", "nation-map")
            .datum(topojson.feature(map_file, map_file.objects.us_map_geo))
            .append("path")
            .attr("d", path)
            # .attr("fill", empty_color)
        console.log("fuck")

        svg.append("defs").append("path")
          .attr("id", "land")
          .datum(topojson.feature(us, map_file.objects.us_map_geo))
          .attr("d", path)


$(document).ready(() -> 

    MakeMap()





    )
