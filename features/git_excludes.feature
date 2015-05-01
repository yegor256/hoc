Feature: Exclude dirs from Git counting
  As a source code writer I want to be able to
  exclude certain files from counting

  Scenario: Simple git repo
    Given I run bash:
    """
    set -e
    git init .
    git config user.email test@teamed.io
    git config user.name test
    mkdir x
    echo 'hello, world!' > x/invalid.txt
    echo 'hello, world!' > valid.txt
    git add .
    git commit -am test
    """
    When I run bin/hoc with "-e x/** -e a.txt"
    Then Exit code is zero
    And Stdout contains "1"

