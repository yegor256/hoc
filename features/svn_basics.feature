Feature: SVN Repo Processing
  As a source code writer I want to be able to
  calculate my hits-of-code metric

  Scenario: Simple SVN repo
    Given It is Unix
    Given I run bash:
      """
        svnadmin create base
        svn co file://$(pwd)/base repo
        cd repo
        echo 'Hello, world!' > test.txt
        svn add test.txt
        svn ci -m 'first commit'
        echo 'Bye!' > test.txt
        svn ci -m 'second commit'
        svn rm test.txt
        svn ci -m 'third commit'
        svn up
      """
    When I run bin/hoc with "-f int -d repo"
    Then Exit code is zero

  Scenario: Real SVN repo
    Given I run bash:
      """
      svn co --non-interactive http://svn.apache.org/repos/asf/httpd/mod_ftp/tags/0.9.6
      """
    When I run bin/hoc with "-f int -d 0.9.6"
    Then Exit code is zero

