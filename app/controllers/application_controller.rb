class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"
# Get all users
  get "/users" do
    users = User.all
    users.to_json
  end
# Get user by id
  get "/users/:id" do
    user = User.find(params[:id])
    user.to_json
  end
# Add new user
  post "/users" do
    user = User.new(params[:user])
    if user.save
      user.to_json
    else
      { errors: user.errors.full_messages }.to_json
    end
  end
# Update user by id
  patch "/users/:id" do
    user = User.find(params[:id])
    if user && user.update(params[:user])
      user.to_json
    else
      { errors: user.errors.full_messages }.to_json
    end
  end
# Delete user by id
  delete "/users/:id" do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end
# Get all tasks by order
  get "/tasks" do
    tasks = Task.all.order(:category_id)
    tasks.to_json
  end
# Get task by id
  get "/tasks/:id" do
    task = Task.find(params[:id])
    task.to_json
  end
# Add new task
  post "/tasks" do
    task = Task.new(params[:task])
    if task.save
      task.to_json
    else
      { errors: task.errors.full_messages }.to_json
    end
  end
# Update task by id
  patch "/tasks/:id" do
    task = Task.find(params[:id])
    if task && task.update(params[:task])
      task.to_json
    else
      { errors: task.errors.full_messages }.to_json
    end
  end
# Delete task by id
  delete "/tasks/:id" do
    task = Task.find(params[:id])
    task.destroy
    task.to_json
  end
# Get all categories
  get "/categories" do
    categories = Category.all
    categories.to_json
  end
# Get category by id
  get "/categories/:id" do
    category = Category.find(params[:id])
    category.to_json
  end
# Update category by id
  patch "/categories/:id" do
    category = Category.find(params[:id])
    if category.update(params[:category])
      category.to_json
    else
      { errors: CategoriesController.errors.full_messages }
    end
  end
end
