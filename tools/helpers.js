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
