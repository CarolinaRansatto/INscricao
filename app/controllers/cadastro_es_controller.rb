class CadastroEsController < ApplicationController
  def new
    @cadastro_e = CadastroE.new
  end

  def success
  end

  def index
     @cadastro_e = CadastroE.all
  end

  def edit
  end
end
