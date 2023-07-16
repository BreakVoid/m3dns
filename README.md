# m3dns
Multiple **D**evices **D**ynamic **D**NS(`m3dns`) is a python package to updating nameservers for multiple devices in 
a subnet, especially for a IPv6 subnet with a prefix shorter than 64.

## Usage

### 1. Install requirements
```bash
pip install -r requirements.txt
```

### 2. Prepare files of access tokens and rr2mac 
`m3dns` currently only supports `aliyun`. The access token file can be directly download from the console. 
Here is an [example](tokens/ali_token_example.csv).

| UserPrincipalName | Password | AccessKeyId | AccessKeySecret |
|-------------------|----------|-------------|-----------------|
| username          |          | keyid       | keysecret       |

`m3dns` provides the support of updating multiple resource records in a subnet centrally. 
The format of [rr2mac](config/rr_mac_example.csv) file is following.

| rr  | mac               |
|-----|-------------------|
| *   | 01-23-45-67-89-AB |
| @   | 01-23-45-67-89-AB |
| pc  | AB-CD-EF-01-23-45 |
| nas | CD-EF-01-78-90-AB |

### 3. Set environment variables
| Environment Variable | Description                            | Example                        |
|----------------------|----------------------------------------|--------------------------------|
| IPV4                 | Updating A records via IPv4 address    | `1`                            |
| IPV6                 | Updating AAAA records via IPv6 address | `1`                            |
| DOMAIN               | The major domain                       | `example.com`                  |
| TOKEN_FILE           | The path to token file                 | `tokens/ali_token_example.csv` |
| RM_FILE              | The path to rr2mac file                | `config/rr_mac_example.csv`    |
| PROVIDER             | The dynamic DNS service provider       | `aliyun`                       |

### 4. Run the http server
```bash
waitress-serve ddns:app
```

### 5. Trigger the updating process by accessing `/healthcheck`
```bash
curl http://localhost:8080/healthcheck
```

## Using in Docker
Check `docker-compose.yml` for further details.
