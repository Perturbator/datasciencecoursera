# Accessing twitter from R
library(httr)
myapp = oath_app("twitter",
                 key="<consumer key>", secret="<consumer secret>")
sig = sign_oath1.0(myapp, 
                   token = "<token>",
                   token_secret = "<token secret>")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

# Converting the json object
library(jsonlite)
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

[[5]]$name
[1] "datasharing"