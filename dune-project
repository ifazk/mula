(lang dune 2.8)
(name mula)

(generate_opam_files true)
(license CC0-1.0)
(authors "Ifaz Kabir")
(maintainers "Ifaz Kabir")
(source (github ifazk/mula))
(documentation https://ifazk.github.io/mula/)
(version 0.1.2)

(package
 (name mula)
 (synopsis "ML's Universal Levenshtein Automata library")
 (description
   "\| ML's radishal Universal Levenshtein Automata library.
   "\| This allows checking if a string is within a given edit
   "\| distance of another string.
   "\| The library supports both the Levenshtein distance and
   "\| the Demarau-Levenshtein.
   "\|
   "\| The library can be used for fuzzy string searching or
   "\| approximate string matching, but does not provide these
   "\| facilities out of the box.
 )
 (tags ("levenshtein" "demarau-levenshtein" "automaton" "typo" "edit" "distance" "approximate" "fuzzy" "string" "search" "matching"))
 (depends (ocaml (>= 4.08.1)) (ppx_inline_test :with-test)))
