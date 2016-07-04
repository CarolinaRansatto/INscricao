module SessoesHelper
  # faz login do admin
  def login(admin)
    session[:admin_id] = admin.id
  end
    
  def logout
    session.delete(:admin_id)
    @admin_atual = nil
  end
  
  # retorna o admin logado se houver um
  def admin_atual
    @admin_atual ||= Admin.find_by(id: session[:admin_id])
  end
  
  #retorna true se houver um admin logado
  def logado?
    !admin_atual.nil?
  end
  
end
