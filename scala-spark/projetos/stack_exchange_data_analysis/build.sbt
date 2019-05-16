version         :=  "1"
name            :=  "StackExchangeAnalysis"
organization    :=  "com.data_flair"
description     :=  "Analise para dado do Stack Exchange"
scalaVersion    :=  "2.12.8"

val sparkVersion    =   "2.4.0"
val sparkXMLVersion = "0.5.0"

//Dependencias
libraryDependencies ++= Seq(
    "org.apache.spark"  %% "spark-core"      % sparkVersion % "provided"
    ,"org.apache.spark"  %% "spark-sql"       % sparkVersion % "provided"
    ,"com.databricks" % "spark-xml" % sparkXMLVersion
)


//Configuracao Assembly SBT Plugin
assemblyMergeStrategy in assembly := {
 case PathList("META-INF", xs @ _*) => MergeStrategy.discard
 case x => MergeStrategy.first
}