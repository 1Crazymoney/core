open OUnit

let rec flatten_list acc = function
  | [] -> acc
  | (TestCase _ as r)::rest -> flatten_list (r::acc) rest
  | (TestList l)::rest ->
    let acc = flatten_list acc l in
    flatten_list acc rest
  | (TestLabel (lbl,test))::rest ->
    flatten_list
      (TestLabel (lbl,flatten test)::acc)
      rest
and flatten = function
  | TestCase _ as res  -> res
  | TestLabel (s,test) -> TestLabel (s,flatten test)
  | TestList l -> TestList (List.rev (flatten_list [] l))





let all () =
  flatten
    (TestList
       [
         Avltree_test.test;
         Bag_test.test;
         Blang_test.test;
         Common_test.test;
         Comparable_test.test;
         Doubly_linked_test.test;
         Float_test.test;
         Fdeque_test.test;
         Int_conversions_test.test;
         Core_char_test.test;
         Core_int_test.test;
         Core_array_test.test;
         Core_filename_test.test;
         Core_map_test.test;
         Core_set_test.test;
         Core_queue_test.test;
         Core_string_test.test;
         PMap_test.test;
         PSet_test.test;
         Union_find_test.test;
         Validate_test.test;
       ])
