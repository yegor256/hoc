# SPDX-FileCopyrightText: Copyright (c) 2014-2026 Yegor Bugayenko
# SPDX-License-Identifier: MIT
Feature: Exclude dirs from Git counting
  As a source code writer I want to be able to
  exclude certain files from counting

  Scenario: Simple git repo
    Given It is Unix
    Given I run bash:
      """
      git init --quiet .
      git config user.email test@zerocracy.com
      git config user.name test
      mkdir x
      echo 'hello, world!' > x/invalid.txt
      echo 'hello, world!' > valid.txt
      git add .
      git commit -qam test
      """
    When I run bin/hoc with "-e x/** -e a.txt"
    Then Exit code is zero
    And Stdout contains "1"
