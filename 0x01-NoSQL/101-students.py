#!/usr/bin/env python3
"""Python function that returns all students sorted by average score"""


def top_students(mongo_collection):
    """returns all students sorted by average score"""
    mongo_collection.find({"$"})