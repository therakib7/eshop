defmodule EshopWeb.Schema.Mutations.UpdateHistory do
    use Absinthe.Schema.Notation
    
    object :update_history_mutations do
        @desc "Create a update_history"
        field :create_update_history, type: :update_history do 
            arg :id, :integer
            arg :created_at, :datetime
            arg :key, :string
            arg :new_value, :string
            arg :old_value, :string
            arg :type, :integer
            arg :type_id, :integer

            resolve &EshopWeb.Schema.Resolvers.UpdateHistory.create_update_history/2
        end
    end 
end