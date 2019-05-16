import org.apache.spark.sql.SparkSession

case object WordCount {

    def main(args: Array[String]): Unit = {

        if (args.length != 2) {
            print("Uso: <inputFile> <outputFile>")
            System.exit(1)
        }

        val inputFile = args(0)
        val outputFile = args(1)

        val name = "WordCount"
        val spark = SparkSession
                        .builder
                        .appName(name)
                        .config("spark.app.id", name)
                        .getOrCreate
        val sc = spark.sparkContext

        try {

            val textRDD = sc.textFile(inputFile)
            val flatRDD = textRDD.flatMap(line => line.split(" "))
            val wordsRDD = flatRDD.map(word => (word, 1))
            val resultRDD = wordsRDD.reduceByKey(_ + _)

            resultRDD.saveAsTextFile(outputFile)

        }
        finally {
            spark.stop
        }

    }

}