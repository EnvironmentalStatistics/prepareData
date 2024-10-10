library(faraway)
data(insulgas)
summary(insulgas)

write.table(insulgas, file = "data/insulgas/insulgas.csv", append = FALSE, quote = TRUE, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = "escape", fileEncoding = "UTF-8")

png(filename="data/insulgas/insulgas.png")
plot(Gas ~ Temp, data=insulgas, col=ifelse(insulgas$Insulate=="Before", "blue", "orange"))
dev.off()



