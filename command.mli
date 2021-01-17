(** Users can either encrypt or decrypt *) 
type t = Encrypt | Decrypt

(** [Malformed] is raised when a user's input string cannot be parsed into a
    command. *)
exception Malformed

(** [Command.parse str] parses a user's input [str] into a command as follows. 
    The first word will always be the action taken by the user. This can be to 
    raise the bet, start the game, see your best hand, call, fold, quit the 
    game, or get help.
    Requires: [str] contains only lowercase alphanumeric (a-z, 0-9) and space 
    characters (only ASCII character code 32; not tabs or newlines, etc.). If 
    there is a substring following the action, then the command is 
    Raise and the substring consists of a string representation of an int.
    Raises: [Malformed] if the command is malformed.  *)
val parse : string -> t


