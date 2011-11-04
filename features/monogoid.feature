Feature: Manage News
  In order to make a blog
  As an author
  I want to create and manage news

  Scenario: News List
    Given I have news_item with title Some and body Some body
    And I have news_item with title SomeElse and body SomeElse body
    When I go to the list of news_items
    Then I should see "Some"
    And I should see "SomeElse"

#  Scenario: Create Valid Article
#    Given I have no articles
#    And I am on the list of articles
#    When I follow "New Article"
#    And I fill in "Title" with "Spuds"
#    And I fill in "Content" with "Delicious potato wedges!"
#    And I press "Create"
#    Then I should see "New article created."
#    And I should see "Spuds"
#    And I should see "Delicious potato wedges!"
#    And I should have 1 article