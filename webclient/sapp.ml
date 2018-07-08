(** Simple web app *)

open! Base
open! Import
open Vdom

type model =
  { text: string
  ; num_clicks: int
  }
[@@deriving compare]

let init_model =
  { text = "Welcome to Sigal's website"
  ; num_clicks = 0
  }

type action =
  | Nothing
  | Click
[@@deriving sexp]

let apply_action action m =
  match action with
  | Nothing -> m
  | Click -> { m with num_clicks = m.num_clicks + 1 }

let attrs l =
  List.map l ~f:(fun (k,v) -> Attr.create k v)

let view m ~inject =
  Node.body []
    [ Node.h1 [] [Node.text m.text]
    ; Node.svg "svg" (attrs ["width","100" ;"height","100"])
        [ Node.svg "circle"
            (attrs ["cx","50"
                   ;"cy","50"
                   ;"r",Int.to_string (5 + m.num_clicks)
                   ;"stroke-width","1"
                   ;"stroke","green"
                   ;"fill","orange" ])
            []
        ]
    ; Node.create "br" [] []
    ; Node.button
        [ Attr.on_click (fun _ -> inject Click) ]
        [ Node.text (Printf.sprintf
                       "This button has been clicked %d times"
                       m.num_clicks)]
    ; Node.create "br" [] []
    ]
