defmodule EshopWeb.Schema.Mutations.Notification do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Notification, as: Notification

  object :notification_mutations do
    @desc "Create a notification"
    field :create_notification, type: :notification do
      arg(:id, :integer)
      arg(:notification_msg_id, :integer)
      arg(:read, :boolean)
      arg(:type, :integer)
      arg(:type_id, :integer)

      resolve(&Notification.create_notification/3)
    end

    @desc "Update a notification"
    field :update_notification, type: :notification do
      arg(:id, non_null(:id))
      arg(:notification_params, :notification_params)

      resolve(&Notification.update_notification/2)
    end

    @desc "Delete a notification"
    field :delete_notification, type: :notification do
      arg(:id, non_null(:id))
      resolve(&Notification.delete_notification/2)
    end
  end
end
