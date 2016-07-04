class SessoesController < ApplicationController
  
  def new
  end
  
  def create
    admin = Admin.find_by(email: params[:sessao][:email])
    if admin && admin.authenticate(params[:sessao][:password])
      login admin
      redirect_to data_dinamicas_url
    else
      flash.now[:danger] = 'Email e/ou senha inválidos'
      render 'new'
    end
  end
  
  def destroy
    logout if logado?
    redirect_to new_candidato_url
  end
end