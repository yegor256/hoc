# SPDX-FileCopyrightText: Copyright (c) 2014-2026 Yegor Bugayenko
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
      raise(StandardError, "svn version #{version} is too old, upgrade it to 1.7+") unless
        Gem::Version.new(version) >= Gem::Version.new('1.7')
      raise(StandardError, 'diffstat is not installed') if
        `diffstat -V`.index('version').nil?
      parts = `cd #{@dir} && svn log --diff | diffstat`.split("\n").last.split(/[^\d]/)
      parts.reject!(&:empty?)
      parts.map! { |n| Integer(n) }
      parts.select! { |x| x > 0 }
      [Hits.new(Time.now, parts.drop(1).inject(:+))]
    end
  end
end
