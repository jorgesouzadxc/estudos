package sum

sealed trait Sum[+A, +B]
final case class Sucess[A](value: A) extends Sum[A, Nothing]
final case class Failure[B](value: B) extends Sum[Nothing, B]