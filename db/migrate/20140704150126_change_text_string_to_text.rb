class ChangeTextStringToText < ActiveRecord::Migration
  def change
    change_column :reviews, :text, :text
  end
end
