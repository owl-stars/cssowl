hbs.registerHelper("commentize", function(val) {
  var key, val, value, _i, _len;
  val = val.trim().split("\n");
  for (key = _i = 0, _len = val.length; _i < _len; key = ++_i) {
    value = val[key];
    val[key] = "// " + value;
  }
  return val.join("\n");
});

hbs.registerHelper("trim", function(val) {
  return (val) ? val.trim() : val;
});

hbs.registerHelper("indent", function(val, indent, escape) {
  if (!val) {
    return val;
  }
  var i, key, value, _i, _j, _len;
  if (indent == null) {
    indent = 1;
  }
  if (escape == null) {
    escape = false;
  }
  val = val.trim().split("\n");
  for (key = _i = 0, _len = val.length; _i < _len; key = ++_i) {
    value = val[key];
    if (key === 0) {
      continue;
    }
    for (i = _j = 0; 0 <= indent ? _j < indent : _j > indent; i = 0 <= indent ? ++_j : --_j) {
      val[key] = "  " + val[key];
    }
  }
  val = val.join("\n")
  if (escape) {
    val = val.replace(/\#\{/g, "\\#{");
  }
  return val;
});
