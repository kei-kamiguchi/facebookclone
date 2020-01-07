class TasksController < ApplicationController
  
  def index
    @task=Task.all
  end

  def new
    @task=Task.new
  end

  def create
    @task=Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: "投稿しました"
    else
      render 'new'
    end
  end

  def show
    @task=Task.find(params[:id])
  end

  def edit
    @task=Task.find(params[:id])
  end

  def update
    @task=Task.find(params[:id])

    if @task.update
      redirect_to tasks_path, notice: "投稿しました"
    else
      render 'edit'
    end
  end

  def confirm
    @task=Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:content, :image)
  end
end
