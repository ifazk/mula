module Lev : sig
  type nfa_state
  val start : k:int -> str:string -> nfa_state
  val feed : nfa_state -> char -> nfa_state
  val current_error : nfa_state -> int option
  val end_input : nfa_state -> int option
  val feed_str : nfa_state -> str:string -> nfa_state
  val get_distance : k:int -> string -> string -> int option
end
module Dem : sig
  type nfa_state
  val start : k:int -> str:string -> nfa_state
  val feed : nfa_state -> char -> nfa_state
  val current_error : nfa_state -> int option
  val end_input : nfa_state -> int option
  val feed_str : nfa_state -> str:string -> nfa_state
  val get_distance : k:int -> string -> string -> int option
end
