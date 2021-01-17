type color = Red | Yellow | White

let print_color s color = 
  match color with
  | Red -> ANSITerminal.(print_string [red] s)
  | Yellow -> ANSITerminal.(print_string [yellow] s)
  | White -> ANSITerminal.(print_string [white] s)

let main () =
  print_color "\n\n Welcome to Terracotta.\n" Red;
  let open_msg = 
    " Would you like to encrypt or decrypt?"

  in
  print_endline open_msg


let () = main ()