class CreateTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :translations do |t|
      t.string :locale
      t.string :key
      t.string :value
      t.text :interpolations
      t.boolean :is_proc, default: false

      t.timestamps
    end
  end
end
