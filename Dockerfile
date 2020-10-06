FROM transportforcairo/geonode-base:latest
LABEL GeoNode development team

COPY . /usr/src/app/
RUN pip install pip==20.1
RUN pip install -r requirements.txt --upgrade
RUN pip install pygdal==$(gdal-config --version).*
RUN python manage.py makemigrations --settings=geonode.settings
RUN python manage.py migrate --settings=geonode.settings

EXPOSE 8000

ENTRYPOINT /usr/src/app/entrypoint.sh
