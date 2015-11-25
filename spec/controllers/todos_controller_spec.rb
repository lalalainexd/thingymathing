require 'rails_helper'

describe TodosController do
  describe '#index' do
    context 'json' do
      it 'returns all the todos' do
        Todo.create(task: 'todo1')
        Todo.create(task: 'todo2')
        Todo.create(task: 'todo3')

        get :index, format: :json

        todos = JSON.parse(response.body)
        expect(todos.length).to eq(3)
       #TODO.. HAHA.. do more..
      end
    end
  end
end