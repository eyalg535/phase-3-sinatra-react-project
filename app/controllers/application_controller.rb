class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"
  
  # Get all tasks by order
  get "/tasks" do
    tasks = Task.includes(:category).all.order(:id)
    tasks.to_json(include: { category: { only: :name }})
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
    categories = Category.all.includes(:tasks)
    categories.to_json(include: :tasks)
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
      { errors: category.errors.full_messages }
    end
  end
end
