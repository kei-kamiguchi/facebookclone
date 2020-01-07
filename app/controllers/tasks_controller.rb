class TasksController < ApplicationController

  def index
    @tasks=Task.all
  end

  def new
    @task=Task.new
  end

  def create
    @task=Task.new(task_params)

    if params[:back].present?
      render 'new'
      return
    end

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

    if @task.update(task_params)
      redirect_to tasks_path, notice: "投稿しました"
    else
      render 'edit'
    end
  end

  def confirm
    @task=Task.new(task_params)
  end

  def destroy
    @task=Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: '削除しました'
  end

  private

  def task_params
    params.require(:task).permit(:content, :image)
  end
end
