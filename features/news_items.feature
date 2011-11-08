Feature: Manage News
  In order to make a blog
  As an author
  I want to create and manage news

  Scenario: Add new news
    Given I have empty list of news_items
    And I am a new, authenticated admin
    And I have category with title "Cat 1" with topics:
    |Topic 1|
    |Topic 2|
    And I go to the new news_item page
    When I fill in the following:
     | news_item_title          | Some                                              |
     | news_item_body           | apfsdgjeflasdlsgmsds;g,lds';fslfgmsdlf;a,fmoew[df |
    And I select "Topic 1" from "news_item_topic_id"
    And I press "Save"
    Then I should have 1 news_item
    And I should be on the admin list of news_items
#    And show me the page

  Scenario: Delete news
    Given I have news_item with title "Some1" and body "Some body1"
    And I am a new, authenticated admin
    When I go to the admin list of news_items
    And I follow "Delete"
    Then I should have 0 news_items
    And I should see "Object deleted"

  Scenario: Edit news
    Given I have news_item with title "Some1" and body "Some body1"
    And I am a new, authenticated admin
    When I go to the admin list of news_items
    And I follow "Edit"
    And I fill in "Title" with "WER234"
    And I press "Save"
    Then I should be on the admin list of news_items
    And I should see "WER234"
    And I should see "Object updated"



  Scenario: News List
    Given I have news_item with title "Some" and body "Some body"
    And I have news_item with title "SomeElse" and body "SomeElse"
    When I go to the list of news_items
    Then I should see "Some"
    And I should see "SomeElse"

  Scenario: Rate news
    Given I have category with title "Some category" with topics:
    |topic 1|
    |topic 2|
    And I have topic with title "topic 1" witch contain news:
    |news 1| body 1|
    |news 2| body 2|
    And I am a new, authenticated user
    And I am on the list of news_items
    When I follow "news 1"
    Then I should see "body 1"
    When I follow "star_3"
    And I wait for 2 seconds
    Then "star_3" should have class "check_ruby"
