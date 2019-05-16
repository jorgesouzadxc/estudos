package list

sealed trait LinkedList[A] {

    def fold[B](end: B, f: (A, B) => B): B =
        this match {
            case End() => end
            case Pair(head, tail) => f(head, tail.fold(end, f))
        }

    def map[B](fn: A => B): LinkedList[B] =
        this match {
            case End() => End[B]()
            case Pair(head, tail) => Pair(fn(head), tail.map(fn))
        }

    def length: Int =
        fold[Int](0, (_, tail) => 1 + tail)

    def contains(value: A): Boolean =
        fold[Boolean](false, (head, tail) => if (head != value) tail else true)
    
    def apply(i: Int): Result[A] = {

        if (i > this.length-1)
            Failure("Index out of bounds")
        else
            this match {
                case Pair(head, tail) => if (i == 0) Success(head) else tail(i-1)
                case End() =>  Failure("No value in an empty list")
            }
        
    }
    
}

final case class End[A]() extends LinkedList[A] 
final case class Pair[A](head: A, tail: LinkedList[A]) extends LinkedList[A]