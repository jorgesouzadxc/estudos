name            :=  "Retail Data Analysis"
organization    :=  "jsouza"
description     :=  "Programa analise de dados em um arquivo"
scalaVersion    :=  "2.11.8"
mainClass       :=  Some("scala.Main")

val sparkVersion    =   "2.4.0"
libraryDependencies ++= Seq(
    "org.apache.spark"  %% "spark-core"      % sparkVersion
    ,"org.apache.spark"  %% "spark-sql"       % sparkVersion
)