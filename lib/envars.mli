(************************************************************************)
(*         *      The Rocq Prover / The Rocq Development Team           *)
(*  v      *         Copyright INRIA, CNRS and contributors             *)
(* <O___,, * (see version control and CREDITS file for authors & dates) *)
(*   \VV/  **************************************************************)
(*    //   *    This file is distributed under the terms of the         *)
(*         *     GNU Lesser General Public License Version 2.1          *)
(*         *     (see LICENSE file for the text of the license)         *)
(************************************************************************)

(** This file provides a high-level interface to the environment variables
    needed by Rocq to run (such as coqlib). The values of these variables
    may come from different sources (shell environment variables,
    command line options, options set at the time Rocq was build). *)

val getenv_rocq : string -> string option
(** [getenv_rocq name] returns the value of "ROCQ$name" if it exists,
    otherwise the value of "COQ$name" if it exists and warns that it
    is deprecated, otherwise [None]. *)

(** [expand_path_macros warn s] substitutes environment variables
    in a string by their values. This function also takes care of
    substituting path of the form '~X' by an absolute path.
    Use [warn] as a message displayer. *)
val expand_path_macros : warn:(string -> unit) -> string -> string

(** [home warn] returns the root of the user directory, depending
    on the OS. This information is usually stored in the $HOME
    environment variable on POSIX shells. If no such variable
    exists, then other common names are tried (HOMEDRIVE, HOMEPATH,
    USERPROFILE). If all of them fail, [warn] is called. *)
val home : warn:(string -> unit) -> string

(** [datadir] is the path to the installed data directory. *)
val datadir : unit -> string

(** [configdir] is the path to the installed config directory. *)
val configdir : unit -> string

(** [coqpath] is the standard path to coq.
    Notice that coqpath is stored in reverse order, since that is
    the order it gets added to the search path. *)
val coqpath : unit -> string list

(** Rocq tries to honor the XDG Base Directory Specification to access
    the user's configuration files.

    see [http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html]
*)
val xdg_config_home : (string -> unit) -> string
val xdg_data_home   : (string -> unit) -> string
val xdg_data_dirs   : (string -> unit) -> string list
val xdg_dirs : warn : (string -> unit) -> string list
