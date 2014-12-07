# Based on Mike Bostocks Let’s Make a Map http://bost.ocks.org/mike/map/

MakeMap = () ->


    console.log("wtf?")
    map_width = document.getElementById("map").offsetWidth
    map_height = map_width * .5

    id_to_full = {'WA': 'Washington', 'DE': 'Delaware', 'DC': 'District of Columbia', 'WI': 'Wisconsin', 'WV': 'West Virginia', 'HI': 'Hawaii', 'FL': 'Florida', 'WY': 'Wyoming', 'NH': 'New Hampshire', 'NJ': 'New Jersey', 'NM': 'New Mexico', 'TX': 'Texas', 'LA': 'Louisiana', 'AK': 'Alaska', 'NC': 'North Carolina', 'ND': 'North Dakota', 'NE': 'Nebraska', 'TN': 'Tennessee', 'NY': 'New York', 'PN': 'Pennsylvania', 'RI': 'Rhode Island', 'NV': 'Nevada', 'VA': 'Virginia', 'CO': 'Colorado', 'CA': 'California', 'AL': 'Alabama', 'AR': 'Arkansas', 'VT': 'Vermont', 'IL': 'Illinois', 'GA': 'Georgia', 'IN': 'Indiana', 'IA': 'Iowa', 'MA': 'Massachusetts', 'AZ': 'Arizona', 'ID': 'Idaho', 'CT': 'Connecticut', 'ME': 'Maine', 'MD': 'Maryland', 'OK': 'Oklahoma', 'KE': 'Kentucky', 'OH': 'Ohio', 'UT': 'Utah', 'MO': 'Missouri', 'MN': 'Minnesota', 'MI': 'Michigan', 'KS': 'Kansas', 'MT': 'Montana', 'MS': 'Mississippi', 'SC': 'South Carolina', 'OR': 'Oregon', 'SD': 'South Dakota'}
    id_to_state = {"1" : "Alabama", "2" : "Alaska", "4" : "Arizona", "5" : "Arkansas", "6" : "California", "8" : "Colorado", "9" : "Connecticut", "10" : "Delaware", "11" : "District of Columbia", "12" : "Florida", "13" : "Georgia", "15" : "Hawaii", "16" : "Idaho", "17" : "Illinois", "18" : "Indiana", "19" : "Iowa", "20" : "Kansas", "21" : "Kentucky", "22" : "Louisiana", "23" : "Maine", "24" : "Maryland", "25" : "Massachusetts", "26" : "Michigan", "27" : "Minnesota", "28" : "Mississippi", "29" : "Missouri", "30" : "Montana", "31" : "Nebraska", "32" : "Nevada", "33" : "New Hampshire", "34" : "New Jersey", "35" : "New Mexico", "36" : "New York", "37" : "North Carolina", "38" : "North Dakota", "39" : "Ohio", "40" : "Oklahoma", "41" : "Oregon", "42" : "Pennsylvania", "44" : "Rhode Island", "45" : "South Carolina", "46" : "South Dakota", "47" : "Tennessee", "48" : "Texas", "49" : "Utah", "50" : "Vermont", "51" : "Virginia", "53" : "Washington", "54" : "West Virginia", "55" : "Wisconsin", "56" : "Wyoming"}
    id_to_abbrev = {"1" : "AL", "2" : "AK", "4" : "AZ", "5" : "AR", "6" : "CA", "8" : "CO", "9" : "CT", "10" : "DE", "11" : "DC", "12" : "FL", "13" : "GA", "15" : "HI", "16" : "ID", "17" : "IL", "18" : "IN", "19" : "IA", "20" : "KS", "21" : "KE", "22" : "LA", "23" : "ME", "24" : "MD", "25" : "MA", "26" : "MI", "27" : "MN", "28" : "MS", "29" : "MO", "30" : "MT", "31" : "NE", "32" : "NV", "33" : "NH", "34" : "NJ", "35" : "NM", "36" : "NY", "37" : "NC", "38" : "ND", "39" : "OH", "40" : "OK", "41" : "OR", "42" : "PN", "44" : "RI", "45" : "SC", "46" : "SD", "47" : "TN", "48" : "TX", "49" : "UT", "50" : "VT", "51" : "VA", "53" : "WA", "54" : "WV", "55" : "WI", "56" : "WY"}
    abbrev_to_id = {'WA': '53', 'DE': '10', 'DC': '11', 'WI': '55', 'WV': '54', 'HI': '15', 'FL': '12', 'WY': '56', 'NH': '33', 'NJ': '34', 'NM': '35', 'TX': '48', 'LA': '22', 'NC': '37', 'ND': '38', 'NE': '31', 'TN': '47', 'NY': '36', 'PN': '42', 'AK': '2', 'NV': '32', 'VA': '51', 'CO': '8', 'CA': '6', 'AL': '1', 'AR': '5', 'VT': '50', 'IL': '17', 'GA': '13', 'IN': '18', 'IA': '19', 'OK': '40', 'AZ': '4', 'ID': '16', 'CT': '9', 'ME': '23', 'MD': '24', 'MA': '25', 'KE': '21', 'OH': '39', 'UT': '49', 'MO': '29', 'MN': '27', 'MI': '26', 'RI': '44', 'KS': '20', 'MT': '30', 'MS': '28', 'SC': '45', 'OR': '41', 'SD': '46'}

    # width = document.getElementById("map").offsetWidth - margin.left - margin.right
    # height = width * .5 - margin.top - margin.bottom
    MapCScale = d3.scale.linear().range(["#A7B2CC", "#303E60"])

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

        # How I made this https://gist.github.com/mbostock/4090846
        d3.json("/static/data/shapefiles/new.json", (error, map_load) ->

            if error 
                return console.error(error)
            draw_map(map_load)
            # setTimeout(
            load_cloro()
                # , 3000)
            
            )



    draw_map = (us) ->

        # Following zoom map http://bl.ocks.org/mbostock/2206590

        land_g
            # .append("g")
            # .attr("id", "states")
            .attr("class", "states")
            .selectAll("path")
            .data(topojson.feature(us, us.objects.states).features)
                .enter().append("path")
                .attr("d", path)
                .attr("d", path)
                .attr("class", "state_1")
                .attr("id", (d) -> d.id)
                .text((d) -> d.id)
                .on("click", zoom)
        land_g.append("path")
            .datum(topojson.mesh(us, us.objects.states, (a, b) -> return a != b))
            .attr("id", "state-borders")
            .attr("d", path)





    zoom = (d) -> 
        # Zoom guide from Mike Bostock

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
        # Get the state
        get_data(id_to_abbrev[d.id])

    prepare_map()


    load_cloro = () -> 
        d3.json("/maps/dem_rank", (error, data) ->

            if error 
                return console.error(error)
            add_cloro(data)
            )
        

    add_cloro = (data) ->

        d3.selectAll(".states")
            .attr("fill", (d) -> "gray")

        # first, set a scale based on the district values
        values_dic = data
        values = []
        for key, val of values_dic
            values.push(val)

        MapCScale.domain(d3.extent(values))
        values_rank = values.sort(d3.ascending)
        
        d3.selectAll(".state_1")
            .attr("fill", (d) -> 
                MapCScale(values_dic[id_to_abbrev[d.id]])
                # console.log(d.id)

                )

    get_data = (state) ->

        d3.select("#menu").remove()
        d3.select("#map_menu").append("div").attr("id", "menu").style("padding-left", "10px")
        d3.select("#menu").append("h1").text(id_to_full[state])
        
        d3.json("/maps/" + String(state), (error, data) ->

            if error
                return console.error(error)
            
            stats = data["data"]
            console.log(state)
            d3.select("#menu").append("h4").text(String("Obama Percent of Votes: " + stats[0] + "%"))
            d3.select("#menu").append("h4").text(String("Obama Total Votes: " + stats[1]))
            d3.select("#menu").append("h4").text(String("Romney Percent of Votes: " + stats[2] + "%"))
            d3.select("#menu").append("h4").text(String("Romney Total Votes: " + stats[3]))
            d3.select("#menu").append("h4").text(String("Percent of Votes for Other Candidates: " + stats[4] + "%"))
        )



$(document).ready(() -> 

    MakeMap()





    )
