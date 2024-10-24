FROM rust:1.82 AS builder
WORKDIR /usr/src/sqlx-cli
RUN cargo install sqlx-cli

FROM gcr.io/distroless/cc-debian12
COPY --from=builder /usr/local/cargo/bin/sqlx /usr/local/bin/sqlx
CMD ["sqlx"]
