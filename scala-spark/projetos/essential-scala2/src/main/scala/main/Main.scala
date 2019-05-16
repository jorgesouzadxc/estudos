import list._
import tree._
import par._

object Main extends App {

    val list = Pair(1, Pair(2, Pair(3, End())))
    assert(list.length == 3)
    assert(list.tail.length == 2)
    assert(End().length == 0)

    assert(list.length == 3)
    assert(list.tail.length == 2)
    assert(End().length == 0)

    assert(list(0) == Success(1))
    assert(list(1) == Success(2))
    assert(list(2) == Success(3))
    assert(list(3) == Failure("Index out of bounds"))

    val intList = IntListPair(1, IntListPair(2, IntListPair(3, IntListEnd)))
    assert(intList.sum == 6)
    assert(intList.length == 3)
    assert(intList.double == IntListPair(2, IntListPair(4, IntListPair(6, IntListEnd))))

    val tree: Tree[String] =
        Node(Node(Leaf("To"),Leaf("iterate")),
            Node(Node(Leaf("is"), Leaf("human,")),
                Node(Leaf("to"), Node(Leaf("recurse"), Leaf("divine")))))

    println(tree.fold[String]((a, b) => a + " " + b, str => str))

    val pair = Par[String, Int]("hi", 2)
    assert(pair.one == "hi")
    assert(pair.two == 2)

    sealed trait Sum[A, B] {
        def fold[C](left: A => C, right: B => C): C =
            this match {
                case Left(value) => left(value)
                case Right(value) => right(value)
            }
    }
    final case class Left[A, B](value: A) extends Sum[A, B]
    final case class Right[A, B](value: B) extends Sum[A, B]

    def intOrString(input: Boolean): Sum[Int, String] =
        if(input == true) {
            Left[Int, String](123)
        } else {
            Right[Int, String]("abc")
        }

    println(intOrString(true))

    sealed trait Maybe[A] {
        def fold[B](full: A => B, empty: B): B =
            this match {
                case Empty() => empty
                case Full(value) => full(value)
            }

        def flatMap[B](fn: A => Maybe[B]): Maybe[B] =
            this match {
                case Full(value) => fn(value)
                case Empty() => Empty[B]()
            }

        def map[B](fn: A => B): Maybe[B] =
            this match {
                case Full(value) => Full(fn(value))
                case Empty() => Empty[B]()
            }
    }
    final case class Full[A](value: A) extends Maybe[A]
    final case class Empty[A]() extends Maybe[A]

    val perhaps: Maybe[Int] = Empty[Int]
    val perhaps2: Maybe[Int] = Full(1)

    //perhaps2.flatMap(_ * 10).map(a => println(a))
    //println(perhaps2.fold[Int](a => a*2,))

    val ll: LinkedList[Int] = Pair(1, Pair(2, Pair(3, End())))
    /*ll.map(a => a*2).map(a => println(a))
    ll.map(a => a+1).map(a => println(a))
    ll.map(a => a/3).map(a => println(a))*/

    val seq = Seq(1, 2, 3, 4)
    0 +: seq
    seq.map(x => println(x))

    //val list = 1 :: 2 :: 3 :: 4 :: Nil
    list.map(x => println(x))

}