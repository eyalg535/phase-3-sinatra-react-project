class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  get '/' do
    "Hello, world!"
  end
  
  get '/users' do
    users = User.all
    users.to_json
  end

  get '/users/:id' do
    user = User.find(params[:id])
    user.to_json
  end

  post '/users' do 
    user = User.new(params[:user])
    if user.save
      user.to_json
    else
      { errors: user.errors.full_messages }.to_json
    end
  end

  patch '/users/:id' do
    user = User.find(params[:id])
    if user && user.update(params[:user])
      user.to_json
    else
      { errors: user.errors.full_messages }.to_json
    end
  end

  delete '/users/:id' do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end

  get '/tasks' do
    tasks = Task.all
    tasks.to_json
  end

  get '/tasks/:id' do
    task = Task.find(params[:id])
    task.to_json
  end

  post '/tasks' do
    task = Task.new(params[:task])
    if task.save
      task.to_json
    else
      { errors: task.errors.full_messages }.to_json
    end
  end

  patch '/tasks/:id' do
    task = Task.find(params[:id])
    if task && task.update(params[:task])
      task.to_json
    else
      { errors: task.errors.full_messages }.to_json
    end
  end

  delete '/tasks/:id' do
    task = Task.find(params[:id])
    task.destroy
    task.to_json
  end

  get '/categories' do
    categories = Category.all
    categories.to_json
  end

  get '/categories/:id' do
    category = Category.find(params[:id])
    category.to_json
  end

  patch '/categories/:id' do
    category = Category.find(params[:id])
    if category.update(params[:category])
    category.to_json
    else
      { errors: CategoriesController.errors.full_messages }
    end
  end
end
