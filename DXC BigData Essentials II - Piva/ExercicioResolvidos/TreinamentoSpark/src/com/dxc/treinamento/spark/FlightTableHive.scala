package com.dxc.treinamento.spark

import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.sql.{DataFrame, SparkSession}
import org.apache.spark.sql.types._
import org.apache.spark.sql.hive.HiveContext
import org.apache.spark.sql.Row
import scala.collection.mutable.ListBuffer
import org.apache.spark.sql.functions._

object FlightTableHive { 
  
  object Flight{
      def setLine(lineArgs:String):Row = {
        
        val tokens = lineArgs.split(",")
        val list   = new ListBuffer[String]();
        
        list += tokens(0)
        list += tokens(1)
        list += tokens(2)
        list += tokens(4)
        list += tokens(8)
        list += tokens(9)
        list += tokens(14)
        list += tokens(16)
        list += tokens(17)
        
        return Row.fromSeq(list.seq)
      }     
  }  
  
  def main(args: Array[String]): Unit = {
    
  
    val sparkConf   = new SparkConf().setAppName("Hive table").setMaster("local")
    val sc          = new SparkContext(sparkConf)
    val textFile    = sc.textFile("C:\\Users\\rpiva\\Documents\\Estudo\\scala\\amostra\\dados_flight\\*")
    val filterTxt   = textFile.filter(line => !line.contains(",NA,")).filter(line => !line.contains("Year"))
    val records     = filterTxt.flatMap(file => file.split("\n")).map(line => Flight.setLine(line))
    
    val hiveContext = new HiveContext(sc) 
    
    val schema    = StructType(
                          List(
                                StructField("Year",StringType,true),
                                StructField("Month",StringType,true),
                                StructField("DayofMonth",StringType,true),
                                StructField("DepTime",StringType,true),
                                StructField("UniqueCarrier",StringType,true),
                                StructField("FlightNum",IntegerType,true),
                                StructField("ArrDelay",IntegerType,true),
                                StructField("Origin",StringType,true),
                                StructField("Dest",StringType,true)
                               )
                    )                    
    val dfFlight  = hiveContext.createDataFrame(records, schema)
    dfFlight.show()
    
  }
  
}
