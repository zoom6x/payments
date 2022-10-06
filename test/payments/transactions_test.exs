defmodule Payments.TransactionsTest do
  use Payments.DataCase

  alias Payments.Transactions

  describe "orders" do
    alias Payments.Transactions.Order

    import Payments.TransactionsFixtures

    @invalid_attrs %{payload: nil, uuid: nil}

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Transactions.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Transactions.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      valid_attrs = %{payload: "some payload", uuid: "some uuid"}

      assert {:ok, %Order{} = order} = Transactions.create_order(valid_attrs)
      assert order.payload == "some payload"
      assert order.uuid == "some uuid"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transactions.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      update_attrs = %{payload: "some updated payload", uuid: "some updated uuid"}

      assert {:ok, %Order{} = order} = Transactions.update_order(order, update_attrs)
      assert order.payload == "some updated payload"
      assert order.uuid == "some updated uuid"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Transactions.update_order(order, @invalid_attrs)
      assert order == Transactions.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Transactions.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Transactions.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Transactions.change_order(order)
    end
  end
end
