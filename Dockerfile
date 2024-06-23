FROM alpine:latest
RUN apk add --no-cache curl qemu-img
COPY run-local.sh /
CMD ["/run-local.sh"]
