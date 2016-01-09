# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
articles = [{:title => 'aabbccdd', :path => 'www.baidu.com', :keyword =>'computer',:publication => 'young',:field => 'computer',:author =>'yuan'},
  	 ]

articles.each do |article|
  Article.create!(article)
end

questions = [{:title => 'When will I finish my project?', :content => 'asdfljaskdlfjklasjfjaslfdl', :questionuser =>'yuan',:article_id => '2',:field => 'software',:filepath=>'www.baidu.com',:liker =>'liu',:state=>'0'},
  	         {:title => 'When will I finish my final?', :content => 'asdfljaasjfjaslfdl123133', :questionuser =>'gap',:article_id => '3',:field => 'hardware',:filepath=>'www.google.com',:liker =>'zhang',:state=>'0'}   
  	 ]
  	 
questions.each do |question|
  Question.create!(question)
end

answers = [{:question_id => '1', :level => '2', :title =>'yuan',:content => 'wo cai zai 10 hao zhi qian ni jiu neng zuo wan',:answeruser => 'liu',:filepath=>'www.baidu.com',:liker =>'yuan'},
  	         {:question_id => '1', :level => '3', :title =>'yuan',:content => 'wo cai zai 16 hao zhi hou ni ya ye zuo bu wan',:answeruser => 'gao',:filepath=>'www.baidu.com',:liker =>'chen'},
  	         {:question_id => '3', :level => '2', :title =>'yuan',:content => 'wo cai zai 22 hao zhi hou ni jiu neng kao wan',:answeruser => 'liu',:filepath=>'www.google.com',:liker =>'wang'}
  	         ]

answers.each do |answer|
  Answer.create!(answer)
end