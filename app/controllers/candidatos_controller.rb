class CandidatosController < ApplicationController

  def new
  	@candidato = Candidato.new
  end

  def create
  	@candidato = Candidato.new(candidato_params)
  	if @candidato.save
  		redirect_to "/candidatos/success"
  	else
  		render 'new'
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
