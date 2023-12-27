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
        multi = false,       # Allow multiple selections (true/false)
        clearable = false,   # Allow clearing the selection (true/false)
        style = Dict("width" => "50%")  # Set the width of the dropdown
    ),

    # Slider component
    dcc_slider(
        id = "slider-selector",
        min = 0,
        max = 10,
        step = 1,
        marks = Dict(0 => "0", 2 => "2", 5 => "5", 10 => "10"),  # Custom marks
        value = 5  # Initial selected value
    )
end

# Run the Dash server
Dash.run_server(app, "0.0.0.0", 8000; debug=true)
