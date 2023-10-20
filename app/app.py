from http.server import HTTPServer, BaseHTTPRequestHandler

# HTML and CSS content
html_content = """
<!DOCTYPE html>
<html>
<head>
    <!-- <link rel="stylesheet" type="text/css" href="styles.css"> -->
</head>
<body>
    <h1>Welcome to the Python HTTP Server</h1>
    <p>This is a simple HTML and CSS page served by a Python HTTP server.</p>
</body>
</html>
"""

css_content = """
body {
    font-family: Arial, sans-serif;
    text-align: center;
    margin-top: 100px;
}
"""

# HTTP request handler
class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(bytes(html_content, 'utf-8'))

    def do_HEAD(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

# Run the server
if __name__ == '__main__':
    server_address = ('', 8000)
    httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
    print("Server running at http://localhost:8000/")
    httpd.serve_forever()

