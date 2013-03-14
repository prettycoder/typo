require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "spec", "factories"))

Given /^there are the following users:$/ do |users|
  users.hashes.each do |u|
    Factory(:user, name: u[:name])
  end
end

Given /^there are the following articles with comments:$/ do |articles|
  articles.hashes.each do |a|
    author = User.find_by_name a[:author]
    article = Factory(:article, title: a[:title], user: author, body: a[:content])
    Factory(:comment, article: article, body: a[:comment])
  end
end

Given /^I merge it with "(.*?)"$/ do |title|
  id = Article.find_by_title(title).id
  fill_in("merge_with", with: id)
  click_button('Merge')
end
