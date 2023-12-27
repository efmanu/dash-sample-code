using Dash

# Create Dash application
app = dash()

# Layout definition
app.layout = html_div() do
    # Dropdown component
    dcc_dropdown(
        id = "dropdown-selector",
        options = [
            Dict("label" => "Option 1", "value" => "option-1"),
            Dict("label" => "Option 2", "value" => "option-2"),
            Dict("label" => "Option 3", "value" => "option-3"),
        ],
        value = "option-1",  # Initial selected value
        style = Dict("width" =>"50%")  # Set the width of the dropdown
    ),

    # HTML div to display selected value
    html_div(id = "output-div", style = Dict("marginTop" => "20px"))
end

# Callback definition
callback!(
    app,
    Output("output-div", "children"),
    Input("dropdown-selector", "value")
) do d_value
    if isnothing(d_value)
        throw(PreventUpdate())
    end
    return "You have selected $d_value"
end

# Run the Dash server
Dash.run_server(app, "0.0.0.0", 8000; debug=true)
