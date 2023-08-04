# frozen_string_literal: true
FactoryBot.define do
  factory :message do
    sender {"guy@enron.com"}
    subject {"Test email about some fraud"}
    body {"Oh, how awful. Did he at least die painlessly? …To shreds, you say. Well, how is his wife holding up? …To shreds, you say."}
  end

  factory :recipientinfo do

  end
end
