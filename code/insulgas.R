library(csvwr)
library(faraway)
data(insulgas)
summary(insulgas)

write.table(insulgas, file = "data/insulgas/insulgas.csv", append = FALSE, quote = TRUE, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = "escape", fileEncoding = "UTF-8")

png(
 filename="data/insulgas/insulgas.png",
 width = 1.0,  #3
 height = 1.0,  #3
 units = "in",
 res = 300,  #1200
 pointsize = 4
)
par(
 mar = c(5,5,2,2),
 xaxs = "i",
 yaxs = "i",
 cex.axis = 2,
 cex.lab = 2
)
plot(Gas ~ Temp, data=insulgas, col=ifelse(insulgas$Insulate=="Before", "blue", "orange"))
dev.off()




#https://www.stevenfirth.com/csv-on-the-web-creating-descriptive-metadata-files/
#https://cran.r-project.org/web/packages/csvwr/vignettes/read-write-csvw.html
#https://csvw.org/

schema <- derive_table_schema(insulgas)
tb <- list(url="insulgas.csv", tableSchema=schema)
meta <- create_metadata(tables=list(tb))
json <- jsonlite::toJSON(meta)
json2 <- jsonlite::prettify(json)
cat(json2, file="data/insulgas/insulgas.json")
