{% if 'master' in grains['nodename'] %}

install bind:
  pkg.installed:
    - name: bind
  service.running:
    - name: named
    - enable: True 
/etc/named.conf:
  file.managed:
    - source: salt://named.conf_master
    - user: root
    - group: root
    - mode: 644
    - template: jinja
/var/named/1.168.192.in-addr.arpa:
  file.managed:
    - source: salt://1.168.192.in-addr.arpa
    - user: root
    - group: root
    - mode: 644
    - template: jinja
/var/named/example.com.zone:
  file.managed:
    - source: salt://example.com.zone
    - user: root
    - group: root
    - mode: 644
    - template: jinja
service named start:
  cmd.run
rndc reconfig:
  cmd.run

{% elif 'slave' in grains['nodename'] %}

install bind:
  pkg.installed:
    - name: bind
  service.running:
    - name: named
    - enable: True 
/etc/named.conf:
  file.managed:
    - source: salt://named.conf_slave
    - user: root
    - group: root
    - mode: 644
    - template: jinja
/var/named/1.168.192.in-addr.arpa:
  file.managed:
    - source: salt://1.168.192.in-addr.arpa
    - user: root
    - group: root
    - mode: 644
    - template: jinja
/var/named/example.com.zone:
  file.managed:
    - source: salt://example.com.zone
    - user: root
    - group: root
    - mode: 644
    - template: jinja
service named start:
  cmd.run
rndc reconfig:
  cmd.run

{% endif %}

