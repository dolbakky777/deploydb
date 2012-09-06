class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :name, null: false  #インスタンス名
      t.date :deploy_date, null: false  #デプロイ日
      t.string :commit_hash, null: false  #コミットhash
      t.string :remarks  #備考
      t.timestamps
    end
  end
end
