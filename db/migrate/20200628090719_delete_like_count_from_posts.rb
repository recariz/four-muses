class DeleteLikeCountFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :like_count
  end
end
