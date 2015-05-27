(* testing communication with javascript *)

(* parser function *)
let p (source:string) : string =
 string_of_int (Parser.main Lexer.token (Lexing.from_string source))
 ;;


let w (s:Js.js_string Js.t) =
  Js.string (p ((Js.to_string s)^"\n"))
  ;;

  type tt = { error   : string;
        timestamp  : int;
      };;

(*
let t = Json.output ((Json.unsafe_input (Js.string "{\"ok\" : 42}"))##ok) ;;
let t = Json.output (Json.unsafe_input (Js.string "{\"ok\" : 42 , \"nope\" : false }")) ;;
Js.Unsafe.global##test2 <- t ;;
*)

let obj = Js.Unsafe.obj [||];;
obj##ok <- 42;;
obj##nope <- (Js.bool false);;
obj##message <- (Js.string "ARGH");;


Js.Unsafe.global##parse <- Js.wrap_callback w ;;
Js.Unsafe.global##test <- (Js.string "KILL ALL HUMANS") ;;

Js.Unsafe.global##test3 <- obj ;;

(* http://stackoverflow.com/questions/1933101/ocamlyacc-parse-error-what-token

let parse_buf_exn lexbuf =
    try
      T.input T.rule lexbuf
    with exn ->
      begin
        let curr = lexbuf.Lexing.lex_curr_p in
        let line = curr.Lexing.pos_lnum in
        let cnum = curr.Lexing.pos_cnum - curr.Lexing.pos_bol in
        let tok = Lexing.lexeme lexbuf in
        let tail = Sql_lexer.ruleTail "" lexbuf in
        raise (Error (exn,(line,cnum,tok,tail)))
      end *)
