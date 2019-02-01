#https://linuxconfig.org/how-to-host-django-with-nginx-on-ubuntu-18-04-bionic-beaver-linux
#gunicorn -c gunicorn/gunicorn-config.py your-project.wsgi

import multiprocessing

bind = 'unix:/tmp/gunicorn.sock'
workers = multiprocessing.cpu_count() * 2 + 1
reload = True
daemon = True
accesslog = './access.log'
errorlog = './error.log'
