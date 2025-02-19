# SPDX-FileCopyrightText: Copyright (c) 2014-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

module HOC
  # Set of hits.
  class Hits
    def initialize(date, total)
      @date = date
      @total = total
    end
    attr_reader :date, :total
  end
end
