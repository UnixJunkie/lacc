
module Acc : sig
  type 'a mut_list = { hd : 'a; mutable tl : 'a list; }
  val create : 'a -> 'a mut_list
  val accum : 'a mut_list -> 'a -> 'a mut_list
  val set_tail : 'a mut_list -> 'a list -> unit
  val return : 'a mut_list -> 'a list
end

module Dacc : sig
  type 'a mut_list = { hd : 'a; mutable tl : 'a list; }
  val create : unit -> 'a mut_list
  val accum : 'a mut_list -> 'a -> 'a mut_list
  val set_tail : 'a mut_list -> 'a list -> unit
  val return : 'a mut_list -> 'a list
end
