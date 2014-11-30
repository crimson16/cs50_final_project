


# google.load("feeds", "1");

#     function initialize() {
#       var feed = new google.feeds.Feed("http://rss.cnn.com/rss/cnn_allpolitics.rss");
#       feed.load(function(result) {
#         if (!result.error) {
#           console.log(result.feed.entries)
#           var container = document.getElementById("feed");
#           for (var i = 0; i < result.feed.entries.length; i++) {
#             var entry = result.feed.entries[i];
#             var div = document.createElement("div");
#             div.appendChild(document.createTextNode(entry.title));
#             container.appendChild(div);
#           }
#         }
#       });
#     }
#     google.setOnLoadCallback(initialize);

# function rssfeedsetup(){
# var feedpointer=new google.feeds.Feed(feedurl) //Google Feed API method
# feedpointer.setNumEntries(feedlimit) //Google Feed API method
# feedpointer.load(displayfeed) //Google Feed API method
# }


# load_feeds = () -> 
    
#     feed_urls = ["https://news.google.com/news/feeds?cf=all&ned=us&hl=en&topic=el&output=rss", "http://rss.cnn.com/rss/cnn_allpolitics.rss"]

#     article_html = '<h3 id= "news">Election News: </h3>'

#     template = _.template("<li><a href='<%= link %>'><%= title %></a></li>")

#     for feed_url in feed_urls
#         feed = new google.feeds.Feed(feed_url)
#         # feed.includeHistoricalEntries().setNumEntries(5)
#         feed.load((result) ->
#             if !result.error
#                 for article in result.feed.entries
#                     # console.log(article)
#                     # article_html += template(article)
#         )

#     # d3.select("#news").append("ul").html(article_html)








$(document).ready(() ->

    google.load("feeds", "1")
    google.setOnLoadCallback(load_feeds)

    # load_feeds()





    # navigator.geolocation.getCurrentPosition(GetLocation)
    )




