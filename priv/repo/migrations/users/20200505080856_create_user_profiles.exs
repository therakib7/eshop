defmodule Eshop.Repo.Migrations.CreateUserProfiles do
  use Ecto.Migration

  def change do
    create table(:user_profiles) do
      add :lat, :float, null: true, size: 50
      add :long, :float, null: true, size: 50
      add :date_of_birth, :utc_datetime, null: true
      add :merital_status, :integer, null: true
      add :gender, :integer, null: true
      add :user_id, references(:users, on_delete: :nothing)
      add :pre_location_id, references(:locations, on_delete: :nothing), null: true
      add :per_location_id, references(:locations, on_delete: :nothing), null: true

      timestamps()
    end

    create index(:user_profiles, [:user_id])
    create index(:user_profiles, [:pre_location_id])
    create index(:user_profiles, [:per_location_id])
  end
end
