Feature: Merge Articles
  As a blog administrator
  In order to better organize similar content
  I want to be able to merge articles

  Background:
    Given the blog is set up

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged into the admin panel
    And there are the following users:
      | name        |
      | Mark First  |
      | Susy Second |
    And there are the following articles with comments:
      | title       | author      | content                           | comment                |
      | Article One | Mark First  | This is the first article         | I like it              |
      | Article Two | Susy Second | Here is more about the same topic | I am totally convinced |
    And I go to the edit article "Article One" page

    When I merge it with "Article Two"
    Then the content should include "This is the first article"
    And the content should include "Here is more about the same topic"
    And the author should be "Mark First"
    And the comments should include "I like it"
    And the comments should include "I am totally convinced"

    When I am on the articles page
    Then I should see "Article One"
    And I should not see "Article Two"

  Scenario: A non-admin cannot merge two articles
    Given I am logged in as a non-admin user
    And there is an article with the title "Yesterday's News" belonging to me
    And I am on the edit page of the article "Yesterday's News"
    Then I should not be able to merge it with another article
