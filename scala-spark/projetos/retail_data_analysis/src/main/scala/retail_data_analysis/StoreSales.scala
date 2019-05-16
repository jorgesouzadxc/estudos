package scala.retail_data_analysis

import org.apache.spark.sql.SparkSession

case object StoreSales {

    def apply(inputFile: String): Unit = {

        val outputFile = "~/output_store_sales"
        val name = "Store Sales" 
        val spark = SparkSession
                        .builder
                        .appName(name)
                        .config("spark.app.id", name)
                        .getOrCreate
        val sc = spark.sparkContext

        try {
            
            val textRDD = sc.textFile(inputFile)
            val result = textRDD.map(line => {
                val splittedLine = line.split("\t")
                (splittedLine(2), splittedLine(4).toFloat)
            }).reduceByKey(_ + _)

            result.saveAsTextFile(outputFile)

        }
        catch {
            case ex: Exception => ex.printStackTrace 
        }
        finally {
            spark.stop
        }

    }

}