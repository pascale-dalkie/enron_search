class Message < ApplicationRecord
  self.primary_key = 'mid'
  has_many :recepientinfos, class_name: 'Recipientinfo', foreign_key: 'mid'

  searchable do
    text :subject, :body
  end
end
