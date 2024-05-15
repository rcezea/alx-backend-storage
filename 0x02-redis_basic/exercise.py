#!/usr/bin/env python3
"""Using redis RDB"""

from typing import Union, Callable as C
from uuid import uuid4

from redis import Redis


class Cache:
    """Class for generating the cache"""

    def __init__(self):
        """initializes the redis instance"""
        self._redis = Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Generates a random key and stores the data in redis """
        key = uuid4().__str__()
        self._redis.set(key, data)
        return key

    def get(self, key: str,
            fn: Union[C[[bytes], Union[str, bytes, int, float]], None] = None):
        """convert the data back to the desired format"""
        value = self._redis.get(key)
        if value and fn:
            value = fn(value)
        return value

    def get_str(self, key):
        """return key as string"""
        return self.get(key, str)

    def get_int(self, key):
        """return key as integer"""
        return self.get(key, int)
