# Global Variables

lat = 42.3581
long = 71.0636
district = "MA - 5"
state = ""
sunlight_api = "&apikey=0fef72b6b209410ba414e58468bb70f5"
goog_api = "AIzaSyDHEs7hFRiVb3BovLC4rMRvg1wbwsyc678"

get_location = () ->
    if navigator.geolocation
        navigator.geolocation.getCurrentPosition(make_regional)
    else
        console.log("Geolocation is not supported by this browser.")


make_regional = (location) ->

    lat = location.coords.latitude
    long = location.coords.longitude
    # accuracy = location.coords.accuracy
    # console.log(long)
    district_url = "https://congress.api.sunlightfoundation.com/districts/locate?"

    d3.json(district_url + "latitude=" + String(lat) + "&longitude=" + String(long) + sunlight_api, (error, json) ->
        if error
            console.log("fail")
        state = json.results[0].state 
        district = String(state + " - " + json.results[0].district)
        $(".location").text(" " + district)
        d3.select("#content_head").text(district)
        # get_state_legs(lat, long, state)
        )
    get_legislators(lat, long)
    # get_state_legs(lat, long)


get_legislators = (lat, long) -> 

    legislators_url = "https://congress.api.sunlightfoundation.com/legislators/locate?"

    d3.json(legislators_url + "latitude=" + String(lat) + "&longitude=" + String(long) + sunlight_api, (error, json) ->
        if error
            console.log("fail")
        process_legislators(json['results'])
    )

process_legislators = (leg_list) ->

    legs = ''

    # make the table elements
    template = _.template("<tr><td><%-title%>. <%-first_name%> <%-last_name%> (<%-party%>)</td><td>@<%-twitter_id%></td><td><%-office%></td><td><%-website%></td><td><%-term_end%></td><tr>")

    for item in leg_list
        legs += String(template(item))

    # append to table 
    d3.select("#leg_table").append("tbody").attr("id", "table_bod").html(legs)

    # Add tooltip to twitter and rep page
    d3.selectAll("td:nth-child(4)")
    .on("click", (d) ->
        window.location.href = $(this).html();
        )
    .attr("title", "Click to Go to Member Page")
    
    d3.selectAll("td:nth-child(2)")
    .on("click", (d) ->
        twitter = $(this).html()
        window.location.href = 'https://twitter.com/' + twitter.substring(1, twitter.length);
        )
    .attr("title", "Click to Go to Member Twitter Page")

search_location = () -> 
    console.log("here")
    base_url = "https://maps.googleapis.com/maps/api/geocode/json?address="
    extra = "&key=" + goog_api

# get_legislators = (lat, long) -> 

#     legislators_url = "https://congress.api.sunlightfoundation.com/legislators/locate?"

#     d3.json(legislators_url + "latitude=" + String(lat) + "&longitude=" + String(long) + sunlight_api, (error, json) ->
#         if error
#             console.log("fail")
#         process_legislators(json['results'])




$(document).ready(() ->
    $(document).tooltip()

    get_location()
    $("search_for").on("click", search_location)
    
    # navigator.geolocation.getCurrentPosition(GetLocation)
    )




