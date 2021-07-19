class CreateStrategies < ActiveRecord::Migration[5.2]
  def change
    create_table :strategies do |t|
      t.string :title, null: false, comment: 'その時間術のタイトル'
      t.text :detail, comment: 'その時間術の詳しい説明'

      t.timestamps
    end
  end
end
