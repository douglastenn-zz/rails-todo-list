class TasksController < ApplicationController
  before_filter :authorize
  before_action :find_task, only: [:edit, :update, :show, :delete]

  # Index que renderiza todas as tasks.
  def index
    @tasks = Task.all
  end

  # Action para salvar tarefa no database
  def create
    @task = Task.new(task_params)
    if @task.save
      # Task criada com sucesso
      redirect_to task_path(@task)
    else
      # Erro ao criar task
      render :new
    end
  end

  # Update action updates the task with the new information
  def update
    if @task.update_attributes(task_params)
      # Task atualizada com sucesso
      redirect_to task_path(@tasks)
    else
      # Erro ao atualizar task
      render :edit
    end
  end

  # Remove uma task do database
  def destroy
    if @task.destroy
      # Task deletada com sucesso
      redirect_to tasks_path
    else
      # Remove ao deletar task
    end
  end

  private

  # Definição e validação dos parametros
  def task_params
    params.require(:task).permit(:title, :body)
  end

  # Busca por id da task
  def find_task
    @task = Task.find(params[:id])
  end
end
