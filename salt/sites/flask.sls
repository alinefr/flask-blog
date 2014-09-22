{% set user = salt['pillar.get']('username','aline') %}
python-virtualenv:
  pkg:
    - installed

libpython2.7-dev:
  pkg:
    - installed

libpq-dev:
  pkg:
    - installed
    
supervisor:
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

/var/log/gunicorn:
  file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - makedirs: True

supervisor conf:
  file:
    - managed
    - name: /etc/supervisor/conf.d/flask_blog.conf
    - source: salt://sites/supervisor.conf
    - template: jinja
