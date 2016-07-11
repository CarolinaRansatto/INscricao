class DataDinamicasController < ApplicationController
	before_action :exigir_login
	
	def create
		@data = DataDinamica.new(data_dinamica_params)
		if !@data.save
			flash[:danger] = 'Data inválida'
		end
		redirect_to ps_config_url
	end
	
	def update
		@data = DataDinamica.find(params[:id])
		if !@data.update_attributes(data_dinamica_params)
			flash[:danger] = 'Data inválida'
		end
		redirect_to ps_config_url
	end
	
	def destroy
		DataDinamica.find(params[:id]).destroy
    flash[:success] = 'Data removida'
    redirect_to ps_config_url
	end
	
	
	private

	  	def data_dinamica_params
	  		params.require(:data_dinamica).permit(:data)
	  	end
  	
end
