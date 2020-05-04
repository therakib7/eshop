defmodule EshopWeb.Schema.Queries.Todo do
    use Absinthe.Schema.Notation

    object :todo_queries do
        @desc "Get all todos"
        field :todos, list_of(:todo) do
            resolve &EshopWeb.Schema.Resolvers.Todo.list_todos/3

        end
    end
    
end