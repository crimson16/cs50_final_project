# Based on Mike Bostocks Let’s Make a Map http://bost.ocks.org/mike/map/

MakeMap = () ->

    # map_width = 960
    # map_height = 500
    console.log("wtf?")
    map_width = document.getElementById("map").offsetWidth
    map_height = map_width * .5

    id_to_full = {'WA': 'Washington', 'DE': 'Delaware', 'DC': 'District of Columbia', 'WI': 'Wisconsin', 'WV': 'West Virginia', 'HI': 'Hawaii', 'FL': 'Florida', 'WY': 'Wyoming', 'NH': 'New Hampshire', 'NJ': 'New Jersey', 'NM': 'New Mexico', 'TX': 'Texas', 'LA': 'Louisiana', 'AK': 'Alaska', 'NC': 'North Carolina', 'ND': 'North Dakota', 'NE': 'Nebraska', 'TN': 'Tennessee', 'NY': 'New York', 'PN': 'Pennsylvania', 'RI': 'Rhode Island', 'NV': 'Nevada', 'VA': 'Virginia', 'CO': 'Colorado', 'CA': 'California', 'AL': 'Alabama', 'AR': 'Arkansas', 'VT': 'Vermont', 'IL': 'Illinois', 'GA': 'Georgia', 'IN': 'Indiana', 'IA': 'Iowa', 'MA': 'Massachusetts', 'AZ': 'Arizona', 'ID': 'Idaho', 'CT': 'Connecticut', 'ME': 'Maine', 'MD': 'Maryland', 'OK': 'Oklahoma', 'KE': 'Kentucky', 'OH': 'Ohio', 'UT': 'Utah', 'MO': 'Missouri', 'MN': 'Minnesota', 'MI': 'Michigan', 'KS': 'Kansas', 'MT': 'Montana', 'MS': 'Mississippi', 'SC': 'South Carolina', 'OR': 'Oregon', 'SD': 'South Dakota'}

    # width = document.getElementById("map").offsetWidth - margin.left - margin.right
    # height = width * .5 - margin.top - margin.bottom

    centered = null
    projection = d3.geo.albersUsa()
        # .scale(800)
        .scale(1.1 * map_width)
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


    # map_file = null
    

    prepare_map = () ->
        svg = d3.select("#map").append("svg").attr("id", "map_svg")
            .attr("width", map_width)
            .attr("height", map_height)

        svg.append("rect")
            .attr("class", "background")
            .attr("width", map_width)
            .attr("height", map_height)
            # .on("click", reset_zoom)

        land_g = svg.append("g")

        # d3.json("/static/data/shapefiles/us_map_fips_topo.json", (error, map_load) ->
        d3.json("/static/data/shapefiles/test.json", (error, map_load) ->

            if error 
                return console.error(error)

            # map_file = map_load
            # svg.append("path")
            #     .datum(topojson.feature(map_file, map_file.objects.us_map_geo))
            #     .attr("d", () -> 
            #         d3.geo.path().projection(d3.geo.mercator())
            #         # draw_map()
            #         )
            console.log("55")
            draw_map(map_load)
            )



    draw_map = (map_file) ->

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
            # .attr("id", (d) -> d.id)
            .on("click", zoom);
            # .attr("fill", "gray")

        land_g.append("path")
            .datum(topojson.mesh(map_file, map_file.objects.us_map_geo, (a, b) -> 
                return a != b))

            .attr("id", "state-borders")
            .attr("d", path)


    zoom = (d) -> 
        # Fond guide from Mike Bostock
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






    prepare_map()





$(document).ready(() -> 

    MakeMap()





    )
