open! Base
open! Import

module Model = struct
  type t = Sapp.model [@@deriving compare]

  let empty = Sapp.init_model

  let cutoff t1 t2 = compare t1 t2 = 0
end

let init_model = Model.empty

module Action = struct
  type t = Sapp.action [@@deriving sexp]

  let should_log _ = true
end

module State = struct
  type t = unit

  let create () = ()
end

let apply_action (action: Action.t) (model: Model.t) (_state: State.t)
  : Model.t =
  Sapp.apply_action action model

let view (m: Model.t Incr.t) ~inject =
  let open Incr.Let_syntax in
  let%map m = m in
  Sapp.view m ~inject

open Async_kernel

let on_startup ~schedule:_ (_: Model.t) = return (State.create ())

let on_display ~old:_ (_: Model.t) _state = ()

let update_visibility m = m
