FROM python:3.11-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.bfsu.edu.cn/g' /etc/apk/repositories \
    && apk add curl && pip config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple \
    && pip install flask waitress aliyun-python-sdk-core-v3 aliyun-python-sdk-domain aliyun-python-sdk-alidns requests \
    && pip cache purge
ADD service_providers /ddns/service_providers
ADD utils /ddns/utils
ADD ddns.py /ddns/ddns.py
WORKDIR /ddns
ENTRYPOINT ["waitress-serve", "ddns:app"]
HEALTHCHECK --interval=300s --timeout=10s --retries=3 --start-period=10s \
    CMD curl -f http://localhost:8080/healthcheck || exit 1