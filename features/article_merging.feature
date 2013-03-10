Feature: Merge Articles
  As a blog administrator
  In order to better organize similar content
  I want to be able to merge articles

  Background:
    Given the blog is set up

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged into the admin panel
    And there is an article with the title "Women's day"
    And there is an article with the title "UNO moto for Women's day"
    And all articles have a comment
    And I am on the edit page of the article "Women's day"
    And I merge it with the article "UNO moto for Women's day"

    Then I should be on the admin content page
    And there should be two articles with the title "Women's day"

    When I read the newer article called "Women's day"
    Then the content should be the combination of the content of the first two articles
    And the author should be the author of the first article
    And the comments should include the comments of the first two articels

  Scenario: A non-admin cannot merge two articles
    Given I am logged in as a non-admin user
    And there is an article with the title "Yesterday's News" belonging to me
    And I am on the edit page of the article "Yesterday's News"
    Then I should not be able to merge it with another article
