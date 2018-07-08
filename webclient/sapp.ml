(** Simple web app *)

open! Base
open! Import

type model =
  { text: string }
[@@deriving compare]

let init_model =
  { text = "Welcome to Sigal's website" }

type action =
  | Nothing
[@@deriving sexp]

let apply_action action m =
  match action with
  | Nothing -> m

open Vdom

let view m =
  Node.body [] [Node.text m.text]
