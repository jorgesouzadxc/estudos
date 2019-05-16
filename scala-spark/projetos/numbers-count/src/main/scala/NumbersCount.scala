import org.apache.spark.sql.SparkSession

case object NumbersCount {

    def main(args: Array[String]): Unit = {

        if (args.length != 1) {
            print("Uso: <inputFile>\n")
            System.exit(1)
        }

        val inputFile = args(0)

        val name = "NumbersCount"
        val spark = SparkSession
                        .builder
                        .appName(name)
                        .config("spark.app.id", name)
                        .getOrCreate
        val sc = spark.sparkContext

        try {

            val textRDD = sc.textFile(inputFile)
            val flatRDD = textRDD.flatMap(line => line.split(" ")).filter(_ != "")
            val numbersRDD = flatRDD.map(number => (1, number.toInt))
            val resultRDD = numbersRDD.reduceByKey(_ + _)

            val result = resultRDD.collect()(0)._2

            print(s"Resultado: ${result}\n")

        }
        finally {
            spark.stop
        }

    }

}