class CreateSchoolTeachers < ActiveRecord::Migration
  def change
    create_table :school_teachers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
