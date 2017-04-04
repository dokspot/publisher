# Feature: Validate actions work
#
# Scenario Outline: Reviewable - actions
#   Given 1 articles with the status <s1>
#   When I <s6> the article
#   Then I expect the article status to be <s2>
#   And I expect the article status not to be <s3>
#   And I expect the article status not to be <s4>
#   And I expect the article status not to be <s5>
#
#   Examples:
#     | s1          | s2          | s3          | s4          | s5          | s6        |
#     | "draft"     | "pending"   | "rejected"  | "reviewed"  | "draft"     | "review!" |
#     | "rejected"  | "rejected"  | "pending"   | "reviewed"  | "draft"     | "review!" |
#     | "pending"   | "pending"   | "rejected"  | "reviewed"  | "draft"     | "review!" |
#     | "reviewed"  | "reviewed"  | "pending"   | "rejected"  | "draft"     | "review!" |
#     | "draft"     | "draft"     | "pending"   | "reviewed"  | "rejected"  | "cancel!" |
#     | "rejected"  | "draft"     | "pending"   | "reviewed"  | "rejected"  | "cancel!" |
#     | "pending"   | "draft"     | "pending"   | "reviewed"  | "rejected"  | "cancel!" |
#     | "reviewed"  | "draft"     | "pending"   | "reviewed"  | "rejected"  | "cancel!" |
