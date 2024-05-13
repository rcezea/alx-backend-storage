#!/usr/bin/env python3
"""Write a Python function that lists all documents in a collection"""


def list_all(mongo_collection):
    """Return the list of all documents in a collection"""
    return mongo_collection.find()
