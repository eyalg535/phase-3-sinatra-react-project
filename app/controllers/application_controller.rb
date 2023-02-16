class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/tasks" do
    tasks = Task.all.order(:category_id)
    tasks.to_json
  end

  get "/tasks/:id" do
    task = Task.find(params[:id])
    task.to_json
  end

  post "/tasks" do
    task = Task.new(params[:task])
    if task.save
      task.to_json
    else
      { errors: task.errors.full_messages }.to_json
    end 
  end

end
