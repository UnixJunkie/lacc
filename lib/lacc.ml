
(* shared code *)
module Common = struct

  (* Thanks to Jacques Garrigue for suggesting the following structure *)
  type 'a mut_list = {
    hd: 'a;
    mutable tl: 'a list
  }

  external inj : 'a mut_list -> 'a list = "%identity"

  let accum acc x =
    let cell = { hd = x; tl = [] } in
    acc.tl <- inj cell;
    cell

  let set_tail acc l =
    acc.tl <- l
end

(* accumulator with a dummy element at its head *)
module Dacc = struct

  include Common

  let create () =
    { hd = Obj.magic (); tl = [] }

  let return acc =
    (* since the first element is a dummy: never return it *)
    acc.tl
end

(* accumulator with a real element at its head *)
module Acc = struct

  include Common

  let create x =
    { hd = x; tl = [] }

  let return acc =
    inj acc
end
