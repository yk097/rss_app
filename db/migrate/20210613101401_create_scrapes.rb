class CreateScrapes < ActiveRecord::Migration[6.0]
  def change
    create_table :scrapes do |t|

      t.timestamps
    end
  end
end
