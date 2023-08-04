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
    formatted_result = formatted_search_hash(search_result).to_h

    # if the query has a sender and a date range then we add on what else they sent during that time
    if sender && start_date && end_date
      formatted_result["related_results"] = related_search
    end

    formatted_result
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

  def formatted_search_hash(search_result)
    search_result.hits.map do | result |
      formatted_match = result.highlights.map { |highlight| highlight.format { |word| "**#{word}**"}}.join(", ")
      [result.primary_key, formatted_match]
    end
  end

  def related_search
    Message.where(sender: sender).where(date: start_date..end_date)
  end
end
