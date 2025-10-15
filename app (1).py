from flask import Flask, request, jsonify
import random
from prometheus_flask_exporter import metrics  # اضافه کردن این

app = Flask(__name__)
metrics.init_app(app)  # این metricهای خودکار مثل http_requests_total{status="500"} رو expose می‌کنه

@app.route('/transaction', methods=['POST'])
def handle_transaction():
    data = request.get_json()
    
    if not data or 'amount' not in data or 'currency' not in data or 'user_id' not in data:
        return jsonify({"error": "Invalid transaction data"}), 400

    if random.random() < 0.1:
        print(f"Simulating a failed transaction for user: {data.get('user_id')}")
        return jsonify({"error": "Internal Server Error"}), 500

    print(f"New transaction received: {data}")
    return jsonify({"message": "Transaction successful"}), 200

@app.route('/metrics')  # endpoint جدید برای Prometheus scrape
def metrics_endpoint():
    return metrics.generate_latest()  # اگر exporter کار نکنه، دستی اضافه کنید

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)