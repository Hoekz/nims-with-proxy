# NIMs with Proxy

This repo is to illustrate a problem when trying to use an `nginx` proxy for embeddings and reranking running on the same machine.

## Setup

1. Create `embeddings.env` and add your `NGC_API_KEY`.
2. Create `reranker.env` and add your `NGC_API_KEY` (optional: `NIM_MODEL_PROFILE=onnx`)
3. `docker compose up` (first login to docker with your `NGC_API_KEY` if you have not already)

## Run

`./test-embeddings.sh` will run 3 `curl` requests:

- direct call to the container: success
- proxy that uses `172.17.0.1`: success
- proxy that uses `embeddings`: fails, error about `HTTP/0.9`

`./test-reranker.sh` will run 3 `curl` requests:

- direct call to the container: success
- proxy that uses `172.17.0.1`: success
- proxy that uses `reranker`: fails, `{"error":"Method Not Allowed"}`

## Notes

- `nginx` will only properly start if it can see the hostnames: `nginx: [emerg] host not found in upstream "not-embeddings" in /etc/nginx/nginx.conf:11` (exit 1)

