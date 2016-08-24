class TasksController < ApplicationController
  before_filter :authorize
  before_action :find_task, only: [:update, :complete, :destroy]

  # Index que renderiza todas as tasks do usuário logado.
  def index
    @tasks = Task.where(user_id: session[:user_id])
                 .order(created_at: :desc)
  end

  # Action para salvar tarefa no database
  def create
    @task = Task.new(task_params)
    if @task.save
      # Task criada com sucesso
      render :json => @task
    else
      # Erro ao criar task
       render :json => { :errors => @task.errors.full_messages }, :status => 422
    end
  end

  # Update action updates the task with the new information
  def update
    if @task.update_attributes(task_params)
      # Task atualizada com sucesso
      render :json => @task
    else
      # Erro ao atualizar task
      render :json => { :errors => @task.errors.full_messages }, :status => 422
    end
  end

  # Marcar como task completada
  def complete
    if @task.update_attributes(status: 1)
      # Task atualizada com sucesso
      @current_user = current_user

      quotes = ['Tenho em mim todos os sonhos do mundo.',
        'Tudo vale a pena quando a alma não é pequena.',
        'Um bom poeta pode fazer uma alma despedaçada voar.',
        'Para se ser feliz até um certo ponto é preciso ter-se sofrido até esse mesmo ponto.',
        'O resultado do pensamento não tem de ser o sentimento mas a atividade.']

      colors = ['#9888A5','#C97C5D','#413C58', '#BFD7B5', '#A6979C']

      @info = { quote: quotes.shuffle.sample, color: colors.shuffle.sample }

      TaskComplete.send_congratulations(@current_user, @info).deliver_now
      render :json => @task
    else
      # Erro ao atualizar task
      render :json => { :errors => @task.errors.full_messages }, :status => 422
    end
  end


  # Remove uma task do database
  def destroy
    if @task.destroy
      # Task deletada com sucesso
      render :json => @task
    else
      render :json => { :errors => @task.errors.full_messages }, :status => 422
    end
  end

  private

  # Definição e validação dos parametros
  def task_params
    params.require(:task)
          .permit(:title, :description)
          .merge({
            status: 0,
            user_id: session[:user_id]
          })
  end

  # Busca por id da task
  def find_task
    @task = Task.find(params[:id])
  end
end
