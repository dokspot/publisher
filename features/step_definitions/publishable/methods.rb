Then(/^I expect Article class to respond to "([^"]*)"$/) do |method|
  expect(Article).to respond_to(method.to_sym)
end

Then(/^I expect Article instance to respond to "([^"]*)"$/) do |method|
  expect(Article.new).to respond_to(method.to_sym)
end

Given(/^(\d+) articles with the status "([^"]*)"$/) do |n, status|
  n.to_i.times {
    send("create_p_#{status}")
    expect(@article.send("#{status}?")).to be_truthy
  }
end

Then(/^I expect (\d+) Article "([^"]*)"$/) do |n, status|
  expect(Article.send(status).count).to eq(n.to_i)
end

Then(/^I expect the article status to be "([^"]*)"$/) do |status|
  expect(@article.status).to eq(status.to_sym)
  expect(@article.status?(status.to_sym)).to be_truthy
  expect(@article.send("#{status}?".to_sym)).to be_truthy
end

Then(/^I expect the article status not to be "([^"]*)"$/) do |status|
  expect(@article.send("#{status}?".to_sym)).to be_falsy
end

When(/^I "([^"]*)" the article$/) do |action|
  @article.send(action.to_sym)
end
