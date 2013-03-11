Given /^there are the following users:$/ do |users|
  users.hashes.each do |u|
    FactoryGirl.create(:user, name: u[:name])
  end
end

Given /^there are the following articles with comments:$/ do |articles|
  articles.hashes.each do |a|
    author = User.find_by_name a[:author]
    article = FactoryGirl.create(:article, title: a[:title], user: author, body: a[:content])
    FactoryGirl.create(:comment, article: article, body: a[:comment])
  end
end

Given /^I merge it with "(.*?)"$/ do |title|
  id = Article.find_by_title(title)
  fill_in("merge_with", with: id)
  click_button('Merge')
end
