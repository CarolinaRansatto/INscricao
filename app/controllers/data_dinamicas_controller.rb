class DataDinamicasController < ApplicationController
	before_action :exigir_login

	def index
		@datas = DataDinamica.all
	end
end
