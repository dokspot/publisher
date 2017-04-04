Feature: Validate methods exist

  Scenario: publishable! class methods
    Then I expect Article class to respond to "draft"
    Then I expect Article class to respond to "rejected"
    Then I expect Article class to respond to "pending"
    Then I expect Article class to respond to "reviewed"
    Then I expect Article class to respond to "publishable"
    Then I expect Article class to respond to "published"
    Then I expect Article class to respond to "retired"

  Scenario: publishable! instance methods
    Then I expect Article instance to respond to "draft?"
    Then I expect Article instance to respond to "rejected?"
    Then I expect Article instance to respond to "pending?"
    Then I expect Article instance to respond to "reviewed?"
    Then I expect Article instance to respond to "status"
    Then I expect Article instance to respond to "status?"
    Then I expect Article instance to respond to "review!"
    Then I expect Article instance to respond to "cancel!"
    Then I expect Article instance to respond to "publishable?"
    Then I expect Article instance to respond to "published?"
    Then I expect Article instance to respond to "retired?"
    Then I expect Article instance to respond to "versionable?"
    Then I expect Article instance to respond to "version_exists?"
    Then I expect Article instance to respond to "previous_version"
    Then I expect Article instance to respond to "next_version"
    Then I expect Article instance to respond to "create_version"
    Then I expect Article instance to respond to "publish!"
    Then I expect Article instance to respond to "retire!"