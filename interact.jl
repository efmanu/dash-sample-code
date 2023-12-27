using Dash

# Create Dash application
app = dash()

Y_VAL = rand(10)

# Layout definition with connected data points
app.layout = html_div() do
    dcc_graph(
        id = "dcc-graph",
        figure = Dict(
            "data" => [
                Dict(
                    "x" => collect(1:10),
                    "y" => rand(10),
                    "type" => "scatter",
                    "name" => "Sample Chart",
                ),
                Dict(
                    "x" => collect(1:10),
                    "y" => ones(10),
                    "type" => "scatter",
                    "name" => "Thereshold",
                )
            ],
            "layout" => Dict(
                "title" => "Sample Chart"
            )
        )
    ),
    dcc_slider(
        id="time-slider",
        min=0,
        max=10,
        step=1,
        value=1
    )
end

# Callback to connect data points based on slider value
callback!(
    app,
    Output("dcc-graph", "figure"),
    Input("time-slider", "value")
) do time_value
    global Y_VAL
    # Update scatter plot based on time slider value
    if isnothing(time_value)
        throw(PreventUpdate())
    end
    return Dict(
        "data" => [
            Dict(
                "x" => collect(1:10),
                "y" => Y_VAL,
                "type" => "scatter",
                "name" => "Sample Chart",
            ),
            Dict(
                "x" => collect(1:10),
                "y" => time_value.*ones(10),
                "type" => "scatter",
                "name" => "Thereshold",
            )
        ],
        "layout" => Dict(
            "title" => "Sample Chart"
        )
    )
end

# Run the Dash server
Dash.run_server(app, "0.0.0.0", 8000; debug=true)
