FROM golang:1.22-alpine
RUN apk --no-cache add ca-certificates git

RUN git clone https://github.com/aquasecurity/trivy.git /opt/trivy
RUN cd /opt/trivy \
    && go install ./cmd/trivy \
    && mkdir /contrib \
    && cp -r /opt/trivy/contrib/*.tpl /contrib

RUN trivy image --download-db-only

WORKDIR /app
ENTRYPOINT ["trivy"]
