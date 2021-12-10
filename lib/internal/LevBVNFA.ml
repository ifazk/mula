module BV = BitVec

type states = States of (BV.t array) [@@unboxed]

module StateSet = struct
  type t = states

  let start ~k : t =
    let arr = Array.make (k + 1) BV.zero in
    let init = BV.snoc_zeros ~m:k (BV.one) in
    arr.(0) <- init;
    States arr

  let _find_index ~f arr : int option =
    let rec find_index f arr n len =
      if n < len then
        begin if f arr.(n) then
          Some n
        else
          find_index f arr (n + 1) len
        end
      else
        None
    in
    find_index f arr 0 (Array.length arr)

  let min_cost_opt (States arr) : int option =
    _find_index ~f:(fun bv -> BV.non_zero bv) arr

end

module Transitions = struct

  let all_transitions (States input : StateSet.t) bv ~k : StateSet.t =
    let output = Array.make (k + 1) BV.zero in
    let del_mask = ref BV.zero in
    let prev = ref BV.zero in
    for i = 0 to k do
      let prev_bv = !prev in
      let ins_subs = (BV.logor (BV.shift_left prev_bv 1) prev_bv) in
      let dels = BV.logand bv !del_mask in
      let prev_transitions = BV.logor ins_subs dels in
      let self_transitions = BV.logand bv input.(i) in
      let transitions = BV.logor prev_transitions self_transitions in
      del_mask := BV.logor (BV.shift_right_logical input.(i) 1) (BV.shift_right_logical !del_mask 1);
      prev := input.(i);
      output.(i) <- transitions
    done;
    States output

end
