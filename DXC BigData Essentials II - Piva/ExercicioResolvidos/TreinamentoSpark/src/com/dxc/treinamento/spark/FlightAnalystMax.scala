package com.dxc.treinamento.spark

import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.sql.{DataFrame, SparkSession}

object FlightAnalystMax {
  
  
  object Flight{
    def setLine(lineArgs:String):String = {
      val tokens = lineArgs.split(",")
      val newLine = tokens(0) + "," + tokens(1) + "," + tokens(2) + "," + 
      tokens(4) + "," + tokens(8) + "," + tokens(9) + "," + 
      tokens(14) + "," + tokens(16) + "," + tokens(17);
      return newLine
    }     
  }
  
  object MapFlight{    
    def setLine(lineArgs:String): (String,Int) = {
      val tokens = lineArgs.split(",")
      val key  = tokens(0) + "," + tokens(1) + "," + tokens(2) + "," + tokens(8);
      val value = Integer.parseInt(tokens(6));
      return (key,value)
    }  
  }
  
  def main(args: Array[String]): Unit = {
    
    val sparkConf = new SparkConf().setAppName("Max Tempo Voo").setMaster("local")
    val sc        = new SparkContext(sparkConf)
    val textFile  = sc.textFile("C:\\Users\\rpiva\\Documents\\Estudo\\scala\\amostra\\dados_flight\\*")
    val filterTxt = textFile.filter(line => !line.contains(",NA,")).filter(line => !line.contains("Year"))
    val records   = filterTxt.flatMap(line => Flight.setLine(line).split("\n"))
                             .map(mapline => MapFlight.setLine(mapline))
                             .reduceByKey(java.lang.Math.max(_,_))
    records.saveAsTextFile("C:\\Users\\rpiva\\Documents\\Estudo\\scala\\resultado\\flightanalystmax")
    
  }
}