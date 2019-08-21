require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/index' do
  erb(:index)
end

# show
get '/students' do
  @students = Student.all()
  erb(:show)
end

# new
get '/students/new' do
  erb(:new)
end

# create

# edit

# update

# destroy
