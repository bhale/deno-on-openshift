# Spin up a container only for building, it won't be pushed anywhere
FROM registry.access.redhat.com/ubi8/ubi as builder
USER root
RUN yum install --disableplugin=subscription-manager -y unzip && rm -rf /var/cache/yum

RUN curl -fsSL https://deno.land/x/install/install.sh | DENO_INSTALL=/usr sh

RUN mkdir -p /opt/app-root
WORKDIR /opt/app-root
COPY . .
RUN DENO_DIR=/opt/app-root/deno deno cache server.ts

# This will be the final image that is created
FROM registry.access.redhat.com/ubi8/ubi-minimal

USER root

# Copy files before dropping priliges so that these are not modifiable

COPY --from=builder /usr/bin/deno /usr/bin/deno

WORKDIR /opt/app-root
COPY --from=builder /opt/app-root/deno deno
COPY --from=builder /opt/app-root/server.ts server.ts

USER 1001

ENV DENO_DIR=/opt/app-root/deno
EXPOSE 8080/tcp
CMD [ "deno", "run", "--allow-net", "server.ts" ]
