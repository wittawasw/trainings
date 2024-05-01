class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :body
      t.string :summary, limit: 500

      t.timestamps
    end
  end
  # rails generate scaffold courses name:string description:text summary:string{500}
end
