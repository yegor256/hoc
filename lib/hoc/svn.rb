# Copyright (c) 2014-2020 Yegor Bugayenko
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

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
