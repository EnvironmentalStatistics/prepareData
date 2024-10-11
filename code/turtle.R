library(csvwr)
library(faraway)
data(turtle)
summary(turtle)

write.table(turtle, file = "data/turtle/turtle.csv", append = FALSE, quote = TRUE, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = "escape", fileEncoding = "UTF-8")

png(
 filename="data/turtle/turtle.png",
 width = 1.0,  #3
 height = 1.0,  #3
 units = "in",
 res = 300,  #1200
 pointsize = 2
)
par(
 mar = c(5,5,2,2),
 xaxs = "i",
 yaxs = "i",
 cex.axis = 1, #2
 cex.lab = 1.5   #2
)
plot(male/(male+female) ~ temp, data=turtle)
dev.off()




#https://www.stevenfirth.com/csv-on-the-web-creating-descriptive-metadata-files/
#https://cran.r-project.org/web/packages/csvwr/vignettes/read-write-csvw.html
#https://csvw.org/

schema <- derive_table_schema(turtle)
tb <- list(url="turtle.csv", tableSchema=schema)
meta <- create_metadata(tables=list(tb))
json <- jsonlite::toJSON(meta)
json2 <- jsonlite::prettify(json)
cat(json2, file="data/turtle/turtle.json")
