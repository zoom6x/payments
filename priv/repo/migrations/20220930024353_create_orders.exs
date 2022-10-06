defmodule Payments.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :uuid, :string
      add :payload, :map

      timestamps()
    end
  end
end
