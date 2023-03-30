# This assumes that you have /root as your main local working folder.
docker run -it --name code-server \
  -d -v /root:/root \
  -p 8086:8086 -w /root code-server
