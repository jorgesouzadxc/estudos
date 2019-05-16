package scala.retail_data_analysis

import org.apache.spark.sql.SparkSession

case object TotalSales {

    def apply(inputFile: String): Unit = {

        val outputFile = "~/output_total_sales"
        val name = "Total Sales"
        val spark = SparkSession
                        .builder
                        .appName(name)
                        .config("spark.app.id", name)
                        .getOrCreate
        val sc = spark.sparkContext

        try {

            val textRDD = sc.textFile(inputFile)
            val tupleRDD = textRDD.map(line => {
                var arr = line.split("\t")
                ("Total Sales", arr(4).toFloat)
            })
            val reducedRDD = tupleRDD.reduceByKey(_ + _)
            
            reducedRDD.saveAsTextFile(outputFile)

        }
        catch {
            case e: Exception => e.printStackTrace
        }
        finally {
            spark.stop
        }

    }
}