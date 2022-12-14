{application,payments,
             [{compile_env,[{payments,['Elixir.PaymentsWeb.Gettext'],error}]},
              {applications,[kernel,stdlib,elixir,logger,runtime_tools,amqp,
                             distillery,phoenix,phoenix_ecto,ecto_sql,
                             postgrex,phoenix_live_dashboard,swoosh,
                             telemetry_metrics,telemetry_poller,gettext,jason,
                             plug_cowboy,secure_random]},
              {description,"payments"},
              {modules,['Elixir.Messages.Sender','Elixir.Payments',
                        'Elixir.Payments.Application',
                        'Elixir.Payments.Mailer','Elixir.Payments.Repo',
                        'Elixir.Payments.Transactions',
                        'Elixir.Payments.Transactions.Order',
                        'Elixir.PaymentsWeb',
                        'Elixir.PaymentsWeb.ChangesetView',
                        'Elixir.PaymentsWeb.Endpoint',
                        'Elixir.PaymentsWeb.ErrorHelpers',
                        'Elixir.PaymentsWeb.ErrorView',
                        'Elixir.PaymentsWeb.FallbackController',
                        'Elixir.PaymentsWeb.Gettext',
                        'Elixir.PaymentsWeb.OrderController',
                        'Elixir.PaymentsWeb.OrderView',
                        'Elixir.PaymentsWeb.Router',
                        'Elixir.PaymentsWeb.Router.Helpers',
                        'Elixir.PaymentsWeb.Telemetry']},
              {registered,[]},
              {vsn,"0.1.0"},
              {mod,{'Elixir.Payments.Application',[]}}]}.
