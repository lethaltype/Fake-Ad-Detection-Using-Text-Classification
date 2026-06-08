from flask import Flask, jsonify, request
import json
from Model_API import predict_ML

app = Flask(__name__)

send = ''


@app.route('/link', methods=['POST'])
def Get_Link():
    global send
    if request.method == 'POST':
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        link = request_data['link']
        global send
        send = link
        print(send)
        return 'Link Request Received '
    else:

        return 'Link Not Received Yet'


@app.route('/results', methods=['GET'])
def results():
    #url = 'https://www.pakwheels.com/used-cars/suzuki-baleno-2003-for-sale-in-lahore-5022373'
    predict = predict_ML(send)
    if predict=="1":
        return jsonify(result="Dealer")
    else:
        return jsonify(result="Genuine")


if __name__ == '__main__':
    app.run(host="0.0.0.0")
