open Command

type color = Red | Yellow | White

let print_color s color = 
  match color with
  | Red -> ANSITerminal.(print_string [red] s)
  | Yellow -> ANSITerminal.(print_string [yellow] s)
  | White -> ANSITerminal.(print_string [white] s)


let encrypt_flow = 
  print_color "Enter a message to encrypt" White;
  print_string  " > ";
  match read_line () with
  | exception End_of_file -> ()
  | message -> ()


let decrypt_flow = ()

let flow cmd : unit = 
  match cmd with 
  | Encrypt -> encrypt_flow
  | Decrypt -> decrypt_flow


let main () =
  print_color "\n\n Welcome to Terracotta.\n" Red;
  let open_msg = 
    " Would you like to encrypt or decrypt?"

  in
  print_endline open_msg;
  print_string  " > ";
  match read_line () with
  | exception End_of_file -> ()
  | command_str -> let cmd = parse command_str in 
    flow cmd


let () = main ()