class TaskComplete < ApplicationMailer
  default :from => 'contact@railstodolist.com'

  def send_congratulations(user, info)
    @info = info
    @user = user
    mail( :to => @user.email,
    :subject => '[RailsTodoList] - Parabéns' )
  end
end
