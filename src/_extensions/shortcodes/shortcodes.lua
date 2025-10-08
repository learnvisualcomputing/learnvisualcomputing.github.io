function Shortcodes(circ)
  local n = circ[1].text
  if FORMAT:match("html") then
    local base = 9311  -- Unicode offset: 9312 is ①
    local code = base + tonumber(n)
    return pandoc.RawInline("html", "&#" .. code .. ";")
  elseif FORMAT:match("pdf") then
    return pandoc.RawInline("latex", "\\textcircled{" .. n .. "}")
  else
    return pandoc.Str("(" .. n .. ")")
  end
end

