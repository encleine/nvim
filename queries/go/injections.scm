
(call_expression
    (selector_expression
        operand: (identifier) @operand (#any-of? @operand "db" "Xdb" "DB" "Pgx" "queryBuilder" "transaction" "pgxscan")
        field: (field_identifier) @field (#any-of? @field "Exec" "NamedExec" "QueryRow" "Select" "Get" "Query" "WriteString" ))

    (argument_list
      [ (raw_string_literal (raw_string_literal_content) @injection.content) (interpreted_string_literal (interpreted_string_literal_content) @injection.content)  ] 
    (#set! injection.language "sql")
  )
)


(call_expression
    (selector_expression
        operand : (selector_expression
            operand: (identifier) @operand (#any-of? @operand "rest" "engine" "food" "db" "pgxscan")
            ;field: (field_identifier) @field (#any-of? @field "db" "Xdb" "DB" "Pgx" "Xdb_READ")
        )
        field: (field_identifier) @field (#any-of? @field "Exec" "NamedExec" "QueryRow" "Select" "Get" "Query" "Queryx")
    )

    (argument_list
      [ (raw_string_literal (raw_string_literal_content) @injection.content) (interpreted_string_literal (interpreted_string_literal_content) @injection.content)  ] 
    (#set! injection.language "sql")
  )
)

(short_var_declaration 
 left: (expression_list (identifier) @operand (#any-of? @operand "query"))

 right: (expression_list
    [ (raw_string_literal (raw_string_literal_content) @injection.content) (interpreted_string_literal (interpreted_string_literal_content) @injection.content)  ] 
    (#set! injection.language "sql")
 )
)

(assignment_statement 
  left: (expression_list (identifier) @operand (#any-of? @operand "query"))

  right: (expression_list
    [ (raw_string_literal (raw_string_literal_content) @injection.content) (interpreted_string_literal (interpreted_string_literal_content) @injection.content)  ] 
    (#set! injection.language "sql")
 )
)


(call_expression 
  function: (selector_expression 
    operand: (call_expression 
    function: (selector_expression 
      operand: (identifier) @operand (#any-of? @operand "template")
      field: (field_identifier)
      ) 
    arguments: (argument_list (interpreted_string_literal))
    )
    field: (field_identifier)  @field (#any-of? @field "Parse")
  )
  arguments: (argument_list 
     [ (raw_string_literal (raw_string_literal_content) @injection.content) (interpreted_string_literal (interpreted_string_literal_content) @injection.content)  ] 
    (#set! injection.language "gotmpl")
     )
)


; INFO putting the builtin go injection here by hand until a workaround is done in treesitter 
((comment) @injection.content
  (#set! injection.language "comment"))

(call_expression
  (selector_expression) @_function
  (#any-of? @_function
    "regexp.Match" "regexp.MatchReader" "regexp.MatchString" "regexp.Compile" "regexp.CompilePOSIX"
    "regexp.MustCompile" "regexp.MustCompilePOSIX")
  (argument_list
    .
    [ 
      (raw_string_literal (raw_string_literal_content) @injection.content) 
      (interpreted_string_literal (interpreted_string_literal_content) @injection.content)  
    ] 

    (#offset! @injection.content 0 1 0 -1)
    (#set! injection.language "regex")))

((comment) @injection.content
  (#match? @injection.content "/\\*!([a-zA-Z]+:)?re2c")
  (#set! injection.language "re2c"))

((call_expression
  function: (selector_expression
    field: (field_identifier) @_method)
  arguments: (argument_list
    .
    [ (raw_string_literal (raw_string_literal_content) @injection.content) (interpreted_string_literal (interpreted_string_literal_content) @injection.content)  ] 
    )
  )
  (#any-of? @_method "Printf" "Sprintf" "Fatalf" "Scanf" "Errorf" "Skipf" "Logf")
  (#set! injection.language "printf"))

((call_expression
  function: (selector_expression
    field: (field_identifier) @_method)
  arguments: (argument_list
    (_)
    [ (raw_string_literal (raw_string_literal_content) @injection.content) (interpreted_string_literal (interpreted_string_literal_content) @injection.content)  ] 
    .
    )
  )
  (#any-of? @_method "Fprintf" "Fscanf" "Appendf" "Sscanf")
  (#set! injection.language "printf"))
