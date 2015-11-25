class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :task
    end
  end
end
