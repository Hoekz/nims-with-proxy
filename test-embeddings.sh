echo "embeddings: direct call"
curl -X "POST" "http://localhost:8001/v1/embeddings" -H 'accept: application/json' -H 'Content-Type: application/json' -d '{
  "input": ["Hello world"],
  "model": "nvidia/nv-embedqa-e5-v5",
  "input_type": "query"
}'

echo "================================================================="
echo "embeddings: proxy with escape ip address"
curl -X "POST" "http://localhost:8000/embeddings/v1/embeddings" -H 'accept: application/json' -H 'Content-Type: application/json' -d '{
  "input": ["Hello world"],
  "model": "nvidia/nv-embedqa-e5-v5",
  "input_type": "query"
}'

echo "================================================================="
echo "embeddings: proxy with hostname"
curl -X "POST" "http://localhost:8000/host/embeddings/v1/embeddings" -H 'accept: application/json' -H 'Content-Type: application/json' -d '{
  "input": ["Hello world"],
  "model": "nvidia/nv-embedqa-e5-v5",
  "input_type": "query"
}'
