#!/usr/bin/env python3
"""A Python script that provides some stats
about Nginx logs stored in MongoDB"""
from pymongo import MongoClient

if __name__ == '__main__':
    client = MongoClient('mongodb://127.0.0.1:27017')
    nginx = client.logs.nginx
    methods: list = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    method_dict: dict = {"GET": 0, "POST": 0, "PUT": 0, "PATCH": 0, "DELETE": 0}
    logs: int = 0
    statusCheck: int = 0

    for log in nginx.find():
        logs += 1
        if log.get('method') in method_dict:
            method_dict[log.get('method')] += 1
        if log.get('method') == 'GET' and log.get('path') == '/status':
            statusCheck += 1

    result: str = "{} logs\nMethods:\n".format(logs)
    for method in methods:
        result += "\tmethod {}: {}\n".format(method, method_dict.get(method))
    result += "{} status check".format(statusCheck)
    print(result, end='')
