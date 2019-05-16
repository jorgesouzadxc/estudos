version         :=  "1"
name            :=  "csv"
organization    :=  "com.treinamento_dxc"
description     :=  "Programa para leitura de csv flight delays"
scalaVersion    :=  "2.11.8"

val sparkVersion    =   "2.3.0"

//Dependencias
libraryDependencies ++= Seq(
    "org.apache.spark"  %% "spark-core"      % sparkVersion % "provided"
    ,"org.apache.spark"  %% "spark-sql"       % sparkVersion % "provided"
)


//Configuracao Assembly SBT Plugin
assemblyMergeStrategy in assembly := {
 case PathList("META-INF", xs @ _*) => MergeStrategy.discard
 case x => MergeStrategy.first
}