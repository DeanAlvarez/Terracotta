type key = int * int

let pub : key = (5 , 14)

let priv : key = (11 , 14)

(** Computes x ^ y via fast exponentiation algorithm *)
let power x y = 
  let rec helper acc a b = 
    if b = 0 then acc
    else
      let new_a = a * a in
      let new_b = b asr 1 in 
      if b land 1 = 1 then helper (acc * a) new_a new_b
      else 
        helper acc new_a new_b
  in 
  helper 1 x y

let modpow x y z = 
  let rec helper acc a b = 
    if b = 0 then acc
    else
      let new_a = a * a in
      let new_b = b asr 1 in 
      if b land 1 = 1 then helper ((acc * a) mod z) new_a new_b
      else 
        helper acc new_a new_b
  in 
  helper 1 x y

let encrypt msg key = 
  power msg