FROM python:3

LABEL org.label-schema.name="subscraper" \
    org.label-schema.description="Subdomain Enumeration Tool" \
    org.label-schema.vcs-url="https://github.com/m8sec/subscraper"

RUN apt update && apt install git

WORKDIR /app
RUN git clone https://github.com/m8sec/subscraper.git /subscraper
RUN pip install -r /subscraper/requirements.txt

RUN mkdir -p ~/.config/subscraper

COPY config.json ~/.config/subscraper/config.json

ENTRYPOINT ["python","/subscraper/subscraper.py"]
CMD ["--help"]
