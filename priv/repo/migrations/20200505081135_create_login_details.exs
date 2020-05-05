defmodule Eshop.Repo.Migrations.CreateLoginDetails do
  use Ecto.Migration

  def change do
    create table(:login_details) do
      add :is_active, :boolean, default: false, null: false
      add :user_agent, :string
      add :ip_address, :string
      add :ip_location, :string
      add :login_at, :utc_datetime
      add :last_activity, :utc_datetime
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:login_details, [:user_id])
  end
end
