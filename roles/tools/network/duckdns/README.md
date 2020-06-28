# DuckDNS IP updater

Install [DuckDNS IP Updater](http://www.duckdns.org/install.jsp) to automatically update the IP
address when using the DuckDNS service.

## Configuration

```yaml
  roles:
    - role: tools/network/duckdns
      duckdns_token: ""
      duckdns_domain: ""
```
