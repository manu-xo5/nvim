local M = {}
function M.ImportsHas(target, root)
  local bufnr = vim.api.nvim_get_current_buf()

  local query = vim.treesitter.query.parse(
    "tsx",
    [[
      (import_statement
        (import_clause
          (named_imports
            (import_specifier
              name: (identifier) @identifier)))
        source: (string))
    ]]
  )

  for _, node in query:iter_captures(root, bufnr) do
    local text = vim.treesitter.get_node_text(node, bufnr)
    if text == target then
      return node
    end
  end
  return nil
end

function M.GetLastImport()
  local bufnr = vim.api.nvim_get_current_buf()
  local parser = vim.treesitter.get_parser(bufnr)
  local tree = parser:parse()[1] -- Get the first tree
  local root = tree:root()
  local query = vim.treesitter.query.parse(
    "tsx",
    [[
      (import_statement
        source: (string)) @import
    ]]
  )

  local last = nil
  for _, node in query:iter_captures(root, bufnr) do
    last = node
  end

  return last
end

function M.SmartSnip()
  local bufnr = vim.api.nvim_get_current_buf()
  local parser = vim.treesitter.get_parser(bufnr)
  local tree = parser:parse()[1] -- Get the first tree
  local root = tree:root()

  local query = vim.treesitter.query.parse(
    "tsx",
    [[
      (import_statement
        source: (string) @base)
    ]]
  )

  local hasUseState = false
  for id, node in query:iter_captures(root, bufnr) do
    local name = query.captures[id]
    local text = vim.treesitter.get_node_text(node, bufnr)

    if name == "base" and text == '"react"' then
      local parent = node:parent()

      if parent and M.ImportsHas("useState", parent) then
        print("yes")
        hasUseState = true
      end
    end
  end

  if not hasUseState then
    print("no. inserting")
    local line_number = -1

    local lastImport = M.GetLastImport()
    if lastImport then
      _, _, line_number = lastImport:range()
    end
    local text_to_insert = 'import { useState } from "react";'

    vim.api.nvim_buf_set_lines(bufnr, line_number + 1, line_number + 1, false, { text_to_insert })
  end
end

return M
