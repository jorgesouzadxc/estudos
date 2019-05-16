package com.dxc.treinamento.spark

object LogCSF {
  val logTime :String = s"LOG(DateUrm.DATETIME):"
  val logTimeErro :String = s"LOG (DateUrm.DATETIME) ERRO:"

  def logMsg(msg:String): Unit = println(s"""
    |$logTime **********************************************************************************
    |$logTime $msg
    |$logTime **********************************************************************************
  """.stripMargin)
}