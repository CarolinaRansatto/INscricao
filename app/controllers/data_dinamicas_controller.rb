class DataDinamicasController < ApplicationController
	before_action :exigir_login

	def index
		@datas = DataDinamica.all
	end
	
	def edit
	end
	
	def update
		@data = DataDinamica.find(params[:id])
		if !@data.update_attributes(data_dinamica_params)
			flash[:danger] = 'Data inválida'
		end
		redirect_to data_dinamicas_path
	end
	
	private

  	def data_dinamica_params
  		params.require(:data_dinamica).permit(:data)
  	end
  	
end
