# Copyright (c) 2014-2025 Yegor Bugayenko
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
  # Git source code base.
  class Git
    def initialize(dir, exclude, author, since, before)
      @dir = dir
      @exclude = exclude
      @author = author
      @since = since
      @before = before
    end

    def hits
      version = `git --version`.split(/ /)[2]
      raise "git version #{version} is too old, upgrade it to 2.0+" unless
        Gem::Version.new(version) >= Gem::Version.new('2.0')
      cmd = [
        "cd #{@dir} && git",
        'log', '--pretty=tformat:', '--numstat',
        '--ignore-space-change', '--ignore-all-space',
        '--ignore-submodules', '--no-color',
        '--find-copies-harder', '-M', '--diff-filter=ACDM',
        "'--author=#{@author}'",
        "'--since=#{@since}'",
        "'--before=#{@before}'",
        '--', '.',
        @exclude.map { |e| "':(exclude,glob)#{e}'" }.join(' ')
      ].join(' ')
      [
        Hits.new(
          Time.now,
          `#{cmd}`.split(/\n/).delete_if(&:empty?).map do |t|
            t.split(/\t/).take(2).map(&:to_i).inject(:+)
          end.inject(:+) || 0
        )
      ]
    end
  end
end
