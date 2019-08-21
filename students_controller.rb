require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index - it doesn't seem to do anything new, so we got rid of it
# get '/index' do
#   erb(:index)
# end

# show
get '/students' do
  @students = Student.all()
  erb(:index)
end

# new
get '/students/new' do
  erb(:new)
end

#show individual student
get '/students/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end

# create
post '/students' do
  @student = Student.new(params)
  @student.save
  erb(:create)
end

# edit
get '/students/:id/edit' do
  @student = Student.find(params[:id])
  erb(:edit)
end

# update
post '/students/:id' do
  Student.new(params).update
  erb(:update)
  # redirect to '/students'
end

# destroy
post '/students/:id/delete' do
  student = Student.find(params[:id])
  @expelled_name = student.first_name  + student.last_name
  student.delete()
  erb(:delete)
end
