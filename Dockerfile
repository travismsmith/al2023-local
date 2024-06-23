FROM alpine:latest
RUN apk add --no-cache curl qemu-img
COPY download.sh /
CMD ["/download.sh"]
