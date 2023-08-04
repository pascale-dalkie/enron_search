class Api::EnronDataController < ApplicationController
  def search
    # Search messages using search_text passed in the params
    search_result = Message.search do
      fulltext params["search_text"] do
        highlight :body, :subject
      end
      with(:sender, params["sender"]) unless params["sender"].nil?
    end

    #  Create a hash with the message ID as the key and the matched snippets as the value
    formatted_result = search_result.hits.map do | result |
      formatted_match = result.highlights.map { |highlight| highlight.format { |word| "**#{word}**"}}.join(", ")
      [result.primary_key, formatted_match]
    end

    render json: formatted_result.to_h

  end
end
