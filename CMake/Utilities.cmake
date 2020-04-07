# File containing various utilities

# Returns a list of arguments that evaluate to true
function(count_true output_count_var)
  set(lst_len 0)
  foreach(option_var IN LISTS ARGN)
    if(${option_var})
      math(EXPR lst_len "${lst_len} + 1")
    endif()
  endforeach()
  set(${output_count_var} ${lst_len} PARENT_SCOPE)
endfunction()

# Returns a list of arguments that evaluate to true
function(collect_true output_var output_count_var)
  set(${output_var})
  foreach(option_var IN LISTS ARGN)
    if(${option_var})
      list(APPEND ${output_var} ${option_var})
    endif()
  endforeach()
  set(${output_var} ${${output_var}} PARENT_SCOPE)
  list(LENGTH ${output_var} ${output_count_var})
  set(${output_count_var} ${${output_count_var}} PARENT_SCOPE)
endfunction()
