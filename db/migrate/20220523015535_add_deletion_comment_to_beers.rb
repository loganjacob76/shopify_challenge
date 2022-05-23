class AddDeletionCommentToBeers < ActiveRecord::Migration[5.2]
  def change
    add_column :beers, :deletion_comment, :text
  end
end
