package com.dxc.treinamento.spark

import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.sql.{DataFrame, SparkSession}


object FlightAnalyze {

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
      val value = java.lang.Integer.parseInt(tokens(6));
      return (key,value)
    }  
  }
    
  object ReduceFlight{
    def setValue(lines:Iterable[Int]):String = {
      val sum = lines.sum
      val min = lines.min
      val max = lines.max
      val count = lines.count{ x => true }
      val avg = sum / count
      return count + "," + sum + "," + avg + "," + min + "," + max      
    }
  }
  
  def main(args: Array[String]): Unit = {
        
    val sparkConf = new SparkConf().setAppName("Max Tempo Voo").setMaster("local")
    val sc        = new SparkContext(sparkConf)
    val textFile  = sc.textFile("C:\\Users\\rpiva\\Documents\\Estudo\\scala\\amostra\\dados_flight\\*")
    val filterTxt = textFile.filter(line => !line.contains(",NA,")).filter(line => !line.contains("Year"))
    val records   = filterTxt.flatMap(line => Flight.setLine(line).split("\n"))
                             .map(mapline => MapFlight.setLine(mapline))
                             .groupByKey().map(t => (t._1, ReduceFlight.setValue(t._2)))
    records.saveAsTextFile("C:\\Users\\rpiva\\Documents\\Estudo\\scala\\resultado\\flightanalyze")
    
  }
  
}