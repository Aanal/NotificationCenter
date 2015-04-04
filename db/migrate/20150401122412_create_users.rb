class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "Name"
      t.string "Discipline"
      t.string "Specialisation" 
      t.integer "Student_ID"
      t.string "Batch"
      t.string "College"
      t.string "Year_of_Exam"
      t.string "Phone_Number"
      t.string "Stream"
      t.string "Course"
      t.string "City" 
      t.string "Center"
      t.string "Email_Address"
      t.string "GCM_RegID"
      t.boolean "Student", :default => false
      t.boolean "Faculty", :default => false
      t.boolean "CenterAdmin", :default => false
      t.boolean "Redirector", :default => false
      t.boolean "Registered", :default => false
      t.string "Password"
      t.references :messagesend, polymorphic: true, index:true
           

      t.timestamps null: false
    end
  end
end
