let http = require("http");
let url = require("url");
let os = require("os");

const PORT = 8080;

http.createServer(function(request, response){
    response.writeHead(200, {"Content-Type": "text/html"});
    response.write("Server from Kali Linux<br>");
    response.write(`Host: ${os.hostname}<br>`);
    response.write(`Path: ${os.platform}<br>`);
    response.end(`Uptime: ${os.uptime}`);
}).listen(PORT);

console.log(`Server launched on http://localhost:${PORT}/`);