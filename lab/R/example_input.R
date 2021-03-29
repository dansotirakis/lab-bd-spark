# Dados do Json
people <- read.df("./examples/src/main/resources/people.json", "json")
head(people)

# SparkR automatically infers the schema from the JSON file

printSchema(people)

# Similarly, multiple files can be read with read.json

people <- read.json(c("./examples/src/main/resources/people.json", "./examples/src/main/resources/people2.json"))

df <- read.df(csvPath, "csv", header = "true", inferSchema = "true", na.strings = "NA")

write.df(people, path = "people.parquet", source = "parquet", mode = "overwrite")
# ------------------------------------------------
# Dados do CSV
df <- read.df(csvPath, "csv", header = "true", inferSchema = "true", na.strings = "NA")
# ------------------------------------------------
#Dados de tabelas HIVE
sparkR.session()
sql("CREATE TABLE IF NOT EXISTS src (key INT, value STRING)")
sql("LOAD DATA LOCAL INPATH 'examples/src/main/resources/kv1.txt' INTO TABLE src")

# Queries can be expressed in HiveQL.
results <- sql("FROM src SELECT key, value")

# results is now a SparkDataFrame
head(results)