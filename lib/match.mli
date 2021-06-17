module type S =
  sig
    type ch
    type t
    val length : t -> int
    val get : t -> int -> ch
    val equal : ch -> ch -> bool
  end

module Make (St : S) :
    sig
      module Lev : sig
        type nfa_state
        val start : k:int -> str:St.t -> nfa_state
        val feed : nfa_state -> St.ch -> nfa_state
        val current_error : nfa_state -> int option
        val end_input : nfa_state -> int option
        val feed_str : nfa_state -> str:St.t -> nfa_state
        val get_distance : k:int -> St.t -> St.t -> int option
      end
      module Dem : sig
        type nfa_state
        val start : k:int -> str:St.t -> nfa_state
        val feed : nfa_state -> St.ch -> nfa_state
        val current_error : nfa_state -> int option
        val end_input : nfa_state -> int option
        val feed_str : nfa_state -> str:St.t -> nfa_state
        val get_distance : k:int -> St.t -> St.t -> int option
      end
    end
