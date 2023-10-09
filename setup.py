from distutils.core import setup

setup(
    name='m3dns',
    version='1.0.0',
    description='Multiple Devices Dynamic DNS(`m3dns`) is a python package to updating nameservers for multiple devices'
                ' in a subnet, especially for a IPv6 subnet with a prefix shorter than 64.',
    author='BreakVoid',
    author_email='songyu-ke@outlook.com',
    url='https://www.python.org/sigs/distutils-sig/',
    packages=['m3dns'],
    requires=[
        'requests',
        'flask',
        'waitress',
        'Flask-APScheduler',
        # Aliyun API requirements
        'aliyun-python-sdk-core-v3',
        'aliyun-python-sdk-domain',
        'aliyun-python-sdk-alidns',
    ]
)
