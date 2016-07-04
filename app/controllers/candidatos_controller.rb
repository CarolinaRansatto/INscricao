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
  		redirect_to "/candidatos/success?token=#{@candidato.edit_token}" 
  	else
  		render 'new'
  	end
  end

  def edit
  	@candidato = Candidato.find(params[:id])
  	if !@candidato || !@candidato.autorizado?(params[:token])
  		redirect_to new_candidato_url
  	else
  		@candidato.edit_token = params[:token]
  	end
  end

  def update
  	@candidato = Candidato.find_by(params[:id])
  	email = @candidato.email

  	if @candidato.update_attributes(candidato_params)
  		if email != params[:email]
  			CandidatoMailer.editar_inscricao(@candidato).deliver_now
  		end
  		redirect_to "/candidatos/success?token=#{params[:token]}" 
	  else
	  	redirect_to "/candidatos/#{params[:id]}/edit?token=#{params[:token]}"
	  end
	end

  def success
  end


  private

  	def candidato_params
  		params.require(:candidato).permit(:nome, :email, :cpf, :matricula, 
  			:periodo, :curso_id, :data_dinamica_id)
  	end

end
