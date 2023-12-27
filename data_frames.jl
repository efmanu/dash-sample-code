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

# Layout definition with integration of external library (DataFrames)
app.layout = html_div() do
    dcc_table(
        id="dataframe-table",
        columns=[Dict("name"=>"Name", "id"=>"Name"), Dict("name"=>"Age", "id"=>"Age"), Dict("name"=>"Score", "id"=>"Score")],
        data=df
    )
end

# Run the Dash server
Dash.run_server(app, "0.0.0.0", 8000; debug=true)
