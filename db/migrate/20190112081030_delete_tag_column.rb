class DeleteTagColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :tags, :string
  end
end
