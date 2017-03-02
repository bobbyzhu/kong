local version = setmetatable({
  major = 0,
  minor = 10,
  patch = 0,
  pre_release = "rc4"
}, {
  __tostring = function(t)
    return string.format("%d.%d.%d%s", t.major, t.minor, t.patch,
                         t.pre_release and t.pre_release or "")
  end
})

return {
  _NAME = "kong",
  _VERSION = tostring(version),
  _VERSION_TABLE = version,

  -- third-party dependencies' minimum required version
  _DEPENDENCIES = {
    nginx = "1.11.2.1",
    serf = "0.7.0",
  }
}
