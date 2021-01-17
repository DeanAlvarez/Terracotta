type t = Encrypt | Decrypt

exception Malformed

(** [rid_spaces cmd_lst] is a helper function for parse that takes
    in a string list [cmd_lst] which represents the command, and gets
    rid of trailing or leading spaces in each element and then filters for only
    those elements which are empty strings. *)
let rid_spaces cmd_lst : string list =
  cmd_lst 
  |> List.map (fun s -> String.trim s) 
  |> List.filter (fun x -> String.length x > 0)

let lower lst = List.map String.lowercase_ascii lst

let parse (str : string) : t =
  let open String in
  let cmd_lst = str |> trim |> split_on_char ' ' |> rid_spaces |> lower in
  match cmd_lst with
  | "encrypt" :: [] -> Encrypt
  | "decrypt" :: [] -> Decrypt
  | _ -> raise Malformed