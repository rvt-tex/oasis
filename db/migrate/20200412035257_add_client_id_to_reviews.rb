class AddClientIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :client_id, :integer
  end
end
