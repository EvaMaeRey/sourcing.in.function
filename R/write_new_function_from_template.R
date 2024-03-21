write_function_template <- function(){
'say_hello <- function(){
  
  "hello"
  
}'
}

write_new_function_from_template <- function(pattern = "hello", replacement = "hi"){
  
  tmp <- tempfile()
  
  write_function_template() |>
    stringr::str_replace_all(pattern = pattern,
                         replacement = replacement) |>
    writeLines(con = tmp)

  source(tmp)

  }
