class AddOwnerToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :owner, :string
  end
end
