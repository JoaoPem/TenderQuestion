module SiteHelper
    def msg_jumbotron
      case params[:action]
      when 'index'
        "Últimas Perguntas Cadastradas..."
      when 'questions'       
        "Resultados para o termo \"#{sanitize params[:term]}\"..."
      when 'subject'
        "Mostrando questões para o assunto \"#{sanitize params[:subject]}\"..."
      else
        "Mensagem padrão para ação desconhecida"
      end
    end
end
