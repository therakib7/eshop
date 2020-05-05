defmodule Eshop.Repo.Migrations.CreateUserProfiles do
  use Ecto.Migration

  def change do
    create table(:user_profiles) do
      add :lat, :float
      add :long, :float
      add :date_of_birth, :string
      add :utc_datetime, :string
      add :merital_status, :string
      add :integer, :string
      add :gender, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :pre_location_id, references(:locations, on_delete: :nothing)
      add :per_location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create index(:user_profiles, [:user_id])
    create index(:user_profiles, [:pre_location_id])
    create index(:user_profiles, [:per_location_id])
  end
end
