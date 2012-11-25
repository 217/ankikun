class ApplicationController < ActionController::Base
# Omniauthでのログイン状況確認
private
    def current_omniuser
        @current_omniuser ||= Omniuser.find(session[:user_id]) if session[:user_id]
    end

  # http://d.hatena.ne.jp/Climber/20100527/1274942772
  # 例外とステータスの関連付け
  rescue_responses.update({
    'Foo::BarError' => :not_found
  })
protected
  # 確認をhttp://localhost 等で確認するときはコメントアウト
  # が定石
  #def local_request?
  #  false
  #end

  def rescue_action_in_public(exception) #:doc:
    status_message_sym = response_code_for_rescue(exception) || :internal_server_error
    @http_status_code = SYMBOL_TO_STATUS_CODE[status_message_sym]
    
    respond_to do |format|
      format.html { render :template => "commons/error.html", :layout => 'application', :status => @http_status_code }
    end
  end
public
  protect_from_forgery

  helper_method :current_omniuser
end
