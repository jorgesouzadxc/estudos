package com.carrefour.genparquet

import org.apache.spark.sql.{ SparkSession, DataFrame }
import org.apache.spark.serializer.KryoSerializer
import scala.io.Source
import scala.util.{ Try, Success, Failure }

object ParquetGen {

    def main(args: Array[String]): Unit = {

        if (args.length != 3) {
            println("Parametros: <query_path> <parquet_output_path> <parquet_file_name>")
            sys.exit(1)
        }

        val queryPath = args(0)
        val outputPath = args(1)
        val fileName = args(2)

        val outputFile = s"${outputPath}/${fileName}"
        val name = "genparquet"
        val spark = SparkSession
            .builder
            .config("spark.app.name", name)
			.config("spark.serializer", "org.apache.spark.serializer.KryoSerializer")
			.config("spark.kryo.classesToRegister", this.getClass.getCanonicalName)
            .enableHiveSupport
            .getOrCreate

        val query: String = getQueryFromFile(queryPath) match {
            case Success(query) => query
            case Failure(e) => {
                println("Não conseguiu ler o script HQL")
                println(e)
                spark.stop
                sys.exit(1)
            }
        }

        writeParquet(spark, query, outputPath) match {
            case Success(_) => {
                println("Concluido com sucesso")
                spark.stop
                sys.exit(0)
            }
            case Failure(e) => {
                println("Falha durante a execucao")
                println(e)
                spark.stop
                sys.exit(1)
            }
        }

    }

    def getQueryFromFile(queryPath: String): Try[String] = Try(Source.fromFile(queryPath).getLines.mkString)

    def writeParquet(spark: SparkSession, query: String, outputFile: String): Try[Unit] = {

        val resultDF = spark.sql(query)
        Try({
            if (resultDF.count <= 0)
                println("Não foram retornados registros para serem gravados")
            else {
                resultDF
                    .repartition(1)
                    .write
                    .mode("append")
                    .option("compression", "gzip")
                    .option("header", "true")
                    .parquet(outputFile)
            }
        })

    }

}