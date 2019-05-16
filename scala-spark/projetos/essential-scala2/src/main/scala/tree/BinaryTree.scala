package tree

sealed trait Tree[A] {

    def fold[B](node: (B, B) => B, leaf: A => B): B

}

final case class Node[A](left: Tree[A], right: Tree[A]) extends Tree[A] {

    def fold[B](node: (B, B) => B, leaf: A => B): B =
        node(left.fold(node, leaf), right.fold(node, leaf))
    
}
final case class Leaf[A](value: A) extends Tree[A] {

    def fold[B](node: (B, B) => B, leaf: A => B): B = 
        leaf(value)
    
}