defmodule TodoWeb.Schema.Resolvers.Todo do

    def list_todos(_parent, _args, _resolution) do
        {:ok, Todo.Tasks.list_todos()}
    end

    def create_todo(_parent, args, _resolution) do
        Todo.Tasks.create_task(args)
    end
    
end