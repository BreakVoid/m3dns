from typing import Type

from .aliyun import Aliyun
from .base import BaseDdnsService

AVAILABLE_PROVIDERS = {
    'aliyun': Aliyun
}


def get_impl_by_name(name: str) -> Type[BaseDdnsService]:
    return AVAILABLE_PROVIDERS[name]
