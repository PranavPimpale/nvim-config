local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
  s("head", {
    t("#include <"),
    i(1, ""),
    t(">"),
  }),

  s("damn", {
    t({
      "#include <iostream>",
      "",
      "int main(int argc, char *argv[]) {",
      "    ",
    }),
    i(1),
    t({
      "",
      "    return 0;",
      "}",
    }),
  }),

  s("class", {
    t("class "),
    i(1, "ClassName"),
    t({ " {", "public:", "    " }),
    i(2),
    t({ "", "", "private:", "    " }),
    i(3),
    t({ "", "};" }),
  }),

  s("case", {
    t("case "),
    i(1, "value"),
    t({ ":", "\t" }),
    i(2),
    t({ "", "\tbreak;", "" }),
  }),

  s("func", {
    i(1, "void"),
    t(" "),
    i(2, "functionName"),
    t(" ("),
    i(3),
    t({ ") {", "    " }),
    i(4),
    t({ "", "}" }),
  }),

  -- Containers
  s("map", {
    t("std::map<"),
    i(1, "int"),
    t(", "),
    i(2, "int"),
    t("> "),
    i(3, "mp"),
  }),

  s("vec", {
    t("std::vector<"),
    i(1, ""),
    t(">"),
    i(2, ""),
  }),
})
