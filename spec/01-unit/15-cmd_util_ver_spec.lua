local ver = require "kong.cmd.utils.ver"

describe("cmd util ver", function()
  local mock_min_version = "0.2.0"
  local g = ver.greater_than

  it("returns true when compared with a newer version", function()
    local mock_version = "0.3.0"

    assert.True(g(mock_version, mock_min_version))
  end)

  it("returns true when compared with a newer version missing a release number", function()
    local mock_version = "0.3"

    assert.True(g(mock_version, mock_min_version))
  end)

  it("returns true when compared with the same version", function()
    local mock_version = "0.2.0"

    assert.True(g(mock_version, mock_min_version))
  end)

  it("returns true when compared with the same version missing a release number", function()
    local mock_version = "0.2"

    assert.True(g(mock_version, mock_min_version))
  end)

  it("returns true when compared with a version with a greater major but lower minor digit", function()
    local mock_version = "1.1.0"

    assert.True(g(mock_version, mock_min_version))
  end)

  it("returns false when compared with an older version", function()
    local mock_version = "0.1.0"

    assert.False(g(mock_version, mock_min_version))
  end)

  it("returns false when compared with an older version with a higher point release", function()
    local mock_version = "0.1.1"

    assert.False(g(mock_version, mock_min_version))
  end)

end)
