class CandidatosController < ApplicationController
  def new
  	@candidato = Candidato.new
  end
end
