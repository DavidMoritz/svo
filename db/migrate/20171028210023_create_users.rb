class CreateUsers < ActiveRecord::Migration[5.1]
	def change
		create_table :users do |t|
		 # no need for Employee ID column specified
			t.string "first_name", :limit => 25
			t.string "last_name", :limit => 50
			t.string "email", :default => '', :null => false, :limit => 100
			# for gem bcrypt
			t.string "password_digest"

			# t.datetime "created_at"
			# t.datetime "updated_at"
			# handled by t.timestamps
			t.timestamps
		end
	end
end
