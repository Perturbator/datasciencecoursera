# Getting data off webpages - readLines()
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode

# Parsing with XML
library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes=TRUE)

xpathSApply(html, "//title", xmlValue)

xpathSApply(html, "//td[@class='gsc_a_c']",xmlValue)

# GET from the httr package
library(httr)
html2 = GET(url)
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2, asText=TRUE)
xpathSApply(parsedHtml,"//title",xmlValue)

# Accessing websites with passwords
pg1 = GET("<url>"), authenticate("<username>", "<password>"))

# Using handles
google = handle("http://google.com")
pg1 = GET(handle=google, path="/")
pg2 = GET(handle=google,path="search")