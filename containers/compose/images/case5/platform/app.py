from flask import Flask
import socket
import sys
import platform
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def dashboard():
    hostname = socket.gethostname()
    ip_address = socket.gethostbyname(hostname)
    py_ver = sys.version.split()[0]
    os_info = platform.platform()
    server_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    html_content = f"""
    <!DOCTYPE html>
    <html>
    <head>
        <title>Case 5 Dashboard</title>
        <style>
            body {{ font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f0f2f5; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }}
            .card {{ background: white; padding: 40px; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); width: 400px; text-align: center; }}
            .status-dot {{ height: 15px; width: 15px; background-color: #4CAF50; border-radius: 50%; display: inline-block; margin-right: 10px; }}
            h1 {{ color: #333; margin-bottom: 20px; font-size: 24px; }}
            .info-item {{ background: #f8f9fa; margin: 10px 0; padding: 15px; border-radius: 8px; border-left: 5px solid #007bff; text-align: left; }}
            .info-label {{ font-size: 12px; color: #666; font-weight: bold; text-transform: uppercase; }}
            .info-value {{ font-size: 16px; color: #333; font-weight: 500; margin-top: 5px; }}
            .footer {{ margin-top: 30px; font-size: 12px; color: #aaa; }}
        </style>
    </head>
    <body>
        <div class="card">
            <div style="display: flex; align-items: center; justify-content: center; margin-bottom: 20px;">
                <span class="status-dot"></span>
                <span style="color: #4CAF50; font-weight: bold;">System Online</span>
            </div>
            <h1>Microservice Dashboard</h1>
            
            <div class="info-item">
                <div class="info-label">Container Hostname</div>
                <div class="info-value">{hostname}</div>
            </div>
            
            <div class="info-item" style="border-left-color: #28a745;">
                <div class="info-label">Container IP Address</div>
                <div class="info-value">{ip_address}</div>
            </div>

            <div class="info-item" style="border-left-color: #ffc107;">
                <div class="info-label">System Info</div>
                <div class="info-value">Python {py_ver} on {os_info}</div>
            </div>

            <div class="info-item" style="border-left-color: #dc3545;">
                <div class="info-label">Server Time</div>
                <div class="info-value">{server_time}</div>
            </div>

            <div class="footer">
                Task 3 Case 5 Cloud Computing
            </div>
        </div>
    </body>
    </html>
    """
    return html_content

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)