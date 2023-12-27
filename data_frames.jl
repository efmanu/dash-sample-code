using Dash
using DataFrames

# Create Dash application
app = dash()

# Sample DataFrames manipulation for integration
df = DataFrame(
    Name=["John", "Jane", "Bob", "Alice"],
    Age=[25, 28, 22, 30],
    Score=[85, 92, 78, 95]
)

fig = plot(
    df, x=:Name, y=:Age, color=:Score,
    mode="markers", marker_size=8
);

# Layout definition with integration of external library (DataFrames)
app.layout = html_div() do
    html_h4("Using DataFrames"),
    dcc_graph(
        id="example-graph",
        figure=fig,
    ),
    dash_datatable(
        data = map(eachrow(df)) do r
        Dict(names(r) .=> values(r))
        end,
        columns=[Dict("name" =>c, "id" => c) for c in names(df)],
        page_size=10
    )
end

# Run the Dash server
Dash.run_server(app, "0.0.0.0", 8000; debug=true)
