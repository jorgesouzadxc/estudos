name            :=  "WordCount"
organization    :=  "jsouza"
description     :=  "Programa simples para contar palavaras de um arquivo de texto"
scalaVersion    :=  "2.11.8"
mainClass       :=  Some("scala.WordCount")

val sparkVersion    =   "2.4.0"
libraryDependencies ++= Seq(
    "org.apache.spark"  %% "spark-core"      % sparkVersion
    ,"org.apache.spark"  %% "spark-sql"       % sparkVersion
)