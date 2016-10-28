def create_teacher name='tim', email='tim@lo.com', password='password', password_confirmation='password'
  Teacher.create(name: name, email: email, password: password, password_confirmation: password_confirmation)
end

def log_in teacher, password='password'
  visit '/sessions#home'
  fill_in 'email', with: teacher.email
  fill_in 'password', with: password
  click_button 'Login'
end

def create_parent name='min', email='min@lo.com', password='password', password_confirmation='password'
  Parent.create(name: name, email: email, password: password, password_confirmation: password_confirmation)
end

def log_in parent, password='password'
  visit '/sessions#home'
  fill_in 'email', with: parent.email
  fill_in 'password', with: password
  click_button 'Login'
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
