using Dash

app = dash()

app.layout = html_div() do
    html_h1("Hello World")
end
Dash.run_server(app, "0.0.0.0", port= 8000; debug=true)
