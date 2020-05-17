defmodule EshopWeb.Schema.Mutations.UpdateHistory do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.UpdateHistory, as: UpdateHistory

  object :update_history_mutations do
    @desc "Create a update_history"
    field :create_update_history, type: :update_history do
      arg(:id, :integer)
      arg(:created_at, :datetime)
      arg(:key, :string)
      arg(:new_value, :string)
      arg(:old_value, :string)
      arg(:type, :integer)
      arg(:type_id, :integer)

      resolve(&UpdateHistory.create_update_history/3)
    end

    @desc "Update a update_history"
    field :update_update_history, type: :update_history do
      arg(:id, non_null(:id))
      arg(:update_history_params, :update_history_params)

      resolve(&UpdateHistory.update_update_history/2)
    end

    @desc "Delete a update_history"
    field :delete_update_history, type: :update_history do
      arg(:id, non_null(:id))
      resolve(&UpdateHistory.delete_update_history/2)
    end
  end
end
