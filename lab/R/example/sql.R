##################################################################################################
# Load a JSON file
##################################################################################################
df <- read.df(csvPath, "csv", header = "true", inferSchema = "true", na.strings = "NA")
createOrReplaceTempView(people, "people")
teenagers <- sql("SELECT name FROM people WHERE age >= 13 AND age <= 19")
head(teenagers)
##################################################################################################
# Load a CSV file
##################################################################################################
alunosF <- read.df("./data/csv/alunos.csv", "csv", header = "true", inferSchema = "true", na.strings = "NA")
createOrReplaceTempView(alunosF, "alunosF")
alunos <- sql("SELECT * FROM alunosF")
head(alunos)
##################################################################################################
licitacao <- read.df("./data/csv/licitacao/ParticipantesLicitacao.csv", "csv", header = "true", inferSchema = "true", na.strings = "NA")
createOrReplaceTempView(licitacao, "licitacao")
licitcoess <- sql("SELECT * FROM licitacao")
head(licitacoes)