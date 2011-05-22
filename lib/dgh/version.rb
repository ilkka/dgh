module Dgh
  module Version
    MAJOR = 0
    MINOR = 1
    PATCH = 1
    BUILD = nil
  end

  VERSION = [Version::MAJOR, Version::MINOR, Version::PATCH, Version::BUILD].compact.join('.')
end
