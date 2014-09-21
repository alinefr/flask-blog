{% set user = 'vagrant' %}
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

