defmodule Messages.Sender do

  # def establish_connection do
  # {:ok, connection} = AMQP.Connection.open
  # {:ok, _channel} = AMQP.Channel.open(connection)
  # end


  # def clean_message do

  # end

  def publish_message(message) do
  {:ok, connection} = AMQP.Connection.open
  {:ok, channel} = AMQP.Channel.open(connection)
    AMQP.Basic.publish(channel, "", "hello", message)
    IO.puts " Payments Module Sent #{message}"
    AMQP.Connection.close(connection)
  end

end
