# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

include AuthenticatedSystem

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
	session :session_key => '_authenticator_session_id'

	private

	def load_league
		@current_league = League.find_by_leaguesubdomain(current_subdomain)
		if @current_league.nil?
			flash[:error] = "No es una liga valida"
			redirect_to root_url
		end
	end

end
