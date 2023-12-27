using Dash

# Create Dash application
app = dash()

# Layout definition with annotations and text components
app.layout = html_div() do
    dcc_graph(
        id = "annotated-plot",
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
    ),
    dcc_markdown(
        """
        ## Analysis Summary

        In this section, we provide key insights derived from our data analysis.

        """
    ),
    dcc_textarea(
        id="analysis-text",
        value="",
        style=Dict("width" => "100%", "height" => "100px")
    )
end

# Callback to update analysis text based on annotated plot
callback!(
    app,
    Output("analysis-text", "value"),
    Input("annotated-plot", "hoverData")
) do hover_data
    final_data = "Explore the annotated plot above to uncover insights: $hover_data"
    return final_data
end

# Run the Dash server
Dash.run_server(app, "0.0.0.0", 8000; debug=true)