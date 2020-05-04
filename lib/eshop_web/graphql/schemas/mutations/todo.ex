defmodule EshopWeb.Schema.Mutations.Todo do
    use Absinthe.Schema.Notation

    object :todo_mutations do
        @desc "Create a todo"
        field :create_todo, type: :todo do
            arg :title, non_null(:string)
            arg :status, :integer

            resolve &TodoWeb.Schema.Resolvers.Todo.create_todo/3
        end
    end
    
end