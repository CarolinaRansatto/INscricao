class DataDinamicasController < ApplicationController
	def index
		@datas = DataDinamica.all
	end
end
