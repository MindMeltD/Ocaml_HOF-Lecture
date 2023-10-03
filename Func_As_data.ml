(* The following expressions are all equivalent*)
let f x y = x + y;;

fun x -> fun y -> x + y;;

fun x y -> x + y;;

(*This is not true in Python where
       lambda x: lambda y: x+y
       Will yield different results from:
       lambda x,y: x+y
       *)

(* let g x = x + 1 in (g) is a SELF-CONTAINED statement*)

let x = 4 in let x = 5 in x+x (* Will return 10, because the second x overshadows the previous value*)

(*
 x = 4
 {
 x = 5
 x+x
 }

 (* In Python x has become 5, in Ocaml, the inner x overshadows the outer x, but that value doesn't disappear*)

 let x = 4 in (let y = (let x = 3 in x) in x) let x = 3 in x

 x = 5
 let f a = x + a
 x = 3 (* Will overshadow x = 5, but won't change the closure *)
 f 6 (* Will print out 11, since closures can't be modified after creation)

 let rec map f lst =
 match lst with
 [] -> []
 | h::t -> (f h)::(map f t)

(*Fold is Ocaml's version of reduce, with three mandatory inputs*)
(** Type: ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a *)
let rec fold f a lst =
match lst with
[] -> a
| h::t -> fold f (f a h) t
