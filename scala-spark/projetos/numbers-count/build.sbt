name            :=  "NumbersCount"
organization    :=  "jsouza"
description     :=  "Programa simples para contar numeros em um arquivo de texto"
scalaVersion    :=  "2.11.8"
mainClass       :=  Some("scala.NumbersCount")

val sparkVersion    =   "2.4.0"
libraryDependencies ++= Seq(
    "org.apache.spark"  %% "spark-core"      % sparkVersion
    ,"org.apache.spark"  %% "spark-sql"       % sparkVersion
)