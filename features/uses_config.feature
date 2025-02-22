# (The MIT License)
#
# SPDX-FileCopyrightText: Copyright (c) 2014-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT
Feature: Using .hoc config file
  As a source code writer I want to be able to
  call HOC as a command line tool and configure
  it via .hoc configuration file

  Scenario: Simple hoc counting
    Given It is Unix
    Given I run bash:
      """
      echo '--help' > .hoc
      """
    When I run bin/hoc with "-f int"
    Then Exit code is zero
    And Stdout contains "[options]"
