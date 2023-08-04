# frozen_string_literal: true

class MessageSearchService

  def initialize(params)
    @params = params
  end

  def call
    search_result = Message.search do
      fulltext search_text do
        highlight :body, :subject
      end
      with(:sender, sender) unless sender.nil?
      with(:date, start_date..end_date) unless start_date.nil? || end_date.nil?
    end

    #  Create a hash with the message ID as the key and the matched snippets as the value
    formatted_result = search_result.hits.map do | result |
      formatted_match = result.highlights.map { |highlight| highlight.format { |word| "**#{word}**"}}.join(", ")
      [result.primary_key, formatted_match]
    end

    # return in hash form
    formatted_result.to_h
  end

  private

  def search_text
    @search_text ||= @params["search_text"]
  end

  def sender
    @sender ||= @params["sender"]
  end

  def start_date
    @start_date ||= @params["start_date"].to_datetime
  end

  def end_date
    @end_date ||= @params["end_date"].to_datetime
  end
end
