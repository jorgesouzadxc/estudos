scalaVersion     := "2.11.8"
version          := "0.1.0"
organization     := "com.carrefour"
description      := "Programa para geracao de arquivos parquet"
mainClass        := Some("com.carrefour.parquet.ParquetGen")
name             := "Parquet"

val sparkVersion = "2.3.0"
libraryDependencies ++= Seq(
  "org.apache.spark"  %% "spark-core"      % sparkVersion
  ,"org.apache.spark"  %% "spark-sql"       % sparkVersion
)