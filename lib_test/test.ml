
module Acc  = Lacc.Acc
module Dacc = Lacc.Dacc

(* append with Acc *)
let append_1 l1 l2 =
  let rec loop dst = function
    | [] ->
      Acc.set_tail dst l2
    | h :: t ->
      loop (Acc.accum dst h) t
  in
  match l1 with
    | [] -> l2
    | h :: t ->
      let r = Acc.create h in
      loop r t;
      Acc.return r

(* append with Dacc *)
let append_2 l1 l2 =
  let rec loop dst = function
    | [] ->
      Dacc.set_tail dst l2
    | h :: t ->
      loop (Dacc.accum dst h) t
  in
  match l1 with
    | [] -> l2
    | h :: t ->
      let r = Dacc.create () in
      loop (Dacc.accum r h) t;
      Dacc.return r

let main () =

  assert(append_1 []     []     = []       );
  assert(append_1 []     [1]    = [1]      );
  assert(append_1 [1]    []     = [1]      );
  assert(append_1 [1]    [2]    = [1; 2]   );
  assert(append_1 [1; 2] [3]    = [1; 2; 3]);
  assert(append_1 [1]    [2; 3] = [1; 2; 3]);

  assert(append_2 []     []     = []       );
  assert(append_2 []     [1]    = [1]      );
  assert(append_2 [1]    []     = [1]      );
  assert(append_2 [1]    [2]    = [1; 2]   );
  assert(append_2 [1; 2] [3]    = [1; 2; 3]);
  assert(append_2 [1]    [2; 3] = [1; 2; 3]);

;;

main ()
