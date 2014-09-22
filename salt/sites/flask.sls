{% set user = 'aline' %}
python-virtualenv:
  pkg:
    - installed

libpython2.7-dev:
  pkg:
    - installed

venv:
  virtualenv.managed:
    - name: /srv/www/venv
    - user: {{ user }}
    - system_site_packages: False
    - cwd: /srv/www
    - requirements: /srv/www/requirements.txt

flask settings:
  file:
    - managed
    - name: /srv/www/config.py
    - source: salt://sites/config.py.template
    - template: jinja


      
