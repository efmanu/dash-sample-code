using Dash
using PlotlyJS

# Create Dash application
app = dash()

data = scatter(
        ;x=[1, 2, 3, 4, 5],
        y=[2, 5, 3, 6, 7],
        mode="markers+text",
        name="Team A",
        text=["P-1", "P-2", "P-3", "P-4", "P-5"],
        textposition="top center",
        textfont_family="Arial",
        marker_size=15
);     
fig=PlotlyJS.plot(data);
# Layout definition with advanced visualization (choropleth map)
app.layout = html_div() do
    html_h4("Plot using PlotlyJS"),
    dcc_graph(
        id="example-graph",
        figure=fig,
    )
end

# Run the Dash server
Dash.run_server(app, "0.0.0.0", 8000; debug=true)
