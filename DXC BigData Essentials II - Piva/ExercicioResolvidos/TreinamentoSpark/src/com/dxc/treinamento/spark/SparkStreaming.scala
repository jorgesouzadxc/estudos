package com.dxc.treinamento.spark

import org.apache.spark._
import org.apache.spark.streaming._
import org.apache.spark.streaming.StreamingContext._ 

//fontes: 
//https://spark.apache.org/docs/2.2.0/streaming-programming-guide.html
//exemplo retirado no site:
//https://www.dataneb.com/blog/streamingcontext-spark-streaming-word-count-example-scala

object SparkStreaming {
   
  
  def setupLogging() = {
    import org.apache.log4j.{Level, Logger}   
    val rootLogger = Logger.getRootLogger()
    rootLogger.setLevel(Level.ERROR)   
  }
  def main(args: Array[String]): Unit = {
  
    /** Defining Spark configuration to utilize all the resources and 
   	*  setting application name as TerminalWordCount*/
    val conf = new SparkConf().setMaster("local[*]").setAppName("TerminalWordCount")
      
    /** Calling logging function */
    setupLogging() 
  
    /** Defining spark streaming context with above configuration and batch interval as 1*/
    val ssc = new StreamingContext(conf, Seconds(1))
    /** Terminal 9999 where we will entering real time messages */
    val lines = ssc.socketTextStream("localhost", 9999)
    /** Flat map to split the words with spaces and reduce by key pair to perform count */
  
    val words = lines.flatMap(_.split(" "))
    val pairs = words.map(word => (word, 1))
    val wordCounts = pairs.reduceByKey(_ + _)
   
    // Print the first ten elements of each RDD 
    wordCounts.print()
    ssc.start()             // Start the computation
    ssc.awaitTermination()  // Wait for the computation to terminate
  
  }  
}