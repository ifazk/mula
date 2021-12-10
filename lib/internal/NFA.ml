module type NFA_t = sig
  module State : sig
    type t
    val compare : t -> t -> int
  end
  module StateSet : sig
    include Set.S with type elt = State.t

    val start : t
    val err : t

    val pp_comma : Format.formatter -> unit -> unit
    val pp_states : Format.formatter -> t -> unit
  end
  module Transitions : sig
    val all_transitions : StateSet.t -> BitVec.t -> k:int -> StateSet.t
  end
end
