FROM python:3.9

COPY . /app/

WORKDIR /app

RUN cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
    && pip install flask gunicorn

EXPOSE 5000

# run without gunicorn in development mode
#ENTRYPOINT ["python"]
#CMD ["/app/app.py"]

# Run the container with gunicorn
CMD ["gunicorn", "--workers=2", "--chdir=/app", "--bind", "0.0.0.0:5000", "--access-logfile=-", "--error-logfile=-", "app:app"]


