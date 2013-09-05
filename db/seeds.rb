# p system('rails runner script/default_info.rb')
# ScotusCase.destroy_all
# p system('rails runner script/add_cases_to_db.rb ../US')
p system('rails runner script/clean_cases_db.rb')