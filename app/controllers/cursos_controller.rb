class CursosController < ApplicationController
	before_action :exigir_login
	
	def create
		@curso = Curso.new(curso_dinamica_params)
		if !@curso.save
			flash[:danger] = 'Nome inválido'
		end
		redirect_to ps_config_url
	end
	
	def update
		@curso = Curso.find(params[:id])
		if !@curso.update_attributes(curso_dinamica_params)
			flash[:danger] = 'Nome inválido'
		end
		redirect_to ps_config_url
	end
	
	def destroy
		Curso.find(params[:id]).destroy
    flash[:success] = 'Curso removido'
    redirect_to ps_config_url
	end
	
	
	private

	  	def curso_dinamica_params
	  		params.require(:curso).permit(:nome)
	  	end
  	
end
