# Based on Mike Bostocks Let’s Make a Map http://bost.ocks.org/mike/map/

MakeMap = () ->

    map_width = 960
    map_height = 500
    centered = null
    projection = d3.geo.albersUsa()
        .scale(800)
        # .scale(1.1 * map_width)
        .translate([map_width / 2, map_height / 2.02]);
    path = d3.geo.path()
        .projection(projection);



    svg = null
    # wrapper_g = null
    states_g = null
    states_borders_g = null
    districts_g = null
    district_borders_g = null
    land_g =null


    map_file = null
    

    prepare_map = () ->
        svg = d3.select("body").append("svg")
            .attr("width", map_width)
            .attr("height", map_height)

        svg.append("rect")
            .attr("class", "background")
            .attr("width", map_width)
            .attr("height", map_height)
            # .on("click", reset_zoom)

        land_g = svg.append("g")

        d3.json("/static/data/shapefiles/us_map_fips_topo.json", (error, map_load) ->

            if error 
                return console.error(error)

            map_file = map_load
            # svg.append("path")
            #     .datum(topojson.feature(map_file, map_file.objects.us_map_geo))
            #     .attr("d", () -> 
            #         d3.geo.path().projection(d3.geo.mercator())
            #         # draw_map()
            #         )

            draw_map()
            )



    draw_map = () ->

        # states = topojson.feature(uk, uk.objects.subunits)
        # land_g = wrapper_g.append("g")

        land_g
            .attr("id", "states")
            .attr("class", "states")
            .selectAll("path")
                .data(topojson.feature(map_file, map_file.objects.us_map_geo).features)
            .enter()
            .append("path")
            .attr("d", path)
            .attr("id", (d) -> d.id)
            .on("click", zoom);
            # .attr("fill", "gray")

        land_g.append("path")
            .datum(topojson.mesh(map_file, map_file.objects.us_map_geo, (a, b) -> 
                return a != b))

            .attr("id", "state-borders")
            .attr("d", path)


    zoom = (d) -> 

        if d and centered != d
            centroid = path.centroid(d)
            x_dim = centroid[0]
            y_dim = centroid[1]
            k = 4
            centered = d
        else
            x_dim = map_width / 2
            y_dim = map_height / 2
            k = 1
            centered = null

        land_g.selectAll("path")
            .classed("active", centered and (d) -> d == centered)

        land_g.transition()
            .duration(700)
            .attr("transform", "translate(" + map_width / 2 + "," + map_height / 2 + ")scale(" + k + ")translate(" + -x_dim + "," + -y_dim + ")")
            .style("stroke-width", 1.5 / k + "px")



    # function clicked(d) {
    #   var x, y, k;

    #   if (d && centered !== d) {
    #     var centroid = path.centroid(d);
    #     x = centroid[0];
    #     y = centroid[1];
    #     k = 4;
    #     centered = d;
    #   } else {
    #     x = width / 2;
    #     y = height / 2;
    #     k = 1;
    #     centered = null;
    #   }

      # g.selectAll("path")
          # .classed("active", centered && function(d) { return d === centered; });

    #   g.transition()
    #       .duration(750)
    #       .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")scale(" + k + ")translate(" + -x + "," + -y + ")")
    #       .style("stroke-width", 1.5 / k + "px");
    # }





    prepare_map()





$(document).ready(() -> 

    MakeMap()





    )
