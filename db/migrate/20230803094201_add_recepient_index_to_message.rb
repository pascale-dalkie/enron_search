class AddRecepientIndexToMessage < ActiveRecord::Migration[7.0]
  def change
    add_index :recipientinfos, :mid
  end
end
