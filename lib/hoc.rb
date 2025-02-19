# SPDX-FileCopyrightText: Copyright (c) 2014-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

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
