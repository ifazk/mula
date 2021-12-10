open Internal

module type S = sig
  type ch
  type t

  val length : t -> int
  val get : t -> int -> ch
  val equal : ch -> ch -> bool
end

module Make (St : S) = struct
  module Lev = Matcher.Make (St) (LevBVNFA)
  module Dem = Matcher.Make (St) (DemarauBVNFA)
end
