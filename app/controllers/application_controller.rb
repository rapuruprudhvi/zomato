class ApplicationController < ActionController::Base
    before_action :set_lan

    def set_lan
        I18n.locale = :en
    end
end
