defmodule PaymentsWeb.OrderControllerTest do
  use PaymentsWeb.ConnCase

  import Payments.TransactionsFixtures

  alias Payments.Transactions.Order

  @create_attrs %{
    payload: "some payload",
    uuid: "some uuid"
  }
  @update_attrs %{
    payload: "some updated payload",
    uuid: "some updated uuid"
  }
  @invalid_attrs %{payload: nil, uuid: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all orders", %{conn: conn} do
      conn = get(conn, Routes.order_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create order" do
    test "renders order when data is valid", %{conn: conn} do
      conn = post(conn, Routes.order_path(conn, :create), order: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.order_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "payload" => "some payload",
               "uuid" => "some uuid"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.order_path(conn, :create), order: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update order" do
    setup [:create_order]

    test "renders order when data is valid", %{conn: conn, order: %Order{id: id} = order} do
      conn = put(conn, Routes.order_path(conn, :update, order), order: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.order_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "payload" => "some updated payload",
               "uuid" => "some updated uuid"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, order: order} do
      conn = put(conn, Routes.order_path(conn, :update, order), order: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete order" do
    setup [:create_order]

    test "deletes chosen order", %{conn: conn, order: order} do
      conn = delete(conn, Routes.order_path(conn, :delete, order))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.order_path(conn, :show, order))
      end
    end
  end

  defp create_order(_) do
    order = order_fixture()
    %{order: order}
  end
end
