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

require 'hoc/git'
require 'hoc/svn'

# HOC main module.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2014-2025 Yegor Bugayenko
# License:: MIT
module HOC
  # Code base abstraction
  class Base
    # Ctor.
    # +opts+:: Options
    def initialize(opts)
      @dir = opts[:dir]
      @exclude = opts[:exclude] || []
      @author = opts[:author] || ''
      @format = opts[:format] || 'int'
      @since = opts[:since] || '2000-01-01'
      @before = opts[:before] || Time.now.strftime('%Y-%m-%d')
    end

    # Generate report.
    def report
      repo = nil
      if File.exist?(File.join(@dir, '.git'))
        repo = Git.new(@dir, @exclude, @author, @since, @before)
      elsif File.exist?(File.join(@dir, '.svn'))
        repo = Svn.new(@dir)
      else
        raise 'Only Git repositories supported now'
      end
      count = repo.hits.map(&:total).inject(:+)
      case @format
      when 'xml'
        "<hoc><total>#{count}</total></hoc>"
      when 'json'
        "{\"total\":#{count}}"
      when 'text'
        "Total Hits-of-Code: #{count}"
      when 'int'
        count
      else
        raise 'Only "text|xml|json|int" formats are supported now'
      end
    end
  end
end
