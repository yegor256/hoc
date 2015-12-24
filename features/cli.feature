Feature: Command Line Processing
  As a source code writer I want to be able to
  calculate my hits-of-code metric

  Scenario: Help can be printed
    When I run bin/hoc with "-h"
    Then Exit code is zero
    And Stdout contains "--format"

  Scenario: Simple git repo
    Given It is Unix
    Given I run bash:
      """
      git init .
      git config user.email test@teamed.io
      git config user.name test
      echo 'hello, world!' > test.txt
      git add test.txt
      git commit -am test
      """
    Then Exit code is zero
    When I run bin/hoc with "-f int"
    Then Exit code is zero
    And Stdout contains "1"

  Scenario: Real git repo
    Given It is Unix
    Given I run bash:
      """
      rm -rf *
      git clone https://github.com/teamed/hoc.git .
      """
    Then Exit code is zero
    When I run bin/hoc with "-f int"
    Then Exit code is zero

  Scenario: Real git repo in Windows
    Given It is Windows
    Given I run bash:
      """
      del /q *.*
      git clone https://github.com/teamed/hoc.git .
      """
    Then Exit code is zero
    And Stdout contains "yyyy"
    When I run bin/hoc with "-f int"
    Then Exit code is zero
