-- local query = vim.treesitter.query.parse(
--     "go",
--     [[
-- (call_expression
-- (selector_expression
--     operand: (identifier) @operand (#any-of? @operand "db" "Xdb")
--
--     field: (field_identifier) @field
--         (#any-of? @field "Exec" "NamedExec" "QueryRow" "Select" "Get"))
--
--     (argument_list
--     [
--         (raw_string_literal) (interpreted_string_literal)
--     ] @sql
--   )
--  (#offset! @sql 1 0 -1 0)
-- )
-- ]]
-- )
--
-- local function get_root(bufnr)
--     local parser = vim.treesitter.get_parser(bufnr, "go", {})
--     local tree = parser:parse()[1]
--     return tree:root()
-- end


vim.treesitter.query.set("go", "injections", [[

(call_expression
    (selector_expression
        operand: (identifier) @operand (#any-of? @operand "db" "Xdb" "DB" "Pgx")
        field: (field_identifier) @field (#any-of? @field "Exec" "NamedExec" "QueryRow" "Select" "Get" "Query"))

    (argument_list
    [ (raw_string_literal) (interpreted_string_literal) ] @injection.content (#offset! @injection.content 0 1 0 -1)
    (#set! injection.language "sql")
  )
)


(call_expression
    (selector_expression
        operand : (selector_expression
            operand: (identifier) @operand (#any-of? @operand "rest" "engine")
            field: (field_identifier) @field (#any-of? @field "db" "Xdb" "DB" "Pgx" "Xdb_READ")
        )
        field: (field_identifier) @field (#any-of? @field "Exec" "NamedExec" "QueryRow" "Select" "Get" "Query")
    )

    (argument_list
    [ (raw_string_literal) (interpreted_string_literal) ] @injection.content (#offset! @injection.content 0 1 0 -1)
    (#set! injection.language "sql")
  )
)

(short_var_declaration
    left: (expression_list
      (identifier) @operand (#any-of? @operand "query"))
    right: (expression_list
      [ (raw_string_literal) (interpreted_string_literal) ] @injection.content (#offset! @injection.content 0 1 0 -1)
    (#set! injection.language "sql")
    )
)

]])
