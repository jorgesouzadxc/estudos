package scala

import scala.retail_data_analysis.StoreSales
import scala.retail_data_analysis.ProductSales
import scala.retail_data_analysis.TotalSales

case object Main {

    def main(args: Array[String]): Unit = {

        if (args.length != 1) {
            println("Uso <inputFile>")
            System.exit(1)
        }

        val inputFile = args(0)

        StoreSales(inputFile)
        ProductSales(inputFile)
        TotalSales(inputFile)

    }

}