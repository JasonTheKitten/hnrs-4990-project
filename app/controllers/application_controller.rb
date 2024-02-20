class ApplicationController < ActionController::Base
    def require_trailing_slash
        if !request.original_fullpath.end_with?('/')
            redirect_to request.original_fullpath + '/'
        end
    end
end
