FROM python:3.11-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.bfsu.edu.cn/g' /etc/apk/repositories \
    && apk add curl && pip config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple \
    && pip install flask waitress aliyun-python-sdk-core-v3 aliyun-python-sdk-domain aliyun-python-sdk-alidns requests \
    && pip cache purge
ADD m3dns /ddns/m3dns
ADD ddns.py /ddns/ddns.py
WORKDIR /ddns
ENTRYPOINT ["waitress-serve", "ddns:app"]
