class Util::ValidationController < ApplicationController
  respond_to :json

  def validatemrn
    @result = []
    @result << params[:fieldId]<<true<<'Good value'
    respond_with(@result.to_json)
  end
end
