FROM fedora:36 as builder

WORKDIR /build
RUN dnf -y install hugo
COPY . /build
RUN hugo

FROM nginxinc/nginx-unprivileged

COPY --from=builder /build/public /usr/share/nginx/html
