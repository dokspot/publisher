# Feature: Validate statuses work
#
#   Scenario: Reviewable.status
#     Given 1 articles with the status "draft"
#     And 2 articles with the status "rejected"
#     And 3 articles with the status "pending"
#     And 4 articles with the status "reviewed"
#     Then I expect 1 Article "draft"
#     Then I expect 2 Article "rejected"
#     Then I expect 3 Article "pending"
#     Then I expect 4 Article "reviewed"
#
#   Scenario Outline: Reviewable - statuses
#     Given 1 articles with the status <s1>
#     Then I expect the article status to be <s1>
#     And I expect the article status not to be <s2>
#     And I expect the article status not to be <s3>
#     And I expect the article status not to be <s4>
#
#     Examples:
#       | s1          | s2          | s3          | s4          |
#       | "draft"     | "rejected"  | "pending"   | "reviewed"  |
#       | "rejected"  | "pending"   | "reviewed"  | "draft"     |
#       | "pending"   | "reviewed"  | "draft"     | "rejected"  |
#       | "reviewed"  | "draft"     | "rejected"  | "pending"   |
