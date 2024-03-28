class AddRoles < ActiveRecord::Migration[7.1]
  def change
    # Insert default roles
    Role.create!(name: 'admin')
    Role.create!(name: 'guest')
    Role.create!(name: 'user_X')
    # Add more roles as needed
  end
end
