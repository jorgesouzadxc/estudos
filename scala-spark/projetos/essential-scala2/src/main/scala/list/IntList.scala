package list

sealed trait IntList {

    def fold[A](end: A, f: (Int, A) => A): A =
        this match {
            case IntListEnd => end
            case IntListPair(head, tail) => f(head, tail.fold(end, f))
        }
    
    def length: Int =
        fold[Int](0, (_, tail) => 1 + tail)

    def product: Int =
        fold[Int](1, (head, tail) => head * tail)

    def sum: Int =
        fold[Int](0, (head, tail) => head + tail)
    
    def double: IntList =
        fold[IntList](IntListEnd, (head, tail) => IntListPair(head*2, tail))

}

final case class IntListPair(head: Int, tail: IntList) extends IntList
final case object IntListEnd extends IntList