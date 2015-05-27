
(*
open Printf

  let () =
    for i = 0 to Array.length Sys.argv - 1 do
      printf "[%i] %s\n" i Sys.argv.(i)
    done;; *)


let f a b = 2+a+b;;
let r a b c = a+b-c;;
let s = "KILL ALL HUMANS";;

Js.Unsafe.global##krill <- Js.wrap_callback f;;
Js.Unsafe.global##plop <- Js.wrap_callback r ;;
Js.Unsafe.global##test <- s ;;
Js.Unsafe.global##n <- 42 ;;
Js.Unsafe.global##pair <- (30,20,-23) ;;

(* let () = (Js.Unsafe.coerce Dom_html.window)##square <- Js.wrap_callback ((fun (a) -> a+2)) *)

(* http://caml.inria.fr/pub/docs/manual-ocaml-400/manual032.html *)
(* ocamlbuild -use-ocamlfind -pkgs js_of_ocaml,js_of_ocaml.syntax -syntax camlp4o main.byte *)
(* ocamlfind ocamlc -package js_of_ocaml -syntax camlp4o -package js_of_ocaml.syntax -linkpkg -o cubes.byte main.ml  *)
