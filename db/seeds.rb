# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

roles = Role.create([{:name=>'Administrator'},{:name=>'Patient'}])
User.create([{:username=>'lastcow', :firstname=>'zhijiang', :lastname=>'chen', :password=>'paradise', :email=>'zhijiang@chen.me', :roles=>Role.find_all_by_name('Administrator')}])
Survey.create([{:name=>'BH Works Survey', :desc=>'Survey for BH-Works only'}])
