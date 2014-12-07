lat = 42.3581
long = 71.0636
district = "MA - 5"
state = ""
sunlight_api = "&apikey=0fef72b6b209410ba414e58468bb70f5"



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
        )


get_location()