class CreateWritings < ActiveRecord::Migration
  def change
    create_table :writings do |t|
      t.references :project, index: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
