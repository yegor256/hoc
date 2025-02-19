# SPDX-FileCopyrightText: Copyright (c) 2014-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'date'
require 'hoc/hits'

module HOC
  # Subversion source code base.
  class Svn
    def initialize(dir)
      @dir = dir
    end

    def hits
      version = `svn --non-interactive --version --quiet`
      raise "svn version #{version} is too old, upgrade it to 1.7+" unless
        Gem::Version.new(version) >= Gem::Version.new('1.7')
      raise 'diffstat is not installed' if
        `diffstat -V`.index('version').nil?
      log = `cd #{@dir} && svn log --diff | diffstat`
      [
        Hits.new(
          Time.now,
          log.split(/\n/).last.split(/[^\d]/)
            .map(&:to_i).select { |x| x > 0 }
            .drop(1).inject(:+)
        )
      ]
    end
  end
end
