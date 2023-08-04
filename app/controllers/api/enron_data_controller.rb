class Api::EnronDataController < ApplicationController
  def search
    # Calling a service to avoid bloat in the controller
    search_results = MessageSearchService.new(params).call
    render json: search_results
  end
end
