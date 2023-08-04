class Message < ApplicationRecord
  self.primary_key = 'mid'
  has_many :recepientinfos, class_name: 'Recipientinfo', foreign_key: 'mid'

  searchable do
    # subject and body are searchable fields and can have matches extracted from them
    text :subject, :stored => true
    text :body, :stored => true

    # allow sender to be used to scope a query
    string :sender
    # allow date to be used in a search range
    time :date, :trie => true
  end
end
