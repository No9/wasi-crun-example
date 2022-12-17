# wasi-crun-example

A simple container defintion to test running a WASI runtime using crun on fedora 37. 

## prereqs 

```
mkdir code 
cd code/
git clone https://github.com/containers/crun.git
cd crun/
./autogen.sh 
./configure 
make 
sudo dnf install podman wasmedge buildah 
mv /usr/bin/crun /usr/bin/curn.backup 
sudo mv /usr/bin/crun /usr/bin/curn.backup 
sudo mv crun /usr/bin

rustup target add wasm32-wasi
```

## build 

```
cargo build --release --target wasm32-wasi
buildah build --annotation "module.wasm.image/variant=compat" -t mywasm-image
```

## run 

```
podman run -e LIFE="GOOD" mywasm-image:latest
```

### outputs
```
Hello, world!
PATH: /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
TERM: xterm
container: podman
LIFE: GOOD
HOSTNAME: ad0c6217d785
HOME: /
```