defmodule Eshop.Repo.Migrations.CreateChatRooms do
  use Ecto.Migration

  def change do
    create table(:chat_rooms) do
      add :shop_id, references(:shops, on_delete: :nothing)
      add :customer_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:chat_rooms, [:shop_id])
    create index(:chat_rooms, [:customer_id])
    create index(:chat_rooms, [:shop_id, :customer_id])
    
  end
end
