FROM scratch 

COPY  target/wasm32-wasi/release/wasi-sample.wasm /

CMD ["./wasi-sample.wasm"]
