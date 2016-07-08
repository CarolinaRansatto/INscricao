class CandidatosController < ApplicationController
  before_action :exigir_login, only: [:index]

  def index
    @candidatos = Candidato.all
  end

  def new
  	@candidato = Candidato.new
  end

  def create
  	@candidato = Candidato.new(candidato_params)
  	if @candidato.save
  		CandidatoMailer.editar_inscricao(@candidato).deliver_now
  		redirect_to success_url(id: @candidato.id, token: @candidato.edit_token)
  	else
  		render 'new'
  	end
  end

  def edit
  	@candidato = Candidato.find(params[:id])
    if params[:token] != nil
      session[:edit_token] = params[:token]
    end
  	if !@candidato || !@candidato.autorizado?(session[:edit_token])
  		redirect_to new_candidato_url
    end
  end

  def update
  	@candidato = Candidato.find(params[:id])
  	email = @candidato.email

  	if @candidato.update_attributes(candidato_params)
  		if email != params[:email]
        @candidato.edit_token = session[:edit_token]
  			CandidatoMailer.editar_inscricao(@candidato).deliver_now
  		end
  		redirect_to success_url(id: params[:id], token: session[:edit_token])
	  else
	  	render 'edit'
	  end
	end

  def success
  end


  private

  	def candidato_params
  		params.require(:candidato).permit(:nome, :email, :cpf, :matricula, 
  			:periodo, :curso_id, :data_dinamica_id, :edit_token)
  	end

end
