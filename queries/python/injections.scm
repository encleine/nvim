(expression_statement 
  (call 
    function: (attribute object: (identifier) attribute: (identifier))
    arguments: (argument_list
      (string 
        (string_start) 
        (string_content) @injection.content
        (string_end)
      )
    )
  )

  (#set! injection.language "sql")
)



(assignment 
  left: (identifier) @operand (#any-of? @operand "query")
  right: (string
    (string_start) 
    (string_content)  @injection.content 
    (string_end)
  )

  (#set! injection.language "sql")
)
