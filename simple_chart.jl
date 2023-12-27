using Dash
using PlotlyJS

# Create Dash application
app = dash()

# Layout definition
app.layout = html_div() do
    dcc_graph(
        id = "sample-chart",
        figure = Dict(
            "data" => [
                Dict(
                    "x" => collect(1:10),
                    "y" => rand(10),
                    "type" => "scatter",
                    "name" => "Sample Chart",
                )
            ],
            "layout" => Dict(
                "title" => "Sample Chart"
            )
        )
    )
end

# Run the Dash server
Dash.run_server(app, "0.0.0.0", 8000; debug=true)
