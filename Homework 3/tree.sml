(*
COEN 171 - Homework #3
Maddie Waldie, 11/11/22
Binary Search Tree
*)

datatype tree = empty | node of 'a* 'a tree * 'a tree

fun insert empty x = node(num, empty, empty)
	| insert x (node(num, left, right)) =
		if x < num
			then node(num, insert x left, right)
		else node(num, left, insert x right)

fun member empty x = false
	| member x (node(num, left, right)) =
		if x < num
			then member x left
		else if x > num
			then member x right
		else true